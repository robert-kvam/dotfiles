#!/bin/bash
main() {
set-alias
update
set-timezone
for item in "${package[@]}"; do
    if [ $UID == 0 ]; then
        echo "::: Installing $item"
        $PKG $INSTALL $item &>/dev/null
    else
        echo "::: Installing $item"
        $SUDO $PKG $INSTALL $item &>/dev/null
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
    INSTALL="install -qq --yes"
}
update() {
if [ $UID == 0 ]; then
    echo "::: Updating apt-repo"
    $PKG $UPT &>/dev/null
else
    echo "::: Updating apt-repo"
    $SUDO $PKG $UPT &>/dev/null
fi
}
clean-variables() {
    unset package
    unset INSTALL
    unset PKG
    unset SUDO
}
main
