(use-package ibuffer
  :requires 'persp-mode
  :config
  (when (require 'persp-mode nil t)
    
    (define-ibuffer-column persp
      (:name "persp")
      (lambda (_)
        persp-last-persp-name))

    (define-key ibuffer-mode-map "g"
                (lambda (arg)
                  (interactive "P")
                  (with-persp-buffer-list () (ibuffer-update arg)))))
  :custom
  (ibuffer-display-summary nil)
  (ibuffer-expert t)
  (ibuffer-formats '((mark modified read-only locked
                           " " (name 32 32 :left :elide)
                           " " (size 5 5 :right)
                           " " (mode 16 16 :left :elide)
                           " " filename-and-process
                           " " persp
                           (mark " " (name 16 -1) " " filename)))))

