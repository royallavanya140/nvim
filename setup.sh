#!/bin/bash

echo "Installing vim-plug..."
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
 https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "Installing plugins via PlugInstall..."
nvim +PlugInstall +qall

echo "Done!"
