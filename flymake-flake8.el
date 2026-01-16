;;; flymake-flake8.el ---                            -*- lexical-binding: t; -*-

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

(require 'rx)
(require 'ert)
(require 'seq)

(defgroup flymake-flake8 nil
  "Flymake checker for flake8.")

(defcustom flymake-flake8-executable "flake8"
  "Flake8 executable."
  :type '(string)
  :group 'flymake-flake8)

(defcustom flymake-flake8-args '("--color=never" "--exit-zero")
  "Flake8 arguments."
  :type '(repeat string)
  :group 'flymake-flake8)

(defcustom flymake-flake8-stdout-buffer "*flake8 stdout*"
  "Flake8 executable."
  :type '(string)
  :group 'flymake-flake8)

(defcustom flymake-flake8-stderr-buffer "*flake8 stderr*"
  "Flake8 executable."
  :type '(string)
  :group 'flymake-flake8)

(defvar flymake-flake8-regexp
  (rx (group (one-or-more (not ":")))
      ":"
      (group (one-or-more digit))
      ":"
      (group (one-or-more digit))
      ": "
      (group (one-or-more (not space)))
      " "
      (group (one-or-more any))))

(defvar-local flymake-flake8--process nil)

(ert-deftest flymake-flake8-test-regexp ()
  (let ((data "main.py:2:6: E999 error message"))
    (save-match-data
      (string-match flymake-flake8-regexp data)

      (should (string= (match-string 1 data) "main.py"))
      (should (string= (match-string 2 data) "2"))
      (should (string= (match-string 3 data) "6"))
      (should (string= (match-string 4 data) "E999"))
      (should (string= (match-string 5 data) "error message")))))

(defun flymake-flake8 (report-fn &rest args)
  (unless (executable-find flymake-flake8-executable t)
    (error "cannot find executable for %s" flymake-flake8-executable))
  
  (let ((source (current-buffer))
        (stdout (get-buffer-create flymake-flake8-stdout-buffer))
        (stderr (get-buffer-create flymake-flake8-stderr-buffer)))

    (with-current-buffer stdout
      (erase-buffer))

    (ignore-errors
      (kill-process flymake-flake8--process))
    
    (setq flymake-flake8--process
          (make-process
           :name (format "*%s*" flymake-flake8-executable)
           :command `(,flymake-flake8-executable
                      ,@flymake-flake8-args
                      ,(file-local-name (buffer-file-name source)))
           :buffer stdout
           :stderr stderr
           :file-handler t
           :sentinel (lambda (proc _)
                       (when (memq (process-status proc) '(exit signal))
                         (with-current-buffer stdout
                           (goto-char (point-min))
                           
                           (cl-loop while (search-forward-regexp
                                           flymake-flake8-regexp
                                           nil
                                           t)
                                    for file-name = (buffer-file-name source)
                                    for line = (string-to-number (match-string 2))
                                    for column = (string-to-number (match-string 3))
                                    for message = (match-string 5)
                                    for (begin . end) = (flymake-diag-region
                                                         source
                                                         line
                                                         column)
                                    for diagnostic = (flymake-make-diagnostic
                                                      file-name
                                                      begin
                                                      end
                                                      :error
                                                      message)
                                    collect diagnostic into diagnostics
                                    finally (funcall report-fn diagnostics)))))))))

(defun flymake-flake8-setup ()
  (interactive)
  
  (unless (seq-contains flymake-diagnostic-functions 'flymake-flake8)
    (add-hook 'flymake-diagnostic-functions 'flymake-flake8 nil t))

  (flymake-mode 1))

(provide 'flymake-flake8)
;;; flymake-flake8.el ends here
