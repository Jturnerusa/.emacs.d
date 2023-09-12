(use-package flymake
  :hook
  (flymake-diagnostics-buffer-mode . visual-line-mode)
  :config
  (when (require 'best-side-window nil t)
    (add-to-list 'display-buffer-alist '((major-mode . flymake-diagonstics-buffer-mode)
                                         best-side-window-display-buffer-in-best-side-window))))
