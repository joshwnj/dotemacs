; auto completion
;;;;;;;;;;;;;;;;;

;; use dabbrev for autocomplete suggestions
(require 'dabbrev)
(setq dabbrev-always-check-other-buffers t)
(setq dabbrev-abbrev-char-regexp "\\sw\\|\\s_")

(defun my-tab (&optional pre-arg)
  "If preceeding character is part of a word then dabbrev-expand,
else if right of non whitespace on line then tab-to-tab-stop or
indent-relative, else if last command was a tab or return then dedent
one step, else indent 'correctly'"
  (interactive "*P")
  (cond ((= (char-syntax (preceding-char)) ?w)
         (let ((case-fold-search t)) (dabbrev-expand pre-arg)))
        ((> (current-column) (current-indentation))
         (indent-relative))
        (t (indent-according-to-mode)))
  (setq this-command 'my-tab))

;; Load the default configuration
(add-to-list 'load-path "~/emacs_config/plugins/auto-complete")
(require 'auto-complete-config)

;; Use dictionaries by default
(add-to-list 'ac-dictionary-directories "~/emacs_config/plugins/auto-complete/dict")
(setq-default ac-sources (add-to-list 'ac-sources 'ac-source-dictionary))
(global-auto-complete-mode t)

;; Start auto-completion after 3 characters of a word
(setq ac-auto-start 3)

;; case sensitivity is important when finding matches
(setq ac-ignore-case nil)

;; turn off menu
(setq ac-auto-show-menu nil)

(provide 'init-autocomplete)
