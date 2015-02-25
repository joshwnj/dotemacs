(require 'erc)

;; This defines the password variables below
(when (file-exists-p "~/.private.el")
  (load-file "~/.private.el"))

(defun start-erc ()
  "Connect to IRC."
  (interactive)
  (erc :server "irc.freenode.net" :port 6667
       :nick freenode-nick :password freenode-password)
  (setq erc-autojoin-channels-alist freenode-channels))

;; speech notification for mentions
(defun erc-global-notify (match-type nick message)
  "Notify when a message is received."
  (async-shell-command (concat "say \"" message "\""))
)

;; ignore certain events
(setq erc-hide-list '("PART" "QUIT"))

;; colorize
(erc-colorize-mode 1)

(provide 'init-erc)
