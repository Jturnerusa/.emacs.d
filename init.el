(defmacro require? (feature)
  `(require ,feature nil t))

(unless (when-let ((e (getenv "NO_SITE_GENTOO")))
          (string= e "1"))
  (require? 'site-gentoo))

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

(when (require? 'flycheck)
  (require 'init-flycheck))

(when (require? 'lsp-mode)
  (require 'init-lsp-mode))

(when (require? 'pixel-scroll)
  (require 'init-pixel-scroll))

(when (and (require? 'treesit) (treesit-available-p))
  (require 'init-treesit))

(require 'man-completion)

(require 'license-boilerplate)

(require 'toggle-local-vars)

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
