((rust-ts-mode . ((eval . (progn
                            (require 'rust-mode)
                            (require 'eglot)
                            (advice-add 'eglot-inlay-hints-mode :around 'ignore)
                            (eglot-ensure)                            
                            (company-mode 1)
                            (use-local-map (make-composed-keymap (list rust-mode-map rust-ts-mode-map)))
                            (add-hook 'before-save-hook rust-before-save-hook nil t)
                            (add-hook 'after-save-hook rust-after-save-hook nil t)
                            (keymap-set (current-local-map)
                                        "C-c C-c C-d"
                                        (lambda ()
                                          (interactive)
                                          (rust--compile
                                            "env TMPDIR=${HOME}/tmp cargo test && cargo doc")))))
                  (eglot-workspace-configuration . (:rust-analyzer  (:check
                                                                     (:command "clippy"))))
                  (rust-format-on-save . t)               
                  (rust-rustfmt-switches . ("--edition" "2021")))))
