#!/bin/sh
# infinite loop for $@

while [ 1 ]
do
	$@
	sleep 3
done
