#!/bin/bash

CURRENT_DIR=$(dirname $(readlink -f $0))

ln -sf $CURRENT_DIR/bin ~/

mv ~/.Xdefaults ~/.Xdefaults.bak || true
ln -sf $CURRENT_DIR/Xdefaults ~/.Xdefaults

ln -sf $CURRENT_DIR/nvim ~/.config/nvim;
