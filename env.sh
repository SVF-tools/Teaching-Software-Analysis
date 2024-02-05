#!/bin/bash
  
PROJECTHOME=$(pwd)
sysOS=`uname -s`
MajorLLVMVer=16
LLVMVer=${MajorLLVMVer}.0.0

LLVMHome="${LLVMVer}.obj"
Z3Home="z3.obj"
install_path=`npm root`

if [[ $sysOS == "Darwin" ]]
then
    LLVM_DIR="$(brew --prefix llvm@${MajorLLVMVer})"
elif [[ $sysOS == "Linux" ]]
then
    LLVM_DIR=$install_path/$LLVMHome
fi

Z3_DIR=$install_path/$Z3Home

export LLVM_DIR=$LLVM_DIR
export Z3_DIR=$Z3_DIR
export PATH=$LLVM_DIR/bin:$PATH
export PATH=$PROJECTHOME/bin:$PATH

echo "export LLVM_DIR=$LLVM_DIR" >> ~/.bashrc
echo "export Z3_DIR=$Z3_DIR" >> ~/.bashrc
echo "export PATH=$LLVM_DIR/bin:$PROJECTHOME/bin:$PATH" >> ~/.bashrc
export SVF_DIR=$install_path/SVF/

echo "LLVM_DIR="$LLVM_DIR
echo "SVF_DIR="$SVF_DIR
echo "Z3_DIR="$Z3_DIR
