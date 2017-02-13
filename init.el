
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
(add-to-list 'load-path (concat conf-dir "/packages/web-mode"))
(add-to-list 'load-path (concat conf-dir "/packages/go-mode"))
(add-to-list 'load-path (concat conf-dir "/packages/jdee"))
(add-to-list 'load-path (concat conf-dir "/packages/lua-mode"))
(add-to-list 'load-path (concat conf-dir "/packages/markdown-mode"))
(add-to-list 'load-path (concat conf-dir "/packages/php-mode"))

(add-to-list 'load-path (concat conf-dir "/solarized"))
(add-to-list 'load-path (concat conf-dir "/themes"))

(load-library "package")

;; misc stuff
(load-library "emacs-rc-misc")

;; melpa
(load-library "emacs-rc-melpa")

;; speedbar
(load-library "emacs-rc-speedbar")

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
;;(load-library "emacs-rc-groovy")

;; scheme mode
(load-library "emacs-rc-scheme")

(load-library "emacs-rc-maildir")

;;  gradle mode
;;(require 'gradle-mode)
;;(gradle-mode 1)

;; cider clojure mode
;;(require 'clojure-mode)
;;(require 'cider)
;;(cider-jack-in)

;; go-mode
(load-library "emacs-rc-go")

;; clearcase support
;;(defvar directory-sep-char "/")
;;(load "clearcase")

;; web-mode
(load-library "emacs-rc-web-mode")

;; jdee
;;(load-library "emacs-rc-jdee")

;; magit
;; (load-library "emacs-rc-magit")

;; lua-mode
(load-library "lua-mode")

;; set some local stuff which should not be shared
(if (file-exists-p "emacs-rc-local.el")
    (load-library "emacs-rc-local")
)

(load-library "emacs-rc-markdown-mode")

(load-library "emacs-rc-php")

;; solarized 
;;(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(custom-enabled-themes (quote (wombat)))
 '(custom-safe-themes
   (quote
    ("8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" default)))
 '(display-time-mode t)
 '(jdee-server-dir "/home/krasm/prj/emacsrc")
 '(nxml-attribute-indent 2)
 '(nxml-auto-insert-xml-declaration-flag t)
 '(nxml-bind-meta-tab-to-complete-flag t)
 '(nxml-slash-auto-complete-flag t)
 '(org-agenda-files nil)
 '(send-mail-function (quote smtpmail-send-it))
 '(show-paren-mode t)
 '(smtpmail-smtp-server "localhost")
 '(smtpmail-smtp-service 25)
 '(tool-bar-mode nil))
(put 'downcase-region 'disabled nil)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "DejaVu Sans Mono" :foundry "PfEd" :slant normal :weight normal :height 98 :width normal)))))
