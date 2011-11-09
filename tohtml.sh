#!/bin/bash
#
# Convert reports downloaded from declarations.ge from PDF to HTML.
#
# It takes two parameters:
# $1 - directory to read PDF files from
# $2 - direcotyr to write HTML files to
#############################################################################

BASEDIR=$PWD
PDFTOHTML=/usr/bin/pdftohtml

#############################################################################

if [ -z "$1" ]; then
    echo "Need directory to read PDF files from!"
    exit 1;
fi
if [ -z "$1" ]; then
    echo "Need directory to write HTML files to!"
    exit 2;
fi
PDF=$1
HTML=$2

for f in `ls $BASEDIR/$PDF/*.pdf`; do
    name=$(basename $f .pdf)
    echo "Converting $name"
    $PDFTOHTML -enc "UTF-8" -i -q -c -hidden -noframes $f $BASEDIR/$HTML/$name.html
    #break
done