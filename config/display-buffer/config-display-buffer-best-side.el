(defun config-display-buffer-frame-wide-p ()
  (> (frame-pixel-width) (/ (x-display-pixel-width) 2)))

(defun config-display-buffer-best-side (buffer alist)
  (let* ((side (funcall (alist-get 'which-side alist)))
         (alist (append (cdr alist) (list (cons 'side side)))))
    (display-buffer-in-side-window buffer alist)))
