# My dotfiles

My little and ( **very** ) basic dotfiles config, including my *i3*, *emacs* and *zsh* configuration files, and some other things I have set up.
It's pretty simple, but I like it.

Oh, I almost forget, the calendar thingy it's only for 2020, for 2021 I've made a Python script using the NASA [APOD API](https://api.nasa.gov/).

## Index
## Installation process

Well, to make it fast and simple, there's a [Makefile](https://github.com/Charly98cma/.dotfiles/blob/master/Makefile) to create symbolic links to each file of the configuration.

To install everything at once (why not), just execute:

``` makefile
make install-all
```

Yes, the `make` commands are very verbose, but I prefer to keep it that way so they're self explanatory.

Each part has it's own `make` command to install it (linking the files would be a better description):

### zsh
``` makefile
make install-zsh
```
### i3

``` makefile
make install-i3
```
### emacs

``` makefile
make install-emacs
```

## zsh

This is my zsh/[oh-my-zsh](https://ohmyz.sh/) configuration, I use the **fino** theme, with a couple of custom things, nothing especial.

I also have some plugins enabled, but I encourage you to look for the ones that suit what you're going to do:

``` text
plugins=(git
		 git-extras
		 pip
		 pyenv
		 yarn
		 zsh-syntax-highlighting
		 )
```

And, of course, because all software developers are quite lazy, I have some alias established, just a couple:

``` text
alias g+++="g++ -Wall -Werror -pedantic -o"
alias gccc="gcc -g -o"
```

The other one (`upmvpn`) is for the university, so it's useless for someone else.

Ans, that's everything on the `zsh` front :D

## i3
### config


Hidden border, I don't like wasting screen space :D
``` text
# BORDER STYLE <normal | 1pixel | pixel xx | none | pixel>
new_window none
new_float normal

# HIDE BORDERS
hide_edge_borders both
```

Terminus font everywhere. Also, the perfect font size for me is 11pt.
``` text
# FONT
# Font for window titles. Will also be used by the bar unless a different font is used in the bar {} block below.
font terminus 11
```

I use Terminator as my custom terminal.
``` text
# START A TERMINAL ('terminator' is my custom terminal)
bindsym $mod+Return exec terminator
```

Quite long *rofi* statement to open the menu, but it's all I need/want. Also, quite pretty.
``` text
# START PROGRAM LAUNCHER (rofi)
bindsym $mod+d exec "rofi -show drun -modi drun,window,run -font \\"terminus 11\\" -show-icons -sidebar-mode -columns 2 -disable-history -terminal terminator"
```

My sound section is a bit of a mess, since the Bluetooth headphones volume can't be controlled using this keys. **This has to be solved... at some point**
``` text
##################
# SOUND CONTROLS #
##################
# This sections could use some work, since Bluetooth headphones volume can't be controlled
bindsym $mod+Ctrl+m exec "terminal -fn \\"xft:Hack:style=Medium\\" -e 'alsamixer'"

# VOLUME CONTROLS
bindsym XF86AudioRaiseVolume exec amixer -q set Master 0.75dB+ unmute
bindsym XF86AudioLowerVolume exec amixer -q set Master 0.75dB- unmute
bindsym XF86AudioMute exec amixer -q -D pulse set Master toggle
```

### i3status.conf
## emacs.d/init.el




Package management based on the [Alfedi](https://github.com/Alfedi/.emacs.d) emacs.d config. file (Thanks :D)
``` text
(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
   'package-archives
   '("melpa" . "http://melpa.org/packages/"))
  (package-initialize))
(unless (featurep 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-when-compile (require 'use-package))
```

Basic start-up options and parameters:
``` text
;; Start-up Options
(tooltip-mode            -1)
(tool-bar-mode           -1)
(menu-bar-mode           -1)
(scroll-bar-mode         -1)
(electric-pair-mode       1)
(show-paren-mode          1)
(set-window-fringes nil 0 0)
(setq custom-file "~/.emacs.d/.emacs-custom.el")
(setq make-backup-files nil)
(setq auto-save-default nil)
```

Deletion of the whole selected text if the user press any key:
``` text
;; Delete the selected text when key pressed
(delete-selection-mode t)
```

No splash-screen and no startup screen:
``` text
;; Splash-screen
(setq inhibit-splash-screen t)
(setq initial-scratch-message nil)
(setq inhibit-startup-screen t)
```

Sets the indentation width to 2 spaces (I've used the Google approach):
``` text
;; Indentation
(setq tab-width 2
	  indent-tabs-mode nil)
```

Change the `Yes/No` option to `Y/N`, which makes more sense than typing the whole word:
``` text
;; yes/no --> y/n
(defalias 'yes-or-no-p 'y-or-n-p)
```

Disable automatic backups and saves (they're quite annoying sometimes):
``` text
;; Backup and Autosaves (thanks Git ;D)
(setq make-backup-files nil)
(setq auto-save-default nil)
```
