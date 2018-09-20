#!/bin/sh
sudo apt-get update && sudo apt-get upgrade -y
sudo apt-get install -y autoconf build-essential texinfo libgnutls28-dev libgnutls30 libxml2-dev libxml2-utils gnutls-bin libncurses5-dev

git clone https://git.savannah.gnu.org/git/emacs.git /tmp/emacs
(cd /tmp/emacs && git checkout tags/emacs-26.1 && ./autogen.sh && \
	./configure --prefix=$HOME/opt/emacs --with-wide-int --without-x --without-libsystemd --with-xml2 --without-gpm  --with-zlib --with-gnutls && make && make install)
