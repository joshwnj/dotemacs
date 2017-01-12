(require 'package)

(setq package-archives '(("melpa" . "http://melpa.milkbox.net/packages/")
                         ("gnu"  . "http://elpa.gnu.org/packages/")))

(package-initialize)

(defvar required-packages
  '(
    expand-region
    thing-cmds
    editorconfig
    flatui-theme
    json-mode
    osx-trash
    bool-flip
    indent-guide
    magit
    magit-gh-pulls
    white-theme
    markdown-mode
    web-mode
    popup
    ag
    company
    smex
    projectile
    undo-tree
    use-package
    ) "A list of packages to install.")

(defun install-required-packages ()
  "Install all packages"
  (package-refresh-contents)
  (dolist (p required-packages)
    (when (not (package-installed-p p))
      (package-install p))))

(provide 'init-packages)
