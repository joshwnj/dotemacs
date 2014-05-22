;; turn line numbers off by default
(global-linum-mode -1)
(setq linum-format " %2d ")

;;;;
;; thanks to @magnars for help here

(defun goto-line-with-feedback (&optional line)
  "Show line numbers temporarily, while prompting for the line number input"
  (interactive "P")
  (if line
      (goto-line line)
    (unwind-protect
        (progn
          (linum-mode 1)
          (goto-line (read-number "Goto line: ")))
      (linum-mode -1))))

(global-set-key (kbd "C-l") 'goto-line-with-feedback)

;; replace all goto-line
(global-set-key (vector 'remap 'goto-line) 'goto-line-with-feedback)

(defun goto-relative-line-with-feedback (&optional delta)
  "Show relative line numbers temporarily, while prompting for the line number input"
  (interactive "P")
  (if delta
      (next-line delta)
    (unwind-protect
        (progn
          (relative-line-numbers-mode 1)
          (next-line (read-number "Relative line: ")))
      (relative-line-numbers-mode -1))))

(global-set-key (kbd "M-l") 'goto-relative-line-with-feedback)


;;;;
;; show column overlay

(defun jc/get-overlay-begin ()
  (line-beginning-position 2))

(defun jc/get-overlay-end ()
  (line-end-position 2))

(defun jc/cleanup ()
  "Remove any previously created column overlays"
  (remove-overlays (point-min) (point-max) 'name 'jc-overlay))

(defvar jc/charmap nil "Map of characters")
(setq jc/charmap
      (concat
       (number-sequence ?a ?z)
       (number-sequence ?A ?Z)
       (number-sequence 33 64)
       ))

(defvar jc/charmap-list nil "Map of characters in list form.")
(setq jc/charmap-list (string-to-list jc/charmap))

(defvar jc/charmap-len nil "Number of characters in the map.")
(setq jc/charmap-len (list-length jc/charmap-list))

(defface jc/overlay-face
  '((((class color)) (:foreground "black" :background "green"))
    (t (:bold t)))
  "Face for displaying overlay text")

(defun jc/make-overlay ()
  (let ((overlay (make-overlay (jc/get-overlay-begin) (jc/get-overlay-end))))
    (overlay-put overlay 'name 'jc-overlay)
    (overlay-put overlay 'display (concat jc/charmap))
    (overlay-put overlay 'face 'jc/overlay-face)
    ))

(defun jc/char-to-num (char)
  (interactive "cChar: ")
  (let ((result (member char jc/charmap-list)))
    (if (not (eq nil result))
	(- jc/charmap-len (list-length result)))))

(defun jc/goto-column ()
  "Show an overlay where each column is represented by a character."
  (interactive)
  (jc/cleanup)

  (unwind-protect
      (progn
	(jc/make-overlay)
	(move-to-column (jc/char-to-num (read-char "Column: "))))
    (jc/cleanup)))

(defun goto-line-and-column ()
  "Go to an exact location in the buffer specified by line number and column."
  (interactive)
  (goto-line-with-feedback)
  (jc/goto-column))

(global-set-key (kbd "C-c g") 'goto-line-and-column)

(provide 'init-linum)
