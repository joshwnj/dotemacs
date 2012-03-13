
(defun keybind-emacs-lisp-mode ()
  (define-key osx-key-mode-map (kbd "A-e") 'eval-buffer))

;; run keybindings when we enter lisp mode
(add-hook 'emacs-lisp-mode-hook  'keybind-emacs-lisp-mode)

(provide 'mode-elisp)

