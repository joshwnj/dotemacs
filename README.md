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
function ed { emacs --daemon; }
alias emacs='emacs -nw'
alias e='emacsclient -t -a nano'
export EDITOR='emacsclient -t -a nano'
```

And then after running `ed` once, you can do `e somefile.txt` to edit.

Recommended Theme
----

- Fantasque Sans Mono (https://github.com/belluzj/fantasque-sans)
- iTerm2 colors: (https://github.com/joshwnj/dotemacs/blob/master/joshwnj.itermcolors)
- Example screenshot:

![](http://content.screencast.com/users/joshwnj/folders/Jing/media/2c02e8e3-7e19-4706-843e-6b772987d076/00000810.png)
