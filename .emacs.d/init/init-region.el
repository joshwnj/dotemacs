(add-to-list 'load-path "~/.emacs.d/plugins/expand-region")
(require 'expand-region)

(global-set-key (kbd "M-_") 'er/contract-region)
(global-set-key (kbd "M-+") 'er/expand-region)

(provide 'init-region)