cmake_minimum_required(VERSION 3.20)
# cmake_system_xxx  used to describe target system
set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_SYSTEM_VERSION 1.0)
set(CMAKE_SYSTEM_PROCESSOR Arm32)

# the tc itself will come with its own library and headers for target
set(CMAKE_C_COMPILER /opt/gccarm/bin/arm-none-eabi-gcc )
set(CMAKE_CXX_COMPILER /opt/gccarm/bin/arm-none-eabi-gcc)

# find_program looks for programs that is executed durihg the build
#   ==> should be searched in host file system

#find_library ==> find libs that used for linking purposes --> search in target environment

#find_file ==> many cases used in finding headers so should be used for target environment

# ==> CMAKE_FIND_ROOT_PATH  <== lists directories that contains target environment
set(CMAKE_FIND_ROOT_PATH ${CMAKE_CURRENT_SOURCE_DIR})
# WE ARE USING ASSEMBLER SO MOSTLY , WE DON'T USE LIBRARY

# this == find_program will never used find_root_path, which is target environment
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)

# this == find_library will use find_root_path location
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)

# this == set up for find_file and find_path, mostly look for headers of target system
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)

#for cross compiling, don't use try_run cuz u are not building for host system
# try_compile will try to compile with the toolchain
