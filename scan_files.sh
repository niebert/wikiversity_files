#!/bin/bash

ROOT=./de
HTTP="./"
DOMAIN="https://de.wikiversity.org"
OUTPUT="./index.html" 
NOW=$(date +"%d.%m.%Y")
echo "<HTML>\n\t<HEAD>\n\t\t<TITLE>Wikiversity Files</TITLE>" > $OUTPUT
echo "\n<STYLE>" >> $OUTPUT
echo "\n body { font-family: Helvetica, Arial, Geneva, sans-serif; }" >> $OUTPUT
echo "\n</STYLE>" >> $OUTPUT
echo "\n\t<BODY>" >> $OUTPUT
echo "<H2>Wikiversity Files for Download</H2>" >> $OUTPUT
echo "<H3>Last Update: ${NOW}</H3>" >> $OUTPUT
echo "This file contains all additional files for learning resources in Wikiversity ${DOMAIN}." >> $OUTPUT
echo "The name of the folder refers to the learning resources in Wikiversity e.g. <tt>Diffusion</tt> to ${DOMAIN}/wiki/Diffusion." >> $OUTPUT
echo "Click on the folder displays the learning resources in Wikiversity for which the content was created." >> $OUTPUT
i=0
echo "<UL>" >> $OUTPUT
DOMAIN="$DOMAIN_DE" 
for filepath in `find "$ROOT" -maxdepth 1 -mindepth 1 -type d| sort`; do
  path=`basename "$filepath"`
  if [ "$path" = ".git" ]
	then
	echo "WARNING: Ignore '.git' folder for $OUTPUT"
  else
  	echo "DIR: $path"
  	echo "  <LI><b><a href='$DOMAIN/wiki/$path' target='_blank'>$path</a></b></LI>" >> $OUTPUT
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
DOMAIN="https://en.wikiversity.org"
ROOT=./en
for filepath in `find "$ROOT" -maxdepth 1 -mindepth 1 -type d| sort`; do
  path=`basename "$filepath"`
  if [ "$path" = ".git" ]
	then
	echo "WARNING: Ignore '.git' folder for $OUTPUT"
  else
  	echo "DIR: $path"
  	echo "  <LI><b><a href='$DOMAIN/wiki/$path' target='_blank'>$path</a></b></LI>" >> $OUTPUT
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