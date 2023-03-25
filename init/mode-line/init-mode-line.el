(setq-default mode-line-format '("%*"
                                 " "
                                 (:eval (if buffer-file-name
                                            (abbreviate-file-name buffer-file-name)
                                          (buffer-name)))
                                 " "
                                 "(" mode-name ")"
                                 " "
                                 "[" (:eval (abbreviate-file-name default-directory)) "]"
                                 " "
                                 "(" (:eval (if server-process
                                                (process-name server-process)
                                              "none"))
                                 ")"))

(provide 'init-mode-line)
