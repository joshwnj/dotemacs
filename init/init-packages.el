(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/"))
(package-initialize)

(defvar required-packages
  '(
    apache-mode
    auto-complete
    erlang
    expand-region
    find-things-fast
    flymake-cursor
    flymake-easy
    flymake-php
    json-mode
    less-css-mode
    move-text
    php-extras
    php-mode
    smex
    sml-modeline
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
