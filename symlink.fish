#! /usr/bin/fish

set dotfiles ".xinitrc" ".vimrc"

echo "installing vim pathogen"
mkdir -p ~/.vim/autoload ~/.vim/bundle
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

echo "relocating to .vim/bundle"
cd ~/.vim/bundle

echo "cloning solarized vim theme"
git clone git://github.com/altercation/vim-colors-solarized.git

