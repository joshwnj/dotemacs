;;;;
;; javascript

(add-to-list 'auto-mode-alist '("\\.js$" . javascript-mode))

;; NOTE: expects jslint command to be in your path
;; npm install -g jslint

(require 'flymake-jslint)
(add-hook 'javascript-mode-hook
	  (lambda () (flymake-mode t)))

(provide 'mode-js)