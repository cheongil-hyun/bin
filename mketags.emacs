#!/bin/sh

PATH_TO_FIND=`pwd`
TAGFILE="TAGS"
OPTS="--extra=+f -e -a -R -h \".h.c.cpp.java.s.S\""

while getopts o: o
do
	case "$o" in
		o)
			TAGFILE="$OPTARG";;
		[?])
			echo "Invalid args!!"
			;;
	esac
done
shift $(($OPTIND - 1))

if [ -n "$1" ]; then
	PATH_TO_FIND=$@
fi

echo "PATH: $PATH_TO_FIND"
echo "TAGFILE: $TAGFILE"
echo "OPTS: $OPTS"

# ctags $OPTS -f $TAGFILE $PATH_TO_FIND

find $PATH_TO_FIND -name "*.[chsS]" -o -name "*.cpp" -o -name "*.java" | xargs etags -a -o $TAGFILE -
