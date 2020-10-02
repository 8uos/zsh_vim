#!/bin/bash
echo "installing homebrew..."

# Install homebrew if not installed
if test ! $(which brew); then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
    echo "brew is found in this system. Skip brew install"
fi

brew cask install iterm2
