Dotemacs
====

My dotemacs files, optimised for 8-color display in iTerm2.

Install
----

First link the repo:

```
ln -s ~/PATH_TO_REPO ~/.emacs.d
```

Install packages:

```
emacs -Q -l ~/.emacs.d/install/packages.el
```

[Optional] Some useful bash aliases:

```
alias emacs='emacs -nw'
alias ed='emacs --daemon'
alias ee='emacsclient -t -a nano'
```

Install jslint
----

```
npm install -g jslint
cp ~/.emacs.d/install/jslint /usr/bin/jslint
chmod +x /usr/bin/jslint
```
