# My dotfiles

My little and ( *very* ) basic dotfiles config, including my i3, emacs, zsh configuration files, and come other things I have set up.
It's pretty simple, but I like it.

Oh, I almost forget, the calendar thingy it's only for 2020, BUT, I will upload a new calendar (2021) as soon as I find a new one with a space theme.

## Index
## Installation process

Well, there's a [Makefile](https://github.com/Charly98cma/.dotfiles/blob/master/Makefile) to create symbolic links to each file of the configuration.

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
		 yarn)
```

And, of course, because all software developers are quite lazy, I have some alias established, just a couple:

``` text
alias g+++="g++ -Wall -Werror -pedantic -o"
alias gccc="gcc -g -o"
```

The other one (`upmvpn`) is for the university, so it's useless for someone else.

Ans, that's everything of zsh :D

## i3
### config
### i3status.conf
## emacs.d/init.el
