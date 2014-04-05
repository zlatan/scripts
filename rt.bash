#!/bin/bash
a=(`ps -ef | grep 19999 | grep -v grep`)
if [ ! "$a" ]; then
    ssh -fN -R 19999:localhost:22 USER@HOST
fi
