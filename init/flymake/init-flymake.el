(require 'flymake)

(load "init-flymake-hooks")

(add-to-list 'display-buffer-alist '("\\*Flymake diagnostics.*"
                                     (init-display-buffer-best-side)
                                     (which-side . (lambda ()
                                                     (if (init-display-buffer-frame-wide-p)
                                                         'right
                                                       'bottom)))))

(provide 'init-flymake)
