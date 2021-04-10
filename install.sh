#!/bin/sh

exists () {
  type "$1" >/dev/null 2>/dev/null
}

exists "apt"
APT=$?
if [ "x0" = "x"$APT ]; then
	sudo apt update && sudo apt upgrade -y
	if [ "x0" != "x"$? ]; then
		echo "update failed - quitting"
		exit 1
	fi
	sudo apt install -y autoconf build-essential texinfo libgnutls28-dev libgnutls30 libxml2-dev libxml2-utils gnutls-bin libncurses5-dev pkg-config
	if [ "x0" != "x"$? ]; then
		echo "update failed - quitting"
		exit 1
	fi
fi

if [ -d $HOME/.emacs.d ]; then
	echo ".emacs.d found - quitting"
	exit 1
fi

mkdir -p $HOME/.emacs.d/
ln -s $PWD/init.el $HOME/.emacs.d/init.el
ln -s $PWD/yasnippet-snipets $HOME/.emacs.d/


git clone https://git.savannah.gnu.org/git/emacs.git /tmp/emacs
(cd /tmp/emacs && git checkout tags/emacs-27.2 && ./autogen.sh && \
	./configure --prefix=$HOME/opt/emacs --with-wide-int --without-x --without-libsystemd --with-xml2 --without-gpm  --with-zlib --with-gnutls --with-json && make && make install)

if [ "x0" = "x"$? ] ; then
	mkdir $HOME/bin/
	ln -s $HOME/opt/emacs/bin/* $HOME/bin
fi


