(defvar backup-before-save-directory (file-name-concat user-emacs-directory "backups"))

(unless (file-exists-p backup-before-save-directory)
  (mkdir backup-before-save-directory))

(defun backup-before-save-format-path (path number)
  (format "%s.~%s~" path number))

(defun backup-before-save-extension (path)
  (let* ((i (string-search "." (reverse path)))
         (extension (substring path (- (length path) i))))
    extension))

(defun backup-before-save-no-extension (path)
  (let* ((i (string-search "." (reverse path)))
         (no-extension (substring path 0 (- (length path) (+ i 1)))))
    no-extension))

(defun backup-before-save-number (path)
  (let* ((extension (backup-before-save-extension path))
         (extracted (substring extension 1 (- (length extension) 1)))
         (as-number (unless (zerop (length extracted))
                      (string-to-number extracted))))
    as-number))

(defun backup-before-save-shift-path (path)
  (let* ((without-extension (backup-before-save-no-extension path))
         (number (backup-before-save-number path))
         (next-number (+ number 1))
         (shifted-path (backup-before-save-format-path
                        without-extension
                        next-number)))
    shifted-path))

(defun backup-before-save-shift-backup (path)
  (let ((next-path (backup-before-save-shift-path path)))
    (when (file-exists-p next-path)
        (backup-before-save-shift-backup next-path))
    (rename-file path next-path)))

(defun backup-before-save-function ()
  (unless backup-inhibited
    (let* ((full-path (buffer-file-name))
           (base-path (file-name-nondirectory full-path))
           (backup-full-path (file-name-concat backup-before-save-directory base-path))
           (backup-full-path-numbered (backup-before-save-format-path backup-full-path 0)))
      (when (file-exists-p full-path)
        (when (file-exists-p backup-full-path-numbered)
          (backup-before-save-shift-backup backup-full-path-numbered))
        (copy-file full-path backup-full-path-numbered)))))

(add-hook 'before-save-hook 'backup-before-save-function)

(provide 'backup-before-save)
