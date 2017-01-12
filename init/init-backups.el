;;;;
;; backups

;; source: http://snarfed.org/gnu_emacs_backup_files
;; Put autosave files (ie #foo#) and backup files (ie foo~) in ~/.emacs.d/.
(custom-set-variables
  '(auto-save-file-name-transforms '((".*" "~/.emacs_autosaves/\\1" t)))
  '(backup-directory-alist '((".*" . "~/.emacs_backups/"))))

;; create the dirs if necessary, since emacs won't
(make-directory "~/.emacs_autosaves/" t)
(make-directory "~/.emacs_backups/" t)

;; create the directory
(make-directory "~/.emacs_backups/" t)

(provide 'init-backups)
