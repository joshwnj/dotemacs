(mouse-wheel-mode -1)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-save-file-name-transforms (quote ((".*" "~/.emacs_autosaves/\\1" t))))
 '(backup-directory-alist (quote ((".*" . "~/.emacs_backups/"))))
 '(column-number-mode nil)
 '(company-dabbrev-downcase nil)
 '(company-dabbrev-ignore-case (quote keep-prefix))
 '(company-minimum-prefix-length 3)
 '(css-indent-offset 2)
 '(custom-safe-themes
   (quote
    ("5ea20171762b3f9682fbf507ee4b4018ce7b6cc65415fa99799a125f112b2cdb" "573e46dadf8c2623256a164831cfe9e42d5c700baed1f8ecd1de0675072e23c2" default)))
 '(dired-auto-revert-buffer t)
 '(dired-hide-details-hide-symlink-targets nil)
 '(dired-use-ls-dired (quote unspecified))
 '(elfeed-feeds
   (quote
    ("https://github.com/joshwnj.private.atom?token=AACPZxiz11F-Oaajxrc74Ok-fL2g8REGks6zMyrfwA==")))
 '(flycheck-checkers
   (quote
    (ada-gnat asciidoc c/c++-clang c/c++-gcc c/c++-cppcheck cfengine chef-foodcritic coffee coffee-coffeelint coq css-csslint d-dmd elixir-dogma emacs-lisp emacs-lisp-checkdoc erlang eruby-erubis fortran-gfortran go-gofmt go-golint go-vet go-build go-test go-errcheck go-unconvert groovy haml handlebars haskell-stack-ghc haskell-ghc haskell-hlint html-tidy jade json-jsonlint json-python-json less lua-luacheck lua perl perl-perlcritic php php-phpmd php-phpcs processing puppet-parser puppet-lint python-flake8 python-pylint python-pycompile r-lintr racket rpm-rpmlint markdown-mdl rst-sphinx rst ruby-rubocop ruby-rubylint ruby ruby-jruby rust-cargo rust sass scala scala-scalastyle scheme-chicken scss-lint scss sh-bash sh-posix-dash sh-posix-bash sh-zsh sh-shellcheck slim slim-lint sql-sqlint tex-chktex tex-lacheck texinfo typescript-tslint verilog-verilator xml-xmlstarlet xml-xmllint yaml-jsyaml yaml-ruby)))
 '(flycheck-javascript-eslint-executable "npm run lint")
 '(global-whitespace-mode t)
 '(initial-buffer-choice nil)
 '(js-indent-level 2)
 '(json-reformat:pretty-string\? t)
 '(jsx-indent-level 2)
 '(line-number-mode t)
 '(markdown-command "markdown-page")
 '(mode-line-format
   (quote
    ("%e" " " mode-line-modified " " mode-line-buffer-identification " (" mode-name ") "
     (vc-mode vc-mode))))
 '(mode-line-in-non-selected-windows t)
 '(mpages-content-directory "~/.emacs.d/mpages/")
 '(org-tag-alist (quote (("bugwolf" . 98) ("fox2ndScreen" . 102))))
 '(org-time-clocksum-format
   (quote
    (:hours "%d" :require-hours t :minutes ":%02d" :require-minutes t)))
 '(package-check-signature nil)
 '(package-selected-packages
   (quote
    (tide rjsx-mode indent-guide cmd-to-echo bool-flip helm helm-ag helm-css-scss helm-flycheck helm-flyspell atomic-chrome company-flow better-shell eslint-fix x-path-walker yaml-mode xterm-color web-mode web vmd-mode vim-empty-lines-mode viking-mode use-package typescript-mode todotxt tj-mode swiper swift-mode stickyfunc-enhance smex simpleclip show-marks shift-text shift-number shell-pop scss-mode rotate relative-line-numbers real-auto-save projectile polymode peep-dired paredit osx-trash nodejs-repl names multiple-cursors mode-line-in-header modalka mmm-mode markdown-mode magit lua-mode less-css-mode kite-mini key-leap jsx-mode json-mode highlight-thing goto-last-change golden-ratio-scroll-screen flycheck-tip flycheck-status-emoji flycheck-flow flycheck-clojure flatui-theme firefox-controller evil-numbers evil-leader erlang erc-colorize embrace elfeed-goodies editorconfig-core editorconfig dumb-jump drag-stuff dizzee desktop+ cursor-in-brackets cssfmt corral composable company-web company-tern change-inner auto-yasnippet apache-mode ag ace-window ace-popup-menu)))
 '(package-user-dir "~/.emacs.d/elpa")
 '(paradox-github-token t)
 '(projectile-switch-project-action (quote projectile-dired))
 '(scss-compile-at-save nil)
 '(sgml-basic-offset 2)
 '(shell-pop-shell-type
   (quote
    ("ansi-term" "*ansi-term*"
     (lambda nil
       (ansi-term shell-pop-term-shell)))))
 '(size-indication-mode nil)
 '(swiper-completion-method (quote ivy))
 '(warning-suppress-types (quote (undo discard-info)))
 '(web-mode-code-indent-offset 2)
 '(web-mode-css-indent-offset 2)
 '(web-mode-enable-auto-expanding t)
 '(web-mode-markup-indent-offset 2)
 '(whitespace-style
   (quote
    (face tabs trailing space-before-tab newline indentation space-after-tab space-mark tab-mark newline-mark)))
 '(yascroll:scroll-bar (quote (left-fringe right-fringe text-area))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background nil))))
 '(company-scrollbar-bg ((t (:inherit company-tooltip))))
 '(company-scrollbar-fg ((t (:background "cyan"))))
 '(company-tooltip ((t (:background "black" :foreground "cyan"))))
 '(company-tooltip-annotation ((t (:inherit company-tooltip :foreground "green"))))
 '(company-tooltip-common ((t (:inherit company-tooltip :foreground "blue"))))
 '(company-tooltip-common-selection ((t (:inherit company-tooltip-selection :foreground "cyan"))))
 '(company-tooltip-selection ((t (:inherit company-tooltip :background "black"))))
 '(ediff-current-diff-A ((t (:inverse-video t))))
 '(elfeed-search-date-face ((t (:foreground "cyan"))))
 '(elfeed-search-title-face ((t (:foreground "cyan"))))
 '(elfeed-search-unread-title-face ((t (:foreground "white"))))
 '(font-lock-comment-face ((t (:foreground "red"))))
 '(header-line ((t (:inherit mode-line :background "white" :foreground "black" :inverse-video nil :underline t))))
 '(hi-yellow ((t (:background "yellow" :foreground "black"))))
 '(hiwin-face ((t (:background "black"))))
 '(hl-line ((t (:background "black"))))
 '(hl-sexp-face ((t (:background "black"))))
 '(isearch ((t (:background "green" :foreground "black"))))
 '(isearch-fail ((t (:background "red" :foreground "black"))))
 '(ivy-current-match ((t (:inverse-video t))))
 '(magit-blame-heading ((t (:background "black"))))
 '(magit-diff-added ((t (:foreground "green"))))
 '(magit-diff-added-highlight ((t (:background "black" :foreground "#22aa22"))))
 '(magit-diff-base ((t (:background "magenta" :foreground "black"))))
 '(magit-diff-base-highlight ((t (:background "#eeeebb" :foreground "black"))))
 '(magit-diff-context-highlight ((t (:background "black" :foreground "grey50"))))
 '(magit-diff-hunk-heading ((t (:background "black"))))
 '(magit-diff-hunk-heading-highlight ((t (:background "cyan"))))
 '(magit-diff-lines-heading ((t (:background "LightSalmon3" :foreground "black"))))
 '(magit-diff-removed ((t (:background "black" :foreground "#aa2222"))))
 '(magit-diff-removed-highlight ((t (:background "black" :foreground "#aa2222"))))
 '(magit-item-highlight ((t (:background "black"))))
 '(magit-log-head-label-head ((t (:background "blue" :foreground "black"))))
 '(magit-log-head-label-local ((t (:background "green" :foreground "black"))))
 '(magit-log-head-label-remote ((t (:background "yellow" :foreground "black"))))
 '(magit-section-highlight ((t (:distant-foreground "black"))))
 '(markdown-header-face-1 ((t (:inherit markdown-header-face :background "black" :foreground "green"))))
 '(markdown-header-face-2 ((t (:inherit markdown-header-face :foreground "blue"))))
 '(markdown-header-face-3 ((t (:foreground "green"))))
 '(markdown-header-rule-face ((t (:inherit font-lock-function-name-face :foreground "cyan" :weight bold))))
 '(minibuffer-prompt ((t (:background "black"))))
 '(mmm-default-submode-face ((t (:background "black"))))
 '(mode-line ((t (:inverse-video t))))
 '(region ((t (:background "white" :foreground "black"))))
 '(show-paren-match ((t (:background "cyan" :foreground "black"))))
 '(swiper-line-face ((t (:inverse-video t))))
 '(swiper-match-face-1 ((t (:inverse-video t))))
 '(swiper-match-face-2 ((t (:inverse-video t))))
 '(swiper-match-face-3 ((t (:inverse-video t))))
 '(swiper-match-face-4 ((t (:background "black"))))
 '(w3m-header-line-location-content ((t (:background "blue" :foreground "black"))))
 '(w3m-header-line-location-title ((t (:background "blue" :foreground "black"))))
 '(w3m-history-current-url ((t (:background "cyan" :foreground "green"))))
 '(w3m-image-anchor ((t (:background "magenta" :foreground "black"))))
 '(w3m-tab-unselected-retrieving ((t (:background "red" :foreground "black"))))
 '(w3m-tab-unselected-unseen ((t (:background "blue" :foreground "black"))))
 '(whitespace-empty ((t (:background "black" :foreground "firebrick"))))
 '(whitespace-indentation ((t (:foreground "cyan"))))
 '(whitespace-space ((((class color) (background dark)) (:background "black" :foreground "yellow"))))
 '(whitespace-space-after-tab ((t (:background "black" :foreground "firebrick"))))
 '(whitespace-space-before-tab ((t (:background "black" :foreground "firebrick"))))
 '(whitespace-tab ((((class color) (background light)) (:background "black" :foreground "cyan"))))
 '(whitespace-trailing ((t (:background "black" :foreground "yellow" :underline t :weight bold))))
 '(widget-field ((t (:background "black" :foreground "yellow"))))
 '(yascroll:thumb-text-area ((t (:background "black")))))


;; colors
