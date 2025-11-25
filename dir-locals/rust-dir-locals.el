((rust-mode . ((fmt-executable . "rustfmt")
               (fmt-args . ("--edition=2024"))
               (rust-cargo-default-arguments . "-r")
               (eval . (eglot-ensure))
               (eval . (company-mode 1))
               (eval . (add-to-list
                        'eglot-server-programs
                        '((rust-ts-mode rust-mode) .
                          ("rust-analyzer"
                           :initializationOptions
                           (:check
                            (:command "clippy"))))))
               (eval . (add-hook 'before-save-hook 'fmt-current-buffer nil t))
               (eval . (add-hook 'eglot-managed-mode-hook (lambda ()
                                                            (eglot-inlay-hints-mode -1))
                                 nil t))))
 (rust-ts-mode . ((fmt-executable . "rustfmt")
                  (fmt-args . ("--edition=2024"))
                  (rust-cargo-default-arguments . "-r")
                  (eval . (eglot-ensure))
                  (eval . (company-mode 1))
                  (eval . (add-to-list
                           'eglot-server-programs
                           '((rust-ts-mode rust-mode) .
                             ("rust-analyzer"
                              :initializationOptions
                              (:check
                               (:command "clippy"))))))                  
                  (eval . (add-hook 'before-save-hook 'fmt-current-buffer nil t))
                  (eval . (add-hook 'eglot-managed-mode-hook (lambda ()
                                                               (eglot-inlay-hints-mode -1))
                                    nil t))))
 (meson-mode
  . ((fmt-executable . "meson")
     (fmt-args . ("format" "-"))
     (eval . (add-hook 'before-save-hook 'fmt-current-buffer nil t)))))
