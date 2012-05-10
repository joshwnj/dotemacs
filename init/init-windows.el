;;;;
;; winner mode

(winner-mode 1)

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


(global-set-key (kbd "M-s <right>") 'enlarge-window-horizontally)
(global-set-key (kbd "M-s <left>") 'shrink-window-horizontally)
(global-set-key (kbd "M-s <up>") 'enlarge-window-vertically)
(global-set-key (kbd "M-s <down>") 'shrink-window-vertically)

(global-set-key (kbd "M-s M-s") 'set-window-width)
(global-set-key (kbd "M-S M-S") 'set-window-height)

(provide 'init-windows)
