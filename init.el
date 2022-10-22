(when (locate-library "site-gentoo")
  (require 'site-gentoo))

(setq auth-source-save-behavior nil
      auto-save-default nil
      change-major-mode-with-file-name nil
      custom-buffer-indent 4
      custom-file (file-name-concat user-emacs-directory "custom.el")
      custom-theme-directory (file-name-concat user-emacs-directory "themes/")
      inhibit-splash-screen t
      make-backup-files nil
      tab-width 4)

(setq-default display-fill-column-indicator-column 120
              mode-line-format (list "%b (%m)")
              indent-tabs-mode nil)

(when (file-exists-p (file-name-concat custom-theme-directory "custom-wombat-theme.el"))
  (load-theme 'custom-wombat t))

(when (file-exists-p custom-file)
  (load custom-file))

(cua-mode 1)
(recentf-mode 1)
(savehist-mode 1)
(save-place-mode 1)
(show-paren-mode 1)
(pixel-scroll-mode 1)
(pixel-scroll-precision-mode 1)
(menu-bar-mode 0)
(scroll-bar-mode 0)
(tool-bar-mode 0)
(tooltip-mode 0)

(let ((config-directory (file-name-concat user-emacs-directory "init")))
  (add-to-list 'load-path (file-name-concat config-directory "company"))
  (add-to-list 'load-path (file-name-concat config-directory "conf-mode"))
  (add-to-list 'load-path (file-name-concat config-directory "dired"))
  (add-to-list 'load-path (file-name-concat config-directory "display-buffer"))
  (add-to-list 'load-path (file-name-concat config-directory "ediff"))
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

(require 'init-text-mode)
(require 'init-conf-mode)
(require 'init-prog-mode)
(require 'init-dired)
(require 'init-display-buffer)
(require 'init-ediff)
(require 'init-eldoc)
(require 'init-electric)
(require 'init-flymake)
(require 'init-garbage-collection)
(require 'init-ibuffer)
(require 'init-keys)
(require 'init-man)
(require 'init-package)
(require 'init-project)
(require 'init-recentf)
(require 'init-savehist)
(require 'init-tramp)

(when (locate-library "company")
  (require 'init-company))

(when (locate-library "eglot")
  (require 'init-eglot))

(when (locate-library "flycheck")
  (require 'init-flycheck))

(when (locate-library "lsp-mode")
  (require 'init-lsp-mode))

(when (and (> emacs-major-version 28) (native-comp-available-p))
  (require 'init-native-comp))

(let ((local-lisp-directory (file-name-concat user-emacs-directory "lisp")))
  (add-to-list 'load-path (file-name-concat local-lisp-directory "man-completion")))

(require 'man-completion)
