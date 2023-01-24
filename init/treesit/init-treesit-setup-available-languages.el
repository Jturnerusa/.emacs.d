;; -*- lexical-binding: t; -*-

(defvar -languages `((python-ts-mode 
                      ((:langs . python)
                       (:file-ext . ,(rx ".py"))
                       (:interpreter . "python")))
                     (rust-ts-mode 
                      ((:langs . rust)
                       (:file-ext . ,(rx ".rs"))))
                     (bash-ts-mode
                      ((:langs . bash)
                       (:file-ext . ,(rx ".sh"))
                       (:interpreter . "bash")))
                     (c-ts-mode 
                      ((:langs . c)
                       (:file-ext . ,(rx ".c"))))
                     (c++-ts-mode 
                      ((:langs . c++)
                       (:file-ext . ,(rx (or ".c++" ".cpp" ".cxx"
                                             ".h++" ".hpp" ".hxx")))))
                     (c-or-c++-ts-mode 
                      ((:langs . (c c++))
                       (:file-ext . ,(rx ".h"))))
                     (toml-ts-mode 
                      ((:langs . toml)
                       (:file-ext . ,(rx ".toml"))))))

(defun -ready-quiet-p (language)
  (treesit-ready-p language t))

(cl-defun -load-language? (&key ts-mode
                                required-languages
                                file-extension
                                interpreter?)
  (let ((ready? (if (listp required-languages)
                    (seq-every-p '-ready-quiet-p required-languages)
                  (-ready-quiet-p required-languages))))
    (when ready?
      (add-to-list 'auto-mode-alist (cons file-extension ts-mode))
      (when interpreter?
        (add-to-list 'interpreter-mode-alist (cons interpreter? ts-mode))))))

(seq-map (lambda (item)
           (-load-language?
            :ts-mode (car item)
            :required-languages (alist-get :langs (cadr item))
            :file-extension (alist-get :file-ext (cadr item))
            :interpreter? (alist-get :interpreter (cadr item))))
         -languages)

(provide 'init-treesit-setup-available-languages)

;; Local Variables:
;; read-symbol-shorthands: (("-" . "init-treesit-setup-available-languages-"))
;; End:
