(require 'seq)

(setq auth-source-save-behavior nil
      auto-save-default nil
      change-major-mode-with-file-name nil
      custom-buffer-indent 4
      custom-file (file-name-concat user-emacs-directory "custom.el")
      custom-theme-directory (file-name-concat user-emacs-directory "themes/")
      debugger 'edebug
      enable-local-variables :safe
      inferior-lisp-program "sbcl"
      inhibit-splash-screen t
      make-backup-files nil
      scheme-program-name "guile"
      tab-width 4)

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

(defmacro require? (feature)
  `(require ,feature nil t))

(require? 'site-gentoo)

(require? 'magit)

(require 'init-text-mode)
(require 'init-conf-mode)
(require 'init-prog-mode)
(require 'init-compile)
(require 'init-dired)
(require 'init-display-buffer)
(require 'init-ediff)
(require 'init-eldoc)
(require 'init-electric)
(require 'init-flymake)
(require 'init-garbage-collection)
(require 'init-ibuffer)
(require 'init-ielm)
(require 'init-keys)
(require 'init-man)
(require 'init-mode-line)
(require 'init-package)
(require 'init-project)
(require 'init-recentf)
(require 'init-savehist)
(require 'init-tramp)

(when (require? 'company)
  (require 'init-company))

(when (require? 'eglot)
  (require 'init-eglot))

(when (require? 'flycheck)
  (require 'init-flycheck))

(when (require? 'lsp-mode)
  (require 'init-lsp-mode))

(when (and (> emacs-major-version 28) (native-comp-available-p))
  (require 'init-native-comp))

(when (require? 'pixel-scroll)
  (require 'init-pixel-scroll))

(require 'man-completion)

(require 'license-boilerplate)

(when (file-exists-p custom-file)
  (load custom-file))

(cua-mode 1)
(save-place-mode 1)
(show-paren-mode 1)
(menu-bar-mode 0)
(scroll-bar-mode 0)
(tool-bar-mode 0)
(tooltip-mode 0)

(load-theme 'wombat)
(load-theme 'badger t)
