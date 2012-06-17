;;;;
;; json syntax highlighting
;; https://github.com/joshwnj/json-mode

(defvar json-mode-hook nil)

(defconst json-quoted-key-re "\\(\"[^\"]+?\"[ ]*:\\)")
(defconst json-quoted-string-re "\\(\".*?\"\\)") 
(defconst json-int-re "\\([^\"][0-9]+[^\"]\\)")
(defconst json-keyword-re "\\(true\\|false\\|null\\)")

(defconst json-font-lock-keywords-1
  (list 
   (list json-quoted-key-re 1 font-lock-keyword-face)
   (list json-quoted-string-re 1 font-lock-string-face)
   (list json-keyword-re 1 font-lock-constant-face)
   (list json-int-re 1 font-lock-constant-face)
   )
  "Level one font lock.")

(define-derived-mode json-mode javascript-mode "JSON"
  "Major mode for editing JSON files"
  (set (make-local-variable 'font-lock-defaults) '(json-font-lock-keywords-1 t)))

;; from http://stackoverflow.com/a/7934783/495995

(defun beautify-json ()
  (interactive)
  (let ((b (if mark-active (min (point) (mark)) (point-min)))
        (e (if mark-active (max (point) (mark)) (point-max))))
    (shell-command-on-region b e
     "python -mjson.tool" (current-buffer) t)))

(define-key json-mode-map (kbd "C-c C-f") 'beautify-json)

(provide 'json-mode)