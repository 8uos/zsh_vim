#!/bin/bash
DIR="$( cd "$( dirname "$0" )" && pwd )"
echo $DIR

cd $HOME
rm -r .tmux
git clone https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf
cp -f $DIR/tmux.conf.local $HOME/.tmux/.tmux.conf.local
cp .tmux/.tmux.conf.local .
