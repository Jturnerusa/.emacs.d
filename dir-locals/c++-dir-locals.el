((c++-mode
  . ((fmt-executable . "clang-format")
     (eval . (add-hook 'before-save-hook 'fmt-current-buffer nil t))
     (eval . (add-to-list 'eglot-server-programs '(c++-mode . ("clangd" "-header-insertion=never"))))
     (eval . (eglot-ensure))
     (eval . (company-mode 1)))))
