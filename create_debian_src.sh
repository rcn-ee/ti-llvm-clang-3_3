#!/bin/bash

ln -s . ti-llvm-3.3-3.3

tar -czvf ti-llvm-3.3-3.3.tar.gz ./ti-llvm-3.3-3.3/* --exclude=.git\* --exclude=\*.tar\* --exclude=ti-llvm-3.3-3.3/ti-llvm-3.3-3.3

rm ti-llvm-3.3-3.3
