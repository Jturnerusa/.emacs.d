(use-package ebuild-mode
  :if (locate-library "ebuild-mode")
  :mode (rx (literal ".") (or "ebuild" "eclass") eos)
  :custom
  (ebuild-mode-full-name  "John Turner")
  (ebuild-mode-mail-address "jturner.usa@gmail.com")
  (ebuild-mode-portage-tmpdir (file-name-concat (getenv "HOME") "tmp" "ebuild"))
  (ebuild-mode-portdir "/var/db/repos/gentoo")
  (ebuild-mode-xml-indent-tabs t)
  (ebuild-mode-process-environment (list (format "ROOT=%s" ebuild-mode-portage-tmpdir)
                                         (format "PORTAGE_TMPDIR=%s" ebuild-mode-portage-tmpdir))))
