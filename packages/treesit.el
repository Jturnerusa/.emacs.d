(use-package treesit
  :if (ignore-errors (treesit-available-p))
  :mode
  ((rx (literal ".") "rs" eos) . rust-ts-mode)
  ((rx (literal ".") "py" eos) . python-ts-mode)
  ((rx (literal ".") "sh" eos) . bash-ts-mode)
  :interpreter
  (("python" "python3" "python2") . python-ts-mode)
  (("bash" "sh" "openrc-run") . bash-ts-mode))

(use-package rust-ts-mode
    :requires treesit
    :hook
    (rust-ts-mode . (lambda ()
                      (when (featurep 'rust-mode)
                        (add-hook before-save-hook rust-before-save-method)
                        (add-hook after-save-hook rust-after-save-method)
                        (use-local-map (make-composed-keymap (list rust-ts-mode-map rust-mode-map)))))))
