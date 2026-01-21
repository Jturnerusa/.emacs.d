(require 'site-gentoo nil t)
(require 'use-package)
(require 'cl-lib)
(require 'seq)
(require 'server)
(require 'edebug)
(require 'xdg)

(global-set-key   (kbd "C-x k")     'kill-current-buffer)
(global-set-key   (kbd "C-x C-b")
                  (lambda (arg)
                    (interactive "P")
                    (if (require 'persp nil t)
                        (with-persp-buffer-list
                         () (ibuffer arg))
                      (ibuffer))))

(setq auth-source-save-behavior nil
      auto-save-default nil
      change-major-mode-with-file-name nil
      custom-buffer-indent 4
      custom-file "/dev/null"
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
      read-process-output-max (or (ignore-errors
				    (string-to-number
				     (with-temp-buffer
                                       (insert-file-contents "/proc/sys/fs/pipe-max-size")
                                       (buffer-string))))
				  (expt 1024 2))
      inhibit-splash-screen t
      make-backup-files nil
      mouse-wheel-progressive-speed nil
      tab-width 4
      temporary-file-directory (file-name-concat (or (getenv "TMPDIR") "/tmp") ".emacs")
      use-package-always-demand t
      use-package-ensure-function 'ignore
      user-full-name "John Turner"
      user-mail-address "jturner.usa@gmail.com"
      package-check-signature 'all)

(setq-default create-lockfiles nil
              display-fill-column-indicator-column 120
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
                                 ")"
                                 " "
                                 "(" persp-last-persp-name ")"))

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

(when (featurep 'pixel-scroll)
  (pixel-scroll-mode 1))

(menu-bar-mode 0)

(when (display-graphic-p)
  (scroll-bar-mode 0))

(tool-bar-mode 0)
(tooltip-mode 0)
(auto-save-mode 0)

(when (require 'persp-mode nil t)
  (persp-mode))

(load-theme 'wombat)
(load-theme 'badger t)

(set-face-attribute
 'default nil
 :family "Noto Sans Mono"
 :foundry "GOOG"
 :slant 'normal)

(add-hook 'focus-out-hook 'garbage-collect)
(add-hook 'before-save-hook 'garbage-collect)
