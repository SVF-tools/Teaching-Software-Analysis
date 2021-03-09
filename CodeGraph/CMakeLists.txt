llvm_map_components_to_libnames(llvm_libs bitwriter core ipo irreader instcombine instrumentation target linker analysis scalaropts support )
file (GLOB SOURCES
    *.cpp
)
add_executable(CodeGraph ${SOURCES})

target_link_libraries(CodeGraph ${SVF_LIB} ${LLVMCudd} ${llvm_libs})

set_target_properties( CodeGraph PROPERTIES
                        RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin )