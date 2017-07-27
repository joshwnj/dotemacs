(require 'package)

(setq package-archives '(("melpa" . "http://melpa.milkbox.net/packages/")
                         ("gnu"  . "http://elpa.gnu.org/packages/")))

(package-initialize)

(defvar required-packages
  '(
     ag
     bool-flip
     bshell
     company
     editorconfig
     expand-region
     flycheck
     json-mode
     magit
     magit-gh-pulls
     markdown-mode
     osx-trash
     popup
     projectile
     shift-number
     smex
     undo-tree
     use-package
     web-mode
     yasnippet
     ) "A list of packages to install.")

(defun install-required-packages ()
  "Install all packages"
  (package-refresh-contents)
  (dolist (p required-packages)
    (when (not (package-installed-p p))
      (package-install p))))

(provide 'init-packages)
