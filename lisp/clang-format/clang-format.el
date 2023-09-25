;;; clang-format.el ---                              -*- lexical-binding: t; -*-

;; Copyright (C) 2023  John Turner

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

(defvar clang-format-exectuable "clang-format")

(defvar clang-format-temp-buffer "*clang-format*")

(defun clang-format-buffer ()
  (interactive)
  (let ((ret (call-process-region (point-min) (point-max) clang-format-exectuable
                                  nil
                                  (with-current-buffer (get-buffer-create clang-format-temp-buffer)
                                    (erase-buffer)
                                    (current-buffer))
                                  nil)))
    (if (zerop ret)
        (replace-buffer-contents clang-format-temp-buffer)
      (message "clang-format failed with exit code: %s (see %s for more details)"
               ret,
               clang-format-temp-buffer))))

(provide 'clang-format)
;;; clang-format.el ends here
