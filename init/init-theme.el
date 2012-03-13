
;;;;;;;;;;;;;;;;
;; appearance
;;;;;;;;;;;;;;;;

(require 'color-theme)
(defun my-color-theme ()
  "custom color theme"
  (interactive)
  (color-theme-install
    '(my-color-theme
       ((foreground-color . "#DBDBDB")
         (background-color . "#001525") 
         (background-mode . dark))
       (bold ((t (:bold t))))
       (bold-italic ((t (:italic t :bold t))))
       (default ((t (nil))))
       
       (font-lock-builtin-face ((t (:italic t :foreground "#a96da0"))))
       (font-lock-comment-face ((t (:italic t :foreground "#FF5555"))))
       (font-lock-comment-delimiter-face ((t (:foreground "#B33D3D"))))
       (font-lock-constant-face ((t (:bold t :foreground "#52C4B5"))))
       (font-lock-doc-string-face ((t (:foreground "#3041c4"))))
       (font-lock-doc-face ((t (:foreground "purple"))))
       (font-lock-reference-face ((t (:foreground "purple"))))
       (font-lock-function-name-face ((t (:foreground "#75CF4E"))))
       (font-lock-keyword-face ((t (:bold t :foreground "#D69758"))))
       (font-lock-preprocessor-face ((t (:foreground "#e3ea94"))))
       (font-lock-string-face ((t (:foreground "#FFFF66"))))
       (font-lock-type-face ((t (:bold t :foreground "#364498"))))
       (font-lock-variable-name-face ((t (:foreground "#2797E6"))))
       (font-lock-warning-face ((t (:bold t :italic nil :underline nil 
                                     :foreground "yellow"))))

       (hl-line ((t (:background "#000D1D"))))
       (mode-line ((t (:foreground "#ffffff" :background "#333333"))))
       (region ((t (:foreground nil :background "#0000FF"))))
       (show-paren-match-face ((t (:bold t :foreground "#FF00FF" 
                                    :background "#330033"))))

       ;; js2
       (js2-function-param-face ((t (:foreground "#75CF4E"))))

       ;; markdown
       (markdown-list-face ((t (:italic f :foreground "#a96da0"))))
)))

;; enable the theme
(my-color-theme)

;; fringe & line numbers
(set-fringe-style "left-only")
(custom-set-faces
 '(fringe ((t (:background "#000D1D"))))
 '(linum ((t (:foreground "#223344" :background "#000D1D")))))
(custom-set-variables
 '(global-linum-mode t))

;; frame opacity
(add-to-list 'default-frame-alist '(alpha . (95 70)))

;; no scroll bars
(scroll-bar-mode nil)

;; misc
(custom-set-variables
 '(cursor-type (quote box))
 '(default-frame-alist (quote ((alpha 95 70) (fringe) (right-fringe) (left-fringe . 1) (cursor-color . "Purple") (menu-bar-lines . 1) (foreground-color . "#DBDBDB") (background-color . "#001525") (background-mode . dark) (vertical-scroll-bars . nil))))
 '(x-stretch-cursor t)
 '(global-hl-line-mode t)
 '(visual-line-mode nil t))

(provide 'init-theme)

