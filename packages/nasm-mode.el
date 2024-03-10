(use-package nasm-mode
  :config
  (advice-add 'nasm-comment :around (lambda (&rest _) (insert ";"))))
