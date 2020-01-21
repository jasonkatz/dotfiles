add_sourcing() {
    printf "\n"

    local PROFILE=~/.profile

    local START_TAG="TOOLKIT SETUP START"
    local END_TAG="TOOLKIT SETUP END"

    local PROFILE_CONTENTS=$(cat $PROFILE)
    if [[ ! $PROFILE_CONTENTS =~ $START_TAG ]] && [[ ! $PROFILE_CONTENTS =~ $END_TAG ]]; then
        printf "# $START_TAG\n" >> $PROFILE
        printf ". ~/toolkit/reload.sh\nreload\n" >> $PROFILE
        printf "startup\n" >> $PROFILE
        printf "# $END_TAG\n" >> $PROFILE

        printf "Added toolkit setup to $PROFILE\n"
    else
        printf "Cannot add toolkit setup to $PROFILE; start and/or end tag already exist.\n"
    fi
}

OLDPATH=$PWD

cd ~/toolkit > /dev/null 2>&1

printf "Installing input configuration file...\n"
INPUTRC=`find $(pwd) -type f -name "inputrc"`
ln -s "$INPUTRC" ~/.inputrc

printf "Installing Xresources file...\n"
XRESOURCES=`find $(pwd) -type f -name "Xresources"`
ln -s "$XRESOURCES" ~/.Xresources

printf "Installing tmux configuration file...\n"
TMUX_CONF=`find $(pwd) -type f -name "tmux.conf"`
ln -s "$TMUX_CONF" ~/.tmux.conf

printf "Installing vim configuration file...\n"
VIMRC=`find $(pwd) -type f -name "vimrc"`
ln -s "$VIMRC" ~/.vimrc

printf "Installing vim color scheme file...\n"
VIMRC=`find $(pwd) -type f -name "monokai.vim"`
mkdir -p ~/.vim/colors
ln -s "$VIMRC" ~/.vim/colors/monokai.vim

printf "\nInstalling dotfiles...\n"
for DOTFILE in `find $(pwd)/dotfiles -type f`
do
    printf "Creating symbolic link for ${DOTFILE}\n"
    FILENAME=$(basename "$DOTFILE")
    ln -s "$DOTFILE" ~/."$FILENAME.tkd"
done

printf "Toolkit successfully installed.\n"

add_sourcing

printf "\n"
. reload.sh
reload

cd $OLDPATH > /dev/null 2>&1
