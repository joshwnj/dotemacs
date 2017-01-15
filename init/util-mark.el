(defun mark-whole-line ()
  (interactive)
  (move-end-of-line nil)
  (set-mark-command nil)
  (move-beginning-of-line nil))

(provide 'util-mark)
