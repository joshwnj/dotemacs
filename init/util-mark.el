(defun mark-whole-line ()
  (interactive)
  (move-end-of-line nil)
  (set-mark-command nil)
  (move-beginning-of-line nil))

(defun activate-region ()
  (interactive)
  (exchange-point-and-mark)
  (exchange-point-and-mark))

(provide 'util-mark)
