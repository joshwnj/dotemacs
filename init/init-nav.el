;;;;
;; ace-jump

(require 'ace-jump-mode)
(global-set-key (kbd "C-c SPC") 'ace-jump-mode)
(global-set-key (kbd "C-c l") 'ace-jump-line-mode)

;;;;
;; Use "%" to jump to the matching parenthesis.

(defun goto-match-paren (arg)
  "Go to the matching parenthesis if on parenthesis, otherwise insert
the character typed."
  (interactive "p")
  (cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
    ((looking-at "\\s\)") (forward-char 1) (backward-list 1))
    (t                    (self-insert-command (or arg 1))) ))
(global-set-key (kbd "%") `goto-match-paren)

;;;;
;; Pop to mark

(global-set-key (kbd "C-c b") 'pop-to-mark-command)
(global-set-key (kbd "C-c C-b") 'pop-to-mark-command)

;;;;

(provide 'init-nav)
