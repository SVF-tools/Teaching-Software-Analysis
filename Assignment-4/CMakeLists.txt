include_directories(../Assignment-2)
include_directories(../Assignment-3)
file (GLOB SOURCES
   *.cpp
   ../Assignment-2/Assignment-2.cpp
   ../Assignment-3/Assignment-3.cpp
)

add_executable(assign-4 ${SOURCES})

target_link_libraries(assign-4 ${SVF_LIB} ${llvm_libs})

set_target_properties(assign-4 PROPERTIES
                       RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin )
