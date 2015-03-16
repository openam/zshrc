#!/bin/zsh

source $HOME/.zshrc

function chpwd() {
    emulate -L zsh
}

COMMAND=${@}

if [ $# -eq 0 ]
    then
        echo "$fg_bold[red]No arguments supplied$reset_color"
        exit
fi

echo "$fg_bold[green]Running command '$COMMAND'$reset_color"

find . -type d \( ! -name . \) -maxdepth 1 | sed 's|./||' | while read LINE; do
    DIR="$PWD/$LINE"

    printf "\n\n"
    echo $fg_bold[white]$DIR$reset_color
    cd "$DIR"
    eval $COMMAND
    cd ../
done
