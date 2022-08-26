(setq ibuffer-saved-filter-groups
      '(("default"
         ("misc" (name . "^\\*.*$"))
         ("dired" (mode . dired-mode)))))

(add-hook 'ibuffer-mode-hook (lambda () (ibuffer-switch-to-saved-filter-groups "default")))

(provide 'config-ibuffer-filter-groups)
