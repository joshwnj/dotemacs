
(require 'flymake-cursor)
(require 'flymake)

(global-set-key (kbd "M-<") 'flymake-goto-prev-error)
(global-set-key (kbd "M->") 'flymake-goto-next-error)

(provide 'init-flymake)