;;;;;;;;;;;;;;;;;;;;;;;;
;; general emacs config
;;;;;;;;;;;;;;;;;;;;;;;;

(setq inhibit-startup-message t)
(fset 'yes-or-no-p 'y-or-n-p)

(add-to-list 'load-path "~/.emacs.d/plugins")
(add-to-list 'load-path "~/.emacs.d/init")

;;;;;;;;;;;;;;;;
;; appearance
;;;;;;;;;;;;;;;;

(require 'init-appearance)
(require 'init-modeline)
(require 'init-whitespace)

;;;;;;;;;;;;;;;;
;; editing
;;;;;;;;;;;;;;;;

(require 'init-autocomplete)
(require 'init-editing)
(require 'init-flymake)
(require 'init-flyspell)
(require 'init-modes)
(require 'init-snippets)

;; major modes
(require 'init-html)
(require 'init-php)
(require 'init-js)
(require 'init-json)
(require 'init-markdown)

;;;;;;;;;;;;;;;;
;; windows
;;;;;;;;;;;;;;;;

(require 'init-windows)

;;;;;;;;;;;;;;;;
;; regions
;;;;;;;;;;;;;;;;

(require 'init-region)

;;;;;;;;;;;;;;;;
;; navigating
;;;;;;;;;;;;;;;;

(require 'init-linum)
(require 'init-nav)
(require 'init-search)

;;;;;;;;;;;;;;;;
;; filesystem
;;;;;;;;;;;;;;;;

(require 'init-fs)

;;;;;;;;;;;;;;;;
;; terminals
;;;;;;;;;;;;;;;;

(require 'init-term)

;;;;;;;;;;;;;;;;
;; misc
;;;;;;;;;;;;;;;;

(require 'init-jabber)
(require 'init-osx)
(require 'init-packages)
(require 'init-smex)
(require 'init-osx)