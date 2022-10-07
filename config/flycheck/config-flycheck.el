(require 'flycheck)

(load "config-flycheck-cargo-has-command-p-fix")

(add-hook 'flycheck-error-list-mode-hook (lambda () (visual-line-mode 1)))

(add-to-list 'display-buffer-alist '("\\*Flycheck errors.*"
                                     (config-display-buffer-best-side)
                                     (which-side . (lambda ()
                                                     (if (config-display-buffer-frame-wide-p)
                                                         'right
                                                       'bottom)))))


(provide 'config-flycheck)
