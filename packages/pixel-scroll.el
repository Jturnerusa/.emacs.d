(use-package pixel-scroll
  :if (and (locate-library "pixel-scroll")
           (display-graphic-p))
  :custom
  (pixel-dead-time 0)
  (pixel-wait 0)
  (pixel-resolution-fine-flag 10))

