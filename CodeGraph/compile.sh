#!/bin/bash
if [ -n $1 ]; then
    cmake ..
    make
    clang -S -c -Xclang -disable-O0-optnone -fno-discard-value-names -emit-llvm $1 -o $1.ll
    opt -S -mem2reg $1.ll -o $1.ll
    ../bin/CodeGraph $1.ll
else
echo "please give the .c file"
fi