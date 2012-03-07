
;; shift a line up or down
;; source: http://www.mygooglest.com/fni/dot-emacs.html

(defun move-line (n)
  "Move the current line up or down by N lines"
  (interactive "p")
  (let ((col (current-column))
        start
        end)
    (beginning-of-line)
    (setq start (point))
    (end-of-line)
    (forward-char)
    (setq end (point))
    (let ((line-text (delete-and-extract-region start end)))
      (forward-line n)
      (insert line-text)
      ;; restore point to the original column in moved line
      (forward-line -1)
      (forward-char col))))

(defun move-line-up (n)
  "Move the current line up by N lines"
  (interactive "p")
  (move-line (if (null n) -1 (- n))))

(defun move-line-down (n)
  "Move the current line down by N lines"
  (interactive "p")
  (move-line (if (null n) 1 n)))

;;;;
;; key binding

(global-set-key (kbd "<A-M-up>") 'move-line-up)
(global-set-key (kbd "<A-M-down>") 'move-line-down)


(provide 'init-edit-lines)
