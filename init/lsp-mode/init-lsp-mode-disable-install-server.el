(setq lsp-server-install-dir "/somewhere/that/doesnt/exist")

(defun init-lsp-mode-disable-install-server-error ()
  (error "lsp-mode server install features have been disabled"))

(advice-add 'lsp-install-server
            :around
            'init-lsp-mode-disable-install-server-error)

(advice-add 'lsp-update-server
            :around
            'init-lsp-mode-disable-install-server-error)

(advice-add 'lsp-update-servers
            :around
            'init-lsp-mode-disable-install-server-error)

(advice-add 'lsp-download-install
            :around
            'init-lsp-mode-disable-install-server-error)

(advice-add 'lsp-download-path
            :around
            'init-lsp-mode-disable-install-server-error)

(advice-add 'lsp-async-start-process
            :around
            'init-lsp-mode-disable-install-server-error)

(advice-add 'lsp--download-status
            :around
            'init-lsp-mode-disable-install-server-error)

(advice-add 'lsp--install-server-internal
            :around
            'init-lsp-mode-disable-install-server-error)

(advice-add 'lsp--npm-dependency-install
            :around
            'init-lsp-mode-disable-install-server-error)
