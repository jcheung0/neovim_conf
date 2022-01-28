#!/bin/bash 


NEOVIM_HOME=~/.config/nvim


ln -s $(pwd)/init.lua $NEOVIM_HOME/init.lua

ln -s $(pwd)/lua $NEOVIM_HOME/lua
