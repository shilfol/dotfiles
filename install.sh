#!/bin/sh

DSTDIR=~/.vim/rc

[ ! -e $DSTDIR ] && mkdir -p $DSTDIR

DIR=$(cd $(dirname $0); pwd)

ln -s $DIR/.latexmkrc ~/.latexmkrc 
ln -s $DIR/.vim/dein.toml ~/.vim/rc/dein.toml 
ln -s $DIR/.vim/dein_lazy.toml ~/.vim/rc/dein_lazy.toml 

ln -s $DIR/.vimrc ~/.vimrc 
