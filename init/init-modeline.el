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
      ("%e " mode-line-modified " " mode-line-buffer-identification " (" mode-name (:eval (if shorty-mode " | SHORTY")) ") "
        (vc-mode vc-mode)))))

(provide 'init-modeline)
