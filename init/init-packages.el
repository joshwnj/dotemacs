(require 'package)

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")))

(package-initialize)

(defvar required-packages
  '(
    ;; ----
    ;; base

    ace-window
    change-inner
    company
    dropdown-list
    electric-case
    expand-region
    find-things-fast
    flycheck
    goto-last-change
    hiwin
    mark
    move-text
    projectile
    relative-line-numbers
    rotate
    shell-pop
    simpleclip
    smex
    tidy
    undo-tree
    use-package
    visual-regexp
    whole-line-or-region
    wrap-region
    yascroll

    ;; ----
    ;; languages

    apache-mode
    erlang
    json-mode
    less-css-mode
    markdown-mode
    php-extras
    php-mode

    ;; ----
    ;; utilities

    circe
    magit
    zencoding-mode
    ) "A list of packages we want to install.")

(defun install-required-packages ()
  "Install all packages"
  (package-refresh-contents)
  (dolist (p required-packages)
    (when (not (package-installed-p p))
      (package-install p))))

(provide 'init-packages)
