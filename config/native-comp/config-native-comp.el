(setq native-comp-async-jobs-number (string-to-number (shell-command-to-string "nproc")))

(provide 'config-native-comp)
