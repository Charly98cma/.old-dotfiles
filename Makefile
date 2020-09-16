WDIR = ${PWD}

install-all: install-emacs install-zsh install-i3

install-emacs:
	ln -fs $(WDIR)/.emacs.d/init.el ~/.emacs.d/init.el

install-zsh:
	ln -fs $(WDIR)/zsh/.zshrc ~/.zshrc

install-i3:
	ln -fs $(WDIR)/.i3/config ~/.i3/config
	sudo ln -fs $(WDIR)/.i3/i3status.conf /etc/i3status.conf
