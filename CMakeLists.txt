cmake_minimum_required(VERSION 3.24)

project(la-gauss-seidel
	LANGUAGES C Fortran
	VERSION 0.2.0)

include(CheckCCompilerFlag)

message(STATUS "CPU: ${CMAKE_HOST_SYSTEM_PROCESSOR}")

set(CMAKE_C_STANDARD 11)
set(CMAKE_C_EXTENSIONS ON)
set(CMAKE_C_STANDARD_REQUIRED ON)

set(CMAKE_C_FLAGS "-pipe")

CHECK_C_COMPILER_FLAG(-march=native HAS_CC_MARCH_NATIVE)
if(HAS_CC_MARCH_NATIVE)
	string(APPEND CMAKE_C_FLAGS " -march=native")
	string(APPEND CMAKE_Fortran_FLAGS " -march=native")
endif()

if (CMAKE_C_COMPILER_ID STREQUAL "GNU")
	set(CMAKE_C_FLAGS_DEBUG "-Og")
	set(CMAKE_Fortran_FLAGS_DEBUG "-Og")
else()
	set(CMAKE_C_FLAGS_DEBUG "-O0")
	set(CMAKE_Fortran_FLAGS_DEBUG "-O0")
endif()
string(APPEND CMAKE_C_FLAGS_DEBUG " -ggdb3 -Wall -Wextra -Wno-unused-parameter")
string(APPEND CMAKE_Fortran_FLAGS_DEBUG " -ggdb3 -Wall -Wextra")

set(CMAKE_C_FLAGS_RELEASE "-O3")
set(CMAKE_Fortran_FLAGS_RELEASE "-O3")

if(NOT CMAKE_BUILD_TYPE)
	set(CMAKE_BUILD_TYPE "Release")
endif()
message(STATUS "Build type: ${CMAKE_BUILD_TYPE}")

add_subdirectory("src")
add_subdirectory("test")

enable_testing()
