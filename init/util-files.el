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

(defun switch-to-other-buffer ()
  (interactive)
  (switch-to-buffer (other-buffer (current-buffer) 1)))

(provide 'util-files)
