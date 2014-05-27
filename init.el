;;;;
;; Auto-Discover .el files

(require 'cl)
(add-to-list 'load-path "~/.emacs.d/init")

;;;;
;; installed packages

(require 'init-packages)

(require 'electric-case)

(require 'auto-complete)
(global-auto-complete-mode)

(require 'undo-tree-mode)


(projectile-global-mode)

(global-set-key (kbd "M-i") 'change-inner)
(global-set-key (kbd "M-o") 'change-outer)

(global-set-key (kbd "C-p") 'goto-last-change)
(global-set-key (kbd "C-n") 'goto-last-change-reverse)

(winner-mode)
(recentf-mode)

;; ace-window keys
(setq aw-keys '(?q ?w ?e ?r ?a ?s ?d ?f))

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

;; disabled because it seems to be crashing sometimes
;(require 'init-snippets)

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
(put 'narrow-to-region 'disabled nil)
