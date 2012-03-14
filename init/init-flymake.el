
(require 'flymake-cursor)
(require 'flymake)

(define-key osx-key-mode-map (kbd "M-A-;") 'flymake-goto-prev-error)
(define-key osx-key-mode-map (kbd "M-A-'") 'flymake-goto-next-error)

(provide 'init-flymake)