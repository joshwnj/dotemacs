# Emacs config

## Using with Aquamacs

This setup should be compatible with both terminal emacs (I'm using iTerm2) and Aquamacs.  To activate the aquamacs-only config, append this to your `~/Library/Preferences/Aquamacs\ Emacs/Preferences.el` file:

    (load "~/emacs_config/init-aquamacs.el")

## To Do

 * selective use of ido-mode, so it doesn't get in the way (eg. when you want to create a new file).
 
 * json mode
  * flymake
  * beautifier
  
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

 * more pleasant whitespace mode colours

 * php mode
  * look into sgrep <https://github.com/facebook/pfff/wiki/Sgrep>

