(require 'package)

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))

(package-initialize)

(defvar required-packages
  '(
    apache-mode
    auto-complete
    dropdown-list
    electric-case
    erlang
    expand-region
    find-things-fast
    flymake-cursor
    flymake-easy
    flymake-php
    golden-ratio
    json-mode
    less-css-mode
    magit
    markdown-mode
    move-text
    org-journal
    php-extras
    php-mode
    smex
    tidy
    wrap-region
    yas-jit
    yasnippet
    zencoding-mode
    ) "A list of packages we want to install.")

(defun install-required-packages ()
  "Install all packages"
  (package-refresh-contents)
  (dolist (p required-packages)
    (when (not (package-installed-p p))
      (package-install p))))

(provide 'init-packages)
