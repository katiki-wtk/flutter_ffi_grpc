cmake_minimum_required(VERSION 3.10)
project(persons_lib)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_POSITION_INDEPENDENT_CODE ON)

add_library(persons SHARED
  persons.cpp
  persons_c_ffi.cpp
)

target_include_directories(persons PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})
