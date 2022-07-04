(defun man-wrapper-find-pages ()
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

(defun man-wrapper-locate-page (page)
  (with-temp-buffer
    (let ((exit-code (call-process "man" nil (current-buffer) nil "--where" page)))
      (when exit-code
        (let* ((output (buffer-string))
               (trimmed (string-trim-right output "\n")))
          trimmed)))))

(defun man-wrapper (orig &rest args)
  (interactive)
  (let* ((arg (if args
                  (nth 0 args)
                (completing-read "Select page: " (man-wrapper-find-pages))))
         (page (man-wrapper-locate-page arg)))
    (funcall orig page)))

(advice-add 'man :around 'man-wrapper)

(provide 'man-wrapper)
