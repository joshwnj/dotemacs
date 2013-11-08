;;;;
;; Auto-Discover .el files

(require 'cl)
(add-to-list 'load-path "~/.emacs.d/init")

;;;;
;; installed packages

(require 'init-packages)

(require 'electric-case)
(require 'org-journal)

(require 'auto-complete)
(global-auto-complete-mode)

(require 'flymake-cursor)

(winner-mode)
(recentf-mode)

;;;;
;; Default settings

(require 'init-defaults)

;;;;
;; Custom settings

(require 'init-backups)
(require 'init-case)
(require 'init-linum)
(require 'init-modeline)
(require 'init-osx)
(require 'init-ido)
(require 'init-shortcuts)
(require 'init-snippets)

;;;;
;; Major modes

(require 'init-html)
(require 'init-js)
(require 'init-markdown)
(require 'init-php)

;;;;
;; customisations

(cond 
 ((window-system) (setq custom-file "~/.emacs.d/custom-cocoa.el"))
 (t (setq custom-file "~/.emacs.d/custom-term.el")))

(load custom-file)
