
;;;;;;;;;;;;;;;;
;; appearance
;;;;;;;;;;;;;;;;

;; no menu bar
(menu-bar-mode 0)

;; highlight matching parens
(show-paren-mode 1)

;; custom character for wrapped lines
(set-display-table-slot standard-display-table 'wrap ?… )

;; line numbers
(global-linum-mode 1)
(setq linum-format "%1d ")

;; misc
(custom-set-variables
 '(cursor-type (quote box))
 '(default-frame-alist (quote ((alpha 95 70) (fringe) (right-fringe) (left-fringe . 1) (cursor-color . "Purple") (menu-bar-lines . 1) (foreground-color . "#DBDBDB") (background-color . "#001525") (background-mode . dark) (vertical-scroll-bars . nil))))
 '(x-stretch-cursor t)
 '(global-hl-line-mode t)
 '(visual-line-mode nil t))

(provide 'init-appearance)

