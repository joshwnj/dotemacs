;;;;
;; backups

(custom-set-variables
  '(backup-directory-alist '((".*" . "~/.emacs_backups/"))))

;; create the directory
(make-directory "~/.emacs_backups/" t)

(provide 'init-backups)
