#!/bin/bash
#
# Requires:
#  - wget
#  - imagemagick (convert function)s
#
# Usage:
# $TITLE = Title of pdf
# $URLS = space separated list of URLS in correct order('url1' 'url2' ...etc)
# $> ./urls-to-pdf.sh $TITLE $URLS

# Make temp dir
DIRNAME=temp_`date +%s`
mkdir $DIRNAME;

# Download images from URLs.
printf "\n\n"
printf "Downloading images."
IMAGE_NUM=$(date +%s)
for var in "${@:2}"
do
  printf "."
  wget --output-document=./$DIRNAME/download_$IMAGE_NUM.jpg $var
  ((IMAGE_NUM++))
done

printf "\n Generating PDF..."
convert ./$DIRNAME/download_* -bordercolor white -border 10%x10% "$1".pdf

# printf "\n Cleaning up..."
rm -rf ./temp_*
