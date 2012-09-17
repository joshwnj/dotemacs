;;;;
;; javascript

(add-to-list 'auto-mode-alist '("\\.js$" . javascript-mode))

(add-to-list 'load-path "~/.emacs.d/plugins/nodejs-mode")
(require 'nodejs-mode)

;; NOTE: expects jslint command to be in your path
;; npm install -g jslint

(require 'flymake-jslint)
(add-hook 'js-mode-hook
	  (lambda () (flymake-mode t)))

(provide 'init-js)
