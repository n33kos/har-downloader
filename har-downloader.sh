#!/bin/bash
# Parse special image links in order out of full har file
# har file copied from network tab console. probably good to sort by waterfall first
#
# >./har-downloader.sh filename.har

echo "Extracting Title..."
TITLE=$(cat $1 | grep -E -o "<title>.+</title>" | sed 's#<title>##' | sed 's#</title>##')

echo "Title: "$TITLE

echo "Extracting Urls..."
URLS=$(cat $1 | grep -E "url.+/chapters/.+.jpg" | sed 's#          \"url\"\: \"##g' | sed 's#",##g')

echo "Downloading Images..."
./scripts/urls-to-pdf.sh "${TITLE:-default}" $URLS
