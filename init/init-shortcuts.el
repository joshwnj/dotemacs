
;; ----

;; TODO: move these elsewhere

(defun switch-to-other-buffer ()
  (interactive)
  (switch-to-buffer (other-buffer (current-buffer) 1)))

(defun create-new-file (filename)
  (interactive "F")
  (find-file filename))

(defun my-find-file (window-option)
  (interactive "p")
  (if (eq window-option 1)
      (ido-find-file)
    (ido-find-file-other-window)))

(defun my-switch-buffer (window-option)
  (interactive "p")
  (if (eq window-option 1)
      (ido-switch-buffer)
    (ido-switch-buffer-other-window)))


(defvar shortcut-mode-map
  (let ((map (make-sparse-keymap)))
    ;; suppress all printing characters
    (suppress-keymap map)
    map))

(defun shortcut-define-keys (map)
  ;; exit shortcut mode
  (define-key map (kbd "C-f") 'global-shortcut-off)

  ;; buffers
  (define-key map (kbd "b b") 'my-switch-buffer)
  (define-key map (kbd "b k") 'kill-this-buffer)
  (define-key map (kbd "b s") 'save-buffer)
  (define-key map (kbd "b o") 'switch-to-other-buffer)

  ;; bookmarks
  (define-key map (kbd "b m") 'bookmark-set)
  (define-key map (kbd "b j") 'bookmark-jump)

  ;; clipboard
  (define-key map (kbd "c b") 'browse-kill-ring)
  (define-key map (kbd "c c") 'kill-ring-save)
  (define-key map (kbd "c x") 'kill-region)
  (define-key map (kbd "c y") 'yank)

  ;; clipboard (osx)
  (define-key map (kbd "c o c") 'simpleclip-copy)
  (define-key map (kbd "c o v") 'simpleclip-paste)
  (define-key map (kbd "c o d") 'osx-get-cwd)

  ;; comments
  (define-key map (kbd ";") 'comment-or-uncomment-region)

  ;; file
  (define-key map (kbd "f a") 'ftf-find-file)
  (define-key map (kbd "f c") 'create-new-file)
  (define-key map (kbd "f f") 'my-find-file)
  (define-key map (kbd "f g") 'grep-find)
  (define-key map (kbd "f r") 'ido-recentf-open)

  ;; go (navigate to a point in a buffer)
  (define-key map (kbd "g f") 'jump-char-forward)
  (define-key map (kbd "g r") 'jump-char-backward)
  (define-key map (kbd "g l") 'goto-line-with-feedback)
  (define-key map (kbd "g s") 'helm-swoop)
  (define-key map (kbd "g .") 'next-error)
  (define-key map (kbd "g ,") 'previous-error)
  (define-key map (kbd "g m") 'forward-mark)
  (define-key map (kbd "g n") 'backward-mark)


  ;; kill
  (define-key map (kbd "k f") 'fastnav-zap-to-char-forward)
  (define-key map (kbd "k r") 'fastnav-zap-to-char-backward)
  (define-key map (kbd "k l") 'kill-whole-line)
  (define-key map (kbd "k w") 'kill-word)
  (define-key map (kbd "k z") 'zap-to-char)

  ;; modes
  (define-key map (kbd "m c") 'css-mode)
  (define-key map (kbd "m e") 'emacs-lisp-mode)
  (define-key map (kbd "m h") 'html-mode)
  (define-key map (kbd "m j") 'js-mode)
  (define-key map (kbd "m m") 'markdown-mode)
  (define-key map (kbd "m p") 'php-mode)

  ;; convert case
  (define-key map (kbd "o u") 'convert-case/upper-camel)
  (define-key map (kbd "o -") 'convert-case/dash)
  (define-key map (kbd "o =") 'convert-case/underscore)
  (define-key map (kbd "o o") 'camelscore-word-at-point)

  ;; region / mark
  (define-key map (kbd "=") 'er/expand-region)
  (define-key map (kbd "-") 'er/contract-region)
  (define-key map (kbd "r x") 'exchange-point-and-mark)

  ;; search
  (define-key map (kbd "s b") 'isearch-backward)
  (define-key map (kbd "s f") 'isearch-forward)
  (define-key map (kbd "s o") 'occur)
  (define-key map (kbd "s .") 'isearch-repeat-forward)
  (define-key map (kbd "s ,") 'isearch-repeat-backward)

  ;; tabs, indentation and whitespace
  (define-key map (kbd "i c") 'whitespace-cleanup-region)
  (define-key map (kbd "i t") 'tabify)
  (define-key map (kbd "i u") 'untabify)
  (define-key map (kbd "i i") 'indent-region)
  (define-key map (kbd "i ]") 'indent-rigidly)

  ;; visual flags
  (define-key map (kbd "v m") 'show-marks)
  (define-key map (kbd "v w") 'global-whitespace-mode)
  (define-key map (kbd "v s") 'global-yascroll-bar-mode)

  ;; windows
  (define-key map (kbd "w w") 'ace-window)
  (define-key map (kbd "w b") 'balance-windows)
  (define-key map (kbd "w g") 'golden-ratio-mode)
  (define-key map (kbd "w o") 'other-window)
  (define-key map (kbd "w 1") 'delete-other-windows)
  (define-key map (kbd "w 2") 'split-window-below)
  (define-key map (kbd "w 3") 'split-window-right)
  (define-key map (kbd "w 0") 'delete-window)
  (define-key map (kbd "w [") 'winner-undo)
  (define-key map (kbd "w ]") 'winner-redo)
  (define-key map (kbd "w j") 'windmove-down)
  (define-key map (kbd "w k") 'windmove-up)
  (define-key map (kbd "w h") 'windmove-left)
  (define-key map (kbd "w l") 'windmove-right)

  (define-key map (kbd "x h") 'helm-M-x)
  (define-key map (kbd "x x") 'smex)
)

(defun shortcut-reload-keys ()
  (interactive)
  (shortcut-define-keys shortcut-mode-map))

;; reload keys once to start
(shortcut-reload-keys)


(defvar shortcut-reenable-after-minibuffer nil
  "Tell whether to reenable Shortcut mode after exiting minibuffer.")

(define-minor-mode shortcut-mode
  "Toggle Shortcut mode."
  'shortcut-mode-map
  :init-value nil
  :lighter " SHORTCUT"
  :global t)

(defun shortcut-on ()
  "Turn on Shortcut mode."
  (interactive)
  (shortcut-mode 1))

(define-globalized-minor-mode global-shortcut-mode shortcut-mode shortcut-on)

(defun global-shortcut-on ()
  "Turn on Global Shortcut mode."
  (interactive)
  (global-shortcut-mode 1))

(defun global-shortcut-off ()
  "Turn off Global Shortcut mode."
  (interactive)
  (global-shortcut-mode -1)
  (setq shortcut-reenable-after-minibuffer nil))

;;;;

(defun shortcut-temp-disable ()
  "Temporarily disable shortcut mode while we're in the minibuffer"
  (if (eq shortcut-mode t)
      (progn
	(global-shortcut-off)
	(setq shortcut-reenable-after-minibuffer t))))

(defun shortcut-reenable ()
  "Re-enable Shortcut mode if it was temporarily disabled."
  (if (eq shortcut-reenable-after-minibuffer t)
      (progn
	(global-shortcut-on))))

;; disable when we're in the minibuffer
(add-hook 'minibuffer-setup-hook 'shortcut-temp-disable)
(add-hook 'minibuffer-exit-hook 'shortcut-reenable)

(defun shortcut-visual-on ()
  (global-hl-line-mode 1)
  
  (custom-set-faces
   '(mode-line ((t (:inverse-video t))))
   )
)

(defun shortcut-visual-off ()
  (global-hl-line-mode -1)

  (custom-set-faces
   '(mode-line ((t (:background "black"))))
   )
)

(defun on-shortcut-mode ()
  "Handle changing state of Shortcut mode."
  (interactive)
  (if (eq shortcut-mode t)
      (shortcut-visual-on)
    (shortcut-visual-off)))

(add-hook 'shortcut-mode-hook 'on-shortcut-mode)

(global-set-key (kbd "C-f") 'global-shortcut-on)

;; enter shortcut mode when mark is activated
(add-hook 'activate-mark-hook 'global-shortcut-on)

;; on globally by default
(global-shortcut-mode 1)
(shortcut-mode 1)

(provide 'init-shortcuts)
