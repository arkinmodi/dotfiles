#!/bin/sh

#
# Download/Install jdt language server.
# Github: https://github.com/eclipse/eclipse.jdt.ls
#
# NOTE: When updating jdtls version, remember to update the jdtls_dir and 
# org.eclipse.equinox.launcher jar version in ~/.config/nvim/ftplugin/java.lua
#

JDTLS_VERSION=1.11.0
JDTLS_DOWNLOAD_FILE_NAME=jdt-language-server-1.11.0-202205051421.tar.gz

JDTLS_HOME="$HOME/jdtls"
JDTLS_INSTALL_LOCATION="$JDTLS_HOME/jdtls-$JDTLS_VERSION"
LOMBOK_INSTALL_LOCATION="$JDTLS_HOME/lombok"

# Check for dependencies
for name in wget
do
  [[ $(which $name 2>/dev/null) ]] || { echo -en "\n$name needs to be installed.";deps=1; }
done
[[ $deps -ne 1 ]] || { echo -en "\nInstall the above and rerun this script.\n";exit 1; }


rm -rf "$JDTLS_HOME" > /dev/null
mkdir -p "$JDTLS_INSTALL_LOCATION"
mkdir -p "$LOMBOK_INSTALL_LOCATION"
mkdir -p "$JDTLS_HOME/.cache"

echo "Downloading jdtls version $JDTLS_VERSION..."

wget "https://download.eclipse.org/jdtls/milestones/$JDTLS_VERSION/$JDTLS_DOWNLOAD_FILE_NAME" \
        --quiet \
        --show-progress \
        --progress=bar:force:noscroll \
        --directory-prefix="$JDTLS_HOME"

echo "Download complete. Extracting jdtls..."

tar -xf "$JDTLS_HOME/$JDTLS_DOWNLOAD_FILE_NAME" \
        --directory="$JDTLS_INSTALL_LOCATION"

echo "Extraction complete. Deleting dowloaded jdtls compressed file..."

rm "$JDTLS_HOME/$JDTLS_DOWNLOAD_FILE_NAME"

echo "jdtls version $JDTLS_VERSION has been installed in $JDTLS_INSTALL_LOCATION"

echo "Downloading lombok..."

wget "https://projectlombok.org/downloads/lombok.jar" \
        --quiet \
        --show-progress \
        --progress=bar:force:noscroll \
        --directory-prefix="$LOMBOK_INSTALL_LOCATION"

echo "Download complete. Lombok installed in $LOMBOK_INSTALL_LOCATION"
