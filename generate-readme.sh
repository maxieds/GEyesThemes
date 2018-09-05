#!/bin/bash 

docstring=""
while read tdir;
do
	seqnum=$(cat $tdir/revs | tail -n 1 | sed -e 's/Sequence Number: //');
	ssimg="$tdir/$tdir.png";
	linehdr="### #$seqnum : $tdir themeNEWLINE";
	imgsrc="<img src=\"https://github.com/maxieds/GEyesThemes/blob/master/$ssimg\" />NEWLINE\n";
	docstring="$docstring$linehdr$imgsrc";
done <themes-list.txt
sorteddocs=$(echo -e $docstring | sort -V --dictionary-order | sed -e 's/NEWLINE/\\n\\n/g')
echo -e $sorteddocs
sorteddocs=$(echo $sorteddocs | sed -e 's/ \#\#\#/\#\#\#/g');
echo -e $sorteddocs >> README.md
