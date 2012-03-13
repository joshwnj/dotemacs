;;;;
;; json

(autoload 'json-mode "json-mode.el"
   "Major mode for editing JSON files" t)

(add-to-list 'auto-mode-alist '("\\.json\\'" . json-mode))

(provide 'mode-json)