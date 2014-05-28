(use-package php-mode
  :init
  (progn
    ;;;;
    ;; triggers

    (add-to-list 'auto-mode-alist '("\\.php$" . php-mode))

    (defun ywb-php-lineup-arglist-intro (langelem)
      (save-excursion
        (goto-char (cdr langelem))
        (vector (+ (current-column) c-basic-offset))))

    (defun ywb-php-lineup-arglist-close (langelem)
      (save-excursion
        (goto-char (cdr langelem))
        (vector (current-column))))

    (defun my-php-hook-function ()
      (progn
        ;; indentation
        (c-set-offset 'arglist-intro 'ywb-php-lineup-arglist-intro)
        (c-set-offset 'arglist-close 'ywb-php-lineup-arglist-close)

        ;; default codesniffer command
        (set (make-local-variable 'compile-command) (format "phpcs --report=emacs --standard=PEAR %s" (buffer-file-name)))))

    (add-hook 'php-mode-hook 'my-php-hook-function)

    ;; auto-start eldoc mode
    (add-hook 'php-mode-hook 'turn-on-eldoc-mode)))

(provide 'init-php)
