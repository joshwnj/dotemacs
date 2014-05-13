(defun osx-get-cwd ()
  "Copy the current directory to osx clipboard."
  (interactive)
  (let ((process-connection-type nil))
    (let ((proc (start-process "pbcopy" "*Messages*" "pbcopy")))
      (process-send-string proc default-directory)
      (process-send-eof proc))))

(provide 'init-osx)
