#!/bin/bash

dbname="oving_calendar"
dbuser="thomaav"
date_format="+%A %b %d %H:%M"
default_color="\e[39m"
red="\e[31m"
yellow="\e[33m"
green="\e[32m"

function print_oving_info {
    # $1=color, $2=course, $3=info, $4=due_date
    echo -ne "$1"
    printf "$2\t $3\t"; echo $(date "$date_format" -d "$4")
    echo -ne "$default_color"
}

echo $(date "$date_format")
echo -----------------------------

psql -d $dbname -U $dbuser -qtA -c \
"SELECT course_id, info, due_date
 FROM oving
 WHERE due_date > now() AND finished = false
 ORDER BY due_date;" \ | while read oving;
do
    course=$(echo $oving | awk -F"|" '{print $1}')
    info=$(echo $oving | awk -F"|" '{print $2}')
    due_date=$(echo $oving | awk -F"|" '{print $3}')

    days_left=$(( ($(date +%s -d "$due_date") - $(date +%s)) / (60*60*24) ))
    case $days_left in
        [0-2])
	    print_oving_info "$red" "$course" "$info" "$due_date" ;;
	[3-5])
	    print_oving_info "$yellow" "$course" "$info" "$due_date" ;;
	*)
	    print_oving_info "$green" "$course" "$info" "$due_date" ;;
    esac
done



