;; use ansi colors so we don't get junk characters in shell or compilation buffer

(add-hook 'shell-mode-hook
          'ansi-color-for-comint-mode-on)

(add-to-list 'comint-output-filter-functions 'ansi-color-process-output)

(require 'ansi-color)
(defun colorize-compilation-buffer ()
  (toggle-read-only)
  (ansi-color-apply-on-region compilation-filter-start (point))
  (toggle-read-only))
(add-hook 'compilation-filter-hook 'colorize-compilation-buffer)

;;;;

(provide 'init-shell)
