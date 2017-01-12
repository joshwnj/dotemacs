;;;;
;; Auto-Discover .el files


;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(require 'cl)
(add-to-list 'load-path "~/.emacs.d/init")

;;;;
;; installed packages

(require 'init-packages)
(require 'use-package)

(use-package undo-tree
  :init
  (undo-tree-mode))

(use-package projectile
  :init
  (projectile-global-mode))

(use-package winner
  :init
  (winner-mode))

(use-package dumb-jump
  :init
  (dumb-jump-mode))

(require 'helm-config)

;; ace-window keys
(use-package ace-window
  :init
  (setq aw-keys '(?q ?w ?e ?r ?a ?s ?d ?f)))

(require 'dizzee)

(use-package yasnippet
  :init
  (yas-global-mode 1))

(require 'todotxt)

;;;;
;; Default settings

(require 'init-defaults)

;;;;
;; Custom settings

(require 'init-autocomplete)
(require 'init-backups)
(require 'init-case)
(require 'init-linum)
(require 'init-osx)
(require 'init-ido)
(require 'init-shell)
(require 'init-shortcuts)
(require 'init-text)

;;;;
;; Major modes

(require 'init-html)
(require 'init-js)
(require 'init-markdown)

;;;;

(require 'atomic-chrome)
(atomic-chrome-start-server)

;; (require 'mmm-mode)
;; (setq mmm-global-mode 'maybe)

;; (defun my-mmm-markdown-auto-class (lang &optional submode)
;;   "Define a mmm-mode class for LANG in `markdown-mode' using SUBMODE.
;; If SUBMODE is not provided, use `LANG-mode' by default."
;;   (let ((class (intern (concat "markdown-" lang)))
;;         (submode (or submode (intern (concat lang "-mode"))))
;;         (front (concat "^```" lang "[\n\r]+"))
;;         (back "^```"))
;;     (mmm-add-classes (list (list class :submode submode :front front :back back)))
;;     (mmm-add-mode-ext-class 'markdown-mode nil class)))

;; Mode names that derive directly from the language name
;; (mapc 'my-mmm-markdown-auto-class
;;       '("awk" "bibtex" "c" "cpp" "css" "html" "latex" "lisp" "makefile"
;;         "markdown" "python" "r" "ruby" "sql" "stata" "xml" "yaml"))

;;;;
;; customisations

(cond
 ((window-system) (setq custom-file "~/.emacs.d/custom-cocoa.el"))
 (t (setq custom-file "~/.emacs.d/custom-term.el")))

(load custom-file)
(put 'narrow-to-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

(setq magit-last-seen-setup-instructions "1.4.0")
