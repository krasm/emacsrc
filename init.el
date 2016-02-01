(defconst conf-dir "~/prj/emacsrc")

(add-to-list 'load-path conf-dir)
(add-to-list 'load-path (concat conf-dir "/packages/"))
(add-to-list 'load-path (concat conf-dir "/packages/color-theme-6.6.0"))
(add-to-list 'load-path (concat conf-dir "/packages/org/lisp"))
(add-to-list 'load-path (concat conf-dir "/packages/groovy-mode"))
(add-to-list 'load-path (concat conf-dir "/packages/emacs-maildir"))
(add-to-list 'load-path (concat conf-dir "/packages/kv"))
(add-to-list 'load-path (concat conf-dir "/packages/noflet"))
(add-to-list 'load-path (concat conf-dir "/packages/s"))
(add-to-list 'load-path (concat conf-dir "/packages/dash"))
(add-to-list 'load-path (concat conf-dir "/packages/gradle-mode"))
(add-to-list 'load-path (concat conf-dir "/packages/clojure-mode"))
(add-to-list 'load-path (concat conf-dir "/packages/cider"))


;; misc stuff
(load-library "emacs-rc-misc")

;; melpa
(load-library "emacs-rc-melpa")

;; color theme
;;(if (< emacs-major-version 24)
;;    (load-library "emacs-rc-color-theme")
;;  (load-theme 'misterioso t))

;; emacs server
(load-library "emacs-rc-server")

;; nxml-mode
(load-library "emacs-rc-nxml")

;; autocomplete-mode
;;(load-library "emacs-rc-autocomplete")

;; org mode
(load-library "emacs-rc-org")

;; cc-mode 
(load-library "emacs-rc-cc-mode")

;; ido mode
(load-library "emacs-rc-ido")

;; ediff mode
(load-library "emacs-rc-ediff")

;; groovy mode
(load-library "emacs-rc-groovy")

;; scheme mode
(load-library "emacs-rc-scheme")

(load-library "emacs-rc-maildir")

;;  gradle mode
(require 'gradle-mode)
(gradle-mode 1)

;; cider clojure mode
(require 'clojure-mode)
(require 'cider)
(cider-jack-in)

;; clearcase support
;;(defvar directory-sep-char "/")
;;(load "clearcase")


;; magit
;;(load-library "emacs-rc-magit")

;; set some local stuff which should not be shared
(if (file-exists-p "emacs-rc-local.el")
    (load-library "emacs-rc-local")
)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(custom-enabled-themes (quote (wombat)))
 '(display-time-mode t)
 '(font-use-system-font t)
 '(nxml-attribute-indent 2)
 '(nxml-auto-insert-xml-declaration-flag t)
 '(nxml-bind-meta-tab-to-complete-flag t)
 '(nxml-slash-auto-complete-flag t)
 '(org-agenda-files nil)
 '(show-paren-mode t)
 '(tool-bar-mode nil))
(put 'downcase-region 'disabled nil)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "fixed" :foundry "misc" :slant normal :weight normal :height 113 :width normal)))))
