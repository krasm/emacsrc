(package-initialize)

(defconst conf-dir (getenv "EMACS_CONF_DIR"))
(defconst snippets-dir "~/.emacs.d/yasnippet-snippets")
(defconst packages-dir "~/prj/emacsrc/packages")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(nxml-attribute-indent 2)
 '(nxml-auto-insert-xml-declaration-flag t)
 '(nxml-bind-meta-tab-to-complete-flag t)
 '(nxml-slash-auto-complete-flag t)
 '(org-agenda-files
   (quote
    ("/home/krasm/private/org/books.org" "/home/krasm/private/org/gym.org" "/home/krasm/private/org/kasa.org" "/home/krasm/private/org/todo.org")))
 '(org-mobile-files "d:\\priv\\org")
 '(package-selected-packages
   (quote
    (eclim yasnippet org-bullets clojure-mode solarized-theme auto-complete dockerfile-mode yaml-mode xcscope projectile material-theme magit lua-mode kotlin-mode jedi groovy-mode elpy cider better-defaults))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(org-babel-load-file (concat conf-dir "/emacs-customize.el.org"))
