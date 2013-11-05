;;;;
;; ido

(require 'ido)
(ido-mode 1)
(setq ido-enable-flex-matching t)

;; ;; Display ido results vertically, rather than horizontally
(setq ido-decorations (quote ("\n-> " "" "\n   " "\n   ..." "[" "]" " [No match]" " [Matched]" " [Not readable]" " [Too big]" " [Confirm]")))
(defun ido-disable-line-truncation () (set (make-local-variable 'truncate-lines) nil))
(add-hook 'ido-minibuffer-setup-hook 'ido-disable-line-truncation)

;;;;
;; grep

(setq grep-find-command
      "find . -path '*/.svn' -prune -o -type f -print | xargs grep -I -n -e ")
(eval-after-load "grep"
  '(progn
     (add-to-list 'grep-find-ignored-files ".tmp")
     (add-to-list 'grep-find-ignored-directories ".svn")))
(grep-compute-defaults)

;;;;
;; recent files

(recentf-mode 1)
(setq recentf-max-saved-items 50)

;; (global-set-key (kbd "C-x C-r") 'ido-recentf-open)

(defun ido-recentf-open ()
  "Use `ido-completing-read' to \\[find-file] a recent file"
  (interactive)
  (if (find-file (ido-completing-read "Find recent file: " recentf-list))
      (message "Opening file...")
    (message "Aborting")))

;;;;

(provide 'init-fs)
