#!/bin/sh
rm -rf $1
mketags -o $1 $2
cd $2
rm -rf cscope.files cscope.out
mkcscope
cd -
