
(require 'flymake-cursor)
(require 'flymake)

(global-set-key (kbd "C-c ,") 'flymake-goto-prev-error)
(global-set-key (kbd "C-c .") 'flymake-goto-next-error)

(provide 'init-flymake)
