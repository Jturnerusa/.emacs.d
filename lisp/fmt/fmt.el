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

(defun fmt--init-output-buffer (name)
  (with-current-buffer (get-buffer-create name)
    (erase-buffer)
    (current-buffer)))

(defun fmt--wait-for-processes (processes)
  (cl-loop for process in processes
           do (cl-loop while (accept-process-output process))))

(defun fmt-process-current-buffer ()
  (let* ((stdout-buffer (fmt--init-output-buffer "*fmt stdout*"))
         (stderr-buffer (fmt--init-output-buffer "*fmt stderr*"))
         (stderr (make-pipe-process
                  :name (format "%s stderr" fmt-executable)
                  :buffer stderr-buffer
                  :sentinel 'ignore
                  :noquery t))
         (process (make-process
                   :name fmt-executable
                   :buffer stdout-buffer
                   :command (cons fmt-executable fmt-args)
                   :sentinel 'ignore
                   :noquery t
                   :connection-type 'pipe
                   :stderr stderr)))
    (process-send-region process (point-min) (point-max))
    (process-send-eof process)
    (cons process stderr)))

(defun fmt-current-buffer ()
  (interactive)
  (pcase-let ((`(,process . ,stderr) (fmt-process-current-buffer)))
    (fmt--wait-for-processes (list process stderr))
    (if (zerop (process-exit-status process))
        (replace-buffer-contents (process-buffer process))
      (message "%s failed with exit status %s. See %s for output."
               fmt-executable
               (process-exit-status process)
               (process-buffer stderr)))))

(provide 'fmt)
;;; fmt.el ends here
