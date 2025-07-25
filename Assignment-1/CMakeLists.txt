cmake_minimum_required(VERSION 3.23)
PROJECT(UTS-Software-Engineer-Studio-Marking)

file(GLOB SRC1 test-exes/Test.cpp *.cpp)
add_executable(assign-1 ${SRC1})


