reload() {
    printf "🌤  Reloading environment...\n\n"

    OLDPATH=$PWD
    cd ~/toolkit/dotfiles > /dev/null 2>&1

    for DOTFILE in `ls`
    do
        [ -f "$DOTFILE" ] && source "$DOTFILE"
        printf "$DOTFILE has run\n"
    done

    cd $OLDPATH > /dev/null 2>&1

    printf "\n☀️  Successfully reloaded environment.\n"
}
