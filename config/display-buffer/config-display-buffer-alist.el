(defvar config-display-buffer-gaps-width 20)

(defun config-display-buffer-which-side ()
  (if (> (+ (frame-pixel-width) config-display-buffer-gaps-width) (/ (x-display-pixel-width) 2))
      'right
    'bottom))

(defun config-display-buffer-update-alist (_)
  (let ((side (config-display-buffer-which-side)))
    (setq display-buffer-alist `(("\\*Flymake diagnostics.*"
                                  (display-buffer-in-side-window)
                                  (side . ,side)
                                  (window-height . 15)
	                          (window-width  . 75)
                                 ("\*Flycheck errors\*"
                                  (display-buffer-in-side-window)
                                  (side . ,side)
                                  (window-height . 15)
                                  (window-width . 75)))))))

(add-hook 'after-make-frame-functions 'config-display-buffer-update-alist)

(add-hook 'window-size-change-functions 'config-display-buffer-update-alist)
