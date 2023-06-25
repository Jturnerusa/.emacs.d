(setq auth-source-save-behavior nil
      auto-save-default nil
      change-major-mode-with-file-name nil
      custom-buffer-indent 4
      custom-file (file-name-concat user-emacs-directory "custom.el")
      custom-theme-directory (file-name-concat user-emacs-directory "themes/")
      debugger 'edebug
      initial-buffer-choice (lambda ()
                       (let ((initial-file (file-name-concat
                                            user-emacs-directory
                                            "initial-buffer")))
                         (if (file-exists-p initial-file)
                             (find-file initial-file)
                           (get-buffer-create "*scratch*"))))
      enable-local-variables :safe
      inferior-lisp-program "sbcl"
      inhibit-splash-screen t
      make-backup-files nil
      scheme-program-name "guile"
      tab-width 4
      temporary-file-directory (file-name-concat (getenv "HOME") "tmp" ".emacs"))

(setq-default display-fill-column-indicator-column 120
              indent-tabs-mode nil)

(let* ((init-modules-wildcard
        (file-name-concat user-emacs-directory "init" "*"))
       (lisp-modules-wildcard
        (file-name-concat user-emacs-directory "lisp" "*"))
       (init-modules-files
        (file-expand-wildcards init-modules-wildcard t))
       (lisp-modules-files
        (file-expand-wildcards lisp-modules-wildcard t))
       (files
        (append init-modules-files lisp-modules-files))
       (directories
        (seq-filter 'file-directory-p files)))
  (mapc (lambda (directory)
          (add-to-list 'load-path directory))
        directories))

(mkdir temporary-file-directory t)

(require 'init-garbage-collection)

(when (and (>= emacs-major-version 29) (native-comp-available-p))
  (require 'init-native-comp))
