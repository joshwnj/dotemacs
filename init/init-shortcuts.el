
;; ----
;; TODO: move these elsewhere

;; (defvar nav-by/type "line"
;;   "Type of navigation")

;; (defvar nav-by/amount 1
;;   "Amount to move by (only applies to line movement at the moment)")

;; (defvar nav-by/next-func 'next-line
;;   "Function to call for forward movement")

;; (defvar nav-by/prev-func 'previous-line
;;   "Function to call for backward movement")

;; ;; wrappers around line movement functions, so we can set the amount
;; (defun nav-by/next-line ()
;;   (next-line nav-by/amount))

;; (defun nav-by/previous-line ()
;;   (previous-line nav-by/amount))

;; (defun nav-by/set-type (amount)
;;   (interactive "p")
;;   (setq nav-by/amount amount)
;;   (let ((type (ido-completing-read "Nav by: " (list "line" "paragraph" "error" "mark" "search"))))
;;     (nav-by/set-type-2 type)))

;; (defun nav-by/set-type-2 (type)
;;   (cond

;;     ((equal type "line")
;;       (progn
;;         (setq nav-by/next-func 'nav-by/next-line)
;;         (setq nav-by/prev-func 'nav-by/previous-line)))

;;     ((equal type "paragraph")
;;       (progn
;;         (setq nav-by/next-func 'forward-paragraph)
;;         (setq nav-by/prev-func 'backward-paragraph)))

;;     ((equal type "error")
;;       (progn
;;         (setq nav-by/next-func 'next-error)
;;         (setq nav-by/prev-func 'previous-error)))

;;     ((equal type "mark")
;;       (progn
;;         (setq nav-by/next-func 'forward-mark)
;;         (setq nav-by/prev-func 'backward-mark)))

;;     ((equal type "search")
;;       (progn
;;         (setq nav-by/next-func 'isearch-repeat-forward)
;;         (setq nav-by/prev-func 'isearch-repeat-backward)))

;;     (t (message "Unknown type: %s" type))))

;; (defun nav-by/move (func amount)
;;   (setq nav-by/amount
;;     (cond
;;       ;; 0: reset
;;       ((equal 0 amount) 1)
;;       ;; 1: no change
;;       ((equal 1 amount) nav-by/amount)
;;       ;; default: set value
;;       (t amount)))
;;   (funcall func))

;; (defun nav-by/next (amount)
;;   (interactive "p")
;;   (nav-by/move nav-by/next-func amount))

;; (defun nav-by/prev (amount)
;;   (interactive "p")
;;   (nav-by/move nav-by/prev-func amount))

;; ;; when you do a search, automatically choose "nav by search"
;; (defun nav-by/on-isearch ()
;;   "Run when isearch mode starts"
;;   (interactive)
;;   (nav-by/set-type-2 "search"))

;; (add-hook 'isearch-mode-hook 'nav-by/on-isearch)

;; ;; when you get a compilation buffer, automatically choose "nav by error" (for things like grep, lint, etc)
;; (defun nav-by/on-compilation-buffer ()
;;   "Run when we get a new compilation buffer"
;;   (interactive)
;;   (nav-by/set-type-2 "error"))

;; (add-hook 'compilation-filter-hook 'nav-by/on-compilation-buffer)

;; (global-set-key (kbd "C-c .") 'nav-by/next)
;; (global-set-key (kbd "C-c ,") 'nav-by/prev)

;; ----

(defun make-line-numbers-green ()
  "Make line numbers green"
  (interactive)
  (set-face-foreground 'linum "green"))

(defun make-line-numbers-black ()
  "Make line numbers black"
  (interactive)
  (set-face-foreground 'linum "black"))

(defun insert-timestamp ()
  "Insert a timestamp"
  (interactive)
  (shell-command "node -e 'process.stdout.write(Date.now().toString())'" t))

(defun node-date ()
  "Get the current date from a node process"
  (shell-command-to-string "node -e 'process.stdout.write(new Date().toString())'"))

(defun insert-date ()
  "Insert the current date"
  (interactive)
  (insert (node-date)))

(defun journal-send-to-slack ()
  "Copy the current directory to osx clipboard."
  (interactive)
  (shell-command-on-region (region-beginning) (region-end) "jr-slack"))

(defun journal-new (heading)
  "Write a new journal entry"
  (interactive "sHeading:")
  (compile (concat "jr -h '" heading "' --noeditor")))

(defun jr-work-note (heading)
  "Write a new journal work note"
  (interactive "sHeading:")
  (compile (concat "jr2 -d ~/journals/work/src/notes/ -h '" heading "' --noeditor")))

(use-package change-inner
  :init
  (progn
    (global-set-key (kbd "M-i") 'change-inner)
    (global-set-key (kbd "M-o") 'change-outer)))

(defun tape-test-current-file ()
  "Run `tape` on the current file"
  (interactive)
  (compile (concat "tape " (buffer-file-name))))

(defun tape-test-all ()
  "Run `tape` on file in the current directory"
  (interactive)
  (compile "tape *"))


(defun un-indent-rigidly (start end arg)
  (interactive "r\np")
  (indent-rigidly start end (* -1 arg)))

(defun mark-whole-line ()
  (interactive)
  (move-end-of-line nil)
  (set-mark-command nil)
  (move-beginning-of-line nil))

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

(defun dired-jump-other ()
  (interactive)
  (dired-jump 1))

(defvar shortcut-mode-map
  (let ((map (make-sparse-keymap)))
    ;; suppress all printing characters
    (suppress-keymap map)
    map))

(defun shortcut-define-keys (map)
  ;; exit shortcut mode
  (define-key map (kbd "C-@") 'global-shortcut-off)

  ;; single-key commands

  ;; visual mark
  (define-key map (kbd "v") 'set-mark-command)
  (define-key map (kbd "C-v") 'set-mark-command)

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
  (define-key map (kbd "c b") 'helm-show-kill-ring)
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

  ;; comments
  (define-key map (kbd ";") 'comment-or-uncomment-region)

  ;; directory
  (define-key map (kbd "d d") 'dired)
  (define-key map (kbd "d j") 'dired-jump)
  (define-key map (kbd "d o") 'dired-jump-other)
  (define-key map (kbd "d s") 'shell-pop)

  ;; evaluating
  (define-key map (kbd "e b") 'eval-buffer)
  (define-key map (kbd "e r") 'eval-region)

  ;; file
  (define-key map (kbd "f a") 'ftf-find-file)
  (define-key map (kbd "f c") 'create-new-file)
  (define-key map (kbd "f f") 'my-find-file)
  (define-key map (kbd "f g") 'ag)
  (define-key map (kbd "f r") 'ido-recentf-open)
  (define-key map (kbd "f p") 'find-file-at-point)

  ;; go (navigate to a point in a buffer)
  (define-key map (kbd "g a") 'beginning-of-buffer)
  (define-key map (kbd "g e") 'end-of-buffer)
  (define-key map (kbd "g f") 'jump-char-forward)
  (define-key map (kbd "g r") 'jump-char-backward)

  (define-key map (kbd "g .") 'next-error)
  (define-key map (kbd "g ,") 'previous-error)
  (define-key map (kbd "g m") 'forward-mark)
  (define-key map (kbd "g n") 'backward-mark)

  (define-key map (kbd "g ;") 'goto-last-change)
  (define-key map (kbd "g '") (lambda () (interactive)(goto-last-change -1)))

  (define-key map (kbd "g j") 'dumb-jump-go)
  (define-key map (kbd "g k") 'dumb-jump-back)
  (define-key map (kbd "g q") 'dumb-jump-quick-look)
  
  ;; (define-key map (kbd "g SPC l") (lambda () (interactive)(nav-by/set-type-2 "line")))
  ;; (define-key map (kbd "g /") 'nav-by/set-type)

  ;; git (magit)
  (define-key map (kbd "g i l") 'magit-log)
  (define-key map (kbd "g i s") 'magit-status)

  ;; highlight
  (define-key map (kbd "h h") 'hl-highlight-thingatpt-local)
  (define-key map (kbd "h g") 'hl-highlight-thingatpt-global)
  (define-key map (kbd "h u") 'hl-unhighlight-all-local)
  (define-key map (kbd "h p") 'hl-paren-mode)
  (define-key map (kbd "h .") 'hl-find-thing-forwardly)
  (define-key map (kbd "h ,") 'hl-find-thing-backwardly)

  ;; kill
  (define-key map (kbd "k f") 'fastnav-zap-to-char-forward)
  (define-key map (kbd "k r") 'fastnav-zap-to-char-backward)
  (define-key map (kbd "k l") 'kill-whole-line)
  (define-key map (kbd "k w") 'kill-word)
  (define-key map (kbd "k z") 'zap-to-char)

  (define-key map (kbd "k i") (lambda (arg)
                                (interactive "p")
                                (progn
                                  (change-inner arg)
                                  (shortcut-mode -1)
                                  )))
  (define-key map (kbd "k o") 'change-outer)

  ;; line
  ;(define-key map (kbd "l SPC") 'mark-whole-line)
  (define-key map (kbd "l k") 'kill-whole-line)
  (define-key map (kbd "l j") 'join-line)
  (define-key map (kbd "l d") 'duplicate-thing)

  ;; modes
  (define-key map (kbd "m c") 'css-mode)
  (define-key map (kbd "m e") 'emacs-lisp-mode)
  (define-key map (kbd "m h") 'html-mode)
  (define-key map (kbd "m j") 'js-mode)
  (define-key map (kbd "m m") 'markdown-mode)
  (define-key map (kbd "m o") 'org-mode)
  (define-key map (kbd "m p") 'php-mode)
  (define-key map (kbd "m w") 'web-mode)

  ;; convert case
  (define-key map (kbd "o u") 'convert-case/upper-camel)
  (define-key map (kbd "o -") 'convert-case/dash)
  (define-key map (kbd "o =") 'convert-case/underscore)
  (define-key map (kbd "o o") 'camelscore-word-at-point)

  ;; projectile
  (define-key map (kbd "p a") 'projectile-ag)
  (define-key map (kbd "p g") 'projectile-grep)
  (define-key map (kbd "p f") 'projectile-find-file)
  (define-key map (kbd "p d") 'projectile-find-dir)
  (define-key map (kbd "p s") 'projectile-switch-project)
  (define-key map (kbd "p b") 'projectile-ibuffer)
  (define-key map (kbd "p k") 'projectile-kill-buffers)

  ;; run
  (define-key map (kbd "r t") 'tape-test-current-file)
  (define-key map (kbd "r a") 'tape-test-all)

  ;; region / mark
  (define-key map (kbd "=") 'er/expand-region)
  (define-key map (kbd "-") 'er/contract-region)
  (define-key map (kbd "r x") 'exchange-point-and-mark)
  ;(define-key map (kbd "l SPC") 'mark-whole-line)
  ;(define-key map (kbd "b SPC") 'mark-whole-buffer)
  ;(define-key map (kbd "u SPC") 'pop-to-mark-command)

  ;; search
  (define-key map (kbd "s b") 'isearch-backward)
  (define-key map (kbd "s f") 'isearch-forward)
  (define-key map (kbd "s o") 'occur)
  (define-key map (kbd "s s") 'swiper)
  (define-key map (kbd "s .") 'isearch-repeat-forward)
  (define-key map (kbd "s ,") 'isearch-repeat-backward)

  ;; tabs, indentation and whitespace
  (define-key map (kbd "i c") 'whitespace-cleanup-region)
  (define-key map (kbd "i t") 'tabify)
  (define-key map (kbd "i u") 'untabify)
  (define-key map (kbd "i i") 'indent-region)
  (define-key map (kbd "i ]") 'indent-rigidly)
  (define-key map (kbd "i [") 'un-indent-rigidly)

  ;; move text
  (define-key map (kbd "r h") 'shift-text-left)
  (define-key map (kbd "r l") 'shift-text-right)
  (define-key map (kbd "r j") 'shift-text-down)
  (define-key map (kbd "r k") 'shift-text-up)

  ;; journal
  (define-key map (kbd "j s") 'journal-send-to-slack)
  (define-key map (kbd "j r") 'journal-new)
  (define-key map (kbd "j t") 'insert-timestamp)
  (define-key map (kbd "j d") 'insert-date)

  ;; undo
  (define-key map (kbd "u h") 'undo-tree-undo)
  (define-key map (kbd "u l") 'undo-tree-redo)
  (define-key map (kbd "u v") 'undo-tree-visualize)

  ;; ;; repeat
  ;; (define-key map (kbd ",") 'nav-by/prev)
  ;; (define-key map (kbd ".") 'nav-by/next)


  ;; visual flags
  ;; (define-key map (kbd "v l") 'linum-mode)
  ;; (define-key map (kbd "v m") 'show-marks)
  ;; (define-key map (kbd "v w") 'global-whitespace-mode)
  ;; (define-key map (kbd "v r") 'relative-line-numbers-mode)
  ;; (define-key map (kbd "v s") 'global-yascroll-bar-mode)

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
  (define-key map (kbd "w r") 'rotate-window)
  (define-key map (kbd "w e v") 'rotate:even-vertical)
  (define-key map (kbd "w e h") 'rotate:even-horizontal)
  (define-key map (kbd "w m v") 'rotate:main-vertical)
  (define-key map (kbd "w m h") 'rotate:main-horizontal)

  ;; line numbers
  (define-key map (kbd "l l") 'goto-line-with-feedback)

  (define-key map (kbd "l g") 'make-line-numbers-green)
  (define-key map (kbd "l b") 'make-line-numbers-black)
  (define-key map (kbd "l ;") 'linum-mode)
  (define-key map (kbd "l r") 'relative-line-numbers-mode)

  (define-key map (kbd "x h") 'helm-M-x)
  (define-key map (kbd "x x") 'smex)

  (define-key map (kbd "( (") 'corral-parentheses-forward)
  (define-key map (kbd "{ {") 'corral-braces-forward)
  (define-key map (kbd "[ [") 'corral-brackets-forward)

  (define-key map (kbd "n n") 'send-region-or-line-to-nodejs-repl-process)
  (define-key map (kbd "n b") 'nodejs-repl-send-buffer)
  (define-key map (kbd "n c") 'comint-clear-buffer)
  (define-key map (kbd "n s") 'nodejs-repl-switch-to-repl)
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
   '(mode-line ((t (:inverse-video nil :background "black" :foreground "white"))))
   )
)

(defun on-shortcut-mode ()
  "Handle changing state of Shortcut mode."
  (interactive)
  (if (eq shortcut-mode t)
      (shortcut-visual-on)
    (shortcut-visual-off)))

(add-hook 'shortcut-mode-hook 'on-shortcut-mode)

(global-set-key (kbd "C-@") 'global-shortcut-on)

;; enter shortcut mode when mark is activated
(add-hook 'activate-mark-hook 'global-shortcut-on)

;; on globally by default
(global-shortcut-mode 1)
(shortcut-mode 1)

(provide 'init-shortcuts)
