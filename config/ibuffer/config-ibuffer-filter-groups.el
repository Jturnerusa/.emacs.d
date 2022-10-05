(setq ibuffer-saved-filter-groups
      '(("default"
         ("Misc" (and (name . "^\\*.*$")
                      (not (mode . Man-mode))))
         ("Dired" (mode . dired-mode))
         ("Man" (mode . Man-mode)))))

(add-hook 'ibuffer-mode-hook (lambda () (ibuffer-switch-to-saved-filter-groups "default")))

(provide 'config-ibuffer-filter-groups)
