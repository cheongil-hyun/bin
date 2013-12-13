#!/bin/sh
cd android/kernel/
rm -rf cscope.*
make cscope
cd -
cd android/bootable/bootloader/lk/
rm -rf cscope.files cscope.out
mkcscope
cd -
cd android/bootable/recovery/
rm -rf cscope.files cscope.out
mkcscope
cd -
cd non_HLOS/boot_images/
rm -rf cscope.files cscope.out
mkcscope
cd -
cd non_HLOS/modem_proc/
rm -rf cscope.files cscope.out
mkcscope
cd -
cd non_HLOS/rpm_proc/
rm -rf cscope.files cscope.out
mkcscope
cd -
cd non_HLOS/adsp_proc/
rm -rf cscope.files cscope.out
mkcscope
cd -
cd non_HLOS/trustzone_images/
rm -rf cscope.files cscope.out
mkcscope
cd -
