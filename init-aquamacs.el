;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; aquamacs-specific config
;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(load "~/emacs_config/init.el")

;;;;;;;;;;;;;;;;
;; appearance
;;;;;;;;;;;;;;;;

(require 'init-theme)

;; monaco all the way down
(aquamacs-autoface-mode 0)

;; fringe & line numbers
(set-fringe-style "right-only")
(custom-set-faces
 '(fringe ((t (:background "#000D1D"))))
 '(linum ((t (:foreground "#223344" :background "#000D1D")))))

;; frame opacity
(add-to-list 'default-frame-alist '(alpha . (95 70)))

;; no scroll bars
(scroll-bar-mode 0)

;; no tool bar
(tool-bar-mode 0)

;;;;;;;;;;;;;;;;;;
;; remap osx keys
;;;;;;;;;;;;;;;;;;

(define-key osx-key-mode-map (kbd "A-o") 'find-file)
