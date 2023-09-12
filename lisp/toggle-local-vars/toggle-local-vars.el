(defun toggle-local-vars-on ()
  (interactive)
  (setq enable-local-variables t)
  (message "enabled local variables"))

(defun toggle-local-vars-off ()
  (interactive)
  (setq enable-local-variables nil)
  (message "disabled local variables"))

(defun toggle-remote-local-vars-on ()
  (interactive)
  (setq enable-remote-dir-locals t
        enable-local-variables t)
  (message "enabled local variables"))

(defun toggle-remote-local-vars-off ()
  (interactive)
  (setq enable-remote-dir-locals nil)
  (message "disabled local variables"))

(provide 'toggle-local-vars)
