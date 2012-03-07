;;;;
;; whitespace

;; basic coloring
;; (setq whitespace-style (quote
;;   ( spaces tabs newline space-mark tab-mark newline-mark)))

;; custom markers
(setq whitespace-display-mappings
 '(
   (space-mark 32 [32] [46]) ; normal space, display nothing
;;    (space-mark 160 [164] [95])
;;    (space-mark 2208 [2212] [95])
;;    (tab-mark 9 [9655 9] [92 9]) ; tab, ▷
))

(custom-set-faces
 '(whitespace-tab ((((class color) (background dark)) (:background "red" :foreground "yellow"))))
 '(whitespace-space ((((class color) (background dark)) (:background "#000D1D" :foreground "yellow"))))
)

(provide 'init-whitespace)