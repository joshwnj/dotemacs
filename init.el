;;;;
;; Auto-Discover .el files

(require 'cl)
(add-to-list 'load-path "~/.emacs.d/init")

;;;;
;; installed packages

(require 'init-packages)
(require 'use-package)

(use-package occur-default-current-word
  :init
  (require 'occur-default-current-word))

(use-package undo-tree
  :init
  (undo-tree-mode))

(use-package projectile
  :init
  (projectile-global-mode))

(use-package hiwin
  :init
  (hiwin-activate))

(use-package winner
  :init
  (winner-mode))

;; ace-window keys
(use-package ace-window
  :init
  (setq aw-keys '(?q ?w ?e ?r ?a ?s ?d ?f)))

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
;; Utilities

(require 'init-erc)

;;;;
;; customisations

(cond
 ((window-system) (setq custom-file "~/.emacs.d/custom-cocoa.el"))
 (t (setq custom-file "~/.emacs.d/custom-term.el")))

(load custom-file)
(put 'narrow-to-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
