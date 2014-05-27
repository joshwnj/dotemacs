(require 'package)

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))

(package-initialize)

(defvar required-packages
  '(
    ace-window
    apache-mode
    change-inner
    circe
    company
    dropdown-list
    electric-case
    erlang
    expand-region
    find-things-fast
    flycheck
    goto-last-change
    hiwin
    json-mode
    less-css-mode
    magit
    mark
    markdown-mode
    move-text
    php-extras
    php-mode
    projectile
    relative-line-numbers
    rotate
    shell-pop
    simpleclip
    smex
    tidy
    undo-tree
    visual-regexp
    whole-line-or-region
    wrap-region
    yascroll
    zencoding-mode
    ) "A list of packages we want to install.")

(defun install-required-packages ()
  "Install all packages"
  (package-refresh-contents)
  (dolist (p required-packages)
    (when (not (package-installed-p p))
      (package-install p))))

(provide 'init-packages)
