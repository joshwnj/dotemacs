;;;;
;; disable auto-fill

(setq auto-fill-mode -1)
(setq-default fill-column 99999)
(setq fill-column 99999)

;;;;;;;;;;;;;;;;
;; indenting
;;;;;;;;;;;;;;;;

;; indent only with spaces
(setq-default indent-tabs-mode nil)
(setq-default c-set-style "k&r")
(setq-default tab-width 4)

;;;;;;;;;;;;;;;;
;; scrolling
;;;;;;;;;;;;;;;;

(setq scroll-conservatively 1)

(provide 'init-editing)