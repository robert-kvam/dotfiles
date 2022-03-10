#!/bin/bash
main() {
set-alias
update
set-timezone
for item in "${package[@]}"; do
    if [ $UID == 0 ]; then
        $PKG $INSTALL $item
    else
        $SUDO $PKG $INSTALL $item
    fi
done
unminimize
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
    DEBIAN_FRONTEND=noninteractive
}
set-alias() {
    SUDO="sudo"
    UPT="update"
    PKG="apt-get"
    INSTALL="install -y"
}
update() {
if [ $UID == 0 ]; then
    $PKG $UPT
else
    $SUDO $PKG $UPT
fi
}
clean-variables() {
    unset package
    unset INSTALL
    unset PKG
    unset SUDO
}
main
