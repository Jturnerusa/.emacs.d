;;; fmt.el ---                                       -*- lexical-binding: t; -*-

;; Copyright (C) 2023  John Turner

;; Author: John Turner <notroot@gentoo-pc>

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

(defgroup fmt nil
  "Format buffers using external programs such as rustfmt.")

(defcustom fmt-executable nil
  "Formatter executable to use for formatting a buffer."
  :local t
  :type '(string)
  :group 'fmt)

(defcustom fmt-args nil
  "Args to use when running fmt-executable."
  :local t
  :type '(repeat string)
  :group 'fmt)

(defcustom fmt-stdout-buffer "*fmt stdout*"
  "Buffer to send fmt-executable stdout to."
  :type '(string)
  :group 'fmt)

(defcustom fmt-stderr-file "/dev/null"
  "Buffer to send fmt-executable stderr to."
  :type '(string)
  :group 'fmt)

(defcustom fmt-before-format-hook nil
  "Hooks to run before fmt-executable runs."
  :type '(hook)
  :group 'fmt)

(define-error 'fmt-failure "fmt-failure")

(defun fmt-buffer ()
  (run-hooks 'fmt-before-format-hook)
  (let ((exit-status (apply 'call-process-region `(,(point-min) ,(point-max) ,fmt-executable
                                                   nil ,(list fmt-stdout-buffer fmt-stderr-file)
                                                   nil ,@fmt-args))))
    (if (zerop exit-status)
        (replace-buffer-contents fmt-stdout-buffer)
      (signal 'fmt-failure nil))))

(defun fmt-current-buffer ()
  (interactive)
  (condition-case _ (fmt-buffer)
    ('fmt-failure (message "%s failed, see %s for more details" fmt-executable fmt-stderr-buffer))))

;; hooks

(defun fmt-erase-stdout-buffer ()
  (with-current-buffer (get-buffer-create fmt-stdout-buffer)
    (erase-buffer)))

(defun fmt-erase-stderr-buffer ()
  (with-current-buffer (get-buffer-create fmt-stderr-buffer)
    (erase-buffer)))

(add-hook 'fmt-before-format-hook 'fmt-erase-stdout-buffer)
(add-hook 'fmt-before-format-hook 'fmt-erase-stderr-buffer)

(provide 'fmt)
;;; fmt.el ends here
