((rust-ts-mode . ((eval . (progn
                            (require 'eglot)
                            (eglot-ensure)
                            (setq-local eglot-workspace-configuration '(:rust-analyzer  (:checkb
                                                                                         (:command "clippy"))))
                            (when (require 'company nil t)
                              (company-mode 1))
                            (when (require 'rust-mode nil t)
                              (setq-local rust-format-on-save t
                                          rust-rustfmt-switches  '("--edition" "2021"))))))))
