#!/bin/sh
rm -rf *_TAGS
mketags -o BOOT_TAGS non_HLOS/boot_images/
mketags -o MODEM_TAGS non_HLOS/modem_proc/
mketags -o RPM_TAGS non_HLOS/rpm_proc/
mketags -o ADSP_TAGS non_HLOS/adsp_proc/
mketags -o TRUSTZONE_TAGS non_HLOS/trustzone_images/
mketags -o LK_TAGS android/bootable/bootloader/lk/
mketags -o RECOVERY_TAGS android/bootable/recovery/
cd android/kernel/
rm TAGS
make TAGS
cd -

