;;; cil-mode.el --- major mode for selinux cil       -*- lexical-binding: t; -*-

;; Copyright (C) 2025  John Turner

;; Author: John Turner <jturner.usa@gmail.com>
;; Keywords: 

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

;;; Code:

(require 'rx)

(put 'block 'lisp-indent-function 4)

(defvar cil-mode--font-lock-defaults
  `((,(rx (group (or "in" "block" "macro")) eow)
     0 font-lock-keyword-face)))

(define-derived-mode cil-mode lisp-data-mode "cil"
  (setq-local font-lock-defaults cil-mode--font-lock-defaults))

(add-to-list 'auto-mode-alist '("\\.cil\\'" . cil-mode))

(provide 'cil-mode)
;;; cil-mode.el ends here
