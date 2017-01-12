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

(provide 'init-datetime)
