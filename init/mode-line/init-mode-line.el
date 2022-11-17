(setq-default mode-line-format '("%*"
                                 " "
                                 (:eval (if buffer-file-name
                                            (abbreviate-file-name buffer-file-name)
                                          (buffer-name)))
                                 " "
                                 "(" mode-name ")"
                                 " "
                                 "[" (:eval (abbreviate-file-name default-directory)) "]"))

(provide 'init-mode-line)
