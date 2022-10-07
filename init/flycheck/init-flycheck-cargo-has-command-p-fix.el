(defun init-flycheck-rust-cargo-has-command-p (command)
  (let* ((commands (process-lines "cargo" "--list"))
         (trimmed (-map (lambda (row) (-slice row 4 (string-search " " 4))) commands)))
    (seq-contains-p (-rest trimmed) command)))

(advice-add 'flycheck-rust-cargo-has-command-p
            :override 'init-flycheck-rust-cargo-has-command-p)
