(require 'ibuffer)
(require 'ibuf-ext)
(require 'init-ibuffer-human-readable-size)
(require 'init-ibuffer-never-show)
(require 'init-ibuffer-filter-groups)

(setq ibuffer-display-summary nil
      ibuffer-expert t)

(setq ibuffer-formats
      '((mark modified read-only locked " "
              (name 32 32 :left :elide)
              " "
              (size-human-readable 5 5 :right)
              " "
              (mode 16 16 :left :elide)
              " " filename-and-process)
        (mark " "
              (name 16 -1)
              " " filename)))
      
(provide 'init-ibuffer)
