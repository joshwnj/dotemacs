
;;;;;;;;;;;;;;;;
;; theme
;;;;;;;;;;;;;;;;

(add-to-list 'load-path "~/.emacs.d/plugins/color-theme")
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

       ;; markdown
       (markdown-list-face ((t (:foreground "#a96da0"))))
)))

;; enable the theme
(my-color-theme)

(provide 'init-theme)

