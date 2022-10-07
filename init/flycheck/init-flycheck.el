(require 'flycheck)

(load "init-flycheck-cargo-has-command-p-fix")

(add-hook 'flycheck-error-list-mode-hook (lambda () (visual-line-mode 1)))

(add-to-list 'display-buffer-alist '("\\*Flycheck errors.*"
                                     (init-display-buffer-best-side)
                                     (which-side . (lambda ()
                                                     (if (init-display-buffer-frame-wide-p)
                                                         'right
                                                       'bottom)))))


(provide 'init-flycheck)
