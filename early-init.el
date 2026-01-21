(when (native-comp-available-p)
  (setq native-comp-async-jobs-number (string-to-number (shell-command-to-string "nproc"))
	native-compile-target-directory (file-name-concat (getenv "HOME") ".cache/emacs-native-comp")
	native-comp-eln-load-path (cons native-compile-target-directory native-comp-eln-load-path)))
  
(setq gc-cons-threshold (* 128 (expt 1024 2)))
