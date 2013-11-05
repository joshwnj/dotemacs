;;;;
;; TODO: isearch colors

;;;;
;; Auto-Discover .el files

(require 'cl)
(add-to-list 'load-path "~/.emacs.test/init")

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

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-save-file-name-transforms (quote ((".*" "~/.emacs_autosaves/\\1" t))))
 '(backup-directory-alist (quote ((".*" . "~/.emacs_backups/"))))
 '(erc-modules (quote (autojoin button completion fill irccontrols list match menu move-to-prompt netsplit networks noncommands notify notifications readonly ring stamp track)))
 '(grep-find-command "find . -path '*/.svn' -prune -o -type f -print | xargs grep -I -n -e ")
 '(markdown-command "markdown-page")
 '(package-user-dir "~/.emacs.test/elpa")
 '(undo-outer-limit 24000000)
 '(warning-suppress-types (quote (undo discard-info)))
 '(whitespace-style (quote (face tabs spaces trailing space-before-tab newline indentation space-after-tab space-mark tab-mark newline-mark))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(header-line ((t (:inherit mode-line :background "black" :inverse-video nil :underline t))))
 '(hl-line ((t (:background "black"))))
 '(hl-sexp-face ((t (:background "black"))))
 '(isearch ((t (:background "green" :foreground "black"))))
 '(isearch-fail ((t (:background "red" :foreground "black"))))
 '(markdown-header-face-1 ((t (:inherit markdown-header-face :background "black"))))
 '(markdown-header-face-3 ((t (:foreground "green"))))
 '(minibuffer-prompt ((t (:background "black"))))
 '(mode-line ((t (:inverse-video t))))
 '(region ((t (:background "white" :foreground "black"))))
 '(show-paren-match ((t (:background "cyan" :foreground "black"))))
 '(whitespace-space ((((class color) (background dark)) (:background "black" :foreground "yellow"))))
 '(whitespace-tab ((((class color) (background light)) (:background "black" :foreground "cyan")))))
