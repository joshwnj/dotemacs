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

;;;;
;; to install:
;; $ npm install -g grasp strip-ansi

(defun grasp-current-buffer (arg)
  (interactive "MGrasp: ")
  (compile (concat "grasp -H '" arg "' " (buffer-file-name) " | strip-ansi")))

;;;;

(provide 'init-js)
