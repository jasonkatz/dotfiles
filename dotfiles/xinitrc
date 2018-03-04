echo "~/.xinitrc has run"

# Append the PATH variable to make sure the X commands are found
if echo ":${PATH}:" | grep -v ":/usr/bin/X11:" > /dev/null
then
    PATH=${PATH}:/usr/bin/X11
    export PATH
fi

# Load user resources into the server
if [ -r $HOME/.Xresources ]
then
    xrdb -merge $HOME/.Xresources
fi
