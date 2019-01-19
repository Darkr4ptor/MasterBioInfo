#	NAME: CreateNewProject.sh
#	AUTHOR: Santiago Garcia Martin
#	CONTACT: s.g.martin94@gmail.com
#	VERSION: 1.0.0
#	SUMMARY:
#	---------------------------------------------------------------	
#	This script takes one argument (project name and/or destination 
#	directory name). Then creates a whole set of subdirectories
#	branching from input
#	
#	DIRECTORIES: bin, src, docs, data, results.
#	FILES: README, LICENSE, CITATION
#
#	----------------------------------------------------------------

#!/bin/bash

ProjectName=$1


echo "CreateNewProject version 1.0.0 by SGM"
echo "Creating project" "$ProjectName..."

#check wether the  target already exists
if [ -d "$ProjectName" ]
then

echo "This directory" "$ProjectName" " already exists"
echo "Delete all its contents? Press Y/N then ENTER"

#If user presses Y, existing project is deleted. Exit otherwise
while(true);do

read -r input

	if [ "$input" == 'Y' ]; then
		rm -r "$ProjectName"
		echo "Old project deleted"
		break;
	else
		echo "Pressed NO. The script will exit now..."
		sleep 3
		exit;
	fi
done

fi


#Creating subfolders
echo "Generating directories..."
mkdir  -p "$ProjectName"/{bin,docs,src,results,data}

#Empty  project files
echo "Generating dummy text files..."
touch "$ProjectName/README" "$ProjectName/LICENSE" "$ProjectName/CITATION"

echo "Finished. Script will exit in 5 seconds..."
sleep 5s
exit
