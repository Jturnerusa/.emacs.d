(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(safe-local-variable-values
   '((rust-rustfmt-switches "--edition" "2021")
     (projectile-package-compilation-cmd . "/home/notroot/bin/cargo-wrapper build")
     (projectile-package-test-cmd . "/home/notroot/bin/cargo-wrapper test")
     (projectile-package-compilation-cmd . "nonet cargo build")
     (projectile-package-test-cmd . "nonet cargo test")
     (projectile-package-cmd . "nonet cargo test")
     (eval lsp)
     (eval eglot-ensure)))
 '(warning-suppress-types '((comp))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Noto Sans Mono" :foundry "GOOG" :slant normal :weight normal :height 98 :width normal))))
 '(flymake-error ((t (:underline nil)))))
