#!/bin/bash
main() {
set-alias
    for item in "${package[@]}"; do
        if [ $UID == 0 ]; then
            $PKG $INSTALL $item
        else
            $SUDO $PKG $INSTALL $item
        fi
    done
clean-variables
}
package = (
    "curl"
    "git"
    "htop"
    "tree"
    "gcc"
    "make"
    "man"
    "iproute2"
    "iputils-ping"
    "iputils-tracepath"
    "inetutils-telnet"
    "inetutils-ftp"
    "mmv"
    "rsync"
)
set-alias() {
    SUDO="sudo"
    PKG="apt"
    INSTALL="install -y"
}
clean-variables() {
    unset package
    unset INSTALL
    unset PKG
    unset SUDO
}
main
