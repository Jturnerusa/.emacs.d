(setq native-comp-async-jobs-number (string-to-number (shell-command-to-string "nproc")))

(provide 'init-native-comp)
