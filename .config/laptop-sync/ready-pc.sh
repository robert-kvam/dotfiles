#!/bin/bash
# Repos used
repoList=(
    "neovim"
    "neofetch"
    "tree"
    "ranger"
)

function main {
    makeReady
    syncSystem
}


function makeReady {
    # Set variables
    SUDO="sudo"
    PKG="apt-get"
    INSTALL="install -y"
    CLEANUP="autoremove -y"
    function updateSystem {
        $SUDO $PKG update
        $SUDO $PKG upgrade -y
        $SUDO $PKG $CLEANUP
    }
    updateSystem
    # Reset used variables
    unset INSTALL
    unset PKG
    unset SUDO
}

function syncSystem {
    # Set variables
    SUDO="sudo"
    PKG="apt-get"
    INSTALL="install -y"
    for item in "${repoList[@]}"; do
        $SUDO $PKG $INSTALL $item
    done
    # Reset used variables
    unset INSTALL
    unset PKG
    unset SUDO
}


# Reset the values
unset repoList
main