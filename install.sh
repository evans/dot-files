#!/bin/bash

#ln -s $pwd/.profile ~/.profile
mkdir -p ~/.config/phoenix/
mkdir -p ~/.config/git/

ln -s "$(pwd)"/.config/phoenix/phoenix.js ~/.config/phoenix/phoenix.js
ln -s "$(pwd)"/.config/git/ignore ~/.config/git/ignore

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
fi

brew install opam

#curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.2/install.sh | bash

source ~/.bash_profile
