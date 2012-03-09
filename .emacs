;;;;
;; Auto-Discover .el files

(add-to-list 'load-path "~/.emacs.d/plugins")
(add-to-list 'load-path "~/.emacs.d/init")
(add-to-list 'load-path "~/.emacs.d/modes")

;;;;;;;;;;;;;;;;
;; dependencies
;;;;;;;;;;;;;;;;

(require 'flymake)

;;;;;;;;;;;;;;;;
;; utils
;;;;;;;;;;;;;;;;

(require 'init-editing)
(require 'init-edit-lines)
(require 'init-nav-buffer)
(require 'init-nav-fs)
(require 'init-region)
(require 'init-search)
(require 'init-theme)
(require 'init-whitespace)
(require 'init-windows)

;;;;;;;;;;;;;;;;
;; modes
;;;;;;;;;;;;;;;;

(require 'mode-conf)
(require 'mode-markdown)
(require 'mode-js)
(require 'mode-json)
(require 'mode-php)
(require 'mode-html)
