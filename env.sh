#!/bin/bash

PROJECTHOME=$(pwd)
sysOS=`uname -s`
LLVMHome="llvm-10.0.0.obj"
install_path=`npm root`
export LLVM_DIR=$HOME/$LLVMHome
export PATH=$LLVM_DIR/bin:$PATH
export PATH=$PROJECTHOME/bin:$PATH
echo "export LLVM_DIR=$HOME/$LLVMHome" >> ~/.bashrc
echo "export PATH=$LLVM_DIR/bin:$PROJECTHOME/bin:$PATH" >> ~/.bashrc
if [[ $sysOS == "Darwin" ]]
then 
    export SVF_DIR=$install_path/SVF/
elif [[ $sysOS == "Linux" ]]
then 
    export SVF_DIR=$install_path/SVF/
fi 

echo "LLVM_DIR="$LLVM_DIR
echo "SVF_DIR="$SVF_DIR