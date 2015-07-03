#!/bin/bash
java -jar ~/limelight/limelight.jar list 192.168.1.99 > games.log
while read -r G
do
    echo -e $"#!/bin/bash \njava -jar ~/limelight/limelight.jar stream -720 -60fps 192.168.1.99 -app \"$G\" -mapping ~/limelight/map1.map" > "$G.sh"
    chmod +x "$G.sh"
done < games.log
rm games.log
rm Search\ apps.sh

sudo reboot
