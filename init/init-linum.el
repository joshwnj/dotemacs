;; turn line numbers off by default
(global-linum-mode -1)
(setq linum-format " %d ")

(defun goto-line-with-feedback (&optional line)
  "Show line numbers temporarily, while prompting for the line number input"
  (interactive "P")
  (if line
    (goto-line line)
    (progn
      (linum-mode 1)
      (let ((line (read-number "Line: ")))
        (goto-line line))
      (linum-mode -1))))

(global-set-key (kbd "C-l") 'goto-line-with-feedback)

(provide 'init-linum)
