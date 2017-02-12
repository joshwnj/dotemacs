(use-package flycheck
  :init
  (progn
    (require 'flycheck)

    ;; disable jshint in favour of eslint
    (setq-default flycheck-disabled-checkers
      (append flycheck-disabled-checkers
        '(javascript-jscs)
        '(javascript-jshint)))

    ;; use eslint with web-mode for jsx files
    (flycheck-add-mode 'javascript-eslint 'web-mode)
    (flycheck-add-mode 'javascript-eslint 'js-mode)

    ;; disable json-jsonlist checking for json files
    (setq-default flycheck-disabled-checkers
      (append flycheck-disabled-checkers
        '(json-jsonlist)))
    ))

(use-package web-mode
  :init
  (progn
    (add-to-list 'auto-mode-alist '("\\.jsx$" . web-mode))))

(defun send-region-or-line-to-nodejs-repl-process ()
  "Send the current line to `nodejs-repl' process."
  (interactive)
  (when (not (region-active-p))
    (mark-whole-line))
  (send-region-to-nodejs-repl-process (region-beginning) (region-end)))

(defun send-region-to-nodejs-repl-process (start end)
  "Send region to `nodejs-repl' process."
  (interactive "r")
  (save-selected-window
    (save-excursion (nodejs-repl)))
  (let ((p (get-process nodejs-repl-process-name)))
    (comint-send-region p start end)
    (comint-send-string p "\n")))

(defun my-js-hook-function ()
  (progn
    (add-to-list 'compilation-error-regexp-alist 'node-stack-trace)
    (add-to-list 'compilation-error-regexp-alist-alist
      '(node-stack-trace "^ +at[:]* [^(]+(\\(.+\\):\\(.+\\):\\(.+\\))" 1 2 3))

    (define-key js-mode-map (kbd "C-c C-r") 'send-region-to-nodejs-repl-process)
    (define-key js-mode-map (kbd "C-c C-c") 'send-region-or-line-to-nodejs-repl-process)))

(add-hook 'js-mode-hook 'my-js-hook-function)

;;;;

(provide 'init-js)
