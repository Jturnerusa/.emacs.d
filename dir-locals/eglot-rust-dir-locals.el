((rust-ts-mode . ((eval . (progn
                            (require 'rust-mode)
                            (eglot-ensure)
                            (use-local-map (make-composed-keymap (list rust-mode-map rust-ts-mode-map)))
                            (add-hook 'before-save-hook rust-before-save-hook nil t)
                            (add-hook 'after-save-hook rust-after-save-hook nil t)
                            (keymap-set (current-local-map) "C-c C-c C-c C-d" (lambda ()
                                                                                (interactive)
                                                                                (rust--compile
                                                                                 "%s doc"
                                                                                 rust-cargo-bin)))))
                  (eglot-workspace-configuration . ((:rust-analyzer . (:checkOnSave
                                                                       (:command "clippy")))))
                  (rust-format-on-save . t)               
                  (rust-rustfmt-switches . ("--edition" "2021"))))
 (nil . ((rust-cargo-bin . "env TMPDIR=~/tmp cargo"))))
