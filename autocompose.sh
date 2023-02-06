#!/bin/bash

#Author: Martin Scheifinger
#This is a script that utilizes the composerize command developed by magicmark to turn a docker run command into a compose file and optionally starts the stack.

if [ "$1" = "-h" ] || [ "$1" = "-help" ]
 then
	echo "This is a script that utilizes the composerize command developed by magicmark to turn a docker run command into a compose file and optionally starts the stack."
	echo "Usage:"
	echo "autocompose -h  Displays this help message"
	echo "autocompose to run command"
	exit 0
fi

echo "Please enter the Docker run command (including \"docker run\"):"
read docker_run

composerize "$docker_run" 1> "./docker-compose.yml"

echo "Following Compose File has been created:"
cat docker-compose.yml


echo "Do you want to start the created compose file(y/N):"
read choice
if [ "$choice" = "y" ]
then
	sudo docker-compose up
else
	echo "Nothing was started"
	echo "Script will now exit"
	exit 0
fi

