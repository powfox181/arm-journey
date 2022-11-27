# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.24

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /media/psf/stm/asmf446/bare1

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /media/psf/stm/asmf446/bare1

# Include any dependencies generated for this target.
include CMakeFiles/mybarebone.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/mybarebone.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/mybarebone.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/mybarebone.dir/flags.make

CMakeFiles/mybarebone.dir/ma.s.obj: CMakeFiles/mybarebone.dir/flags.make
CMakeFiles/mybarebone.dir/ma.s.obj: ma.s
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/media/psf/stm/asmf446/bare1/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building ASM object CMakeFiles/mybarebone.dir/ma.s.obj"
	/opt/gccarm/bin/arm-none-eabi-gcc $(ASM_DEFINES) $(ASM_INCLUDES) $(ASM_FLAGS) -o CMakeFiles/mybarebone.dir/ma.s.obj -c /media/psf/stm/asmf446/bare1/ma.s

CMakeFiles/mybarebone.dir/ma.s.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing ASM source to CMakeFiles/mybarebone.dir/ma.s.i"
	/opt/gccarm/bin/arm-none-eabi-gcc $(ASM_DEFINES) $(ASM_INCLUDES) $(ASM_FLAGS) -E /media/psf/stm/asmf446/bare1/ma.s > CMakeFiles/mybarebone.dir/ma.s.i

CMakeFiles/mybarebone.dir/ma.s.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling ASM source to assembly CMakeFiles/mybarebone.dir/ma.s.s"
	/opt/gccarm/bin/arm-none-eabi-gcc $(ASM_DEFINES) $(ASM_INCLUDES) $(ASM_FLAGS) -S /media/psf/stm/asmf446/bare1/ma.s -o CMakeFiles/mybarebone.dir/ma.s.s

CMakeFiles/mybarebone.dir/head.s.obj: CMakeFiles/mybarebone.dir/flags.make
CMakeFiles/mybarebone.dir/head.s.obj: head.s
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/media/psf/stm/asmf446/bare1/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building ASM object CMakeFiles/mybarebone.dir/head.s.obj"
	/opt/gccarm/bin/arm-none-eabi-gcc $(ASM_DEFINES) $(ASM_INCLUDES) $(ASM_FLAGS) -o CMakeFiles/mybarebone.dir/head.s.obj -c /media/psf/stm/asmf446/bare1/head.s

CMakeFiles/mybarebone.dir/head.s.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing ASM source to CMakeFiles/mybarebone.dir/head.s.i"
	/opt/gccarm/bin/arm-none-eabi-gcc $(ASM_DEFINES) $(ASM_INCLUDES) $(ASM_FLAGS) -E /media/psf/stm/asmf446/bare1/head.s > CMakeFiles/mybarebone.dir/head.s.i

CMakeFiles/mybarebone.dir/head.s.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling ASM source to assembly CMakeFiles/mybarebone.dir/head.s.s"
	/opt/gccarm/bin/arm-none-eabi-gcc $(ASM_DEFINES) $(ASM_INCLUDES) $(ASM_FLAGS) -S /media/psf/stm/asmf446/bare1/head.s -o CMakeFiles/mybarebone.dir/head.s.s

CMakeFiles/mybarebone.dir/start.s.obj: CMakeFiles/mybarebone.dir/flags.make
CMakeFiles/mybarebone.dir/start.s.obj: start.s
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/media/psf/stm/asmf446/bare1/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building ASM object CMakeFiles/mybarebone.dir/start.s.obj"
	/opt/gccarm/bin/arm-none-eabi-gcc $(ASM_DEFINES) $(ASM_INCLUDES) $(ASM_FLAGS) -o CMakeFiles/mybarebone.dir/start.s.obj -c /media/psf/stm/asmf446/bare1/start.s

CMakeFiles/mybarebone.dir/start.s.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing ASM source to CMakeFiles/mybarebone.dir/start.s.i"
	/opt/gccarm/bin/arm-none-eabi-gcc $(ASM_DEFINES) $(ASM_INCLUDES) $(ASM_FLAGS) -E /media/psf/stm/asmf446/bare1/start.s > CMakeFiles/mybarebone.dir/start.s.i

CMakeFiles/mybarebone.dir/start.s.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling ASM source to assembly CMakeFiles/mybarebone.dir/start.s.s"
	/opt/gccarm/bin/arm-none-eabi-gcc $(ASM_DEFINES) $(ASM_INCLUDES) $(ASM_FLAGS) -S /media/psf/stm/asmf446/bare1/start.s -o CMakeFiles/mybarebone.dir/start.s.s

# Object files for target mybarebone
mybarebone_OBJECTS = \
"CMakeFiles/mybarebone.dir/ma.s.obj" \
"CMakeFiles/mybarebone.dir/head.s.obj" \
"CMakeFiles/mybarebone.dir/start.s.obj"

# External object files for target mybarebone
mybarebone_EXTERNAL_OBJECTS =

mybarebone: CMakeFiles/mybarebone.dir/ma.s.obj
mybarebone: CMakeFiles/mybarebone.dir/head.s.obj
mybarebone: CMakeFiles/mybarebone.dir/start.s.obj
mybarebone: CMakeFiles/mybarebone.dir/build.make
mybarebone: CMakeFiles/mybarebone.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/media/psf/stm/asmf446/bare1/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Linking ASM executable mybarebone"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/mybarebone.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/mybarebone.dir/build: mybarebone
.PHONY : CMakeFiles/mybarebone.dir/build

CMakeFiles/mybarebone.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/mybarebone.dir/cmake_clean.cmake
.PHONY : CMakeFiles/mybarebone.dir/clean

CMakeFiles/mybarebone.dir/depend:
	cd /media/psf/stm/asmf446/bare1 && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /media/psf/stm/asmf446/bare1 /media/psf/stm/asmf446/bare1 /media/psf/stm/asmf446/bare1 /media/psf/stm/asmf446/bare1 /media/psf/stm/asmf446/bare1/CMakeFiles/mybarebone.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/mybarebone.dir/depend

