(defvar config-eglot-server-clangd '((c-mode c++-mode) .
                                     ("clangd"
                                      "--header-insersion=never")))

(defvar config-eglot-server-rust-analyzer '((rust-mode) .
                                            ("rust-analyzer")))
  
(add-to-list 'eglot-server-programs config-eglot-server-clangd)
(add-to-list 'eglot-server-programs config-eglot-server-rust-analyzer)
