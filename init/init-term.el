;;;;
;; multi-term
;; source: http://emacswiki.org/emacs/MultiTerm

(require 'multi-term)
(setq multi-term-program "/bin/bash")

(define-key term-mode-map (kbd "C-j") 'term-line-mode)
(define-key term-mode-map (kbd "C-k") 'term-char-mode)

;;;;
;; fix an issue with *-word in term
;; source: http://programmingforchildren.blogspot.com.au/2012/06/emacs-multi-term-backwardforward-word.html

(add-to-list 'term-bind-key-alist '("M-d" . term-send-forward-kill-word))

(add-to-list 'term-bind-key-alist '("M-DEL" . term-send-backward-kill-word))
(add-to-list 'term-bind-key-alist '("M-<right>" . term-send-forward-word))
(add-to-list 'term-bind-key-alist '("M-<left>" . term-send-backward-word))

;; ----

(provide 'init-term)
