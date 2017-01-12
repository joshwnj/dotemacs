;;;
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

(require 'init-shorty)

;;;;
;; Default settings

(require 'init-defaults)

;;;;
;; Custom settings

(require 'init-autocomplete)
(require 'init-backups)
(require 'init-datetime)
(require 'init-linum)
(require 'init-osx)
(require 'init-ido)
(require 'init-shell)
(require 'init-text)

;;;;
;; Major modes

;(require 'init-js)
(require 'init-markdown)

;;;;
;; atomic chrome

;(require 'atomic-chrome)
;(atomic-chrome-start-server)

;;;;
;; color theme


(when (string= (getenv "TERM") "xterm-256color")
  (load-theme 'tango-dark))

;;;;
;; Show a list of recent files as the default screen

(recentf-open-files)

;;;;

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-save-file-name-transforms (quote ((".*" "~/.emacs_autosaves/\\1" t))))
 '(backup-directory-alist (quote ((".*" . "~/.emacs_backups/"))))
 '(custom-safe-themes
   (quote
    ("a2dd771a05705be2a6e6adb6ddbc7a27ebf49edab1dffdbefe243096becba7c9" "15348febfa2266c4def59a08ef2846f6032c0797f001d7b9148f30ace0d08bcf" default)))
 '(mode-line-format
   (quote
    ("%e" " " mode-line-modified " " mode-line-buffer-identification " (" mode-name ") "
     (vc-mode vc-mode))))
 '(mode-line-in-non-selected-windows t)
 '(package-selected-packages
   (quote
    (expand-region thing-cmds editorconfig flatui-theme json-mode osx-trash bool-flip indent-guide magit magit-gh-pulls white-theme markdown-mode web-mode popup ag company smex projectile undo-tree use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cursor ((t nil)))
 '(mode-line ((t (:inverse-video t)))))
