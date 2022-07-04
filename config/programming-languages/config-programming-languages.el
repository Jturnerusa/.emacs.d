(defvar config-programming-languages-directory (file-name-directory
						(locate-library "config-programming-languages")))

(defvar config-programming-languages-modules '(c shell))

(mapc (lambda (module)
	(let ((module-load-path (file-name-concat config-programming-languages-directory (symbol-name module))))
	  (add-to-list 'load-path module-load-path)))
      config-programming-languages-modules)

(require 'config-c)
(require 'config-shell)

(provide 'config-programming-languages)
