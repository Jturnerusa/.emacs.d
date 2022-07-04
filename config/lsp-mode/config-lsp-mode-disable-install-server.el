(setq lsp-server-install-dir "/somewhere/that/doesnt/exist")

(defun config-lsp-mode-disable-install-server-error ()
  (error "lsp-mode server install features have been disabled"))

(advice-add 'lsp-install-server
            :around
            'config-lsp-mode-disable-install-server-error)

(advice-add 'lsp-update-server
            :around
            'config-lsp-mode-disable-install-server-error)

(advice-add 'lsp-update-servers
            :around
            'config-lsp-mode-disable-install-server-error)

(advice-add 'lsp-download-install
            :around
            'config-lsp-mode-disable-install-server-error)

(advice-add 'lsp-download-path
            :around
            'config-lsp-mode-disable-install-server-error)

(advice-add 'lsp-async-start-process
            :around
            'config-lsp-mode-disable-install-server-error)

(advice-add 'lsp--download-status
            :around
            'config-lsp-mode-disable-install-server-error)

(advice-add 'lsp--install-server-internal
            :around
            'config-lsp-mode-disable-install-server-error)

(advice-add 'lsp--npm-dependency-install
            :around
            'config-lsp-mode-disable-install-server-error)
