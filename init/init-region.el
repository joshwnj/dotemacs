;; ----
;; region shortcut keys

(defvar region-shortcut-mode-map
  (let ((map (make-sparse-keymap)))
    ;; suppress all printing characters
    (suppress-keymap map)
    map))

(defun region-shortcut-define-keys (map)
    ;; clipboard
    (define-key map (kbd "c") 'kill-ring-save)
    (define-key map (kbd "C-d") 'delete-region)
    (define-key map (kbd "v") 'replace-region)

    ;; tabs and whitespace
    (define-key map (kbd "t") 'untabify)
    (define-key map (kbd "T") 'tabify)
    (define-key map (kbd "w") 'whitespace-cleanup-region)
    (define-key map (kbd "\\") 'indent-rigidly)

    ;; search/replace
    (define-key map (kbd "/ /") 'replace-string)
    (define-key map (kbd "/ .") 'replace-regexp)
    (define-key map (kbd "?") 'query-replace)

    ;; movement
    (define-key map (kbd "j") 'next-line)
    (define-key map (kbd "k") 'previous-line)
    (define-key map (kbd "h") 'left-char)
    (define-key map (kbd "l") 'right-char)

    (define-key map (kbd "C-j") 'forward-paragraph)
    (define-key map (kbd "C-k") 'backward-paragraph)

    ;; jump around
    (define-key map (kbd "a") 'move-beginning-of-line)
    (define-key map (kbd "e") 'move-end-of-line)
    (define-key map (kbd "g") 'goto-line)

    ;; expand-region
    (define-key map (kbd "=") 'er/expand-region)
    (define-key map (kbd "-") 'er/contract-region)

    ;; comments
    (define-key map (kbd ";") 'comment-or-uncomment-region)

    ;; region movement
    (define-key map (kbd "x") 'exchange-point-and-mark)

    ;; toggle region appearance
    (define-key map (kbd "`") 'region-toggle-color)
)

(defvar region-is-highlighted t)
(defun region-toggle-color (&optional disable-transient-mode)
  "Toggle the region color"
  (interactive "p")

  (message "disable-transient-mode: %d" disable-transient-mode)
  (if (= disable-transient-mode 2)
      (transient-mark-mode -1)
    (progn
      (setq region-is-highlighted (if region-is-highlighted nil t))
      (if region-is-highlighted
          (region-make-highlighted)
        (region-make-unhighlighted)))
    ))

(defun region-make-highlighted ()
  (interactive)
  (transient-mark-mode 1)
  (custom-set-faces
   '(region ((t (:inverse-video t))))
   ))

(defun region-make-unhighlighted ()
  (interactive)
  (transient-mark-mode 1)
  (custom-set-faces
   '(region ((t (:inverse-video nil))))
   '(region ((t (:background "black"))))
   ))

(defun region-shortcut-reload-keys ()
  (interactive)
  (region-shortcut-define-keys region-shortcut-mode-map))

;; reload keys once to start
(region-shortcut-reload-keys)

;; ----

(define-minor-mode region-shortcut-mode
  "Toggle Region-Shortcut mode."
  'region-shortcut-mode-map
  :init-value nil)

(defun region-shortcut-on ()
  "Turn on Region-Shortcut mode."
  (unless (minibufferp)
    (progn
      (custom-set-faces
       '(mode-line ((t (:inverse-video t))))
       )
      (region-shortcut-mode 1))))

(defun region-shortcut-selective-toggle ()
  "Turn on Region-Shortcut mode if there is an active region."
  (if (region-active-p)
      (region-shortcut-on)
    (region-shortcut-off)))

(defun region-shortcut-off ()
  "Turn off Region-Shortcut mode."
  (progn
    (custom-set-faces
       '(mode-line ((t (:background "black"))))
       )
    (region-shortcut-mode -1)))

;; enable when we have an active mark
(add-hook 'activate-mark-hook 'region-shortcut-on)
(add-hook 'deactivate-mark-hook 'region-shortcut-off)

;; disable when we're in the minibuffer
(add-hook 'minibuffer-setup-hook 'region-shortcut-off)
(add-hook 'minibuffer-exit-hook 'region-shortcut-selective-toggle)

;; TODO move the face-updating to a hook

(provide 'init-region)
