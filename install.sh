#!/bin/bash

#ln -s $pwd/.profile ~/.profile
mkdir -p ~/.config/phoenix/
mkdir -p ~/.config/git/

ln -s "$(pwd)"/.config/phoenix/phoenix.js ~/.config/phoenix/phoenix.js
ln -s "$(pwd)"/.config/google-chrome ~/.config/google-chrome
ln -s "$(pwd)"/.config/git/ignore ~/.config/git/ignore
ln -s "$(pwd)"/.config/UltiSnips ~/.config/UltiSnips

files=($(find . -name ".*" -type f | sed "s|^\./||"))
for file in "${files[@]}"
do
  if [[ "$file" != ".gitignore" ]]
  then
    echo "linking "$(pwd)"/"$file" to ~/"$file""
    ln -s "$(pwd)"/"$file" ~/"$file"
  fi
done

if ! [ hash nvm 2>/dev/null ]; then
  curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.2/install.sh | bash
fi

#https://github.com/VundleVim/Vundle.vim
#Launch vim and run :PluginInstall
#To install from command line: vim +PluginInstall +qall
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
vim +BundleDocs +qall

# read -p "Would you like to install gcp(Google Cloud Platform)[yY]? " -r
# echo # move to a new line
# if [[ $REPLY =~ ^[Yy] ]]
# then
#   #gcp
#   curl https://sdk.cloud.google.com | bash
# fi

#install homebrew
if [[ "$OSTYPE" == "darwin"* ]]; then
  # Mac OSX
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

  brew cask install xquartz

  brew install clojure
  brew install cmake
  brew install colordiff
  brew install direnv
  brew install git
  brew install go
  brew install grip
  brew install heroku/brew/heroku
  brew install hub
  brew install jq
  brew install leiningen
  brew install mongodb
  brew install opam
  brew install openssl
  brew install postgresql
  brew install pstree
  brew install rust
  brew install screen
  brew install vim --with-client-server --with-gettext --with-lua --with-python3 --with-tcl
  brew install wget
  brew install yarn
  brew install youtube-dl

  brew cask install alfred
  brew cask install docker
  brew cask install eclipse-java
  brew cask install firefox
  brew cask install flux
  brew cask install gimp
  brew cask install google-chrome
  brew cask install gpg-suite
  brew cask install iina
  brew cask install inkscape
  brew cask install insomnia
  brew cask install istat-menus
  brew cask install java
  brew cask install kindle
  brew cask install phoenix
  brew cask install postman
  brew cask install quip
  brew cask install sketch
  brew cask install slack
  brew cask install tunnelblick
  brew cask install visual-studio-code
  brew cask install vlc

  brew install zsh
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
  mv .zshrc.pre-oh-my-zsh .zshrc

fi

curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.2/install.sh | bash

source ~/.bash_profile
