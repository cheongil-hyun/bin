#!/bin/bash

cd /home001/cheongil.hyun/project/g3/
repo forall -c "git checkout -qf lamp_l_release; git clean -xdf"
# /home001/cheongil.hyun/bin/lr_sync.sh msm8974 lamp_l_release
repo sync -cqj16 --no-tags
cd /home001/cheongil.hyun/project/g3_mr1/
repo forall -c "git checkout -qf lamp_l_mr1_release; git clean -xdf"
repo sync -cqj16 --no-tags
# /home001/cheongil.hyun/bin/lr_sync.sh msm8974 lamp_l_mr1_release
cd /home001/cheongil.hyun/project/g4/
repo forall -c "git checkout -qf lamp_l_mr1_release; git clean -xdf"
repo sync -cqj16 --no-tags
# /home001/cheongil.hyun/bin/lr_sync.sh msm8992 lamp_l_mr1_release
cd /home001/cheongil.hyun/project/z2_mr1/
repo forall -c "git checkout -qf lamp_l_mr1_release; git clean -xdf"
repo sync -cqj16 --no-tags
# /home001/cheongil.hyun/bin/lr_sync.sh msm8994 lamp_l_mr1_release
cd /home001/cheongil.hyun/project/g3/android/kernel/
rm TAGS cscope.*
make TAGS cscope
cd /home001/cheongil.hyun/project/g3_mr1/android/kernel/
rm TAGS cscope.*
make TAGS cscope
cd /home001/cheongil.hyun/project/g4/android/kernel/
rm TAGS cscope.*
make TAGS cscope
cd /home001/cheongil.hyun/project/z2_mr1/android/kernel/
rm TAGS cscope.*
make TAGS cscope
cd
