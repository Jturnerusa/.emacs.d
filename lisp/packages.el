;;; packages.el ---                                  -*- lexical-binding: t; -*-

;; Copyright (C) 2023  

;; Author:  John Turner

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

(use-package man-completion
  :load-path (lambda () (locate-user-emacs-file "lisp/man-completion")))

(use-package reload-library
  :load-path (lambda () (locate-user-emacs-file "lisp/reload-library")))

(use-package toggle-local-vars
  :load-path (lambda () (locate-user-emacs-file "lisp/toggle-local-vars")))

(use-package license-boilerplate
  :load-path (lambda () (locate-user-emacs-file "lisp/license-boilerplate"))
  :custom
  (license-boilerplate-copyright-author "John Turner"))

(use-package best-side-window
  :load-path (lambda () (locate-user-emacs-file "lisp/best-side-window")))

(use-package clang-format
  :load-path (lambda () (locate-user-emacs-file "lisp/clang-format")))
