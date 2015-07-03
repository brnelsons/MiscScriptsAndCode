#!/bin/bash
# 192.168.1.99 is the static IP for my Geforce PC
# run the limelight jar to scan for games on the PC and print it to file games.log
java -jar ~/limelight/limelight.jar list 192.168.1.99 > games.log
# start while loop, read each line in games.log as var G
while read -r G
do
    # write this string to a file, $G = the name of the game from Limelight, into a file called [gamename].sh
    echo -e $"#!/bin/bash \njava -jar ~/limelight/limelight.jar stream -720 -60fps 192.168.1.99 -app \"$G\" -mapping ~/limelight/map1.map" > "$G.sh"
	# change permission on the sh file
    chmod +x "$G.sh"
	# declare what var to loop over
done < games.log
# remove the file we made and the file that was generated from the first
# line of the games.log, because we don't need that anymore
rm games.log
rm Search\ apps.sh
# reboot so RetroPi picks up the new files
sudo reboot
