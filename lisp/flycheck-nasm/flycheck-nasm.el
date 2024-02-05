;;; flycheck-nasm-mode.el --- flycheck checker for NASM  -*- lexical-binding: t; -*-

;; Copyright (C) 2024  John Turner

;; Author: John Turner jturner.usa@gmail.com

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

(require 'flycheck)

(flycheck-def-option-var flycheck-nasm-format "elf64" nasm
  "NASM executable format."
  :type 'string)

(flycheck-define-checker nasm
  "Flycheck checker for NASM."
  :command ("nasm" "-o" "/dev/null" (option "-f" flycheck-nasm-format) source)
  :error-patterns ((error line-start (file-name) ":" line ":" space "error:" space (message) line-end)
                   (warning line-start (file-name) ":" line ":" space "warning:" space (message) line-end))
  :modes (asm-mode nasm-mode))

(provide 'flycheck-nasm)
;;; flycheck-nasm-mode.el ends here
