(add-to-list 'load-path "~/emacs_config/plugins/php-mode")
(require 'php-mode)

(add-hook 'php-mode-hook
          '(lambda () (define-abbrev php-mode-abbrev-table "ex" "extends")))

;; indenting
(add-hook 'php-mode-hook '(lambda () 
  (c-set-style "cc-mode") 
  (setq c-basic-offset 4)
))

(setq php-manual-path "/usr/share/doc/php/html")

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

;; prevent collision
(define-key php-mode-map (kbd "C-c .") 'flymake-goto-next-error)

(add-hook 'php-mode-hook (lambda () (flymake-mode 1)))

(provide 'init-php)
