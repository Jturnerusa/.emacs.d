(setq native-comp-async-jobs-number (string-to-number (shell-command-to-string "nproc"))
      native-compile-target-directory temporary-file-directory)

(provide 'init-native-comp)
