(defun mode-line-verbose ()
  (interactive)
  (setq mode-line-format
    (quote
      ("%e" " " mode-line-modified " " mode-line-buffer-identification " | " mode-name " "
        (vc-mode vc-mode)
        " | " minor-mode-alist))))

(defun mode-line-terse ()
  (interactive)
  (setq mode-line-format
    (quote
      ("%e" " " mode-line-modified " " mode-line-buffer-identification " (" mode-name ") "
        (vc-mode vc-mode)))))
