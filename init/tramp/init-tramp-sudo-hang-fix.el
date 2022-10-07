(defun sudo-edit ()
  (interactive)
  (find-file (format "/sudo:root@%s:%s" system-name (read-file-name "Edit as root: "))))
