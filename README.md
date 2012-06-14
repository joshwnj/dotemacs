# Emacs config

Optimized for emacs 24 in iTerm2.

I was previously using Aquamacs as well, and it should be mostly compatible.  See **Using with Aquamacs** below for more info.

## Wish List

 * on startup, show me:
  * buffer list
  * recent files

 * learn keys for scrolling the buffer without moving the point.

 * diff of changes since last save
  * highlight additions in green
  * keyboard shortcuts to move to next/prev change
  * allow reverting specific changes
 
 * json mode
  * flymake
  * beautifier

* php mode
  * fix indentation rules (sometimes buggy with arrays)
  * look into sgrep <https://github.com/facebook/pfff/wiki/Sgrep>
  
 * svn
  * view status of a directory, and quick diffing
  
 * tailing a log file
  * font lock to highlight a timestamp
  * filtering / highlighting

 * predefined window configurations

 * html-mode: search by css-selector
  * could maybe do this with the php-tokens.el plugin, and a phpquery script

 * bookmarks
  * maybe just use the mark ring?


## Using with Aquamacs

This setup should be compatible with both terminal emacs (I'm using iTerm2) and Aquamacs.  To activate the aquamacs-only config, append this to your `~/Library/Preferences/Aquamacs\ Emacs/Preferences.el` file:

    (load "~/emacs_config/init-aquamacs.el")

