(defun config-man-pages ()
  (let* ((manpath (getenv "MANPATH"))
         (directories (split-string manpath ":" t))
         (that-exist (seq-filter 'file-exists-p directories))
         (files (mapcar (lambda (d)
                          (directory-files-recursively d ".*" nil))
                        that-exist))
         (flattened (flatten-list files))
         (pages (mapcar 'file-name-nondirectory flattened))
         (without-second-ext (mapcar (lambda (p)
                                       (let ((extension (file-name-extension p)))
                                         (if (string-match-p "^[0-9+]$" extension)
                                             p
                                           (file-name-sans-extension p))))
                                     pages)))
    without-second-ext))

(defun config-man-locate-page (page)
  (with-temp-buffer
    (let ((exit-code (call-process "man" nil (current-buffer) nil "--where" page)))
      (when exit-code
        (let* ((output (buffer-string))
               (trimmed (string-trim-right output "\n")))
          trimmed)))))

(defun config-man-advice (orig &rest args)
  (interactive)
  (let ((page (or args (list (completing-read "Select page: " (config-man-pages) nil t)))))
    (apply orig page)))

(advice-add 'man :around 'config-man-advice)
