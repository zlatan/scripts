a=(`ps -ef | grep 19999 | grep -v grep`)
echo $a >> /home/rfid/log.txt
if [ ! "$a" ]; then
    ssh -fN -R 19999:localhost:22 USER@HOST
fi
