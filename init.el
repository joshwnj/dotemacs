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

(use-package editorconfig
  :init
  (editorconfig-mode))

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
;; util functions

(require 'util-files)
(require 'util-mark)

;;;;
;; atomic chrome

;(require 'atomic-chrome)
;(atomic-chrome-start-server)

;;;;
;; color theme


(when (string= (getenv "TERM") "xterm-256color")
  (load-theme 'adwaita))

;;;;
;; Show a list of recent files as the default screen

(recentf-open-files)

;;;;
;; activate shorty-mode by default

(global-shorty-on)

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
    ("%e" " " mode-line-modified " " mode-line-buffer-identification " | " mode-name " "
     (vc-mode vc-mode)
     " | " minor-mode-alist)))
 '(mode-line-in-non-selected-windows t)
 '(package-selected-packages
   (quote
    (yaml-mode company-tern backward-forward shift-number expand-region thing-cmds editorconfig flatui-theme json-mode osx-trash bool-flip indent-guide magit magit-gh-pulls white-theme markdown-mode web-mode popup ag company smex projectile undo-tree use-package)))
 '(whitespace-style
   (quote
    (face tabs trailing space-before-tab newline indentation space-after-tab space-mark tab-mark newline-mark))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cursor ((t nil)))
 '(hl-line ((t (:underline t))))
 '(isearch ((t (:background "magenta4" :foreground "black"))))
 '(magit-diff-added ((t (:foreground "green"))))
 '(magit-diff-added-highlight ((t (:foreground "#22aa22"))))
 '(magit-diff-base ((t (:background "red" :foreground "black"))))
 '(magit-diff-base-highlight ((t (:background "red" :foreground "black"))))
 '(magit-diff-context-highlight ((t (:foreground "grey50"))))
 '(magit-diff-hunk-heading-highlight ((t (:underline t))))
 '(magit-diff-hunk-region ((t (:inherit bold :background "black"))))
 '(magit-diff-lines-heading ((t (:background "LightSalmon3" :foreground "black"))))
 '(magit-diff-removed ((t (:foreground "#aa2222"))))
 '(magit-diff-removed-highlight ((t (:foreground "#aa2222"))))
 '(magit-section-highlight ((t (:background "black"))))
 '(mode-line ((t (:inverse-video nil :background "black"))))
 '(region ((t (:background "white" :foreground "black"))))
 '(whitespace-empty ((t (:background "black" :foreground "firebrick"))))
 '(whitespace-indentation ((t (:foreground "cyan"))))
 '(whitespace-space ((((class color) (background dark)) (:background "black" :foreground "yellow"))))
 '(whitespace-space-after-tab ((t (:background "black" :foreground "firebrick"))))
 '(whitespace-space-before-tab ((t (:background "black" :foreground "firebrick"))))
 '(whitespace-tab ((((class color) (background light)) (:background "black" :foreground "cyan"))))
 '(whitespace-trailing ((t (:background "black" :foreground "yellow" :underline t :weight bold)))))
