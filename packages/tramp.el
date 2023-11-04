(use-package tramp
  :custom
  (tramp-password-cache nil)
  (tramp-persistency-file-name (file-name-concat (xdg-state-home) "emacs/tramp/persistency-file"))
  :config
  (add-to-list 'tramp-connection-properties
               (list (regexp-quote (format "/sudo:root@%s:" system-name))
                     "session-timeout" (* 60 60))))
