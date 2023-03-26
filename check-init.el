#!/usr/bin/env -S emacs --script

(kill-emacs (condition-case nil
                (progn
                  (load (file-name-concat user-emacs-directory "early-init.el"))
                  (load (file-name-concat user-emacs-directory "init.el")))
              (error 1)
              (:success 0)))
