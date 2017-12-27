cd ~/toolkit

echo "Removing all toolkit files..."
for TKFILE in `find ~ -maxdepth 1 -lname "$(pwd)/*"`
do
    rm -f "$TKFILE"
    echo "Removed $TKFILE"
done
