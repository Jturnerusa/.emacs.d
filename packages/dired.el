(use-package dired 
  :custom
  (dired-kill-when-opening-new-dired-buffer t)
  (dired-listing-switches (if (and (file-directory-p "/sys/fs/selinux")
                                   (not (getenv "TERMUX_VERSION")))
                              "-alhZ --group-directories-first"
                            "-alh --group-directories-first")))
