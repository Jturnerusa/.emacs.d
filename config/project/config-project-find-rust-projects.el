(add-to-list 'project-find-functions (lambda (directory)
                                       (let ((rust-project (locate-dominating-file directory "Cargo.toml")))
                                         (when rust-project
                                           (cons 'transient rust-project)))))
