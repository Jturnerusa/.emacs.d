(defvar init-ibuffer-never-show '("^\\*Messages\\*$"                                    
                                    "^\\*Completions\\*$"                                    
                                    "^\\*Async-native-compile-log\\*$"
                                    "^\\*Native-compile-Log\\*$"
                                    "^\\*Warnings\\*$"))

(mapc (lambda (p)
        (add-to-list 'ibuffer-never-show-predicates p))
      init-ibuffer-never-show)

(provide 'init-ibuffer-never-show)
