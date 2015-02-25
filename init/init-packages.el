(require 'package)

(setq package-archives '(("melpa" . "http://melpa.milkbox.net/packages/")
                          ("gnu"  . "http://elpa.gnu.org/packages/")
                                        ;("marmalade" . "http://marmalade-repo.org/packages/")
                          ))

(package-initialize)

(defvar required-packages
  '(
     ;; ----
     ;; base

     ace-window
     ag
     change-inner
     company
     company-tern
    ;; dired+
    ;; dropdown-list
    ;; electric-case
     expand-region
    ;; find-things-fast
     ;; flycheck
    ;; flycheck-clojure
    ;; golden-ratio
     goto-last-change
     ;; hiwin ; disabled: seems to cause incorrect buffer display when opening a file in emacsclient
    ;; ;mark
    ;; move-text
    ;; ;occur-default-current-word
    ;; paredit
     peep-dired
     projectile
    ;; rainbow-delimiters
     relative-line-numbers
     rotate
     shell-pop
    ;; show-marks
     simpleclip
     smex
    ;; tidy
     undo-tree
     use-package
    ;; visual-regexp
    ;; whole-line-or-region
    ;; wrap-region

    ;; ----
    ;; languages

     apache-mode
     clojure-mode
     erlang
     json-mode
     less-css-mode
     markdown-mode
     ;; php-extras
     php-mode
     scss-mode
     web-mode

    ;; ----
    ;; utilities

     cider
     editorconfig
    ;; erc-colorize
    ;; erc-hl-nicks
     magit
    ;; zencoding-mode

    ;; ----
    ;; trial

     ;; auto-highlight-symbol
     ;; ido-vertical-mode
     ;; volatile-highlights
    ) "A list of packages we want to install.")

(defun install-required-packages ()
  "Install all packages"
  (package-refresh-contents)
  (dolist (p required-packages)
    (when (not (package-installed-p p))
      (package-install p))))

(provide 'init-packages)
