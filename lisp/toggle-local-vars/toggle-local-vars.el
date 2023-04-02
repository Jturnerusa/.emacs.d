(defun toggle-local-vars-on ()
  (interactive)
  (setq enable-local-variables t)
  (message "enabled local variables"))

(defun toggle-local-vars-off ()
  (interactive)
  (setq enable-local-variables nil)
  (message "disabled local variables"))

(provide 'toggle-local-vars)
