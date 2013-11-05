;; source: http://amitp.blogspot.com.au/2011/08/emacs-custom-mode-line.html

;; Mode line setup
(setq-default
 mode-line-format
 '(; Position, including warning for 80 columns
   (:propertize "%4l:" face mode-line-position-face)
   (:eval (propertize "%3c" 'face
                      (if (>= (current-column) 80)
                          'mode-line-80col-face
                        'mode-line-position-face)))

   (:propertize " %p " face font-lock-constant-face) ;; % above top

   ; read-only or modified status
   (:eval
    (cond (buffer-read-only
           (propertize " RO " 'face 'mode-line-read-only-face))
          ((buffer-modified-p)
           (propertize " ** " 'face 'mode-line-modified-face))
          (t "      ")))
   "    "
   ; directory and buffer/file name
   (:propertize (:eval (shorten-directory default-directory 30))
                face mode-line-folder-face)
   (:propertize "%b"
                face mode-line-filename-face)
   ; mode indicators: major mode, minor modes
   "  %["
   (:propertize mode-name
                face mode-line-mode-face)
   "%] "
   (:eval (propertize (format-mode-line minor-mode-alist)
                      'face 'mode-line-minor-mode-face))
   ))

;; Helper function
(defun shorten-directory (dir max-length)
  "Show up to `max-length' characters of a directory name `dir'."
  (let ((path (reverse (split-string (abbreviate-file-name dir) "/")))
        (output ""))
    (when (and path (equal "" (car path)))
      (setq path (cdr path)))
    (while (and path (< (length output) (- max-length 4)))
      (setq output (concat (car path) "/" output))
      (setq path (cdr path)))
    (when path
      (setq output (concat ".../" output)))
    output))

;; Extra mode line faces
(make-face 'mode-line-read-only-face)
(make-face 'mode-line-modified-face)
(make-face 'mode-line-folder-face)
(make-face 'mode-line-filename-face)
(make-face 'mode-line-position-face)
(make-face 'mode-line-mode-face)
(make-face 'mode-line-minor-mode-face)
(make-face 'mode-line-process-face)
(make-face 'mode-line-80col-face)

(set-face-attribute 'mode-line nil
    :foreground "white" :background "black"
    :inverse-video nil
    :box '(:line-width 6 :color "black" :style nil))

(set-face-attribute 'mode-line-inactive nil
    :foreground "white" :background nil
    :inverse-video nil
    :box '(:line-width 6 :color "black" :style nil))

(set-face-attribute 'mode-line-read-only-face nil
    :inherit 'mode-line-face
    :foreground "magenta"
    :box '(:line-width 2 :color "black"))

(set-face-attribute 'mode-line-modified-face nil
    :inherit 'mode-line-face
    :foreground "red"
    :background "white"
    :box '(:line-width 2 :color "white"))

(set-face-attribute 'mode-line-folder-face nil
    :inherit 'mode-line-face
    :foreground "white")

(set-face-attribute 'mode-line-filename-face nil
    :inherit 'mode-line-face
    :foreground "green"
    :weight 'bold)

(set-face-attribute 'mode-line-position-face nil
    :inherit 'mode-line-face)

(set-face-attribute 'mode-line-mode-face nil
    :inherit 'mode-line-face
    :foreground "white")

(set-face-attribute 'mode-line-minor-mode-face nil
    :inherit 'mode-line-mode-face
    :foreground "green")

(set-face-attribute 'mode-line-process-face nil
    :inherit 'mode-line-face
    :foreground "white")

(set-face-attribute 'mode-line-80col-face nil
    :inherit 'mode-line-position-face
    :foreground "white")

(provide 'init-modeline)
