(require 'flycheck)

(add-hook 'flycheck-error-list-mode-hook (lambda () (visual-line-mode 1)))

(load "config-flycheck-cargo-has-command-p-fix")

(provide 'config-flycheck)
