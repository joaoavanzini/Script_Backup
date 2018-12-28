#!/bin/bash

#colors
green='\e[1;32m'
white='\e[1;37m'
red='\e[1;31m'
yellow='\e[0;33m'
blue='\e[1;34m'
reset="\033[0m"

#any variable
DATE_TIME=`date '+%Y-%m-%d--%H:%M:%S'`
DATE_TIME_NOSEC=`date '+%Y-%m-%d--%H-%M'`
DATE_WEEK=`date '+%a'`
TIME=`date '+%H:%M'`

#directories of backup
BKP_NAME="backup-$DATE_TIME.tar.tgz"

#inicializando
echo -e "$white date and time local: $reset $vermelho $DATE_TIME $reset"
echo -e "$white day of the week: $reset $vermelho$DATE_WEEK $reset"
echo -e "$red    __               __              $reset";
echo -e "$red   / /_  ____ ______/ /____  ______  $reset";
echo -e "$red  / __ \/ __ \`/ ___/ //_/ / / / __ \ $reset";
echo -e "$red / /_/ / /_/ / /__/ ,< / /_/ / /_/ / $reset";
echo -e "$red/_.___/\__,_/\___/_/|_|\__,_/ .___/  $reset";
echo -e "$red                           /_/       $reset";
echo -e "$green Script of backup$reset$azul - monday up until friday at 2:45AM - GMT 0300 $reset";
echo "";

#condicoes
if [ "$DATE_WEEK" != "Sat" ]; then
	if [ "$DATE_WEEK" != "Sun" ]; then
		if [ "$TIME" = "22:53" ]; then
			echo -e "$red -> making backup of file web... $reset";
			tar -cf /dados/backups/backup-$DATE_TIME_NOSEC.tar /var/www/html;
			echo -e "$red -> listing all files with .tar: $reset";
			tar -tf /dados/backups/backup-$DATE_TIME_NOSEC.tar
			echo -e "$red -> backup done into /dados/backups...$reset";
			echo -e "$red -> compacting...$reset";
			gzip /dados/backups/backup-$DATE_TIME_NOSEC.tar
			echo -e "$red -> compacted...$reset"
		else
			echo -e "$red -> could not backup this time $reset"
		fi
	fi
fi
