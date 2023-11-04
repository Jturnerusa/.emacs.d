(use-package savehist
  :custom
  (savehist-file (file-name-concat (xdg-state-home) "emacs/savehist"))
  (savehist-save-minibuffer-history t))
