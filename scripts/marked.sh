#!/bin/sh

# open file with Marked 2 or just open Marked 2
if [ $1 ]; then
    open -a "Marked 2" $1;
else
    open -a "Marked 2";
fi
