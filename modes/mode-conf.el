;;;;
;; conf-mode

(add-to-list 'auto-mode-alist '("\\.htaccess$" . conf-mode))
(add-to-list 'auto-mode-alist '("\\Vagrantfile$" . conf-mode))

(provide 'mode-conf)