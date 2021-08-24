#!/bin/bash
if [ -n $1 ]; then
    file=$(basename $1 .c)
    clang -S -g -c -O0 -fno-discard-value-names -emit-llvm $1 -o $file.ll
    opt -S -mem2reg $file.ll -o $file.ll
else
echo "please give the .c file"
fi
