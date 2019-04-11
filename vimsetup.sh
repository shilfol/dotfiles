sudo apt install -y python-dev python3-dev ruby-dev libperl-dev luajit lua5.2 liblua5.2-dev

sudo make distclean
sudo ./configure --prefix=/usr/local --with-features=huge --enable-multibyte --enable-rubyinterp --enable-pythoninterp --enable-python3interp --enable-luainterp --enable-gui=auto --enable-gtk2-check --enable-cscope
sudo make 
sudo make install

vim --version
