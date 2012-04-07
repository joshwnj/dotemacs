;;;;
;; global minor-mode for non-editing actions
;; 
;; * making and manipulating regions
;; * jumping between buffers
;; * navigating and resizing windows

(defun kill-current-buffer ()
  "Kill the current buffer without confirmation unless explicitly modified."
  (interactive)
  (kill-buffer (current-buffer)))

;;;;
;; keys

(defvar nonedit-mode-map (make-keymap) "nonedit-mode keymap.")

;; define a region
(define-key nonedit-mode-map (kbd "SPC") 'cua-set-mark)
(define-key nonedit-mode-map (kbd "\\") 'exchange-point-and-mark)

(define-key nonedit-mode-map (kbd "=") 'er/expand-region)
(define-key nonedit-mode-map (kbd "-") 'er/contract-region)

(define-key nonedit-mode-map (kbd ":") 'goto-line)
(define-key nonedit-mode-map (kbd "?") 'search-forward)
(define-key nonedit-mode-map (kbd "/") 'search-forward-regexp)

;; act on a region
(define-key nonedit-mode-map (kbd "x") 'cua-cut-region)
(define-key nonedit-mode-map (kbd "c") 'clipboard-kill-ring-save)
(define-key nonedit-mode-map (kbd "v") 'cua-paste)
(define-key nonedit-mode-map (kbd ";") 'comment-or-uncomment-region)

;; buffers
(define-key nonedit-mode-map (kbd "|") 'switch-buffer) 
(define-key nonedit-mode-map (kbd "]") 'previous-buffer)
(define-key nonedit-mode-map (kbd "[") 'next-buffer)
(define-key nonedit-mode-map (kbd "k") 'kill-current-buffer)


(define-minor-mode nonedit-mode
  "Toggle NonEdit mode."
  'nonedit-mode-map
  :lighter " NE"
  :init-value nil
  :global t)

(define-globalized-minor-mode global-nonedit-mode nonedit-mode nonedit-on)

(defun nonedit-on ()
  (unless (minibufferp)
    (nonedit-mode 1)))

(global-set-key (kbd "M-<return>") 'global-nonedit-mode)

(defun nonedit-mode-toggle-appearance ()
  "Toggle the appearance based on whether we're in nonedit mode or not"
  (if global-nonedit-mode
      (progn
        (set-face-attribute 'hl-line nil
                            :background "#000")
        (set-face-attribute 'mode-line nil
                            :background "#000" :box '(:line-width 6 :color "#000" :style nil))
        (setq cursor-type 'bar))
    (progn
      (set-face-attribute 'hl-line nil
                          :background "#000D1D")
      (set-face-attribute 'mode-line nil
                          :background "gray20" :box '(:line-width 6 :color "gray20" :style nil))
      (setq cursor-type 'box))
    ))

(remove-hook 'global-nonedit-mode-hook 'nonedit-mode-toggle-appearance)
(add-hook 'global-nonedit-mode-hook 'nonedit-mode-toggle-appearance)

;;;;

(provide 'init-nonedit)