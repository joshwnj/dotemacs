;; source: http://www.emacswiki.org/emacs/ChangeHook
(setq should-save-after-insert t)

(defun save-after-insert (begin end length)
  (let (command-key-vector)
    ;; Do the same kind of testing as in the before change function,
    ;; only here we look at the character after point, if it is
    ;; already a space, then don't do anything.
    (setq command-key-vector (this-command-keys-vector))
    (if (and should-save-after-insert (string= "self-insert-command" (symbol-name this-command)))
      (save-buffer))))

(defun save-on-change ()
  (interactive)
  (let ()
    (add-hook 'after-change-functions
      'save-after-insert
      nil
      t)))
