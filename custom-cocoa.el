(load-theme 'flatui t)

;;;;
;; Utilities

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ag-executable "/usr/local/bin/ag")
 '(auto-save-file-name-transforms (quote ((".*" "~/.emacs_autosaves/\\1" t))))
 '(backup-directory-alist (quote ((".*" . "~/.emacs_backups/"))))
 '(custom-safe-themes
   (quote
    ("15348febfa2266c4def59a08ef2846f6032c0797f001d7b9148f30ace0d08bcf" "04dd0236a367865e591927a3810f178e8d33c372ad5bfef48b5ce90d4b476481" "ab04c00a7e48ad784b52f34aa6bfa1e80d0c3fcacc50e1189af3651013eb0d58" "a0feb1322de9e26a4d209d1cfa236deaf64662bb604fa513cca6a057ddf0ef64" default)))
 '(hl-paren-background-colors (quote ("#2492db" "#95a5a6" nil)))
 '(hl-paren-colors (quote ("#ecf0f1" "#ecf0f1" "#c0392b")))
 '(package-selected-packages
   (quote
    (exec-path-from-shell alect-themes yaml-mode xterm-color web-mode web vmd-mode vim-empty-lines-mode viking-mode use-package typescript-mode todotxt tj-mode swiper swift-mode stickyfunc-enhance smex simpleclip show-marks shift-text shift-number shell-pop scss-mode rotate relative-line-numbers real-auto-save projectile polymode peep-dired paredit osx-trash nodejs-repl names multiple-cursors mode-line-in-header modalka mmm-mode markdown-mode magit lua-mode less-css-mode kite-mini key-leap jsx-mode json-mode highlight-thing goto-last-change golden-ratio-scroll-screen flycheck-tip flycheck-status-emoji flycheck-flow flycheck-clojure flatui-theme firefox-controller evil-numbers evil-leader erlang erc-colorize embrace elfeed-goodies editorconfig-core editorconfig dumb-jump drag-stuff dizzee desktop+ cursor-in-brackets cssfmt corral composable company-web company-tern change-inner auto-yasnippet apache-mode ag ace-window ace-popup-menu)))
 '(sml/active-background-color "#34495e")
 '(sml/active-foreground-color "#ecf0f1")
 '(sml/inactive-background-color "#dfe4ea")
 '(sml/inactive-foreground-color "#34495e"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(mode-line ((t (:inverse-video t)))))
