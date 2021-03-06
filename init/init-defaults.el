;; source: https://raw.github.com/magnars/.emacs.d/master/sane-defaults.el

;; set some sane defaults
(setq inhibit-startup-message t)
(fset 'yes-or-no-p 'y-or-n-p)

(setq indent-tabs-mode nil)
(setq-default indent-tabs-mode nil)
(setq c-basic-offset 4)
(setq sgml-basic-offset 4)
(setq js-indent-level 4)

;; no menu bar or tool bar
(menu-bar-mode -1)
(tool-bar-mode -1)

;; highlight matching parens
(show-paren-mode 1)

;; custom character for wrapped lines
(set-display-table-slot standard-display-table 'wrap ?… )
(set-default 'truncate-lines nil)

;; no hl line
(global-hl-line-mode -1)

;; Disable auto refresh buffers (seems to sometimes cause periodic flickering)
(global-auto-revert-mode -1)

;; Also auto refresh dired, but be quiet about it
(setq global-auto-revert-non-file-buffers t)
(setq auto-revert-verbose nil)

;; Hide dired details by default
(add-hook 'dired-mode-hook
          (lambda () (dired-hide-details-mode 1)))

;; Show keystrokes in progress
(setq echo-keystrokes 0.1)

;; Move files to trash when deleting
(setq delete-by-moving-to-trash t)

;; Real emacs knights don't use shift to mark things
(setq shift-select-mode nil)

;; Transparently open compressed files
(auto-compression-mode t)

;; UTF-8 please
(setq locale-coding-system 'utf-8) ; pretty
(set-terminal-coding-system 'utf-8) ; pretty
(set-keyboard-coding-system 'utf-8) ; pretty
(set-selection-coding-system 'utf-8) ; please
(prefer-coding-system 'utf-8) ; with sugar on top

;; Show active region
(transient-mark-mode 1)
(make-variable-buffer-local 'transient-mark-mode)
(put 'transient-mark-mode 'permanent-local t)
(setq-default transient-mark-mode t)

;; Sentences do not need double spaces to end. Period.
(set-default 'sentence-end-double-space nil)

;; Sane level of whitespace visibility
;; custom whitespace markers
(setq whitespace-display-mappings
 '(
   (space-mark 32 [32] [46]) ; normal space, display nothing
   (tab-mark 9 [9655 9] [92 9]) ; tab, ▷
))

;;;;
;; source: https://github.com/technomancy/better-defaults/blob/master/better-defaults.el

(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

(require 'saveplace)
(setq-default save-place t)

;; track recent files
(recentf-mode)

;;;;
;; scrolling (don't auto-recenter, it's really distracting)
;; source: http://zhangda.wordpress.com/2009/05/21/customize-emacs-automatic-scrolling-and-stop-the-cursor-from-jumping-around-as-i-move-it/

(setq
    scroll-margin 1
    scroll-conservatively 0
    scroll-up-aggressively 0.01
    scroll-down-aggressively 0.01)

;; mouse wheel scrolling

(global-set-key [mouse-4] 'scroll-down-line)
(global-set-key [mouse-5] 'scroll-up-line)

;;;;

(provide 'init-defaults)
