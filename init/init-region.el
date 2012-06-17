;; ----
;; expand-region

(add-to-list 'load-path "~/.emacs.d/plugins/expand-region")
(require 'expand-region)

(global-set-key (kbd "M-_") 'er/contract-region)
(global-set-key (kbd "M-+") 'er/expand-region)

;; ----
;; wrap-region

(add-to-list 'load-path "~/.emacs.d/plugins/wrap-region")
(require 'wrap-region)
(wrap-region-global-mode 1)

;; ----
;; movement with memory

(defvar memove/line-amount 1
  "How many lines to move at a time.")

(defun memove/next-line (&optional amount)
  (interactive "P")
  (when amount
    ;; remember this for next time
    (setq memove/line-amount amount))
  (forward-line memove/line-amount))

(defun memove/previous-line (&optional amount)
  (interactive "P")
  (when amount
    ;; remember this for next time
    (setq memove/line-amount amount))
  (forward-line (* -1 memove/line-amount)))

;; ----
;; replace active region with a yank

(defun replace-region (start end)
  "Replace region with a yank."
  (interactive "r")
  (delete-region start end)
  (yank))

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

    ;; comments
    (define-key map (kbd ";") 'comment-or-uncomment-region)

    ;; region movement
    (define-key map (kbd "x") 'exchange-point-and-mark)
    (define-key map (kbd "=") 'er/expand-region)
    (define-key map (kbd "-") 'er/contract-region)

    ;; browsing
    (define-key map (kbd "j") 'memove/next-line)
    (define-key map (kbd "k") 'memove/previous-line)

    ;; toggle transient-mark-mode
    (define-key map (kbd "`") 'transient-mark-mode)
)

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
      (hl-line-mode 1)
      (region-shortcut-mode 1))))

(defun region-shortcut-selective-toggle ()
  "Turn on Region-Shortcut mode if there is an active region."
  (if (region-active-p)
      (region-shortcut-on)
    (region-shortcut-off)))

(defun region-shortcut-off ()
  "Turn off Region-Shortcut mode."
  (hl-line-mode -1)
  (region-shortcut-mode -1))

;; enable when we have an active mark
(add-hook 'activate-mark-hook 'region-shortcut-on)
(add-hook 'deactivate-mark-hook 'region-shortcut-off)

;; disable when we're in the minibuffer
(add-hook 'minibuffer-setup-hook 'region-shortcut-off)
(add-hook 'minibuffer-exit-hook 'region-shortcut-selective-toggle)

(provide 'init-region)
