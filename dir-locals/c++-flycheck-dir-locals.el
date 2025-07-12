((c++-ts-mode
  . ((fmt-executable . "clang-format")
     (flycheck-gcc-language-standard . "c++23")
     (eval . (add-hook 'before-save-hook 'fmt-current-buffer nil t))
     (eval . (company-mode 1)))))
