## setup all symbolic links required for `keanu`

# config
ln -sf $HOME/keanu/config $HOME/.config

# vim
ln -sf $HOME/keanu/vim/.vimrc $HOME/.vimrc

# xorg
ln -sf $HOME/keanu/xorg/.Xauthority $HOME/.Xauthority
ln -sf $HOME/keanu/xorg/.Xdefaults $HOME/.Xdefaults
ln -sf $HOME/keanu/xorg/.Xresources $HOME/.Xresources
ln -sf $HOME/keanu/xorg/.Xresources.d $HOME/.Xresources.d
ln -sf $HOME/keanu/xorg/.xinitrc $HOME/.xinitrc

## zsh
ln -sf $HOME/keanu/zsh/.zshrc $HOME/.zshrc
ln -sf $HOME/keanu/zsh/.zprofile $HOME/.zprofile
