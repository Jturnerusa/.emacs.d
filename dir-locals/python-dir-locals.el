((python-ts-mode . ((eval . (flycheck-mode 1))
                    (eval . (flycheck-select-checker 'python-mypy))
                    (eval . (flycheck-add-next-checker 'python-mypy (cons t 'python-flake8)))
                    (eval . (add-hook 'before-save-hook 'fmt-current-buffer nil t))
                    (eval . (setq-local fmt-executable "black"
                                        fmt-args '("-"))))))
