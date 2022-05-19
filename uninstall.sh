#!/bin/sh

#
# Uninstall configs
#

# Check for dependencies
for name in stow
do
  [[ $(which $name 2>/dev/null) ]] || { echo -en "\n$name needs to be installed.";deps=1; }
done
[[ $deps -ne 1 ]] || { echo -en "\nInstall the above and rerun this script.\n";exit 1; }

STOW_FOLDERS="nvim,zsh"

pushd $DOTFILES

for folder in ${STOW_FOLDERS//,/ }
do
  stow --target="$HOME" --delete $folder
  stow --target="$HOME" $folder
done
popd
