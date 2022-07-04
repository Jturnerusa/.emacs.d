(let ((local-lisp-directory (file-name-concat user-emacs-directory "lisp")))
  (add-to-list 'load-path (file-name-concat local-lisp-directory "backup-before-save")))

(require 'backup-before-save)
