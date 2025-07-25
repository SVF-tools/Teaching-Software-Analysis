include_directories(../ ${GTRAV_DIR})
file(GLOB SOURCES
        Assignment-3.cpp
)
list(REMOVE_ITEM SOURCES "${CMAKE_CURRENT_SOURCE_DIR}/test.cpp")
set(LIB ${SVF_LIB} ${llvm_libs})
add_library(assign-3 ${SOURCES})
target_link_libraries(assign-3 ${LIB})
set_target_properties(assign-3 PROPERTIES
        RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib
        ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib
        RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib
)
add_executable(ass3 test.cpp)
target_link_libraries(ass3 ${LIB} assign-3)
set_target_properties(ass3 PROPERTIES
        RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)

# loops over pta_assert_files and run "ass3-pta $bc_file"
message(STATUS "Adding test for pta_assert_files")
file(GLOB pta_assert_files RELATIVE ${CMAKE_CURRENT_SOURCE_DIR} "${CMAKE_CURRENT_SOURCE_DIR}/Tests/testcases/pta/*.ll")
foreach(filename ${pta_assert_files})
    message(STATUS "Adding test for ${filename}")
    add_test(
            NAME ass3-pta-cpp/${filename}
            COMMAND ass3 -pta ${CMAKE_CURRENT_SOURCE_DIR}/${filename}
            WORKING_DIRECTORY ${CMAKE_BINARY_DIR}/bin
    )
    set_tests_properties(ass3-pta-cpp/${filename} PROPERTIES TIMEOUT 5)
endforeach()

message(STATUS "Adding test for icfg_assert_files")
file(GLOB icfg_assert_files RELATIVE ${CMAKE_CURRENT_SOURCE_DIR} "${CMAKE_CURRENT_SOURCE_DIR}/Tests/testcases/icfg/*.ll")
foreach(filename ${icfg_assert_files})
    add_test(
            NAME ass3-icfg-cpp/${filename}
            COMMAND ass3 -icfg ${CMAKE_CURRENT_SOURCE_DIR}/${filename}
            WORKING_DIRECTORY ${CMAKE_BINARY_DIR}/bin
    )
    set_tests_properties(ass3-icfg-cpp/${filename} PROPERTIES TIMEOUT 5)
endforeach()

message(STATUS "Adding test for taint_assert_files")
file(GLOB taint_assert_files RELATIVE ${CMAKE_CURRENT_SOURCE_DIR} "${CMAKE_CURRENT_SOURCE_DIR}/Tests/testcases/taint/*.ll")
foreach(filename ${taint_assert_files})
    add_test(
            NAME ass3-taint-cpp/${filename}
            COMMAND ass3 -taint ${CMAKE_CURRENT_SOURCE_DIR}/${filename}
            WORKING_DIRECTORY ${CMAKE_BINARY_DIR}/bin
    )
    set_tests_properties(ass3-taint-cpp/${filename} PROPERTIES TIMEOUT 5)
endforeach()

