(require 'ibuffer)
(require 'ibuf-ext)
(require 'config-ibuffer-human-readable-size)
(require 'config-ibuffer-never-show)
(require 'config-ibuffer-filter-groups)

(setq ibuffer-display-summary nil
      ibuffer-expert t)

(setq ibuffer-formats
      '((mark modified read-only locked " "
              (name 18 18 :left :elide)
              " "
              (size-human-readable 5 5 :right)
              " "
              (mode 16 16 :left :elide)
              " " filename-and-process)
        (mark " "
              (name 16 -1)
              " " filename)))
      
(provide 'config-ibuffer)
