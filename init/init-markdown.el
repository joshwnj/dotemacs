(use-package markdown-mode
  :init
  (progn
    (require 'markdown-mode)
    (add-to-list 'auto-mode-alist '("\\.md$" . markdown-mode))))

(provide 'init-markdown)
