#!/bin/bash
DIR="$( cd "$( dirname "$0" )" && pwd )"
if [ ! -d "$HOME/.vim" ]; then
  mkdir $HOME/.vim
fi

if [ ! -d "$HOME/.vim/bundle" ]; then
  mkdir $HOME/.vim/bundle
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

rm $HOME/.vimrc
cp $DIR/vimrc $HOME/.vimrc
vim +PluginInstall +qall

