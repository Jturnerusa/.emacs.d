(use-package treesit
  :if (>= emacs-major-version 29))

(use-package rust-ts-mode
    :requires treesit
    :mode (rx (literal ".") "rs" eos)
    :hook (rust-ts-mode . (lambda ()
                            (when (featurep 'rust-mode)
                              (add-hook before-save-hook rust-before-save-method)
                              (add-hook after-save-hook rust-after-save-method)
                              (use-local-map (make-composed-keymap (list rust-ts-mode-map rust-mode-map)))))))

(use-package python-ts-mode
  :requires treesit
  :mode (rx (literal ".") "py" eos)
  :interpreter ("python" "python3" "python2"))

(use-package bash-ts-mode
  :requires treesit
  :mode (rx (literal ".") "sh" eos)
  :interpreter ("bash" "sh" "openrc-run"))
