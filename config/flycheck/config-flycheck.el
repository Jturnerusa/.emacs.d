(require 'flycheck)

(load "config-flycheck-cargo-has-command-p-fix")

(add-hook 'flycheck-error-list-mode-hook (lambda () (visual-line-mode 1)))

(add-to-list 'display-buffer-alist '("\\*Flycheck errors.*"
                                     (display-buffer-in-side-window)
                                     (side . (config-display-buffer-which-side))
                                     (window-height . 15)
                                     (window-width . 75)))

(provide 'config-flycheck)
