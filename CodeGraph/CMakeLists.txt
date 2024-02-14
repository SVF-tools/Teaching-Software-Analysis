file (GLOB SOURCES
    *.cpp
)
add_executable(codegraph ${SOURCES})

target_link_libraries(codegraph ${SVF_LIB} ${llvm_libs})

set_target_properties( codegraph PROPERTIES
                        RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin )
