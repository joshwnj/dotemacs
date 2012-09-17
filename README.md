# Emacs config

Optimized for emacs 24 in iTerm2.

I was previously using Aquamacs as well, and it should be mostly compatible.  See **Using with Aquamacs** below for more info.

## Wish List

 * when doing an i-search
  * RET moves point to end of match, M-RET moves point to start of match

 * NPM package.json mode
  * create from skeleton
  * run `npm install`
  * add dependency
  * search the npm registry

 * instantly create a new window with a terminal for the current working directory

 * manual lookup for:
  * php
  * node

 * jump to column
 
 * fill region with character

 * quick browsing around:
  * step into block
  * step over block
  * forward/backward word
  

 * whenever the line changes by more than 1 line, activate hl-line for a couple of seconds

 * every time you split a window, assign it a number and show this in the modeline. then make a shortcut for fast switching to window by id.

 * learn keys for scrolling the buffer without moving the point.

 * jump from ansi-term to dired (or file) of the same cwd

 * diff of changes since last save
  * highlight additions in green
  * keyboard shortcuts to move to next/prev change
  * allow reverting specific changes

 * predefined window configurations

 * live preview in a browser while editing markdown
 
 * json mode
  * flymake
  * json-path
  * multi-select based on json-path

 * auto-indent the region when you yank

 * php mode
  * fix indentation rules (sometimes buggy with arrays)
  * look into sgrep <https://github.com/facebook/pfff/wiki/Sgrep>
  
 * svn
  * view status of a directory, and quick diffing
  
 * tailing a log file
  * font lock to highlight a timestamp
  * filtering / highlighting

 * html-mode: search by css-selector
  * could maybe do this with the php-tokens.el plugin, and a phpquery script

## Using with Aquamacs

This setup should be compatible with both terminal emacs (I'm using iTerm2) and Aquamacs.  To activate the aquamacs-only config, append this to your `~/Library/Preferences/Aquamacs\ Emacs/Preferences.el` file:

    (load "~/emacs_config/init-aquamacs.el")

