(require 'use-package)
(require 'cl-lib)
(require 'seq)
(require 'server)
(require 'edebug)
(require 'site-gentoo)

(global-unset-key (kbd "<left>"))
(global-unset-key (kbd "<right>"))
(global-unset-key (kbd "<up>"))
(global-unset-key (kbd "<down>"))
(global-unset-key (kbd "<C-left>"))
(global-unset-key (kbd "<C-right>"))
(global-unset-key (kbd "<C-up>"))
(global-unset-key (kbd "<C-down>"))
(global-set-key   (kbd "C-x k")     'kill-this-buffer)
(global-set-key   (kbd "C-x C-b")   'ibuffer)

(setq auth-source-save-behavior nil
      auto-save-default nil
      change-major-mode-with-file-name nil
      custom-buffer-indent 4
      custom-file (file-name-concat user-emacs-directory "custom.el")
      custom-theme-directory (file-name-concat user-emacs-directory "themes/")
      debugger 'edebug
      display-buffer-base-action '(display-buffer-same-window display-buffer-reuse-window)
      initial-buffer-choice (lambda ()
                              (let ((initial-file (file-name-concat
                                                   user-emacs-directory
                                                   "initial-buffer")))
                                (if (file-exists-p initial-file)
                                    (find-file initial-file)
                                  (get-buffer-create "*scratch*"))))
      enable-local-variables :safe
      inhibit-splash-screen t
      make-backup-files nil
      mouse-wheel-progressive-speed nil
      tab-width 4
      temporary-file-directory (file-name-concat (or (getenv "TMPDIR") "/tmp") ".emacs")
      use-package-always-demand t
      use-package-ensure-function 'ignore)

(setq-default display-fill-column-indicator-column 120
              indent-tabs-mode nil)

(setq-default mode-line-format '("%*"
                                 " "
                                 (:eval (if buffer-file-name
                                            (abbreviate-file-name buffer-file-name)
                                          (buffer-name)))
                                 " "
                                 "(" mode-name ")"
                                 " "
                                 "(" (:eval (if server-process
                                                (process-name server-process)
                                              "_"))
                                 ")"))

(load-file (locate-user-emacs-file "lisp/packages.el"))

(cl-loop with packages-directory = (file-name-concat user-emacs-directory "packages")
         for package in (directory-files packages-directory t)
         unless (seq-contains-p '("." "..") (file-name-base package))
         do (load-file package))

(mkdir temporary-file-directory t)

(cua-mode 1)
(save-place-mode 1)
(show-paren-mode 1)
(recentf-mode 1)
(savehist-mode 1)
(when (and (featurep 'pixel-scroll) (display-graphic-p))
  (pixel-scroll-mode 1))

(menu-bar-mode 0)
(scroll-bar-mode 0)
(tool-bar-mode 0)
(tooltip-mode 0)

(load-theme 'wombat)
(load-theme 'badger t)

(set-face-attribute
 'default nil
 :family "Noto Sans Mono"
 :foundry "GOOG"
 :slant 'normal)
