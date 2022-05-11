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

rm -rf "$JDTLS_HOME" > /dev/null
mkdir -p "$JDTLS_INSTALL_LOCATION"
mkdir -p "$JDTLS_HOME/.cache"

echo "Downloading jdtls version $JDTLS_VERSION..."

wget "https://download.eclipse.org/jdtls/milestones/$JDTLS_VERSION/$JDTLS_DOWNLOAD_FILE_NAME" \
        --quiet \
        --directory-prefix="$JDTLS_HOME"

echo "Download complete. Extracting file..."

tar -xf "$JDTLS_HOME/$JDTLS_DOWNLOAD_FILE_NAME" \
        --directory="$JDTLS_INSTALL_LOCATION"

echo "Extraction complete. Deleting dowloaded compressed file..."

rm "$JDTLS_HOME/$JDTLS_DOWNLOAD_FILE_NAME"

echo "jdtls version $JDTLS_VERSION has been installed in $JDTLS_INSTALL_LOCATION"
