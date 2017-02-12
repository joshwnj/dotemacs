(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-echo-common ((t (:background "green" :foreground "black"))))
 '(company-preview-search ((t (:background "black"))))
 '(company-scrollbar-bg ((t (:background "black"))))
 '(company-scrollbar-fg ((t (:background "white"))))
 '(company-tooltip ((t (:background "cyan" :foreground "black"))))
 '(company-tooltip-common ((t (:underline t))))
 '(cursor ((t nil)))
 '(hl-line ((t (:underline t))))
 '(isearch ((t (:background "magenta4" :foreground "black" :weight normal))))
 '(isearch-fail ((t (:background "red" :foreground "black"))))
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
 '(markdown-header-face-1 ((t (:inherit markdown-header-face :foreground "green" :height 1.0))))
 '(markdown-header-face-3 ((t (:inherit markdown-header-face :foreground "magenta" :height 1.0))))
 '(mode-line ((t (:inverse-video nil :background "black"))))
 '(mode-line-inactive ((t (:foreground "white" :overline t :underline t))))
 '(next-error ((t (:background "red" :foreground "black"))))
 '(region ((t (:background "white" :foreground "black"))))
 '(whitespace-empty ((t (:background "black" :foreground "firebrick"))))
 '(whitespace-indentation ((t (:foreground "cyan"))))
 '(whitespace-space ((((class color) (background dark)) (:background "black" :foreground "yellow"))))
 '(whitespace-space-after-tab ((t (:background "black" :foreground "firebrick"))))
 '(whitespace-space-before-tab ((t (:background "black" :foreground "firebrick"))))
 '(whitespace-tab ((((class color) (background light)) (:background "black" :foreground "cyan"))))
 '(whitespace-trailing ((t (:background "black" :foreground "yellow" :underline t :weight bold)))))
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
 '(mode-line-in-non-selected-windows t)
 '(package-selected-packages
    (quote
      (flycheck ripgrep bshell rotate easy-kill yasnippet ioccur show-marks vkill vmd-mode yaml-mode company-tern backward-forward shift-number expand-region thing-cmds editorconfig flatui-theme json-mode osx-trash bool-flip indent-guide magit magit-gh-pulls white-theme markdown-mode web-mode popup ag company smex projectile undo-tree use-package)))
 '(whitespace-style
    (quote
      (face tabs trailing space-before-tab newline indentation space-after-tab space-mark tab-mark newline-mark)))
 '(yas-snippet-dirs (quote ("/Users/josh/.emacs.d/snippets"))))
