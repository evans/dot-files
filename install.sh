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

#https://github.com/tpope/vim-pathogen
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
  curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

git clone git://github.com/tpope/vim-commentary.git ~/.vim/bundle/vim-commentary
git clone git://github.com/tpope/vim-repeat.git ~/.vim/bundle/vim-repeat
git clone git://github.com/tpope/vim-surround.git ~/.vim/bundle/vim-surround
vim -u NONE -c "helptags ~/.vim/bundle/vim-surround/doc" -c q

#:help fugitive
git clone git://github.com/tpope/vim-fugitive.git ~/.vim/bundle/vim-fugitive
vim -u NONE -c "helptags ~/.vim/bundle/vim-fugitive/doc" -c q

#:Gbrowse
git clone https://github.com/tpope/vim-rhubarb.git ~/.vim/bundle/vim-rhubarb
vim -u NONE -c "helptags ~/.vim/bundle/vim-rhubarb/doc" -c q

# gC
# :help capslock
git clone git://github.com/tpope/vim-capslock.git ~/.vim/bundle/vim-capslock
vim -u NONE -c "helptags ~/.vim/bundle/vim-capslock/doc" -c q

#:DetectIndent
git clone https://github.com/roryokane/detectindent.git ~/.vim/bundle/detectindent
vim -u NONE -c "helptags ~/.vim/bundle/detectindent/doc" -c q

#vimperator syntax highlighting
git clone https://github.com/vimperator/vimperator.vim.git ~/.vim/bundle/vimperator.vim
#typescript sytax highlighting
git clone https://github.com/leafgarland/typescript-vim.git ~/.vim/bundle/typescript-vim

git clone git://github.com/godlygeek/tabular.git ~/.vim/bundle/tabular

#https://github.com/VundleVim/Vundle.vim
#Launch vim and run :PluginInstall
#To install from command line: vim +PluginInstall +qall
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

#clone color files
git clone git://github.com/altercation/vim-colors-solarized.git ~/.vim/bundle/vim-colors-solarized
git clone git@github.com:zcodes/vim-colors-basic.git ~/.vim/bundle/vim-colors-basic

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

#curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.2/install.sh | bash
