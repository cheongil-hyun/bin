#!/bin/bash

find . -name .git | sed 's/\/\.git//' | xargs -i repo forall {} -c $@
