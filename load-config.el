(let ((config-directory (file-name-concat user-emacs-directory "config")))
  (add-to-list 'load-path (file-name-concat config-directory "company"))
  (add-to-list 'load-path (file-name-concat config-directory "conf-mode"))
  (add-to-list 'load-path (file-name-concat config-directory "dired"))
  (add-to-list 'load-path (file-name-concat config-directory "display-buffer"))
  (add-to-list 'load-path (file-name-concat config-directory "eglot"))
  (add-to-list 'load-path (file-name-concat config-directory "eldoc"))
  (add-to-list 'load-path (file-name-concat config-directory "electric"))
  (add-to-list 'load-path (file-name-concat config-directory "flycheck"))
  (add-to-list 'load-path (file-name-concat config-directory "flymake"))
  (add-to-list 'load-path (file-name-concat config-directory "garbage-collection"))
  (add-to-list 'load-path (file-name-concat config-directory "ibuffer"))
  (add-to-list 'load-path (file-name-concat config-directory "keys"))
  (add-to-list 'load-path (file-name-concat config-directory "man"))
  (add-to-list 'load-path (file-name-concat config-directory "lsp-mode"))
  (add-to-list 'load-path (file-name-concat config-directory "native-comp"))
  (add-to-list 'load-path (file-name-concat config-directory "package"))
  (add-to-list 'load-path (file-name-concat config-directory "prog-mode"))
  (add-to-list 'load-path (file-name-concat config-directory "project"))
  (add-to-list 'load-path (file-name-concat config-directory "recentf"))
  (add-to-list 'load-path (file-name-concat config-directory "savehist"))
  (add-to-list 'load-path (file-name-concat config-directory "text-mode"))
  (add-to-list 'load-path (file-name-concat config-directory "tramp")))

(require 'config-text-mode)
(require 'config-conf-mode)
(require 'config-prog-mode)
(require 'config-dired)
(require 'config-display-buffer)
(require 'config-eldoc)
(require 'config-electric)
(require 'config-flymake)
(require 'config-garbage-collection)
(require 'config-ibuffer)
(require 'config-keys)
(require 'config-man)
(require 'config-package)
(require 'config-project)
(require 'config-recentf)
(require 'config-savehist)
(require 'config-tramp)

(when (locate-library "company")
  (require 'config-company))

(when (locate-library "eglot")
  (require 'config-eglot))

(when (locate-library "flycheck")
  (require 'config-flycheck))

(when (locate-library "lsp-mode")
  (require 'config-lsp-mode))

(when (and (> emacs-major-version 28) (native-comp-available-p))
  (require 'config-native-comp))
