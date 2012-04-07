
;;;;
;; resize window with specific width/height
;; source: http://dse.livejournal.com/67732.html

(defun set-window-width (width)
  "Set the window's size to 80 (or prefix arg WIDTH) columns wide."
  (interactive "P")
  (enlarge-window (- (or width 80) (window-width)) 'horizontal))

(defun set-window-height (height)
  "Set the window's height to 80 (or prefix arg HEIGHT) columns wide."
  (interactive "P")
  (enlarge-window (- (or height 80) (window-height))))


(defvar windowsize-mode-map (make-keymap) "windowsize-mode keymap.")

;;;;
;; horizontal

(define-key windowsize-mode-map (kbd "a") 'shrink-window-horizontally)

(define-key windowsize-mode-map (kbd "q") 'enlarge-window-horizontally)

(define-key windowsize-mode-map (kbd "M-a")
  (lambda ()
    (interactive)
    (shrink-window-horizontally 10)))

(define-key windowsize-mode-map (kbd "M-q")
  (lambda ()
    (interactive)
    (enlarge-window-horizontally 10)))

;;;;
;; vertical

(define-key windowsize-mode-map (kbd "s") 'shrink-window)

(define-key windowsize-mode-map (kbd "w") 'enlarge-window)

(define-key windowsize-mode-map (kbd "M-s")
  (lambda ()
    (interactive)
    (shrink-window 10)))

(define-key windowsize-mode-map (kbd "M-w")
  (lambda ()
    (interactive)
    (enlarge-window 10)))

(define-minor-mode windowsize-mode
  "Toggle WindowSize mode."
  'windowsize-mode-map
  :lighter " Size"
  :init-value nil
  :global t)

(define-globalized-minor-mode global-windowsize-mode windowsize-mode windowsize-on)

(defun windowsize-on ()
  (unless (minibufferp)
    (windowsize-mode 1)))

(global-set-key "\C-c\C-w" 'global-windowsize-mode)

(provide 'init-windows)
