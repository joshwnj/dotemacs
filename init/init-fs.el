;;;;
;; dired

(setq dired-listing-switches "-alhgoG")

;;;;
;; buffers

(global-set-key (kbd "A-b") 'ibuffer)
(global-set-key (kbd "A-M-]") 'previous-buffer)
(global-set-key (kbd "A-M-[") 'next-buffer)

;;;;
;; ibuffer

(add-hook 'ibuffer-mode-hook
          '(lambda ()
             ;; dont want to be prompted before killing buffers
             (setq ibuffer-expert t)

             ;; keep the ibuffer up to date
             (ibuffer-auto-mode 1)))

(provide 'init-fs)