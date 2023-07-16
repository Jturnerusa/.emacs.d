(use-package conf-mode
  :hook
  (prog-mode . visual-line-mode)
  (prog-mode . display-line-numbers-mode)
  (prog-mode . electric-pair-mode)
  (prog-mode . electric-indent-mode)
  (prog-mode . (lambda ()
                 (when (featurep 'highlight-indentation)
                   (highlight-indentation-mode 1)))))
