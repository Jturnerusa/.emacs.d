(defvar config-files-backup-directory (file-name-concat user-emacs-directory "backups"))

(unless (file-exists-p config-files-backup-directory)
  (mkdir config-files-backup-directory))

(defun config-files-format-backup-path (path number)
  (format "%s.~%s~" path number))

(defun config-files-backup-extension (path)
  (let* ((i (string-search "." (reverse path)))
         (extension (substring path (- (length path) i))))
    extension))

(defun config-files-backup-no-extension (path)
  (let* ((i (string-search "." (reverse path)))
         (no-extension (substring path 0 (- (length path) (+ i 1)))))
    no-extension))

(defun config-files-backup-number (path)
  (let* ((extension (config-files-backup-extension path))
         (extracted (substring extension 1 (- (length extension) 1)))
         (as-number (unless (zerop (length extracted))
                      (string-to-number extracted))))
    as-number))

(defun config-files-shift-path (path)
  (let* ((without-extension (config-files-backup-no-extension path))
         (number (config-files-backup-number path))
         (next-number (+ number 1))
         (shifted-path (config-files-format-backup-path
                        without-extension
                        next-number)))
    shifted-path))

(defun config-files-shift-backup (path)
  (let ((next-path (config-files-shift-path path)))
    (when (file-exists-p next-path)
        (config-files-shift-backup next-path))
    (rename-file path next-path)))

(defun config-files-backup-before-save ()
  (unless backup-inhibited
    (let* ((path (buffer-file-name))
           (backup-path (config-files-format-backup-path path 0)))
      (when (file-exists-p path)
        (when (file-exists-p backup-path)
          (config-files-shift-backup backup-path))
        (copy-file path backup-path)))))

(add-hook 'before-save-hook 'config-files-backup-before-save)
