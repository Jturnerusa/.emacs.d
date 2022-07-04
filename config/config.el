(require 'seq)

(defvar config-directory (file-name-directory (locate-library "config")))

(defun config-add-modules-to-load-path (directory)
  (let* ((pattern (file-name-concat directory "*"))
         (results (file-expand-wildcards pattern))
         (directories (seq-filter 'file-directory-p results))
         (non-hidden (seq-filter (lambda (d)
                                   (let ((base (file-name-base d)))
                                     (not (string-prefix-p "." base))))
                                 directories)))
    (mapc (lambda (m)
            (add-to-list 'load-path m))
          non-hidden)))

(config-add-modules-to-load-path config-directory)

(require 'config-dired)
(require 'config-display-buffer)
(require 'config-eldoc)
(require 'config-electric)
(require 'config-files)
(require 'config-flymake)
(require 'config-garbage-collection)
(require 'config-keys)
(require 'config-man)
(require 'config-package)
(require 'config-programming-languages)
(require 'config-project)
(require 'config-recentf)
(require 'config-savehist)
(require 'config-tramp)

(require 'config-text-mode)
(require 'config-conf-mode)
(require 'config-prog-mode)

(when (locate-library "company")
  (require 'config-company))

(when (locate-library "eglot")
  (require 'config-eglot))

(when (locate-library "flycheck")
  (require 'config-flycheck))

(when (locate-library "lsp-mode")
  (require 'config-lsp-mode))

(when (and (>= emacs-major-version 28) (native-comp-available-p))
  (require 'config-native-comp))

(provide 'config)
