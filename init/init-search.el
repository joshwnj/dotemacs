;;;;
;; searching

(setq grep-find-command
      "export GREP_OPTIONS=\"--exclude=*.svn*\"; find . -type f -print0 | xargs -0 grep -nH --color -e ")

;; colors for occur-mode
(require 'color-occur)

(global-set-key (kbd "M-f") 'search-forward-regexp)
(global-set-key (kbd "M-F") 'search-backward-regexp)
(global-set-key (kbd "M-A-f") 'occur)
(global-set-key (kbd "M-A-g") 'grep-find)
(global-set-key (kbd "M-A-,") 'previous-error)
(global-set-key (kbd "M-A-.") 'next-error)


(provide 'init-search)