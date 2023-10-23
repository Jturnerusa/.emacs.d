(defgroup license-boilerplate nil
  "A small script for inserting license boilerplate text into source files.")

(defcustom license-boilerplate-copyright-author user-full-name
  "The value to insert into the Copyright line."
  :group 'license-boilerplate
  :type 'string)

(defun license-boilerplate-gpl-3 ()
  (interactive)
  (save-excursion
    (let ((saved-point (point)))
      (insert (format "Copyright (C) %s" (format-time-string "%Y")))
      (when-let ((author license-boilerplate-copyright-author))
        (insert (format " %s" author)))
      (insert "\n")
      (insert "\
This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <https://www.gnu.org/licenses/>.")
      (comment-region saved-point (point)))))

(provide 'license-boilerplate)
