;;;;
;; Jump mode: jump to the next/previous matching character

(defvar jump-mode/last-char
  "Remember the last character we jumped to"
  nil)

(defun jump-mode/repeat-foward ()
  "Jump forward, using the same chatacter as last time."
  (interactive)
  (search-forward (char-to-string jump-mode/last-char)))  

(defun jump-mode/repeat-backward ()
  "Jump backward, using the same chatacter as last time."
  (interactive)
  (search-backward (char-to-string jump-mode/last-char)))

(defun jump-mode/on () 
  "Turn on jump-mode"
  (interactive)
  (hl-line-mode 1)
  (jump-mode 1))

(defun jump-mode/off () 
  "Turn off jump-mode"
  (interactive)
  (hl-line-mode 0)
  (jump-mode 0))

(defun jump-mode/start (char)
  "Start jump mode"
  (interactive "cForward to char: ")

  ;; make search case-sensitive
  (setq case-fold-search nil)

  (jump-mode/on)
  (setq jump-mode/last-char char)
  (jump-mode/repeat-foward))

(defvar jump-mode-map (make-keymap) "jump-mode keymap.")

(define-key jump-mode-map (kbd "j") 'jump-mode/repeat-foward)
(define-key jump-mode-map (kbd "k") 'jump-mode/repeat-backward)
(define-key jump-mode-map (kbd "RET") 'jump-mode/off)

(define-minor-mode jump-mode
  "Toggle Jump mode."
  'browse-mode-map
  :lighter " Jump"
  :init-value nil)

(global-set-key (kbd "C-c j") 'jump-mode/start)

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
