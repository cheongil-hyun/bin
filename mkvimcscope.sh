#!/bin/sh
@echo "deleting the cscope.files cscope.out tags"
rm -rf cscope.files cscope.out tags

@echo "making the cscope.files"
find $PWD \( -name '*.c' -o -name '*.cpp' -o -name '*.cc' -o -name '*.h' -o -name '*.s' -o -name '*.S' -o -name '*.java' \) -print > cscope.files

@echo "makig the cscope.out"
cscope -b -i cscope.files

@echo "making the ctags"
ctags -R

@echo "done"
