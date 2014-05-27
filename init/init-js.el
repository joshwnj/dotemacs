(require 'flycheck)
(add-hook 'js-mode-hook
          (lambda () (flycheck-mode t)))

;;;;
;; to install:
;; $ npm install -g grasp strip-ansi

(defun grasp-current-buffer (arg)
  (interactive "MGrasp: ")
  (compile (concat "grasp -H '" arg "' " (buffer-file-name) " | strip-ansi")))

;;;;

(provide 'init-js)
