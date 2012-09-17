(defun osx-pbcopy (start end)
  "Copy data to osx clipboard."
  (interactive "r")
  (shell-command-on-region start end "pbcopy"))

(defun osx-pbpaste ()
  "Paste data from osx clipboard."
  (interactive)
  (shell-command-on-region
   (point)
   (if mark-active (mark) (point))
   "pbpaste" nil t))

(defun osx-get-cwd ()
  "Copy the current directory to osx clipboard."
  (interactive)
  (let ((process-connection-type nil))
    (let ((proc (start-process "pbcopy" "*Messages*" "pbcopy")))
      (process-send-string proc default-directory)
      (process-send-eof proc))))

(global-set-key (kbd "C-c c") 'osx-pbcopy)
(global-set-key (kbd "C-c C-c") 'osx-pbcopy)

(global-set-key (kbd "C-c v") 'osx-pbpaste)
(global-set-key (kbd "C-c C-v") 'osx-pbpaste)

(global-set-key (kbd "C-c d") 'osx-get-cwd)
(global-set-key (kbd "C-c C-d") 'osx-get-cwd)

(provide 'init-osx)
