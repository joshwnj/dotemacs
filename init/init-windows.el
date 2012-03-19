(defvar windowsize-mode-map (make-keymap) "windowsize-mode keymap.")

;;;;
;; horizontal

(define-key windowsize-mode-map (kbd "z") 'shrink-window-horizontally)

(define-key windowsize-mode-map (kbd "a") 'enlarge-window-horizontally)

(define-key windowsize-mode-map (kbd "M-z")
  (lambda ()
    (interactive)
    (shrink-window-horizontally 10)))

(define-key windowsize-mode-map (kbd "M-a")
  (lambda ()
    (interactive)
    (enlarge-window-horizontally 10)))

;;;;
;; vertical

(define-key windowsize-mode-map (kbd "x") 'shrink-window)

(define-key windowsize-mode-map (kbd "s") 'enlarge-window)

(define-key windowsize-mode-map (kbd "M-x")
  (lambda ()
    (interactive)
    (shrink-window 10)))

(define-key windowsize-mode-map (kbd "M-s")
  (lambda ()
    (interactive)
    (enlarge-window 10)))

(define-minor-mode windowsize-mode
  "Toggle WindowSize mode."
  'windowsize-mode-map
  :lighter    " Size"
  :init-value nil
  :global t)

(define-globalized-minor-mode global-windowsize-mode windowsize-mode windowsize-on)

(defun windowsize-on ()
  (unless (minibufferp)
    (windowsize-mode 1)))

(global-set-key "\C-c\C-w" 'global-windowsize-mode)

(provide 'init-windows)
