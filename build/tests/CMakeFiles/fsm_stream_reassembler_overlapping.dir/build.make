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
include tests/CMakeFiles/fsm_stream_reassembler_overlapping.dir/depend.make

# Include the progress variables for this target.
include tests/CMakeFiles/fsm_stream_reassembler_overlapping.dir/progress.make

# Include the compile flags for this target's objects.
include tests/CMakeFiles/fsm_stream_reassembler_overlapping.dir/flags.make

tests/CMakeFiles/fsm_stream_reassembler_overlapping.dir/fsm_stream_reassembler_overlapping.cc.o: tests/CMakeFiles/fsm_stream_reassembler_overlapping.dir/flags.make
tests/CMakeFiles/fsm_stream_reassembler_overlapping.dir/fsm_stream_reassembler_overlapping.cc.o: ../tests/fsm_stream_reassembler_overlapping.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/tracy/Desktop/sponge/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object tests/CMakeFiles/fsm_stream_reassembler_overlapping.dir/fsm_stream_reassembler_overlapping.cc.o"
	cd /home/tracy/Desktop/sponge/build/tests && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/fsm_stream_reassembler_overlapping.dir/fsm_stream_reassembler_overlapping.cc.o -c /home/tracy/Desktop/sponge/tests/fsm_stream_reassembler_overlapping.cc

tests/CMakeFiles/fsm_stream_reassembler_overlapping.dir/fsm_stream_reassembler_overlapping.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/fsm_stream_reassembler_overlapping.dir/fsm_stream_reassembler_overlapping.cc.i"
	cd /home/tracy/Desktop/sponge/build/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/tracy/Desktop/sponge/tests/fsm_stream_reassembler_overlapping.cc > CMakeFiles/fsm_stream_reassembler_overlapping.dir/fsm_stream_reassembler_overlapping.cc.i

tests/CMakeFiles/fsm_stream_reassembler_overlapping.dir/fsm_stream_reassembler_overlapping.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/fsm_stream_reassembler_overlapping.dir/fsm_stream_reassembler_overlapping.cc.s"
	cd /home/tracy/Desktop/sponge/build/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/tracy/Desktop/sponge/tests/fsm_stream_reassembler_overlapping.cc -o CMakeFiles/fsm_stream_reassembler_overlapping.dir/fsm_stream_reassembler_overlapping.cc.s

# Object files for target fsm_stream_reassembler_overlapping
fsm_stream_reassembler_overlapping_OBJECTS = \
"CMakeFiles/fsm_stream_reassembler_overlapping.dir/fsm_stream_reassembler_overlapping.cc.o"

# External object files for target fsm_stream_reassembler_overlapping
fsm_stream_reassembler_overlapping_EXTERNAL_OBJECTS =

tests/fsm_stream_reassembler_overlapping: tests/CMakeFiles/fsm_stream_reassembler_overlapping.dir/fsm_stream_reassembler_overlapping.cc.o
tests/fsm_stream_reassembler_overlapping: tests/CMakeFiles/fsm_stream_reassembler_overlapping.dir/build.make
tests/fsm_stream_reassembler_overlapping: tests/libspongechecks.a
tests/fsm_stream_reassembler_overlapping: libsponge/libsponge.a
tests/fsm_stream_reassembler_overlapping: tests/CMakeFiles/fsm_stream_reassembler_overlapping.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/tracy/Desktop/sponge/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable fsm_stream_reassembler_overlapping"
	cd /home/tracy/Desktop/sponge/build/tests && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/fsm_stream_reassembler_overlapping.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
tests/CMakeFiles/fsm_stream_reassembler_overlapping.dir/build: tests/fsm_stream_reassembler_overlapping

.PHONY : tests/CMakeFiles/fsm_stream_reassembler_overlapping.dir/build

tests/CMakeFiles/fsm_stream_reassembler_overlapping.dir/clean:
	cd /home/tracy/Desktop/sponge/build/tests && $(CMAKE_COMMAND) -P CMakeFiles/fsm_stream_reassembler_overlapping.dir/cmake_clean.cmake
.PHONY : tests/CMakeFiles/fsm_stream_reassembler_overlapping.dir/clean

tests/CMakeFiles/fsm_stream_reassembler_overlapping.dir/depend:
	cd /home/tracy/Desktop/sponge/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/tracy/Desktop/sponge /home/tracy/Desktop/sponge/tests /home/tracy/Desktop/sponge/build /home/tracy/Desktop/sponge/build/tests /home/tracy/Desktop/sponge/build/tests/CMakeFiles/fsm_stream_reassembler_overlapping.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : tests/CMakeFiles/fsm_stream_reassembler_overlapping.dir/depend

