;;;;
;; svn integration

;; custom shell-command function,
;; which handles colors
(defun my-shell-execute(cmd)
   (interactive "sShell command: ")
   (shell (get-buffer-create "my-shell-buf"))
   (process-send-string (get-buffer-process "my-shell-buf") (concat cmd "\n")))

(defun svndiff ()
  "diff the current buffer with subversion"
  (interactive)
  (let
	  ((fn (buffer-file-name)))
	(if (and fn (my-shell-execute (format "svn diff %s" fn)))
		(switch-to-buffer-other-window "*svn-diff*"))))

(provide 'init-svn)