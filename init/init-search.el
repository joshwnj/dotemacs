;;;;
;; searching

(setq grep-find-command
      "export GREP_OPTIONS=\"--exclude=*.svn*\"; find . -type f -print0 | xargs -0 grep -nH --color -e ")

(global-set-key (kbd "C-c o") 'occur)
(global-set-key (kbd "C-c g") 'grep-find)
(global-set-key (kbd "C-s") 'isearch-forward)
(global-set-key (kbd "C-c ,") 'previous-error)
(global-set-key (kbd "C-c .") 'next-error)

(provide 'init-search)
