((c++-ts-mode
  . ((fmt-executable . "clang-format")
     (eval . (setq-local fmt-args `("--assume-filename" ,(buffer-file-name))))
     (eval . (add-hook 'before-save-hook 'fmt-current-buffer nil t))
     (eval . (add-to-list 'eglot-server-programs '(c++-mode . ("clangd" "-header-insertion=never" "-clang-tidy"))))
     (eval . (eglot-ensure))
     (eval . (add-hook 'eglot-managed-mode-hook (lambda ()
                                                  (eglot-inlay-hints-mode -1))))
     (eval . (company-mode 1)))))
