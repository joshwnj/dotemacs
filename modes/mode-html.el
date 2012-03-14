;;;;
;; html editing

(setq auto-mode-alist
	  (append '(("\\.html$" . html-mode)
                ("\\.htm$" . html-mode)
                ("\\.tpl$" . html-mode)
                ("\\.phtml$" . html-mode)
                ) auto-mode-alist))

;; disable the magic list (so we don't get html-helper-mode)
(setq magic-mode-alist ())

;; indenting
(defun indent-region-as (other-mode)
  "Indent selected region as some other mode.  Used in order to indent source code contained within HTML."
  (interactive "aMode to use: ")

  (save-excursion
    (let ((old-mode major-mode))
      (narrow-to-region (region-beginning) (region-end))
      (funcall other-mode)
      (indent-region (region-beginning) (region-end) nil)
      (funcall old-mode)))
  (widen))

(provide 'mode-html)