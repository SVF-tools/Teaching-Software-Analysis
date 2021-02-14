#!/bin/bash
npm i --silent svf-lib --prefix ${HOME}
source ./env.sh
cmake -DCMAKE_BUILD_TYPE=Debug .
make
