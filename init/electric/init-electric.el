(require 'electric)
(require 'elec-pair)

(add-to-list 'electric-pair-pairs '("?(" . "?)"))
(add-to-list 'electric-pair-pairs '("?{" . "?}"))

(provide 'init-electric)
