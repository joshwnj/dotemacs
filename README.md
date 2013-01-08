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
alias ee='emacsclient -t -a nano'
```

Configuring Daemon
----

To load Emacs faster instead of having to re-load all configurations
and plugins each time, you can run Emacs as a Daemon and then connect
to it via the `emacsclient` mentioned among the aliases listed above.

On OS X, you can use Launchd to automatically start the Daemon upon
logging in. To do so, create a file `~/Library/LaunchAgents/gnu.emacs.daemon.plist`
which contains the following (with the proper path to `emacs` in the
`ProgramArguments`:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN"
    "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
 <plist version="1.0">
  <dict>
    <key>Label</key>
    <string>gnu.emacs.daemon</string>

    <key>ProgramArguments</key>
    <array>
      <string>/usr/local/bin/emacs</string>
      <string>--daemon</string>
    </array>

   <key>RunAtLoad</key>
   <true/>

   <key>ServiceDescription</key>
   <string>Gnu Emacs Daemon</string>
 </dict>
</plist>
```

Then you can load the service via:

```
$ launchctl load -w ~/Library/LaunchAgents/gnu.emacs.daemon.plist
$ launchctl start gnu.emacs.daemon
```

You can then set your environment to use `emacsclient` instead of `emacs`
for example in your `.bash_profile`:

```bash
export SVN_EDITOR='emacsclient -t'
export VISUAL='emacsclient -t'
export EDITOR='emacsclient -t'
```

Install jslint
----

```
npm install -g jslint
cp ~/.emacs.d/install/jslint /usr/bin/jslint
chmod +x /usr/bin/jslint
```
