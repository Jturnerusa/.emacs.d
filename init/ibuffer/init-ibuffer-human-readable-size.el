(define-ibuffer-column size-human-readable
  (:name "Size" :inline t)
  (let ((size (buffer-size)))
    (cond
     ((> size (expt 1000 4))
      (error "buffer is over 1TB large!"))
     ((> size (expt 1000 3))
      (format "%sG" (/ size (expt 1000 3))))
     ((> size (expt 1000 2))
      (format "%sM" (/ size (expt 1000 2))))
     ((> size 1000)
      (format "%sK" (/ size 1000)))
     (t
      (format "%sB" size)))))
       
(provide 'init-ibuffer-human-readable-size)
