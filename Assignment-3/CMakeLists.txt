llvm_map_components_to_libnames(llvm_libs bitwriter core ipo irreader instcombine instrumentation target linker analysis scalaropts support )
file (GLOB SOURCES
   *.cpp
)
add_executable(assign-3 ${SOURCES})

target_link_libraries(assign-3 ${SVF_LIB} ${LLVMCudd} ${llvm_libs})

set_target_properties( assign-3 PROPERTIES
                       RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin )