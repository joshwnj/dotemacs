(defun mode-line-verbose ()
  (interactive)
  (setq-default mode-line-format
    (quote
      ("%e " mode-line-modified " " mode-line-buffer-identification " | " mode-name " "
        (vc-mode vc-mode)
        " | " minor-mode-alist))))

(defun mode-line-terse ()
  (interactive)
  (setq-default mode-line-format
    (quote
      ("%e " mode-line-modified " " (:eval (if shorty-mode (propertize "%12b" 'face 'font-lock-warning-face) mode-line-buffer-identification)) " (" mode-name ") " (vc-mode vc-mode)))))

(provide 'init-modeline)
