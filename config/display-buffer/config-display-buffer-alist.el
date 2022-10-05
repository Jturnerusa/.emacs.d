(defvar config-display-buffer-gaps-width 20)

(defun config-display-buffer-which-side ()
  (if (> (+ (frame-pixel-width) config-display-buffer-gaps-width) (/ (x-display-pixel-width) 2))
      'right
    'bottom))
