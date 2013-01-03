;; initialize smex
(require 'smex)

(defun run-smex ()
  "Run the smex command."
  (interactive)
  (or (boundp 'smex-cache)
      (smex-initialize))
  (global-set-key (kbd "M-x") 'smex)
  (smex))

(defun run-smex-major-mode ()
  "Run the smex command using major mode commands."
  (interactive)
  (or (boundp 'smex-cache)
      (smex-initialize))
  (global-set-key (kbd "M-S-x") 'smex-major-mode-commands)
  (smex-major-mode-commands))

(global-set-key (kbd "M-x") 'run-smex-major-mode)
(global-set-key (kbd "C-z") 'run-smex)

;; ----

(provide 'init-smex)
