(defvar config-ibuffer-never-show '("^\\*Messages\\*$"
                                    "^\\*Help\\*$"
                                    "^\\*Completions\\*$"
                                    "^\\*Backtrace\\*$"
                                    "^\\*Async-native-compile-log\\*$"))

(mapc (lambda (p)
        (add-to-list 'ibuffer-never-show-predicates p))
      config-ibuffer-never-show)

(provide 'config-ibuffer-never-show)
