;;;;
;; ace-jump

(require 'ace-jump-mode)
(global-set-key (kbd "C-c SPC") 'ace-jump-mode)
(global-set-key (kbd "C-c l") 'ace-jump-line-mode)

;;;;
;; Use "%" to jump to the matching parenthesis.
;; source: http://emacswiki.org/emacs/ParenthesisMatching

(defun goto-match-paren (arg)
  "Go to the matching  if on (){}[], similar to vi style of % "
  (interactive "p")
  ;; first, check for "outside of bracket" positions expected by forward-sexp, etc.
  (cond ((looking-at "[\[\(\{]") (forward-sexp))
        ((looking-back "[\]\)\}]" 1) (backward-sexp))
        ;; now, try to succeed from inside of a bracket
        ((looking-at "[\]\)\}]") (forward-char) (backward-sexp))
        ((looking-back "[\[\(\{]" 1) (backward-char) (forward-sexp))
        (t (self-insert-command (or arg 1)))))

(global-set-key (kbd "%") 'goto-match-paren)

;;;;
;; Pop to mark

(global-set-key (kbd "C-c b") 'pop-to-mark-command)
(global-set-key (kbd "C-c C-b") 'pop-to-mark-command)

;;;;

(provide 'init-nav)
