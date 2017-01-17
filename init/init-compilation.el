(defun on-compilation-mode ()
  (progn

    (define-key compilation-mode-map (kbd "]") 'next-error-no-select)
    (define-key compilation-mode-map (kbd "[") 'previous-error-no-select)))

(add-hook 'compilation-filter-hook 'on-compilation-mode)

(provide 'init-compilation)
