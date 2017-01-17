;;;;
;; color theme

(defun theme-256-color ()
  (interactive)
  (load-theme 'adwaita))

(defun theme-16-color ()
  (interactive)
  (disable-theme 'adwaita))

(provide 'init-theme)
