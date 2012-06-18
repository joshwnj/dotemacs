(add-to-list 'load-path "~/.emacs.d/plugins/yasnippet")

(require 'yasnippet)
(yas/initialize)
(setq yas/snippet-dirs '("~/.emacs.d/snippets"))

(require 'dropdown-list)
(setq yas/prompt-functions '(yas/dropdown-prompt))
(setq yas/trigger-key "TAB")

(provide 'init-snippets)
