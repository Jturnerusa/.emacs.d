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

(defcustom fmt-stderr-buffer "*fmt stderr*"
  "Buffer to send fmt-executable stderr to."
  :type '(string)
  :group 'fmt)

(defun fmt-current-buffer ()
  (interactive)

  (unless (executable-find fmt-executable t)
    (error "failed to find fmt-executable: %s" fmt-executable))
  
  (let ((stdout (get-buffer-create fmt-stdout-buffer))
        (stderr (get-buffer-create fmt-stderr-buffer)))

    (with-current-buffer stdout
      (erase-buffer))

    (let ((proc (make-process
                 :name (format "*%s*" fmt-executable)
                 :command `(,fmt-executable ,@fmt-args)
                 :buffer stdout
                 :stderr stderr
                 :file-handler t)))

      (process-send-region proc (point-min) (point-max))
      (process-send-eof proc)

      (while (process-live-p proc)
        (accept-process-output proc))
      
      (if (zerop (process-exit-status proc))
          (replace-buffer-contents stdout)
        (error "failed to run formatter")))))
        
(provide 'fmt)
;;; fmt.el ends here
