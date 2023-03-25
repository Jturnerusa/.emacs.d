(require 'savehist)

(defvar init-savehist-history-size 9999999999)

(setq savehist-file (expand-file-name "savehist" user-emacs-directory)
      savehist-save-minibuffer-history t)

(add-to-list 'savehist-additional-variables `(command-history . ,init-savehist-history-size))

(unless (file-exists-p savehist-file)
  (make-empty-file savehist-file))

(savehist-mode 1)

(provide 'init-savehist)
