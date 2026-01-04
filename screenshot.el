;;; screenshot.el ---                                -*- lexical-binding: t; -*-

;; Copyright (C) 2026  John Turner

;; Author: John Turner <jturner.usa@gmail.com>

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

(defgroup screenshot nil
  "screenshot.el")

(defcustom screenshot-clipboard-command "wl-copy"
  "Command used to write to the system clipboard.")

(defcustom screenshot-clipboard-command-args '("--type" "image/png")
  "Parameters passed to clipboard command.")

(defun screenshot-current-buffer ()
  (interactive)
  (let ((file (make-temp-file "screenshot")))
    (with-temp-file file
      (setq-local buffer-file-coding-system 'binary)
      (insert (x-export-frames nil 'png)))
    (apply 'call-process screenshot-clipboard-command file nil nil screenshot-clipboard-command-args)
    (message "saved screenshot to %s and clipboard" file)))

(provide 'screenshot)
;;; screenshot.el ends here
