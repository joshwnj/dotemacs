(theme-256-color)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(hl-line ((t (:background "color-253" :underline t))))
 '(ido-first-match ((t (:inherit bold :foreground "red" :weight normal))))
 '(linum ((t (:background "color-253"))))
 '(mode-line-inactive ((t (:background "white" :foreground "brightwhite")))))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-save-file-name-transforms (quote ((".*" "~/.emacs_autosaves/\\1" t))))
 '(backup-directory-alist (quote ((".*" . "~/.emacs_backups/"))))
 '(custom-safe-themes
    (quote
      ("b838b592a189633b696e53a8cf4cc084db2a704904d07bf4a8bf75bbf3f13eb5" "a2dd771a05705be2a6e6adb6ddbc7a27ebf49edab1dffdbefe243096becba7c9" "15348febfa2266c4def59a08ef2846f6032c0797f001d7b9148f30ace0d08bcf" default)))
 '(global-linum-mode t)
 '(linum-format " ")
 '(mode-line-in-non-selected-windows t)
 '(package-selected-packages
    (quote
      (madhat2r-theme show-marks vkill vmd-mode yaml-mode company-tern backward-forward shift-number expand-region thing-cmds editorconfig flatui-theme json-mode osx-trash bool-flip indent-guide magit magit-gh-pulls white-theme markdown-mode web-mode popup ag company smex projectile undo-tree use-package)))
 '(whitespace-style
    (quote
      (face tabs trailing space-before-tab newline indentation space-after-tab space-mark tab-mark newline-mark))))
