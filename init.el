(defconst conf-dir "~/priv/emacsrc")

(add-to-list 'load-path conf-dir)
(add-to-list 'load-path (concat conf-dir "/packages/color-theme-6.6.0"))
(add-to-list 'load-path (concat conf-dir "/packages/org/lisp"))

;; misc stuff
(load-library "emacs-rc-misc")

;; color theme
(if (< emacs-major-version 24)
    (load-library "emacs-rc-color-theme")
  (load-theme 'misterioso t))

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

;; mutt support
(load-library "emacs-rc-ediff")

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
 '(tool-bar-mode nil))
(put 'downcase-region 'disabled nil)
