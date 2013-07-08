#!/bin/bash
scanimage --format=pnm --batch-count=2 --batch-prompt --mode Color --resolution 150 -x 210 -y 297
convert -compress JPEG -quality 60 out1.pnm out2.pnm $1.pdf
rm out1.pnm out2.pnm
