;;;;
;; php

;; indenting
(add-hook 'php-mode-hook '(lambda () 
  (c-set-style "K&R") 
  (setq c-basic-offset 4)
  (setq indent-line-function 'custom-indent-line)

  ;; disable electric indent
  (c-toggle-electric-state -1)
))

(global-set-key "\r" 'newline-and-indent)

(defun custom-indent-line ()
  "Custom indent function for `php-mode'."
  (interactive)
  (let ((indent-col 0))
    (save-excursion
      (beginning-of-line)
      (condition-case nil
          (while t
            (backward-up-list 1)
            (when (looking-at "[[{(]")
              (setq indent-col (+ indent-col c-basic-offset))))
        (error nil)))
    (save-excursion
      (back-to-indentation)
      (when (and (looking-at "[]})]") (>= indent-col c-basic-offset))
        (setq indent-col (- indent-col c-basic-offset))))
    (indent-line-to indent-col)))

;; flymake 
(defun flymake-php-init ()
  "Use php to check the syntax of the current file."
  (let* ((temp (flymake-init-create-temp-buffer-copy 'flymake-create-temp-inplace))
	 (local (file-relative-name temp (file-name-directory buffer-file-name))))
    (list "php" (list "-f" local "-l"))))

(add-to-list 'flymake-err-line-patterns
  '("\\(Parse\\|Fatal\\) error: +\\(.*?\\) in \\(.*?\\) on line \\([0-9]+\\)$" 3 4 nil 2))

(add-to-list 'flymake-allowed-file-name-masks '("\\.php$" flymake-php-init))

;; extra extensions
(add-to-list 'flymake-allowed-file-name-masks '("\\.inc$" flymake-php-init))
(add-to-list 'flymake-allowed-file-name-masks '("\\.class$" flymake-php-init))

(add-hook 'php-mode-hook (lambda () (flymake-mode 1)))
;(define-key php-mode-map '[M-S-up] 'flymake-goto-prev-error)
;(define-key php-mode-map '[M-S-down] 'flymake-goto-next-error)

(provide 'mode-php)