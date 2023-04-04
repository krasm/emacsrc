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
	sudo apt install -y autoconf build-essential texinfo libgnutls28-dev libgnutls30 libxml2-dev libxml2-utils gnutls-bin libncurses5-dev pkg-config jq libx11-dev libxpm-dev libjpeg-dev libpng-dev libgif-dev libtiff-dev libgtk2.0-dev libncurses5-dev libxpm-dev fonts-inconsolata libxft-dev
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
(cd /tmp/emacs && git checkout tags/emacs-28.2 && ./autogen.sh && \
	./configure --prefix=$HOME/opt/emacs --with-xft --with-wide-int --without-libsystemd --with-xml2 --without-gpm  --with-zlib --with-gnutls --with-json=ifavailable  && make && make install)

if [ ! -d $HOME/bin ]; then 
    mkdir $HOME/bin
fi

if [ "x0" = "x"$? ] ; then
	ln -sf $HOME/opt/emacs/bin/* $HOME/bin
fi


