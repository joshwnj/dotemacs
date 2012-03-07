;;;;
;; searching

(setq grep-find-command 
  "find . -type f -exec grep -nH --exclude=\"*\.svn*\" -e   {} /dev/null \\;")

(provide 'init-search)