file(GLOB SRC1 test-exes/Test.cpp *.cpp)
add_executable(assign-2 ${SRC1})
target_link_libraries(assign-2 ${SVF_LIB} ${llvm_libs})

# set_target_properties(assign-2 PROPERTIES
#                        RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin )
