modify_profile() {
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

printf "Installing toolkit...\n\n"

OLDPATH=$PWD

cd ~/toolkit/links > /dev/null 2>&1

for TKFILE in `ls -A`
do
    printf "Installing $TKFILE...\n"
    ln -s "$(pwd)/$TKFILE" ~/$TKFILE
done

modify_profile

cd ~/toolkit > /dev/null 2>&1

printf "Toolkit successfully installed.\n"

printf "\n"
. reload.sh
reload

cd $OLDPATH > /dev/null 2>&1
