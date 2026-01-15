;;; flymake-mypy.el ---                              -*- lexical-binding: t; -*-

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

(require 'cl-lib)

(defgroup flymake-mypy nil
  "Flymake checker for mypy with TRAMP support.")

(defcustom flymake-mypy-executable "mypy"
  "Mypy executable."
  :type '(string)
  :group 'flymake-mypy)

(defcustom flymake-mypy-args nil
  "Mypy args."
  :type '(repeat string)
  :group 'flymake-mypy)

(defcustom flymake-mypy-buffer "*flymake-mypy*"
  "Buffer used to collect mypy output."
  :type '(string)
  :group 'flymake-mypy)

(defvar-local flymake-mypy--process nil)

(defun flymake-mypy (report-fn &rest args)
  (unless (executable-find flymake-mypy-executable t)
    (error "cannot find a mypy executable"))
  
  (let* ((source (current-buffer))
         (source-file-name (file-local-name (buffer-file-name source)))
         (buffer (get-buffer-create flymake-mypy-buffer)))

    (ignore-errors (kill-process flymake-mypy--process))
    
    (with-current-buffer buffer
      (erase-buffer))
    
    (setq flymake-mypy--process
          (make-process
           :name "flymake-mypy process" :noquery t :connection-type 'pipe
           :buffer buffer
           :command `(,flymake-mypy-executable
                      ,@flymake-mypy-args
                      "--output"
                      "json"
                      ,source-file-name)
           :file-handler t
           :sentinel (lambda (proc event)
                       (when (equal (process-status proc) 'exit)
                         
                         (with-current-buffer buffer
                           (goto-char (point-min))
                           
                           (cl-loop for json = (ignore-errors
                                                 (json-read))
                                    while json
                                    for (begin . end) = (flymake-diag-region
                                                         source
                                                         (cdr (assoc 'line json))
                                                         (cdr (assoc 'column json)))
                                    for diagnostic = (flymake-make-diagnostic
                                                      (cdr (assoc 'file json))
                                                      begin
                                                      end
                                                      (pcase (cdr (assoc 'severity json))
                                                        ("error" :error)
                                                        ("warning" :warning))
                                                      (cdr (assoc 'message json)))
                                    collect diagnostic into diagnostics
                                    finally (funcall report-fn diagnostics)))))))))

(defun flymake-mypy-enable ()
  (interactive)
  (add-hook 'flymake-diagnostic-functions 'flymake-mypy nil t)
  (flymake-mode 1))

(provide 'flymake-mypy)
;;; flymake-mypy.el ends here
