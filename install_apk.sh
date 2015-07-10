#!/bin/bash
for i in $( ls *.apk); do
	echo adb install $i
	adb install $i
done