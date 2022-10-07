(defvar init-eglot-server-clangd '((c-mode c++-mode) .
                                     ("clangd"
                                      "--header-insersion=never")))

(defvar init-eglot-server-rust-analyzer '((rust-mode) .
                                            ("rust-analyzer")))
  
(add-to-list 'eglot-server-programs init-eglot-server-clangd)
(add-to-list 'eglot-server-programs init-eglot-server-rust-analyzer)
