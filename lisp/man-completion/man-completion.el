(defun man-completion-is-compression-suffix (suffix)
  (string-match-p "\\.bz2$\\|gzip$\\|zst$" suffix))

(defun man-completion-get-man-paths ()
  (let* ((manpath (getenv "MANPATH"))
         (manpaths (split-string manpath ":" t))
         (manpaths (mapcar (lambda (path)
                             (file-expand-wildcards (file-name-concat path "man*")))
                           manpaths))
         (manpaths (flatten-list manpaths))
         (manpaths (seq-filter 'file-exists-p manpaths)))
    manpaths))

(defun man-completion-find-pages ()
  (let* ((files (mapcar (lambda (p)
                          (directory-files-recursively p ".+" nil))
                        (man-completion-get-man-paths)))
         (files (flatten-list files))
         (files (mapcar 'file-name-base files))
         (files (mapcar (lambda (f)
                          (if (man-completion-is-compression-suffix f)
                              (file-name-sans-extension f)
                            f))
                        files)))
    files))

(defun man-completion-locate-page (page)
  (with-temp-buffer
    (let ((exit-code (call-process "man" nil (current-buffer) nil "--where" page)))
      (when exit-code
        (let* ((output (buffer-string))
               (trimmed (string-trim-right output "\n")))
          trimmed)))))

(defun man-completion (orig &rest args)
  (interactive)
  (let* ((arg (if args
                  (nth 0 args)
                (completing-read "Select page: "
                                 (man-completion-find-pages)
                                 nil
                                 t)))
         (page (man-completion-locate-page arg)))
    (funcall orig page)))

(advice-add 'man :around 'man-completion)

(provide 'man-completion)
