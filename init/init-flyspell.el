;;;;;;;;;;;;;;;;;
;; flyspell mode
;;;;;;;;;;;;;;;;;

;; suppress messages to increase performance
(setq flyspell-issue-message-flag nil)

;; use aspell
(setq-default ispell-program-name "/usr/local/bin/aspell")

;; enable globally
(flyspell-mode 1)

(global-set-key (kbd "C-c '") 'flyspell-goto-next-error)
(global-set-key (kbd "C-c /") 'ispell-word)

(provide 'init-flyspell)
