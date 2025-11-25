(use-package flycheck
  :hook
  (flycheck-error-list-mode . visual-line-mode)
  :custom
  (flycheck-python-mypy-cache-dir (file-name-concat (getenv "HOME") ".cache" "mypy"))
  (flycheck-python-project-files '("meson.build" "pyproject.toml" ".mypy.ini"))
  :config
  (when (require 'best-side-window nil t)
    (add-to-list 'display-buffer-alist '((major-mode . flycheck-error-list-mode)
                                         best-side-window-display-buffer-in-best-side-window))))
