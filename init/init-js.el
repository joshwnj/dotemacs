;; source: http://www.emacswiki.org/emacs-fr/FlymakeJavaScript
;; source: http://lapin-bleu.net/riviera/?p=191

;; NOTE: expects jslint command to be in your path
;; npm install -g jslint

(when (load "flymake" t)
  (defun flymake-jslint-init ()
    (let* ((temp-file (flymake-init-create-temp-buffer-copy
		       'flymake-create-temp-inplace))
           (local-file (file-relative-name
                        temp-file
                        (file-name-directory buffer-file-name))))
      (list "jslint" (list "--terse" local-file))))

  (setq flymake-err-line-patterns
	(cons '("^\\(.*\\)(\\([[:digit:]]+\\)):\\(.*\\)$"
		1 2 nil 3)
	      flymake-err-line-patterns))

  (add-to-list 'flymake-allowed-file-name-masks
               '("\\.js\\'" flymake-jslint-init)))

(add-hook 'js-mode-hook
	  (lambda () (flymake-mode t)))

(provide 'init-js)
