(defvar php-tokens-mode-target-buffer nil)
(defun php-tokens-mode-find-occurrence ()
  (let ((pos (get-text-property (point) 'occur-target)))
    (when pos
      (unless (buffer-live-p (get-buffer php-tokens-mode-target-buffer))
        (error "Buffer for this occurrence was killed"))
      pos)))
(defun php-tokens-mode-goto-occurrence (&optional event)
  "Go to the occurrence the current line describes."
  (interactive (list last-nonmenu-event))
  (let ((pos
         (if (null event)
             ;; Actually `event-end' works correctly with a nil argument as
             ;; well, so we could dispense with this test, but let's not
             ;; rely on this undocumented behavior.
             (php-tokens-mode-find-occurrence)
           (with-current-buffer (window-buffer (posn-window (event-end event)))
             (save-excursion
               (goto-char (posn-point (event-end event)))
               (php-tokens-mode-find-occurrence)))))
        same-window-buffer-names
        same-window-regexps)
    (pop-to-buffer php-tokens-mode-target-buffer)
    (goto-line pos)))
(defun php-tokens-mode (buffer-name regexp)
  (pop-to-buffer buffer-name)
  (setq buffer-read-only nil)
  (let ((matchbeg 0)
        (origpt nil)
        (begpt nil)
        (contloop t)
        (endpt nil))
    (save-excursion
      (goto-char (point-min)) ;; begin searching in the buffer
      (while (and contloop (not (eobp)))
        (setq origpt (point))
        (if (setq endpt (re-search-forward regexp nil t))
            (add-text-properties (line-beginning-position) (line-end-position)
                                 (append
                                  `(mouse-face (highlight))
                                  `(occur-target ,(string-to-number (match-string 0)))))
          (setq contloop nil)))))
  (local-set-key '[return] 'php-tokens-mode-goto-occurrence)
  (local-set-key '[mouse-1] 'php-tokens-mode-goto-occurrence))
(defgroup php-tokens nil
  "Generates an overview of PHP tokens"
  :group 'convenience)
(defun php-tokens ()
  "Lists tokens for a PHP-buffer"
  (interactive)
  (let* ((source-buffername (buffer-name))
         (buffername "*php-tokens*")
         (contents (buffer-substring-no-properties (point-min) (point-max))))
    (when (get-buffer buffername)
      (kill-buffer buffername))
    (save-excursion
      (pop-to-buffer buffername)
      (with-temp-buffer
        (insert contents)
        (shell-command-on-region (point-min) (point-max)
                                 (format "php %s" (shell-quote-argument (expand-file-name "~/.emacs.d/scripts/tokens.php")))
                                 buffername nil))
      (setq php-tokens-mode-target-buffer source-buffername)
      (php-tokens-mode buffername "^\\([0-9]+\\)[ ]+"))))
(provide 'php-tokens)