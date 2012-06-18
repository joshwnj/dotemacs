
;;;;;;;;;;;;;;;;
;; appearance
;;;;;;;;;;;;;;;;

;; no menu bar
(menu-bar-mode -1)

;; highlight matching parens
(show-paren-mode 1)

;; custom character for wrapped lines
(set-display-table-slot standard-display-table 'wrap ?… )

;; no hl line
(global-hl-line-mode -1)

;; line number colors
(require 'linum)
(setq linum-format " %d  ")
(set-face-attribute 'linum nil :background nil :foreground "blue")

;; custom whitespace markers
(setq whitespace-display-mappings
 '(
   (space-mark 32 [32] [46]) ; normal space, display nothing
   (tab-mark 9 [9655 9] [92 9]) ; tab, ▷
))

;; colors
(custom-set-faces
 ;; flymake colors
 '(flymake-errline ((((class color) (background light)) (:background "magenta" :foreground "black"))))

 ;; region colors
 '(region ((((class color) (min-colors 8)) (:background "blue" :foreground "black"))))

 ;; whitespace colors
 '(whitespace-tab ((((class color) (background dark)) (:background "cyan" :foreground "black"))))
 '(whitespace-space ((((class color) (background dark)) (:background "black" :foreground "yellow"))))
 )

;; ----

(provide 'init-appearance)
