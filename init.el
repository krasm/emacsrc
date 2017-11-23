(package-initialize)

(defconst conf-dir "~/prj/emacsrc")
(defconst snippets-dir "~/.emacs.d/yasnippet-snippets")
(defconst packages-dir "~/prj/emacsrc/packages")
(defconst aspell-prog "/usr/local/bin/aspell")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (dockerfile-mode yaml-mode xcscope projectile material-theme magit lua-mode kotlin-mode jedi groovy-mode elpy cider better-defaults))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(org-babel-load-file (concat conf-dir "/emacs-customize.el.org"))
