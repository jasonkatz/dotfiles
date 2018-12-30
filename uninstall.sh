OLDPATH=$PWD

cd ~/toolkit > /dev/null 2>&1

printf "Removing all toolkit files...\n"
for TKFILE in `find ~ -maxdepth 1 -lname "$(pwd)/*"`
do
    rm -f "$TKFILE"
    printf "Removed $TKFILE\n"
done

printf "\n"

PROFILE=~/.bash_profile
if [ ! -f $PROFILE ]; then
    PROFILE=~/.profile
fi

START_TAG="TOOLKIT SETUP START"
END_TAG="TOOLKIT SETUP END"

PROFILE_CONTENTS=$(cat $PROFILE)
if [[ $PROFILE_CONTENTS =~ $START_TAG ]] && [[ $PROFILE_CONTENTS =~ $END_TAG ]]; then
    sed "/$START_TAG/,/$END_TAG/d" $PROFILE > $PROFILE.tmp
    cp $PROFILE.tmp $PROFILE

    printf "Removed toolkit setup from $PROFILE\n"
else
    printf "Cannot remove toolkit setup from $PROFILE; start and/or end tag do not exist.\n"
fi

cd $OLDPATH > /dev/null 2>&1
