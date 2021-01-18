#!/bin/bash
source env.sh
mkdir build
cd build
cmake ..
make
cd ..
mv ./build/bin/svf-ex ./
