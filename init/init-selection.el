(defvar selection-mode-map (make-keymap) "selection-mode keymap.")

(define-key selection-mode-map (kbd "SPC") 'cua-set-mark)
(define-key selection-mode-map (kbd "\\") 'exchange-point-and-mark)

(define-key selection-mode-map (kbd "=") 'er/expand-region)
(define-key selection-mode-map (kbd "-") 'er/contract-region)

(define-key selection-mode-map (kbd ":") 'goto-line)
(define-key selection-mode-map (kbd "?") 'search-forward)
(define-key selection-mode-map (kbd "/") 'search-forward-regexp)

(define-key selection-mode-map (kbd "x") 'cua-cut-region)
(define-key selection-mode-map (kbd "c") 'clipboard-kill-ring-save)
(define-key selection-mode-map (kbd "v") 'cua-paste)

(define-key selection-mode-map (kbd ";") 'comment-or-uncomment-region)

(define-minor-mode selection-mode
  "Toggle Selection mode."
  'selection-mode-map
  :lighter " Sel"
  :init-value nil
  :global nil)

(global-set-key (kbd "S-<return>") 'selection-mode)

(provide 'init-selection)