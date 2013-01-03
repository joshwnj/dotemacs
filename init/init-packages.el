(require 'package)
(add-to-list 'package-archives 
	     '("marmalade" .
	       "http://marmalade-repo.org/packages/"))
(package-initialize)

(defvar required-packages 
  '(apache-mode erlang expand-region find-things-fast flymake-cursor
		flymake-php json-mode less-css-mode markdown-mode move-text 
		php-extras php-mode projectile smex sml-modeline tidy
		wrap-region yas-jit yasnippet zencoding-mode)
  "A list of packages we want to install.")

(defun install-required-packages ()
  "Install all packages"
  (package-refresh-contents)
  (dolist (p required-packages)
    (when (not (package-installed-p p))
      (package-install p))))

(provide 'init-packages)
