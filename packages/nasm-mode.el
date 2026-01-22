(use-package nasm-mode
  :if (locate-library "nasm-mode")
  :config
  (advice-add 'nasm-comment :around (lambda (&rest _) (insert ";"))))
