;;;;
;; navigating filesystem

(ido-mode t)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)

(define-key osx-key-mode-map (kbd "A-o") 'find-file)
(define-key ido-common-completion-map (kbd "M-/") 'ido-select-text)

;;;;
;; buffers

(global-set-key (kbd "A-b") 'ido-switch-buffer)

(global-set-key (kbd "A-M-]") 'previous-buffer)
(global-set-key (kbd "A-M-[") 'next-buffer)

(provide 'init-nav-fs)