(use-package dired
  :config
  (setq dired-listing-switches
        (if (and (file-directory-p "/sys/fs/selinux")
                 (not (getenv "TERMUX_VERSION")))
            "-ahlZ --grouo-directories-first"
          "-ahl --group-directories-first"))
  :custom
  (dired-kill-when-opening-new-dired-buffer t))
