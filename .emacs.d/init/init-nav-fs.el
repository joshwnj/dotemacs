;;;;
;; navigating filesystem

(ido-mode t)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)

(define-key osx-key-mode-map (kbd "A-o") 'find-file)
(define-key ido-common-completion-map (kbd "M-/") 'ido-select-text)

(provide 'init-nav-fs)