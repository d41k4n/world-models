# March 09 2014
# Version 0.4 by crashmax
# Simple start up script for Tony's World2Xplane
#
# To do:

#!/bin/bash
# bash

# declare defaults
arch="64"
rootpath="./"
exec="World2XPlane.jar"
minxm="2"
minfree="2" # used only for abort message text


# get available memory
memusage=`top -n 1 -b | grep "Mem"`
echo "Mem-Info: "$memusage

splitit=${memusage##*"used"}
avmem=`echo $splitit | cut -d" " -f2 | awk '{print substr($0,1,length($0))}'`
avmem=`echo "${avmem//[!0-9]/}"`

	# convert value to GB
	avmem=$(((($avmem/1024)-500)/1024))

# check if enough free memory is available. End script if not.
if (( $avmem < $minxm ));
then
echo "Sorry, not enough free memory. Min free memory is: "$minfree"GB."" Ending process now..."
exit
fi


# ask for amount of memory or auto calculation
echo ""
echo "How much memory (in GB) should World2Xplane use?"
echo "For example write a 2 (only int numbers) for 2GB." "Available memory is: "$avmem"GB"
echo ""
echo "Write a number or press Enter to use computed amount of memory:"
read reponse
usrinput=$reponse

# Check user input. Use auto calculated amount if user entered 0 or enter
if [ "$usrinput" == "" ]
then
echo "Using computed amount of memory which is: "$avmem"GB"
echo "Press enter to continue"
read response
Xms=$avmem
Xmx=$avmem

# start World2Xplane
echo "starting World2Xplane"
java -d$arch -Xms$Xms"g" -Xmx$Xmx"g" -jar $rootpath$exec &

exit
fi

if (( $usrinput < $minxm ));
then
echo "Input number to low, using computed amount of memory which is: "$avmem"GB"
echo "Press enter to continue"
read response
Xms=$avmem
Xmx=$avmem

# start World2Xplane
echo "starting World2Xplane"
java -d$arch -Xms$Xms"g" -Xmx$Xmx"g" -jar $rootpath$exec &

exit
fi

# Use entered value
if (( $usrinput >= $minxm ));
then
Xms="$usrinput"
Xmx="$usrinput"

# start World2Xplane
echo "starting World2Xplane"
java -d$arch -Xms$Xms"g" -Xmx$Xmx"g" -jar $rootpath$exec &

exit
fi

# start World2Xplane
# echo "starting World2Xplane"
# java -d$arch -Xms$Xms"g" -Xmx$Xmx"g" -jar $rootpath$exec &


# Just for debugging
# echo "Final xxecutable is: ""java -d"$arch" -Xms"$Xms"g"" -Xmx"$Xmx"g -jar "$rootpath$exec

# end of script
