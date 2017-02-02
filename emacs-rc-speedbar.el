(require 'sr-speedbar)
(setq speedbar-use-images nil)
(setq width 25)
(sr-speedbar-open)

(with-current-buffer sr-speedbar-buffer-name
  (setq window-size-fixed 'width))
(setq sr-speedbar-skip-other-window-p t)

(defadvice delete-other-windows (after my-sr-speedbar-delete-other-window-advice activate)
  "Check whether we are in speedbar, if it is, jump to next window."
  (let ()
	(when (and (sr-speedbar-window-exist-p sr-speedbar-window)
               (eq sr-speedbar-window (selected-window)))
      (other-window 1)
	)))

