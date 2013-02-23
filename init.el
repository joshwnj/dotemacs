;;;;
;; URL: https://github.com/joshwnj/dotemacs

;;;;
;; Auto-Discover .el files 

(require 'cl)
(add-to-list 'load-path "~/.emacs.d/init")

;;;;
;; Packages

(require 'init-packages)
(require 'flymake-cursor)
(require 'flymake)

;;;;
;; Misc settings

(require 'init-autocomplete)
(require 'init-backups)
(require 'init-defaults)
(require 'init-fs)
(require 'init-linum)
(require 'init-modeline)
(require 'init-osx)
(require 'init-region)
(require 'init-smex)
(require 'init-windows)

;;;;
;; Major modes

(require 'init-html)
(require 'init-js)
(require 'init-markdown)
(require 'init-php)

;; avoiding Meta
(global-set-key (kbd "C-f") 'forward-word)
(global-set-key (kbd "C-b") 'backward-word)

;;;;

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-save-file-name-transforms (quote ((".*" "~/.emacs_autosaves/\\1" t))))
 '(backup-directory-alist (quote ((".*" . "~/.emacs_backups/")))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(flymake-errline ((t (:foreground "magenta" :underline t))))
 '(font-lock-comment-face ((t (:foreground "red"))))
 '(hl-line ((t (:background "black"))))
 '(minibuffer-prompt ((t (:background "black"))))
 '(mode-line ((t (:background "black"))))
 '(whitespace-indentation ((t (:foreground "black"))))
 '(whitespace-space ((((class color) (background dark)) (:background "black" :foreground "yellow"))))
 '(whitespace-tab ((((class color) (background light)) (:background "black" :foreground "cyan")))))
