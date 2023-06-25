;;; reload-library.el ---                            -*- lexical-binding: t; -*-

;; Copyright (C) 2023  

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

(require 'loadhist)

(defun reload-library ()
  (interactive)
  (let* ((library (read-string
                  "Library to reload: "
                  (buffer-file-name)))
         (feature (intern (file-name-base library)))
         (loaded (featurep feature))
         (dependents (file-dependents library)))
    (when (and loaded (or (not dependents)
                          (yes-or-no-p (format "%s is required by another library, force reload?" feature))))
      (unload-feature feature t))
    (load-library library)))
           

      
(provide 'reload-library)
;;; reload-library.el ends here

