#!/bin/bash

#ln -s $pwd/.profile ~/.profile
mkdir -p ~/.config/phoenix/
mkdir -p ~/.config/git/

ln -s "$(pwd)"/.config/phoenix/phoenix.js ~/.config/phoenix/phoenix.js
ln -s "$(pwd)"/.config/git/ignore ~/.config/git/ignore

files=($(find . -name ".*" -type f | sed "s|^\./||"))
for file in "${files[@]}"
do
  echo "linking "$(pwd)"/"$file" to ~/"$file""
  ln -s "$(pwd)"/"$file" ~/"$file"
done

#https://github.com/tpope/vim-pathogen
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
  curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

git clone git://github.com/tpope/vim-commentary.git ~/.vim/bundle/vim-commentary
git clone git://github.com/tpope/vim-repeat.git ~/.vim/bundle/vim-repeat

#https://github.com/VundleVim/Vundle.vim
#Launch vim and run :PluginInstall
#To install from command line: vim +PluginInstall +qall
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
