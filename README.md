Dotemacs
====

My dotemacs files

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
function ed { emacs --daemon; }
alias emacs='emacs -nw'
alias e='emacsclient -t -a nano'
export EDITOR='emacsclient -t -a nano'
```

And then after running `ed` once, you can do `e somefile.txt` to edit.
