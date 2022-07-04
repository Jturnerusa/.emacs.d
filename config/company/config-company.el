(require 'company)

(setq company-idle-delay 0
      company-clang-executable "/usr/lib/llvm/11/bin/clang"
      company-clang-insert-arguments nil
      company-minimum-prefix-length 1)

(provide 'config-company)
