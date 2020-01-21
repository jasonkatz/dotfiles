reload() {
    printf "Reloading environment...\n\n"

    OLDPATH=$PWD
    cd ~/toolkit/dotfiles > /dev/null 2>&1

    for DOTFILE in `ls`
    do
        [ -f "$DOTFILE" ] && source "$DOTFILE"
    done

    cd $OLDPATH > /dev/null 2>&1

    printf "\nSuccessfully reloaded environment.\n"
}
