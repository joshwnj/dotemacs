(defun erc-global-notify (match-type nick message)
  "Notify when a message is received."
  (async-shell-command (concat "say \"" message "\""))
)

(remove-hook 'erc-text-matched-hook 'erc-global-notify)
(add-hook 'erc-text-matched-hook 'erc-global-notify)
