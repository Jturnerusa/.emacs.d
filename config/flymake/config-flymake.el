(require 'flymake)

(load "config-flymake-hooks")

(add-to-list 'display-buffer-alist '("\\*Flymake diagnostics.*"
                                     (display-buffer-in-side-window)
                                     (side . (config-display-buffer-which-side))
                                     (window-height . 15)
                                     (window-width . 75)))

(provide 'config-flymake)
