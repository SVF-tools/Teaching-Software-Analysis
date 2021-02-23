add_executable(hello hello.cpp)
set_target_properties( hello PROPERTIES
                       RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin )