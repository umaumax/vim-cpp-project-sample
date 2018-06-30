cmake_minimum_required(VERSION 3.11)

set(CMAKE_CXX_FLAGS "-std=c++11 -Wall")
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
# add_definitions("-DNDEBUG")

include_directories("include")

add_executable(cmake_test src/main.cpp)
# target_link_libraries(cmake_test pthread)
