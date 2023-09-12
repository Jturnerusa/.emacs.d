(use-package tramp
  :custom
  (tramp-password-cache nil)
  (tramp-persistency-file-name nil)
  :config
  (add-to-list 'tramp-connection-properties
               (list (regexp-quote (format "/sudo:root@%s:" system-name))
                     "session-timeout" (* 60 60)))
  (add-to-list 'tramp-remote-path "/root/bin"))
