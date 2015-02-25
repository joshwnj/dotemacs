(use-package flycheck
  :init
  (progn
    (require 'flycheck)
    (add-hook 'js-mode-hook
              (lambda () (flycheck-mode t)))))

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

(define-key js-mode-map (kbd "C-c C-r") 'send-region-to-nodejs-repl-process)
(define-key js-mode-map (kbd "C-c C-c") 'send-region-or-line-to-nodejs-repl-process)

;;;;
;; to install:
;; $ npm install -g grasp strip-ansi

(defun grasp-current-buffer (arg)
  (interactive "MGrasp: ")
  (compile (concat "grasp -H '" arg "' " (buffer-file-name) " | strip-ansi")))

;;;;

(provide 'init-js)
