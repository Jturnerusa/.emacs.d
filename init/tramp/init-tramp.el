(require 'tramp)

(setq password-cache nil
      password-cache-expiry 0
      tramp-persistency-file-name nil)

(load "init-tramp-connection-properties")
(load "init-tramp-sudo-hang-fix")

(provide 'init-tramp)
