llvm_map_components_to_libnames(llvm_libs bitwriter core ipo irreader instcombine instrumentation target linker analysis scalaropts support )
file (GLOB SOURCES
    *.cpp
)
add_executable(codegraph ${SOURCES})

target_link_libraries(codegraph ${SVF_LIB} ${LLVMCudd} ${llvm_libs})

set_target_properties( codegraph PROPERTIES
                        RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin )