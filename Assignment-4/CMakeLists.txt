include_directories( ${Z3MGR_DIR})
file(GLOB SOURCES
        *.cpp
)
list(REMOVE_ITEM SOURCES "${CMAKE_CURRENT_SOURCE_DIR}/test-sse.cpp")
set(LIB ${SVF_LIB} ${llvm_libs} ${Z3_LIBRARIES})
add_library(assign-4 ${SOURCES})
target_link_libraries(assign-4 ${LIB})
set_target_properties(assign-4 PROPERTIES
        RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib
        ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib
        RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib
)
add_executable(ass4 test-sse.cpp)
target_link_libraries(ass4 ${LIB} assign-4)
set_target_properties(ass4 PROPERTIES
        RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)

message(STATUS "Adding test for sse_assert_files")
file(GLOB ass4files RELATIVE ${CMAKE_CURRENT_SOURCE_DIR}/Tests "${CMAKE_CURRENT_SOURCE_DIR}/Tests/testcases/sse/*.ll")
message(STATUS "file for sse_assert_files: ${ass4files}")
foreach(filename ${ass4files})
    message(STATUS "Adding test for ${filename}")
    add_test(
            NAME ass4-cpp/${filename}
            COMMAND ass4 ${CMAKE_CURRENT_SOURCE_DIR}/Tests/${filename}
            WORKING_DIRECTORY ${CMAKE_BINARY_DIR}/bin
    )
endforeach()
