(use-package rust-mode
  :ensure t
  :custom
  (rust-mode-treesitter-derive (ignore-errors
                                 (treesit-language-available-p 'rust))))
