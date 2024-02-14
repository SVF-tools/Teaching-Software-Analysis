file (GLOB SOURCES
   *.cpp
)
add_executable(assign-3 ${SOURCES})

target_link_libraries(assign-3 ${SVF_LIB} ${llvm_libs})

set_target_properties( assign-3 PROPERTIES
                       RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin )
