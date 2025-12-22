(use-package persp-mode
  :custom
  (persp-add-buffer-on-after-change-major-mode t)
  (persp-save-dir (file-name-concat
                   (or (getenv "XDG_STATE_DIR") (file-name-concat (getenv "HOME") ".local/state"))
                   "emacs/persp")))
