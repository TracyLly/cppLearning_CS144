# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.16

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
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
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/tracy/Desktop/sponge

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/tracy/Desktop/sponge/build

# Include any dependencies generated for this target.
include tests/CMakeFiles/byte_stream_construction.dir/depend.make

# Include the progress variables for this target.
include tests/CMakeFiles/byte_stream_construction.dir/progress.make

# Include the compile flags for this target's objects.
include tests/CMakeFiles/byte_stream_construction.dir/flags.make

tests/CMakeFiles/byte_stream_construction.dir/byte_stream_construction.cc.o: tests/CMakeFiles/byte_stream_construction.dir/flags.make
tests/CMakeFiles/byte_stream_construction.dir/byte_stream_construction.cc.o: ../tests/byte_stream_construction.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/tracy/Desktop/sponge/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object tests/CMakeFiles/byte_stream_construction.dir/byte_stream_construction.cc.o"
	cd /home/tracy/Desktop/sponge/build/tests && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/byte_stream_construction.dir/byte_stream_construction.cc.o -c /home/tracy/Desktop/sponge/tests/byte_stream_construction.cc

tests/CMakeFiles/byte_stream_construction.dir/byte_stream_construction.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/byte_stream_construction.dir/byte_stream_construction.cc.i"
	cd /home/tracy/Desktop/sponge/build/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/tracy/Desktop/sponge/tests/byte_stream_construction.cc > CMakeFiles/byte_stream_construction.dir/byte_stream_construction.cc.i

tests/CMakeFiles/byte_stream_construction.dir/byte_stream_construction.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/byte_stream_construction.dir/byte_stream_construction.cc.s"
	cd /home/tracy/Desktop/sponge/build/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/tracy/Desktop/sponge/tests/byte_stream_construction.cc -o CMakeFiles/byte_stream_construction.dir/byte_stream_construction.cc.s

# Object files for target byte_stream_construction
byte_stream_construction_OBJECTS = \
"CMakeFiles/byte_stream_construction.dir/byte_stream_construction.cc.o"

# External object files for target byte_stream_construction
byte_stream_construction_EXTERNAL_OBJECTS =

tests/byte_stream_construction: tests/CMakeFiles/byte_stream_construction.dir/byte_stream_construction.cc.o
tests/byte_stream_construction: tests/CMakeFiles/byte_stream_construction.dir/build.make
tests/byte_stream_construction: tests/libspongechecks.a
tests/byte_stream_construction: libsponge/libsponge.a
tests/byte_stream_construction: tests/CMakeFiles/byte_stream_construction.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/tracy/Desktop/sponge/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable byte_stream_construction"
	cd /home/tracy/Desktop/sponge/build/tests && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/byte_stream_construction.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
tests/CMakeFiles/byte_stream_construction.dir/build: tests/byte_stream_construction

.PHONY : tests/CMakeFiles/byte_stream_construction.dir/build

tests/CMakeFiles/byte_stream_construction.dir/clean:
	cd /home/tracy/Desktop/sponge/build/tests && $(CMAKE_COMMAND) -P CMakeFiles/byte_stream_construction.dir/cmake_clean.cmake
.PHONY : tests/CMakeFiles/byte_stream_construction.dir/clean

tests/CMakeFiles/byte_stream_construction.dir/depend:
	cd /home/tracy/Desktop/sponge/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/tracy/Desktop/sponge /home/tracy/Desktop/sponge/tests /home/tracy/Desktop/sponge/build /home/tracy/Desktop/sponge/build/tests /home/tracy/Desktop/sponge/build/tests/CMakeFiles/byte_stream_construction.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : tests/CMakeFiles/byte_stream_construction.dir/depend

