#!/bin/bash
sudo apt-get install pdftk imagemagick
cnt=1
while IFS=, read col1 col2 col3 col4
do
   rm name.png category.png school.png location.png
   convert -channel RGB -transparent white -font URW-Gothic-L-Book -density 300 -pointsize 34 -negate label:$col1 name.png
   convert -channel RGB -transparent white -font URW-Gothic-L-Book -density 300 -pointsize 34 -negate label:$col2 category.png
   convert -channel RGB -transparent white -font URW-Gothic-L-Book -density 300 -pointsize 34 -negate label:$col3 school.png
   convert -channel RGB -transparent white -font URW-Gothic-L-Book -density 300 -pointsize 34 -negate label:$col4 location.png
   convert org.jpg -page +800+1920 name.png -page +920+2090 category.png -page +850+2290 school.png -page +1200+2420 location.png -flatten $cnt.png
   convert $cnt.png $cnt.pdf
   rm $cnt.png
   ((cnt++))
done < participants.csv
pdftk *.pdf cat output ALL.pdf
rm name.png category.png school.png location.png
for podnoga in `ls -1 [0-9]*`
 do
   rm $podnoga
done
