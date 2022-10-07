(require 'flymake)

(load "config-flymake-hooks")

(add-to-list 'display-buffer-alist '("\\*Flymake diagnostics.*"
                                     (config-display-buffer-best-side)
                                     (which-side . (lambda ()
                                                     (if (config-display-buffer-frame-wide-p)
                                                         'right
                                                       'bottom)))))

(provide 'config-flymake)
