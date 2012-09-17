(defun toggle-mode (char)
  "Single-char shortcut for toggling modes."
  (interactive "cChoose a mode: ")
  (cond
   ((= char ?e) (emacs-lisp-mode))
   ((= char ?h) (html-mode))
   ((= char ?j) (js-mode))
   ((= char ?m) (markdown-mode))
   ((= char ?p) (php-mode))
   ((= char ?w) (whitespace-mode))
   ))

(global-set-key (kbd "C-c m") 'toggle-mode)
(global-set-key (kbd "C-c C-m") 'toggle-mode)

(provide 'init-modes)
