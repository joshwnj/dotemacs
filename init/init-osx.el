(defun osx-copy (start end)
  "Copy the current region to the osx clipboard."
  (interactive "r")
  (unless (use-region-p)
    (error "No region to copy"))
  (let ((process-connection-type nil))
    (let (
          (proc (start-process "pbcopy" "*Messages*" "pbcopy"))
          (region-contents (filter-buffer-substring start end))
          )
      (process-send-string proc region-contents)
      (process-send-eof proc))))

(defun osx-get-cwd ()
  "Copy the current directory to osx clipboard."
  (interactive)
  (let ((process-connection-type nil))
    (let ((proc (start-process "pbcopy" "*Messages*" "pbcopy")))
      (process-send-string proc default-directory)
      (process-send-eof proc))))

(defun osx-get-file-basename ()
  "Copy the current file basename to the osx clipboard."
  (interactive)
  (let ((process-connection-type nil))
    (let ((proc (start-process "pbcopy" "*Messages*" "pbcopy")))
      (process-send-string proc (buffer-name))
      (process-send-eof proc))))

(defun osx-get-file-path ()
  "Copy the current file path to the osx clipboard."
  (interactive)
  (let ((process-connection-type nil))
    (let ((proc (start-process "pbcopy" "*Messages*" "pbcopy")))
      (process-send-string proc (buffer-file-name))
      (process-send-eof proc))))

(defun osx-get-region-ref (start end)
  "Copy the current region along with file name and line number to the osx clipboard."
  (interactive "r")
  (unless (use-region-p)
    (error "No region to copy"))
  (let ((process-connection-type nil))
    (let (
          (proc (start-process "pbcopy" "*Messages*" "pbcopy"))
          (region-contents (filter-buffer-substring start end))
          )
      (process-send-string proc (buffer-file-name))
      (process-send-string proc ":")
      (process-send-string proc (number-to-string (line-number-at-pos start)))
      (process-send-string proc "\n\n")
      (process-send-string proc region-contents)
      (process-send-eof proc))))

;; move files to trash instead of deleting permanently
(setq delete-by-moving-to-trash t)

(defun system-move-file-to-trash (file)
  "Use \"trash\" to move FILE to the system trash.
When using Homebrew, install it using \"brew install trash\"."
  (call-process (executable-find "trash")
                nil 0 nil
                file))

(provide 'init-osx)
