(use-package markdown-mode
  :init
  (progn
    (require 'markdown-mode)
    (add-to-list 'auto-mode-alist '("\\.md$" . markdown-mode))
    (define-key markdown-mode-map (kbd "C-c C-f") 'markdown-follow-thing-at-point)))

(defun my-markdown-hook ()
  (progn
    ;; turn off electric-indent in markdown,
    ;; always seems to do the wrong thing with nested lists
    (electric-indent-mode -1)))

(add-hook 'markdown-mode-hook 'my-markdown-hook)

(provide 'init-markdown)
