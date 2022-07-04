(require 'savehist)

(setq savehist-file (expand-file-name "savehist" user-emacs-directory)
      savehist-save-minibuffer-history t)

(add-to-list 'savehist-additional-variables 'command-history)

(unless (file-exists-p savehist-file)
  (make-empty-file savehist-file))

(provide 'config-savehist)
