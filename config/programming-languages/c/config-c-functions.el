(defun config-c-mode-insert-header-guard ()
  (interactive)
  (let ((guard (upcase (format "%s_H" (file-name-base (buffer-file-name))))))
    (insert (format "#ifndef %s\n#define %s\n#endif" guard guard))))
