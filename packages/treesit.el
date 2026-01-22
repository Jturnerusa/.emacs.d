(use-package treesit
  :if (ignore-errors (treesit-available-p))
  :config
  (let ((setup-treesit-mode (lambda (parser treesit-mode modes &optional interpreters)
                              (if (not (treesit-language-available-p parser))
                                  (message "treesit language parser not available for %s"
                                           (symbol-name parser))
                                (seq-each (lambda (mode)
                                            (add-to-list 'auto-mode-alist
                                                         (cons (rx (literal ".")
                                                                   (literal mode) eos)
                                                               treesit-mode)))
                                          modes)
                                (seq-each (lambda (interpreter)
                                            (add-to-list 'interpreter-mode-alist
                                                         (cons interpreter treesit-mode)))
                                          interpreters)))))
    (funcall setup-treesit-mode 'python 'python-ts-mode  '("py")  '("python" "python3"))
    (funcall setup-treesit-mode 'bash 'bash-ts-mode '("sh")  '("bash" "sh" "openrc-run"))
    (funcall setup-treesit-mode 'cpp 'c++-ts-mode '("cpp" "cxx" "c++" "hpp" "hxx" "h++"))))

(use-package c-ts-mode
  :requires treesit
  :if (ignore-errors (treesit-language-available-p 'c))
  :custom
  (c-ts-mode-indent-style 'linux)
  (c-ts-mode-indent-offset 2))
