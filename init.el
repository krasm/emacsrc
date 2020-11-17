(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")

(defconst conf-dir (getenv "EMACS_CONF_DIR"))
(defconst snippets-dir "~/.emacs.d/yasnippet-snippets")
(defconst packages-dir (concat conf-dir "/packages"))


(org-babel-load-file (concat conf-dir "/emacs-customize.el.org"))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(eclim-eclipse-dirs '("~/opt/sts-bundle/sts-3.9.0-RELEASE"))
 '(nxml-attribute-indent 2)
 '(nxml-auto-insert-xml-declaration-flag t)
 '(nxml-bind-meta-tab-to-complete-flag t)
 '(nxml-slash-auto-complete-flag t)
 '(package-selected-packages
   '(lua-mode yaml-mode xcscope solarized-theme projectile powerline org-bullets magit evil elpy dockerfile-mode better-defaults auto-complete)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
