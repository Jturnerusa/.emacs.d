(use-package eglot
  :if (locate-library "eglot")
  :custom
  (eglot-autoshutdown t)
  (eglot-events-buffer-size . nil))
