;;;;
;; triggers

(add-to-list 'auto-mode-alist '("\\.php$" . php-mode))

;;;;
;; indentation

(add-hook 'php-mode-hook (lambda ()
			   (defun ywb-php-lineup-arglist-intro (langelem)
			     (save-excursion
			       (goto-char (cdr langelem))
			       (vector (+ (current-column) c-basic-offset))))
			   (defun ywb-php-lineup-arglist-close (langelem)
			     (save-excursion
			       (goto-char (cdr langelem))
			       (vector (current-column))))
			   (c-set-offset 'arglist-intro 'ywb-php-lineup-arglist-intro)
			   (c-set-offset 'arglist-close 'ywb-php-lineup-arglist-close)))

;;;;
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

;; auto-start flymake
(add-hook 'php-mode-hook 
	  (lambda ()
	    (define-key php-mode-map (kbd "C-c .") 'flymake-goto-next-error)
	    (flymake-mode 1)))

;; auto-start eldoc mode
(add-hook 'php-mode-hook 'turn-on-eldoc-mode)

(provide 'init-php)
