;;;;
;; misc global keybindings

;; alias C-g
(global-set-key (kbd "<A-backspace>") 'minibuffer-keyboard-quit)

;; alias M-x
(global-set-key (kbd "A-<return>") 'execute-extended-command)

(provide 'init-keys)