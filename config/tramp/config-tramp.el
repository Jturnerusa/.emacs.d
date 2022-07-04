(require 'tramp)

(setq password-cache nil
      password-cache-expiry 0
      tramp-persistency-file-name nil)

(load "config-tramp-connection-properties")
(load "config-tramp-sudo-hang-fix")

(provide 'config-tramp)
