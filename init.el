(add-to-list 'load-path (file-name-concat user-emacs-directory "config"))

(require 'config)

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
