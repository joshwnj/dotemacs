(require 'popup)

(defvar shorty-submode nil
  "Submode")

(defvar shorty-submode-amount 1
  "Persistent prefix for submode actions")

(defun shorty-submode-forward (amount)
  (interactive "p")
  (cond
   ((equal shorty-submode "indent")
    (indent-rigidly (region-beginning) (region-end) shorty-submode-amount))
   ((equal shorty-submode "error")
    (next-error))
   ((equal shorty-submode "window")
    (let ((command 'winner-redo))
      (setq this-command command)
      (call-interactively command)))))

 (defun shorty-submode-backward (amount)
  (interactive "p")
  (cond
   ((equal shorty-submode "indent")
    (indent-rigidly (region-beginning) (region-end) (* -1 shorty-submode-amount)))
   ((equal shorty-submode "error")
    (previous-error))
   ((equal shorty-submode "window")
    (let ((command 'winner-undo))
      (setq this-command command)
      (call-interactively command)))))

 (defun shorty-indent (amount)
  "Sub-mode for indentation"
  (interactive "p")

  (popup-tip (concat "\n indent [" (number-to-string amount) "] \n") :nowait)
  (setq shorty-submode-amount amount)
  (setq shorty-submode "indent"))

(defun shorty-window ()
  "Sub-mode for window nav"
  (interactive)

  (popup-tip "\n window \n" :nowait)
  (setq shorty-submode "window"))

(defun shorty-error ()
  "Sub-mode for error nav"
  (interactive)

  (if (not (equal shorty-submode "error"))
    (popup-tip "\n compilation \n" :nowait))
  (setq shorty-submode "error"))

;; when you get a compilation buffer, automatically choose shorty-error submode (for things like grep, lint, etc)
(defun shorty-on-compilation-buffer ()
  "Run when we get a new compilation buffer"
  (interactive)
  (shorty-error))

(add-hook 'compilation-filter-hook 'shorty-on-compilation-buffer)

(provide 'shorty-submode)
