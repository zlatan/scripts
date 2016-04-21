#!/bin/bash
sudo apt-get install pdftk imagemagick
cnt=1
while IFS=, read col1 col2 col3 col4
do
   rm name.png category.png school.png location.png
   echo -n $col1 | convert -channel RGB -transparent white -font Segoe-Print -density 300 -pointsize 34 -negate label:@- name.png 
   echo -n $col3 | convert -channel RGB -transparent white -font Segoe-Print -density 300 -pointsize 34 -negate label:@- category.png
   echo -n $col2 | convert -channel RGB -transparent white -font Segoe-Print -density 300 -pointsize 30 -negate label:@- school.png
   echo -n $col4 | convert -channel RGB -transparent white -font Segoe-Print -density 300 -pointsize 30 -negate label:@- location.png
   convert org.jpg -page +1192+2740 name.png -page +1410+2990 category.png -page +1230+3250 school.png -page +1820+3500 location.png -flatten $cnt.png
   convert $cnt.png $cnt.pdf
   rm $cnt.png
   ((cnt++))
done < participants.csv
pdftk *.pdf cat output ALL.pdf
rm name.png category.png school.png location.png
rm `ls -1 [0-9]*.pdf`
