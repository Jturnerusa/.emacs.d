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
 (meson-mode . ((fmt-executable . "meson")
                (fmt-args . ("format" "-"))
                (eval . (add-hook 'before-save-hook 'fmt-current-buffer nil t))))
 (python-ts-mode . ((eval . (flycheck-mode 1))
                    (eval . (flycheck-select-checker 'python-mypy))
                    (eval . (flycheck-add-next-checker 'python-mypy (cons t 'python-flake8)))
                    (eval . (add-hook 'before-save-hook 'fmt-current-buffer nil t))
                    (eval . (setq-local fmt-executable "black"
                                        fmt-args '("-")))))
 (emacs-lisp-mode) . ((company-mode . 1)
                      (eldoc-mode . 1))
 (c++-ts-mode
  . ((fmt-executable . "clang-format")
     (eval . (setq-local fmt-args `("--assume-filename" ,(buffer-file-name))))
     (eval . (add-hook 'before-save-hook 'fmt-current-buffer nil t))
     (eval . (add-to-list 'eglot-server-programs '(c++-mode . ("clangd" "-header-insertion=never" "-clang-tidy"))))
     (eval . (eglot-ensure))
     (eval . (add-hook 'eglot-managed-mode-hook (lambda ()
                                                  (eglot-inlay-hints-mode -1))))
     (eval . (company-mode 1)))))
