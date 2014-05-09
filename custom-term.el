(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-save-file-name-transforms (quote ((".*" "~/.emacs_autosaves/\\1" t))))
 '(backup-directory-alist (quote ((".*" . "~/.emacs_backups/"))))
 '(circe-reduce-lurker-spam t)
 '(column-number-mode nil)
 '(erc-modules (quote (autojoin button completion fill irccontrols list match menu move-to-prompt netsplit networks noncommands notify notifications readonly ring stamp track)))
 '(grep-find-command "find . -path '*/.svn' -prune -o -type f -print | xargs grep -I -n -e ")
 '(line-number-mode t)
 '(markdown-command "markdown-page")
 '(mode-line-format (quote ("%e" " " mode-line-modified " " mode-line-buffer-identification " " (vc-mode vc-mode))))
 '(mode-line-in-non-selected-windows t)
 '(package-user-dir "~/.emacs/elpa")
 '(size-indication-mode nil)
 '(undo-outer-limit 24000000)
 '(w3m-search-default-engine "duckduckgo
")
 '(w3m-search-engine-alist (quote (("duckduckgo" "https://duckduckgo.com/?q=%s" nil))))
 '(warning-suppress-types (quote (undo discard-info)))
 '(whitespace-style (quote (face tabs spaces trailing space-before-tab newline indentation space-after-tab space-mark tab-mark newline-mark))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background nil))))
 '(fringe ((t (:background "grey95"))))
 '(header-line ((t (:inherit mode-line :background "black" :inverse-video nil :underline t))))
 '(hl-line ((t (:background "black"))))
 '(hl-sexp-face ((t (:background "black"))))
 '(isearch ((t (:background "green" :foreground "black"))))
 '(isearch-fail ((t (:background "red" :foreground "black"))))
 '(markdown-header-face-1 ((t (:inherit markdown-header-face :background "black" :foreground "green"))))
 '(markdown-header-face-2 ((t (:inherit markdown-header-face :foreground "blue"))))
 '(markdown-header-face-3 ((t (:foreground "green"))))
 '(markdown-header-rule-face ((t (:inherit font-lock-function-name-face :foreground "cyan" :weight bold))))
 '(minibuffer-prompt ((t (:background "black"))))
 '(mode-line ((t (:inverse-video t))))
 '(region ((t (:background "white" :foreground "black"))))
 '(show-paren-match ((t (:background "cyan" :foreground "black"))))
 '(w3m-header-line-location-content ((t (:background "blue" :foreground "black"))))
 '(w3m-header-line-location-title ((t (:background "blue" :foreground "black"))))
 '(w3m-history-current-url ((t (:background "cyan" :foreground "green"))))
 '(w3m-image-anchor ((t (:background "magenta" :foreground "black"))))
 '(w3m-tab-unselected-retrieving ((t (:background "red" :foreground "black"))))
 '(w3m-tab-unselected-unseen ((t (:background "blue" :foreground "black"))))
 '(whitespace-space ((((class color) (background dark)) (:background "black" :foreground "yellow"))))
 '(whitespace-tab ((((class color) (background light)) (:background "black" :foreground "cyan"))))
 '(widget-field ((t (:background "black" :foreground "yellow")))))
