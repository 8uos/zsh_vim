#!/bin/bash
DIR="$( cd "$( dirname "$0" )" && pwd )"
echo "installing oh-my-zsh..."
if [ ! -f "$HOME/.oh-my-zsh/oh-my-zsh.sh" ]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    mv $HOME/.zshrc $HOME/.zshrc.old
    cp $DIR/zshrc $HOME/.zshrc
    git clone --depth 1 https://github.com/junegunn/fzf.git $HOME/.fzf
    $HOME/.fzf/install
else
    echo "Skip oh-my-zsh install"
fi

if [ ! -d ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions ]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
fi

if [ ! -d ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting ]; then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
fi
