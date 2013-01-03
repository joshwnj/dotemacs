;; turn line numbers off by default
(global-linum-mode -1)
(setq linum-format " %d  ")

;;;;
;; thanks to @magnars for help here

(defun goto-line-with-feedback (&optional line)
  "Show line numbers temporarily, while prompting for the line number input"
  (interactive "P")
  (if line
      (goto-line line)
    (unwind-protect
        (progn
          (linum-mode 1)
          (goto-line (read-number "Goto line: ")))
      (linum-mode -1))))

(global-set-key (kbd "C-l") 'goto-line-with-feedback)

;; replace all goto-line
(global-set-key (vector 'remap 'goto-line) 'goto-line-with-feedback)

(provide 'init-linum)
