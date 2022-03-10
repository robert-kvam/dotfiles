#!/bin/bash
main() {
set-alias
update
set-timezone
for item in "${package[@]}"; do
    if [ $UID == 0 ]; then
        $PKG $INSTALL $item
        echo "::: Installing $item"
    else
        $SUDO $PKG $INSTALL $item
        echo "::: Installing $item"
    fi
done
clean-variables
}
package=(
    "neovim"
    "neofetch"
    "curl"
    "wget"
    "git"
    "htop"
    "tree"
    "gcc"
    "make"
    "bind9-host"
    "man"
    "iproute2"
    "iputils-ping"
    "iputils-tracepath"
    "inetutils-telnet"
    "inetutils-ftp"
    "mmv"
    "rsync"
)
set-timezone() {
    ln -fs /usr/share/zoneinfo/Europe/Oslo /etc/localtime
    export DEBIAN_FRONTEND=noninteractive
}
set-alias() {
    SUDO="sudo"
    UPT="update -qq"
    PKG="apt-get"
    INSTALL="install -qqy"
}
update() {
if [ $UID == 0 ]; then
    $PKG $UPT
    echo "::: Updating apt-repo"
else
    $SUDO $PKG $UPT
    echo "::: Updating apt-repo"
fi
}
clean-variables() {
    unset package
    unset INSTALL
    unset PKG
    unset SUDO
}
main
