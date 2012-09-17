;;;;
;; ido

(require 'ido)
(ido-mode 1)
(setq ido-enable-flex-matching t)

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

(setq dired-listing-switches "-Gahl")

;;;;
;; find file at point

(global-set-key (kbd "C-c p") 'find-file-at-point)

;;;;
;; buffers

(global-set-key (kbd "C-c [") 'previous-buffer)
(global-set-key (kbd "C-c ]") 'next-buffer)
(global-set-key (kbd "C-x C-b") 'ido-switch-buffer)

;;;;
;; ibuffer

(add-hook 'ibuffer-mode-hook
          '(lambda ()
             ;; dont want to be prompted before killing buffers
             (setq ibuffer-expert t)

             ;; keep the ibuffer up to date
             (ibuffer-auto-mode 1)))


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
