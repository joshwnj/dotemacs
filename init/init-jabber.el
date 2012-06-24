(require 'jabber-autoloads)

(setq jabber-account-list
      '(("josh@x-team.com" 
         (:network-server . "talk.google.com")
         (:connection-type . ssl))))

(provide 'init-jabber)
