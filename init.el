(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")
(package-initialize)

(defconst conf-dir (getenv "EMACS_CONF_DIR"))
(defconst snippets-dir "~/.emacs.d/yasnippet-snippets")
(defconst packages-dir (concat conf-dir "/packages"))


(org-babel-load-file (concat conf-dir "/emacs-customize.el.org"))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(nxml-attribute-indent 2)
 '(nxml-auto-insert-xml-declaration-flag t)
 '(nxml-bind-meta-tab-to-complete-flag t)
 '(nxml-slash-auto-complete-flag t)
 '(package-selected-packages
   (quote
    (elpy yasnippet yaml-mode xcscope solarized-theme projectile org-bullets magit dockerfile-mode better-defaults auto-complete))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
