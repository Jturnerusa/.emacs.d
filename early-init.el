(setq native-comp-async-jobs-number (string-to-number (shell-command-to-string "nproc"))
      native-compile-target-directory (file-name-concat (getenv "HOME") ".cache/emacs-native-comp"))
