(require 'lsp-mode)
(require 'flycheck)

(setq lsp-enable-dap-auto-configure nil
      lsp-enable-folding nil
      lsp-enable-indentation t
      lsp-enable-on-type-formatting nil
      lsp-completion-enable nil
      lsp-enable-snippet nil
      lsp-modeline-code-actions-enable nil
      lsp-lens-enable nil
      lsp-signature-auto-activate nil
      lsp-eldoc-render-all t
      lsp-rls-server-command nil
      lsp-enable-suggest-server-download nil)

(load "init-lsp-mode-disable-install-server")

(provide 'init-lsp-mode)
