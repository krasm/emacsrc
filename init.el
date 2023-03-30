(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")
(if (< emacs-major-version 27)
    (package-initialize)
  )

(defconst conf-dir (getenv "EMACS_CONF_DIR"))
(defconst snippets-dir "~/.emacs.d/yasnippet-snippets")
(defconst packages-dir (concat conf-dir "/packages"))


(org-babel-load-file (concat conf-dir "/emacs-customize.el.org"))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("00445e6f15d31e9afaa23ed0d765850e9cd5e929be5e8e63b114a3346236c44c" "0fffa9669425ff140ff2ae8568c7719705ef33b7a927a0ba7c5e2ffcfac09b75" default))
 '(frame-background-mode nil)
 '(mail-user-agent 'gnus-user-agent)
 '(nxml-attribute-indent 2)
 '(nxml-auto-insert-xml-declaration-flag t)
 '(nxml-bind-meta-tab-to-complete-flag t)
 '(nxml-slash-auto-complete-flag t)
 '(package-selected-packages
   '(notmuch elpy yasnippet-snippets yaml-mode xcscope restclient projectile org-bullets dockerfile-mode better-defaults auto-complete))
 '(send-mail-function 'sendmail-send-it))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
