;; init.el --- Emacs configuration

;; GLOBALS
;; --------------------------------------
(defconst conf-dir "~/prj/misc/emacsrc")
(defconst snippets-dir "~/.emacs.d/yasnippet-snippets")
(defconst aspell "/usr/local/bin/aspell")

(add-to-list 'load-path "~/prj/emacsrc/packages")

;; INSTALL PACKAGES
;; --------------------------------------

(require 'package)

(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)

(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))

(defvar myPackages
  '(better-defaults
    kotlin-mode
    lua-mode
    xcscope
    magit
    material-theme
    projectile
    clojure-mode
    cider
    groovy-mode
    yaml-mode
    ))

(mapc #'(lambda (package)
          (unless (package-installed-p package)
            (package-install package)))
      myPackages)

;; BASIC CUSTOMIZATION
;; --------------------------------------

(setenv "DICTIONARY" "en_GB")
(setq ispell-program-name aspell)
(require 'ispell)

(require 'xcscope)
(cscope-setup)

(setq inhibit-startup-message t) ;; hide the startup message
(load-theme 'material t) ;; load material theme
(global-linum-mode t) ;; enable line numbers globally
(display-time-mode 1)

;; sr-speedbar

(require 'sr-speedbar)
(setq
   sr-speedbar-right-side nil
   sr-speedbar-width-x 10
   sr-speedbar-width-console 10
   sr-speedbar-max-width 10
   sr-speedbar-delete-windows t
   sr-speedbar-auto-refresh t)
(sr-speedbar-open)

;; snippets directory
(setq yas-snippet-dirs
      '(snippets-dir)
      )
(yas-global-mode 1)


;; org mode
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-cb" 'org-iswitchb)

(setq org-mobile-directory "/scp:krasm@krasm.net:~/org/")
(setq org-directory "~/priv/org")

;; yaml mode


;; load some defaults see https://github.com/hrs/sensible-defaults.el
(load-file "emacs-rc-sensible-defaults.el")
(sensible-defaults/use-all-settings)
(sensible-defaults/use-all-keybindings)

(server-start)

(add-to-list 'load-path (concat conf-dir "/packages/yaml-mode") )
(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-mode))
(add-hook 'yaml-mode-hook
	  (lambda ()
	    (define-key yaml-mode-map "\C-m" 'newline-and-indent)))

;; misc functions
(defun json-format ()
  (interactive)
  (save-excursion
    (shell-command-on-region (mark) (point) "python -m json.tool" (buffer-name) t)
    )
  )

;; transpose windows
(defun rotate-windows ()
  "Rotate your windows"
  (interactive)
  (cond
   ((not (> (count-windows) 1))
    (message "You can't rotate a single window!"))
   (t
    (let ((i 1)
          (num-windows (count-windows)))
      (while  (< i num-windows)
        (let* ((w1 (elt (window-list) i))
               (w2 (elt (window-list) (+ (% i num-windows) 1)))
               (b1 (window-buffer w1))
               (b2 (window-buffer w2))
               (s1 (window-start w1))
               (s2 (window-start w2)))
          (set-window-buffer w1 b2)
          (set-window-buffer w2 b1)
          (set-window-start w1 s2)
          (set-window-start w2 s1)
          (setq i (1+ i))))))))
(global-set-key "\C-xt" 'rotate-windows)

(defun toggle-window-split ()
  (interactive)
  (if (= (count-windows) 2)
      (let* ((this-win-buffer (window-buffer))
             (next-win-buffer (window-buffer (next-window)))
             (this-win-edges (window-edges (selected-window)))
             (next-win-edges (window-edges (next-window)))
             (this-win-2nd (not (and (<= (car this-win-edges)
                                         (car next-win-edges))
                                     (<= (cadr this-win-edges)
                                         (cadr next-win-edges)))))
             (splitter
              (if (= (car this-win-edges)
                     (car (window-edges (next-window))))
                  'split-window-horizontally
                'split-window-vertically)))
	(delete-other-windows)
	(let (((format "message" format-args)irst-win (selected-window)))
          (funcall splitter)
          (if this-win-2nd (other-window 1))
          ((setq )et-window-buffer (selected-window) this-win-buffer)
          (set-window-buffer (next-window) next-win-buffer)
          (select-window first-win)
          (if this-win-2nd (other-window 1))))))

(define-key ctl-x-4-map "t" 'toggle-window-split)

(defun toggle-fullscreen ()
  "Toggle full screen on X11"
  (interactive)
  (when (eq window-system 'x)
    (set-frame-parameter
     nil 'fullscreen
     (when (not (frame-parameter nil 'fullscreen)) 'fullboth))))

(global-set-key [f11] 'toggle-fullscreen)


;; rename buffer and file opened in emacs
;; source: http://steve.yegge.googlepages.com/my-dot-emacs-file
(defun rename-file-and-buffer (new-name)
  "Renames both current buffer and file it's visiting to NEW-NAME."
  (interactive "sNew name: ")
  (let ((name (buffer-name))
        (filename (buffer-file-name)))
    (if (not filename)
        (message "Buffer '%s' is not visiting a file!" name)
      (if (get-buffer new-name)
          (message "A buffer named '%s' already exists!" new-name)
        (progn
          (rename-file name new-name 1)
          (rename-buffer new-name)
          (set-visited-file-name new-name)
          (set-buffer-modified-p nil))))))

(global-set-key "\M-\C-?" 'delete-horizontal-space)
(global-set-key "\C-xn" 'other-window)

(defun other-window-backward (&optional n)
  "Select Nth previous window."
  (interactive "p")
  (other-window (- (or n 1)))
)
(global-set-key "\C-xp" 'other-window-backward)


;; global keybindings
(global-set-key (kbd "C-x  C-g") 'goto-line)

(global-set-key (kbd "S-C-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "S-C-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "S-C-<down>") 'shrink-window)
(global-set-key (kbd "S-C-<up>") 'enlarge-window)

;; init.el ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(display-time-mode t)
 '(menu-bar-mode nil)
 '(package-selected-packages
   (quote
    (cider clojure-mode projectile material-theme magit lua-mode kotlin-mode elpy better-defaults)))
 '(python-shell-interpreter "/usr/local/bin/python2")
 '(show-paren-mode t)
 '(speedbar-default-position (quote left))
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Consolas" :foundry "MS  " :slant normal :weight normal :height 128 :width normal)))))
