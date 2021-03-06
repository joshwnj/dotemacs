;; shorty.el
;;
;; custom shortcuts for modal editing

;; todo
;;
;; - `3 r l`: mark 3 whole lines
;; - per-major-mode keymaps

(require 'shorty-submode)

(defun quick-edit (text)
  "Insert some text (or replace, if there is an active region)"
  (interactive "sEdit:")
  (when (region-active-p) (kill-region (region-beginning) (region-end)))
  (insert text)
  (activate-region))

(defvar shorty-reenable-after-minibuffer nil
  "Tell whether to reenable shorty-mode after exiting minibuffer.")

(defvar shorty-mode-map
  (let ((map (make-sparse-keymap)))
    ;; suppress all printing characters
    (suppress-keymap map)
    map))


(defvar hl-underline-on 0
  "Tell whether to use an underline or a background for hl-line")

(defun toggle-hl-underline ()
  (interactive)
  (if (eq hl-underline-on 1)
    (progn
      (setq hl-underline-on 0)
      (message "hl underline off")
      (custom-set-faces
        '(hl-line ((t (:background "black"))))))
    (progn
      (setq hl-underline-on 1)
      (message "hl underline on")
      (custom-set-faces
        '(hl-line ((t (:underline t))))))
    ))

(defun shorty-define-keys (map)
  ;; exit shorty-mode
  (define-key map (kbd "C-@") 'global-shorty-off)

  ;; numbers
  (define-key map (kbd "+") 'shift-number-up)
  (define-key map (kbd "_") 'shift-number-down)

  ;; buffers
  (define-key map (kbd "b b") 'my-switch-buffer)
  (define-key map (kbd "b k") 'kill-this-buffer)
  (define-key map (kbd "b s") 'save-buffer)
  (define-key map (kbd "b o") 'switch-to-other-buffer)
  (define-key map (kbd "b r") 'revert-buffer)

  ;; bookmarks
  (define-key map (kbd "b m") 'bookmark-set)
  (define-key map (kbd "b j") 'bookmark-jump)

  ;; clipboard
  (define-key map (kbd "c c") 'kill-ring-save)
  (define-key map (kbd "c x") 'kill-region)
  (define-key map (kbd "c y") 'yank)

  ;; clipboard (osx)
  (define-key map (kbd "c o c") 'osx-copy)
  (define-key map (kbd "c o v") 'simpleclip-paste)
  (define-key map (kbd "c v") 'simpleclip-paste)
  (define-key map (kbd "c o d") 'osx-get-cwd)
  (define-key map (kbd "c o b") 'osx-get-file-basename)
  (define-key map (kbd "c o p") 'osx-get-file-path)
  (define-key map (kbd "c o r") 'osx-get-region-ref)

  ;; dired
  (define-key map (kbd "d d") 'dired-jump)
  (define-key map (kbd "d o") 'dired-jump-other-window)

  ;; edit-mode
  (define-key map (kbd "e") 'quick-edit)

  ;; file
  (define-key map (kbd "f c") 'create-new-file)
  (define-key map (kbd "f f") 'my-find-file)
  (define-key map (kbd "f g") 'ag)
  (define-key map (kbd "f r") 'ido-recentf-open)
  (define-key map (kbd "f p") 'find-file-at-point)

  ;; magit
  (define-key map (kbd "g i s") 'magit-status)
  (define-key map (kbd "g i l") 'magit-log)

  ;; line
  (define-key map (kbd "g a") 'beginning-of-buffer)
  (define-key map (kbd "g e") 'end-of-buffer)
  (define-key map (kbd "g l") 'goto-line)

  (define-key map (kbd "g .") 'next-error)
  (define-key map (kbd "g ,") 'previous-error)
  (define-key map (kbd "g m") 'forward-mark)
  (define-key map (kbd "g n") 'backward-mark)

  ;; hide/show
  (define-key map (kbd "h l") 'linum-mode)
  (define-key map (kbd "h u") 'toggle-hl-underline)
  (define-key map (kbd "h w") 'whitespace-mode)
  (define-key map (kbd "h m") 'mode-line-terse)
  (define-key map (kbd "h n") 'mode-line-verbose)

  ;; submodes
  (define-key map (kbd "i i") 'shorty-indent)
  (define-key map (kbd "w w") 'shorty-window)
  (define-key map (kbd "[") 'shorty-submode-backward)
  (define-key map (kbd "]") 'shorty-submode-forward)

  ;; indentation
  (define-key map (kbd "i o") 'indent-for-tab-command)
  (define-key map (kbd "i ]") 'indent-rigidly)
  (define-key map (kbd "i [") 'un-indent-rigidly)

  ;; projectile
  (define-key map (kbd "p g") 'projectile-ag)
  (define-key map (kbd "p f") 'projectile-find-file)
  (define-key map (kbd "p d") 'projectile-find-dir)
  (define-key map (kbd "p p") 'projectile-switch-project)
  (define-key map (kbd "p b") 'projectile-ibuffer)
  (define-key map (kbd "p k") 'projectile-kill-buffers)

  ;; region
  (define-key map (kbd "r r") 'activate-region)
  (define-key map (kbd "r x") 'exchange-point-and-mark)
  (define-key map (kbd "r p") 'mark-paragraph)
  (define-key map (kbd "r d") 'mark-defun)
  (define-key map (kbd "r w") 'mark-word)
  (define-key map (kbd "r s") 'mark-sexp)
  (define-key map (kbd "r e") 'mark-enclosing-list)
  (define-key map (kbd "r l") 'mark-whole-line)
  (define-key map (kbd "r b") 'mark-whole-buffer)

  ;; search within a buffer
  (define-key map (kbd "s o") 'occur)

  ;; shell (terminal)
  (define-key map (kbd "t o") 'bshell-switch)
  (define-key map (kbd "t l") 'bshell-list)
  (define-key map (kbd "t r") 'bshell-rename)
  (define-key map (kbd "t n") 'bshell-new)
  (define-key map (kbd "t t") (lambda ()
                                (interactive)
                                (let ((current-prefix-arg 4))
                                  (call-interactively 'bshell-switch))))

  ;; visual mark
  (define-key map (kbd "v") 'set-mark-command)
  (define-key map (kbd "C-v") 'set-mark-command)

  ;; window navigation
  (define-key map (kbd "w [") 'winner-undo)
  (define-key map (kbd "w ]") 'winner-redo)
  (define-key map (kbd "w o") 'other-window)
  (define-key map (kbd "w 1") 'delete-other-windows)
  (define-key map (kbd "w 2") 'split-window-below)
  (define-key map (kbd "w 3") 'split-window-right)
  (define-key map (kbd "w 0") 'delete-window)
  (define-key map (kbd "w e h") 'rotate:even-horizontal)
  (define-key map (kbd "w e v") 'rotate:even-vertical)
  (define-key map (kbd "w m h") 'rotate:main-horizontal)
  (define-key map (kbd "w m v") 'rotate:main-vertical)
  (define-key map (kbd "w l") 'rotate-layout)
  (define-key map (kbd "w r") 'rotate-window)
  (define-key map (kbd "w b") 'balance-windows)
  (define-key map (kbd "w h") 'resize-window-h)
  (define-key map (kbd "w v") 'resize-window-v)

  ;; misc commands
  (define-key map (kbd "x x") 'smex)
  (define-key map (kbd "x e b") 'eval-buffer)
  (define-key map (kbd "x e s") 'eval-last-sexp)
  (define-key map (kbd "x i d") 'insert-date)
  (define-key map (kbd "x f c") 'flycheck-mode)

  ;; modes
  (define-key map (kbd "x m c") 'css-mode)
  (define-key map (kbd "x m e") 'emacs-lisp-mode)
  (define-key map (kbd "x m h") 'sgml-mode)
  (define-key map (kbd "x m j") 'js-mode)
  (define-key map (kbd "x m m") 'markdown-mode)
  (define-key map (kbd "x m w") 'web-mode)
  (define-key map (kbd "x m f") 'flow-mode)

  ;; comments
  (define-key map (kbd ";") (lambda (from to)
                              (interactive "r")
                              (comment-or-uncomment-region from to)
                              (setq deactivate-mark nil)
                              )))

(defun shorty-reload-keys ()
  (interactive)
  (shorty-define-keys shorty-mode-map))

(define-minor-mode shorty-mode
  "Toggle shorty-mode."
  'shorty-mode-map
  :init-value nil
  :lighter " SHORTY"
  :global t)

(defun shorty-on ()
  "Turn on shorty-mode."
  (interactive)

  (when (not (memq major-mode
               (list 'dired-mode 'package-menu-mode 'magit-status-mode)))
    (shorty-mode 1)))

(define-globalized-minor-mode global-shorty-mode shorty-mode shorty-on)

(defun global-shorty-on ()
  "Turn on Global shorty-mode."
  (interactive)
  (if (eq (active-minibuffer-window) nil)
      (global-shorty-mode 1)))

(defun global-shorty-off ()
  "Turn off Global shorty-mode."
  (interactive)
  (global-shorty-mode -1)
  (setq shorty-reenable-after-minibuffer nil))

(defun shorty-temp-disable ()
  "Temporarily disable shorty-mode while we're in the minibuffer"
  (if (eq shorty-mode t)
      (progn
        (global-shorty-off)
        (setq shorty-reenable-after-minibuffer t))))

(defun shorty-reenable ()
  "Re-enable shorty-mode if it was temporarily disabled."
  (if (eq shorty-reenable-after-minibuffer t)
      (progn
        (global-shorty-mode 1))))

;; disable when we're in the minibuffer
(add-hook 'minibuffer-setup-hook 'shorty-temp-disable)
(add-hook 'minibuffer-exit-hook 'shorty-reenable)

(defun shorty-visual-on ()
  (global-hl-line-mode 1)
)

(defun shorty-visual-off ()
  (global-hl-line-mode -1)
)

(defun handle-shorty-mode-change ()
  "Handle changing state of shorty-mode."
  (interactive)
  (if (eq shorty-mode t)
      (shorty-visual-on)
    (shorty-visual-off)))

(add-hook 'shorty-mode-hook 'handle-shorty-mode-change)

(global-set-key (kbd "C-@") 'global-shorty-on)

;; reload keys once to start
(shorty-reload-keys)

(provide 'init-shorty)
