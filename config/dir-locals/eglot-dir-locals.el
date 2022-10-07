((rust-mode . ((eval . (eglot-ensure))
               (eglot-workspace-configuration . ((:rust-analyzer . (:checkOnSave
                                                                    (:command "clippy")))))
               (rust-format-on-save . t)
               (rust-format-goto-problem . t)
               (rust-rustfmt-switches . ("--edition" "2021")))))
