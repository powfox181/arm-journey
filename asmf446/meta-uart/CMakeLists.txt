cmake_minimum_required(VERSION 3.21)

set(CMAKE_TOOLCHAIN_FILE ${CMAKE_CURRENT_SOURCE_DIR}/../asmtchain.cmake)

set(srcdir ${CMAKE_CURRENT_SOURCE_DIR})

project(meta-uart-obj ASM)

add_compile_options(-x assembler -mthumb -ggdb -mcpu=cortex-m4 -mfpu=fpv4-sp-d16 -mtune=cortex-m4)

#include_directories(${PROJECT_SOURCE_DIR})
add_executable( ${PROJECT_NAME} ma.s head.s ${srcdir}/../start.s)


#cmake_exe_linker_flag : linker control, adding options for linker
set(linker_script "${CMAKE_CURRENT_SOURCE_DIR}/../stf446.ld")
set(CMAKE_EXE_LINKER_FLAGS  "${CMAKE_EXE_LINKER_FLAGS} -nostartfiles -nodefaultlibs -nolibc -nostdlib -T ${linker_script} -Wl,-Map,ohno.map")

 