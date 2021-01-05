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
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

  brew install --cask xquartz

  brew install circleci
  brew install clojure
  brew install cmake
  brew install colordiff
  brew install direnv
  brew install git
  brew install go
  brew install gradle
  brew install grip
  brew install heroku/brew/heroku
  brew install hub
  brew install jq
  brew install leiningen
  brew install mongodb
  brew install octave
  brew install opam
  brew install openssl
  brew install postgresql
  brew install pstree
  brew install python3
  brew install rust
  brew install screen
  # git history
  brew install tig
  # code stats
  brew install tokei
  brew install unrar
  brew install vim --with-client-server --with-gettext --with-lua --with-python3 --with-tcl --with-override-system-vi
  brew install vim --with-client-server --with-gettext --with-lua --with-python3 --with-tcl
  brew install wget
  brew install yarn
  brew install youtube-dl
  brew install yq

  brew install --cask alfred
  brew install --cask calibre
  brew install --cask docker
  brew install --cask eclipse-java
  brew install --cask firefox
  brew install --cask flux
  brew install --cask gimp
  brew install --cask google-chrome
  brew install --cask gpg-suite
  brew install --cask iina
  brew install --cask inkscape
  brew install --cask insomnia
  brew install --cask istat-menus
  brew install --cask java
  brew install --cask kindle
  brew install --cask knockknock
  brew install --cask lulu
  brew install --cask minikube
  brew install --cask phoenix
  brew install --cask postico
  brew install --cask postman
  brew install --cask quip
  brew install --cask sketch
  brew install --cask slack
  brew install --cask soundflower
  brew install --cask telegram
  brew install --cask tunnelblick
  brew install --cask visual-studio-code
  brew install --cask vlc

  brew install zsh
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
  mv .zshrc.pre-oh-my-zsh .zshrc

fi

curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.2/install.sh | bash

#link vscode settings after installing
ln -Fs "$(pwd)"/vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json

# haskell
curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh

source ~/.bash_profile
