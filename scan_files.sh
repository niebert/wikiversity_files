#!/bin/bash

ROOT=.
HTTP="./"
OUTPUT="./index.html" 
echo "<HTML>\n\t<HEAD>\n\t\t<TITLE>Wikiversity Files</TITLE>\n\t<BODY>" > $OUTPUT
echo "<H2>Wikiversity Files for Download</H2>" >> $OUTPUT

i=0
echo "<UL>" >> $OUTPUT
for filepath in `find "$ROOT" -maxdepth 1 -mindepth 1 -type d| sort`; do
  path=`basename "$filepath"`
  if [ "$path" = ".git" ]
	then
	echo "WARNING: Ignore '.git' folder for $OUTPUT"
  else
  	echo "DIR: $path"
  	echo "  <LI>$path</LI>" >> $OUTPUT
  	echo "  <UL>" >> $OUTPUT
  	echo "Filepath: $filepath"
  	rm "${filepath}/.DS_Store"
  	for i in `find "$filepath" -maxdepth 1 -mindepth 1 -type f| sort`; do
    	file=`basename "$i"`
    	if [ "$file" = "index.html" ]
			then
			echo "- WARNING: Ignore self-reference to 'index.html' file for $OUTPUT"
  		else
    		echo "- FILE: $file"
  			echo "    <LI><a href=\"$path/$file\">$file</a></LI>" >> $OUTPUT
  		fi
  	done
  	echo "  </UL>" >> $OUTPUT
  fi
done
echo "</UL>" >> $OUTPUT
echo "</BODY>" >> $OUTPUT
echo "</HTML>" >> $OUTPUT