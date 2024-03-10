((rust-ts-mode . ((eglot-workspace-configuration . (:rust-analyzer (:check (:command "clippy"))))
                  (fmt-executable . "rustfmt")
                  (eval . (eglot-ensure))
                  (eval . (add-hook 'before-save-hook 'fmt-current-buffer nil t)))))
