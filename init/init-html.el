;;;;
;; html editing

(setq auto-mode-alist
	  (append '(("\\.html$" . html-mode)
                ("\\.htm$" . html-mode)
                ("\\.tpl$" . html-mode)
                ("\\.phtml$" . html-mode)
                ) auto-mode-alist))

;; disable the magic list (so we don't get html-helper-mode)
(setq magic-mode-alist ())

;;;;
;; indenting

(setq sgml-basic-offset 4)

(provide 'init-html)