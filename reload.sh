reload() {
    for DOTFILE in `find ~ -maxdepth 1 -type l -name "*.tkd"`
    do
        [ -f "$DOTFILE" ] && source "$DOTFILE"
    done
}
