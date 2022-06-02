#!/bin/sh

# Set source and target directories
current_dir="$( cd "$( dirname "$0" )" && pwd )"
dir="$HOME/"
emacs_dir="$HOME/.emacs.d"
mkdir -p $emacs_dir
echo "$current_dir" "$emacs_dir/"
rsync -r --exclude="*.sh" "$current_dir" "$emacs_dir/"

echo "Copying files to $emacs_dir"




