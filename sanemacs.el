;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Sanemacs version 0.3.3 ;;;
;;; https://sanemacs.com   ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; For performance
(setq gc-cons-threshold 100000000)
(setq read-process-output-max (* 1024 1024)) ;; 1mb


(add-hook 'after-init-hook #'(lambda ()
                               ;; restore after startup
                               (setq gc-cons-threshold 800000)))

;;; Disable menu-bar, tool-bar, and scroll-bar.
(if (fboundp 'menu-bar-mode)
    (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode)
    (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode)
    (scroll-bar-mode -1))

;;; Fix this bug:
;;; https://www.reddit.com/r/emacs/comments/cueoug/the_failed_to_download_gnu_archive_is_a_pretty/
(when (version< emacs-version "26.3")
  (setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3"))

;;; Setup package.el
(require 'package)
(setq package-enable-at-startup t)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(unless package--initialized (package-initialize))

;;; Setup use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-when-compile
  (require 'use-package))
(setq use-package-always-ensure t)

;; install packages

(use-package undo-tree
  :init (global-undo-tree-mode)
  )

(use-package company
  :init (global-company-mode)
  )

(use-package treesit-fold
  :vc  (:url "https://github.com/emacs-tree-sitter/treesit-fold"
	     :rev :newest
	     :branch "main"
	     )
  :init (global-treesit-fold-mode)
  :hook (
	 (c-mode . (lambda ()
		     (when (not (treesit-language-available-p 'c))
		       (treesit-install-language-grammar 'c))
		     (treesit-parser-create 'c)
		     )
		 )
	 (js-mode . (lambda ()
		      (when (not (treesit-language-available-p 'javascript))
			(treesit-install-language-grammar 'javascript))
		      (treesit-parser-create 'javascript)
		      )
		  )
	 (c++-mode . (lambda ()
		       (when (not (treesit-language-available-p 'c++))
			 (treesit-install-language-grammar 'c++))
		       (treesit-parser-create 'c++)
		       )
		   )
	 )
	 (lua-mode . (lambda ()
		       (when (not (treesit-language-available-p 'lua))
			 (treesit-install-language-grammar 'lua))
		       (treesit-parser-create 'lua)
		       )
		   )
	 )

(use-package copilot
  :vc (:url "https://github.com/copilot-emacs/copilot.el"
            :rev :newest
            :branch "main")
  :hook (prog-mode-hook . copilot-mode)
  :config (lambda () ((define-key copilot-completion-map (kbd "<tab>") 'copilot-accept-completion)
		      (define-key copilot-completion-map (kbd "TAB") 'copilot-accept-completion)
		      (define-key copilot-mode-map (kbd "C-c C-c") 'copilot-complete)
		      (define-key copilot-mode-map (kbd "C-c C-d") 'copilot-describe)
		      )
	    )
  )

(use-package copilot-chat)

;;; Useful Defaults
(setq-default cursor-type 'bar)           ; Line-style cursor similar to other text editors
(setq inhibit-startup-screen t)           ; Disable startup screen
(setq initial-scratch-message "")         ; Make *scratch* buffer blank
(setq-default frame-title-format '("%b")) ; Make window title the buffer name
(setq ring-bell-function 'ignore)         ; Disable bell sound
(fset 'yes-or-no-p 'y-or-n-p)             ; y-or-n-p makes answering questions faster
(show-paren-mode 1)                       ; Show closing parens by default
(setq linum-format "%4d ")                ; Line number format
(delete-selection-mode 1)                 ; Selected text will be overwritten when you start typing
(global-auto-revert-mode t)               ; Auto-update buffer if file has changed on disk
(use-package undo-tree                    ; Enable undo-tree, sane undo/redo behavior
  :init (global-undo-tree-mode)
  :config (setq-default undo-tree-auto-save-history nil))
(add-hook 'before-save-hook
	  'delete-trailing-whitespace)    ; Delete trailing whitespace on save

;; Show line numbers in programming modes
(add-hook 'prog-mode-hook
          (if (or
			   ; If linum-mode doesn't exist...
			   (not (fboundp 'linum-mode))
			   ; ...or Emacs has display-line-numbers-mode capability
			   (and (fboundp 'display-line-numbers-mode) (display-graphic-p)))
			  ; ...then use display-line-numbers-mode!
              'display-line-numbers-mode
			; Otherwise, use linum-mode
            'linum-mode))

(global-display-line-numbers-mode)

(defun sanemacs/backward-kill-word ()
  (interactive "*")
  (push-mark)
  (backward-word)
  (delete-region (point) (mark)))

;;; Keybindings
(global-set-key [mouse-3] 'mouse-popup-menubar-stuff)          ; Gives right-click a context menu
(global-set-key (kbd "C->") 'indent-rigidly-right-to-tab-stop) ; Indent selection by one tab length
(global-set-key (kbd "C-<") 'indent-rigidly-left-to-tab-stop)  ; De-indent selection by one tab length
(global-set-key (kbd "M-DEL") 'sanemacs/backward-kill-word)    ; Kill word without copying it to your clipboard
(global-set-key (kbd "C-DEL") 'sanemacs/backward-kill-word)    ; Kill word without copying it to your clipboard

;;; Offload the custom-set-variables to a separate file
;;; This keeps your init.el neater and you have the option
;;; to gitignore your custom.el if you see fit.
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(unless (file-exists-p custom-file)
  (write-region "" nil custom-file))
;;; Load custom file. Don't hide errors. Hide success message
(load custom-file nil t)

;;; Put Emacs auto-save and backup files to /tmp/ or C:/Temp/
(defconst emacs-tmp-dir (expand-file-name (format "emacs%d" (user-uid)) temporary-file-directory))
(setq
   backup-by-copying t                                        ; Avoid symlinks
   delete-old-versions t
   kept-new-versions 6
   kept-old-versions 2
   version-control t
   auto-save-list-file-prefix emacs-tmp-dir
   auto-save-file-name-transforms `((".*" ,emacs-tmp-dir t))  ; Change autosave dir to tmp
   backup-directory-alist `((".*" . ,emacs-tmp-dir)))

;;; Lockfiles unfortunately cause more pain than benefit
(setq create-lockfiles nil)

;;; Load wheatgrass as the default theme if one is not loaded already

(if (not custom-enabled-themes)
    (load-theme 'wheatgrass t))

(defun reload-config ()
  (interactive)
  (load-file (expand-file-name "init.el" user-emacs-directory)))
