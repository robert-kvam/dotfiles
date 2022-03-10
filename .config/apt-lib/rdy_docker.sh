#!/bin/bash
main() {
set-alias
update
for item in "${package[@]}"; do
    if [ $UID == 0 ]; then
        $PKG $INSTALL $item
    else
        $SUDO $PKG $INSTALL $item
    fi
done
update
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
    UPT="update"
    PKG="apt"
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
