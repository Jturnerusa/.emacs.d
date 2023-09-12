;;; best-side-window.el ---                          -*- lexical-binding: t; -*-

;; Copyright John Turner (C) 2023  

;; Author: John Turner

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

(require 'cl-lib)

(defgroup best-side-window nil "Select ideal side to display buffer")

(defcustom -default-side 'bottom
  "Default side to display buffer if -choose-best-side-functions fails to choose a side")

(defcustom -choose-best-side-functions nil
  "The first non-nil return value will be used as the side to use for display buffer")

(defun -best-side ()
  (cl-loop for f in -choose-best-side-functions
           for result = (funcall f)
           if result
           return result))

(defun -display-buffer-in-best-side-window (buffer alist)
  (let ((side (or (-best-side) -default-side)))
    (display-buffer-in-side-window buffer (cons (cons 'side side) alist))))

(defun -bottom-when-frame-split ()
  (if (< (frame-pixel-width) (/ (display-pixel-width) 2))
      'bottom
    -default-side))

(add-to-list '-choose-best-side-functions '-bottom-when-frame-split)
  
(provide 'best-side-window)
;;; best-side-window.el ends here

;; Local Variables:
;; read-symbol-shorthands: (("-" . "best-side-window-"))
;; End:
