;;;;
;; ido

(require 'ido)
(ido-mode 1)
(setq ido-enable-flex-matching t)

;; Display ido results vertically, rather than horizontally
(setq ido-decorations (quote ("\n-> " "" "\n   " "\n   ..." "[" "]" " [No match]" " [Matched]" " [Not readable]" " [Too big]" " [Confirm]")))
(defun ido-disable-line-truncation () (set (make-local-variable 'truncate-lines) nil))
(add-hook 'ido-minibuffer-setup-hook 'ido-disable-line-truncation)

;;;;
;; recent files

(recentf-mode 1)
(setq recentf-max-saved-items 50)

(global-set-key (kbd "C-x C-r") 'ido-recentf-open)

(defun ido-recentf-open ()
  "Use `ido-completing-read' to \\[find-file] a recent file"
  (interactive)
  (if (find-file (ido-completing-read "Find recent file: " recentf-list))
      (message "Opening file...")
    (message "Aborting")))

;;;;
;; dired

(defun my-dired ()
  "Open a dired in a split window"
  (interactive)
  (dired-other-window (file-name-directory (or load-file-name buffer-file-name))))

(global-set-key (kbd "C-c C-d") 'my-dired)

(add-hook 'dired-mode-hook
          (lambda ()
            (local-unset-key (kbd "f"))
            (define-key dired-mode-map (kbd "f f") 'dired-find-file)
            (define-key dired-mode-map (kbd "f g") 'grep-find)
            (define-key dired-mode-map (kbd "f a") 'ftf-find-file)
            ))

(setq dired-listing-switches "-Gahl")
(setq ls-lisp-use-insert-directory-program nil)
(require 'ls-lisp)

;;;;
;; find file at point

(global-set-key (kbd "C-c p") 'find-file-at-point)

;;;;
;; ibuffer

(add-hook 'ibuffer-mode-hook
          '(lambda ()
             ;; dont want to be prompted before killing buffers
             (setq ibuffer-expert t)

             ;; keep the ibuffer up to date
             (ibuffer-auto-mode 1)))

(global-set-key (kbd "C-c b") 'ibuffer)

;;;;
;; insert file name
;; source: http://www.emacswiki.org/emacs/InsertFileName

(defun my-insert-file-name (filename &optional args)
  "Insert name of file FILENAME into buffer after point.

  Prefixed with \\[universal-argument], expand the file name to
  its fully canocalized path.  See `expand-file-name'.

  Prefixed with \\[negative-argument], use relative path to file
  name from current directory, `default-directory'.  See
  `file-relative-name'.

  The default with no prefix is to insert the file name exactly as
  it appears in the minibuffer prompt."
  ;; Based on insert-file in Emacs -- ashawley 20080926
  (interactive "*fInsert file name: \nP")
  (cond ((eq '- args)
         (insert (file-relative-name filename)))
        ((not (null args))
         (insert (expand-file-name filename)))
        (t
         (insert filename))))

(global-set-key (kbd "C-c i") 'my-insert-file-name)

;;;;

(provide 'init-fs)
