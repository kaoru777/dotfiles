#!/bin/zsh
ln -s ~/dotfiles/.zshenv  ~/.zshenv
ln -s ~/dotfiles/.psqlrc  ~/.psqlrc
ln -s ~/dotfiles/.tmux.conf  ~/.tmux.conf
ln -s ~/dotfiles/.gitignore_global  ~/.gitignore_global

# mkdir -p ~/.config/nvim
ln -s ~/dotfiles/nvim ~/.config/

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
nvim --headless +PlugInstall +qall
