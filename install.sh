cd ~/toolkit

echo "Installing Xresources file..."
XRESOURCES=`find $(pwd) -type f -name "Xresources"`
ln -s "$XRESOURCES" ~/.Xresources

echo "Installing tmux configuration file..."
TMUX_CONF=`find $(pwd) -type f -name "tmux.conf"`
ln -s "$TMUX_CONF" ~/.tmux.conf

echo "Installing vim configuration file..."
VIMRC=`find $(pwd) -type f -name "vimrc"`
ln -s "$VIMRC" ~/.vimrc

echo "Installing dotfiles..."
for DOTFILE in `find $(pwd)/dotfiles -type f`
do
    echo "Creating symbolic link for ${DOTFILE}"
    FILENAME=$(basename "$DOTFILE")
    ln -s "$DOTFILE" ~/."$FILENAME.tkd"
done

echo "Toolkit successfully installed."
