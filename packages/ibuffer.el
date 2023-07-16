(use-package ibuffer
  :custom
  (ibuffer-display-summary nil)
  (ibuffer-expert t)
  (ibuffer-formats '((mark modified read-only locked
                           " " (name 32 32 :left :elide)
                           " " (size 5 5 :right)
                           " " (mode 16 16 :left :elide)
                           " " filename-and-process)
                     (mark " " (name 16 -1) " " filename))))
