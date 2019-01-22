#!/bin/sh

set -x


sed -i -e "s/##HOST##/${HOST:-}/; s/##HOST2##/${HOST2:-}/; s/##PORT##/${PORT:-443}/; s/##SSL##/${SSL:-True}/; s/##SKIP_SSL##/${SKIP_SSL:-False}/; s/##USERNAME##/${USERNAME:-User}/; s/##PASSWORD##/${PASSWORD:-Password}/;" /usr/share/curator/config/config_file.yml

sed -i -e "s/##CLOSE_COUNT##/${CLOSE_COUNT:-7}/; s/##DELETE_COUNT##/${DELETE_COUNT:-14}/;"  /usr/share/curator/config/action_file.yml


if [ -z "${HOST}" ]
then
	echo "Please enter Host-Adress (Client and Data Node)"
        exit 1
fi

if [ -z "${HOST2}" ]
then
	echo "Please enter Host-Adress2 (Client and Data Node)"
        exit 1
fi


if [ "$#" -le "0" ] ; 
then
	/usr/bin/curator --config /usr/share/curator/config/config_file.yml /usr/share/curator/config/action_file.yml
else
	$*

fi
