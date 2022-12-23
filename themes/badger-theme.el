(require-theme 'wombat-theme)

(deftheme badger)

(custom-theme-set-faces
 'badger
 `(fringe ((t (:foreground ,(face-foreground 'default) :background ,(face-background 'default)))))
 '(elisp-shorthand-font-lock-face ((t (:foreground "dark cyan"))))
 '(line-number-current-line ((t (:background "gray"))))
 '(highlight-indentation-face ((t (:background "gray20")))))

(provide-theme 'badger)
