# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.12

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
CMAKE_COMMAND = /Applications/CLion.app/Contents/bin/cmake/mac/bin/cmake

# The command to remove a file.
RM = /Applications/CLion.app/Contents/bin/cmake/mac/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/vector_cat/gits/OTMapping

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/vector_cat/gits/OTMapping/cmake-build-release-1

# Include any dependencies generated for this target.
include CMakeFiles/graphcut_test_bin.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/graphcut_test_bin.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/graphcut_test_bin.dir/flags.make

CMakeFiles/graphcut_test_bin.dir/src/graphcut_test.cpp.o: CMakeFiles/graphcut_test_bin.dir/flags.make
CMakeFiles/graphcut_test_bin.dir/src/graphcut_test.cpp.o: ../src/graphcut_test.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/vector_cat/gits/OTMapping/cmake-build-release-1/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/graphcut_test_bin.dir/src/graphcut_test.cpp.o"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/graphcut_test_bin.dir/src/graphcut_test.cpp.o -c /Users/vector_cat/gits/OTMapping/src/graphcut_test.cpp

CMakeFiles/graphcut_test_bin.dir/src/graphcut_test.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/graphcut_test_bin.dir/src/graphcut_test.cpp.i"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/vector_cat/gits/OTMapping/src/graphcut_test.cpp > CMakeFiles/graphcut_test_bin.dir/src/graphcut_test.cpp.i

CMakeFiles/graphcut_test_bin.dir/src/graphcut_test.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/graphcut_test_bin.dir/src/graphcut_test.cpp.s"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/vector_cat/gits/OTMapping/src/graphcut_test.cpp -o CMakeFiles/graphcut_test_bin.dir/src/graphcut_test.cpp.s

# Object files for target graphcut_test_bin
graphcut_test_bin_OBJECTS = \
"CMakeFiles/graphcut_test_bin.dir/src/graphcut_test.cpp.o"

# External object files for target graphcut_test_bin
graphcut_test_bin_EXTERNAL_OBJECTS =

graphcut_test_bin: CMakeFiles/graphcut_test_bin.dir/src/graphcut_test.cpp.o
graphcut_test_bin: CMakeFiles/graphcut_test_bin.dir/build.make
graphcut_test_bin: libotmapping.a
graphcut_test_bin: /usr/local/lib/libboost_thread-mt.a
graphcut_test_bin: /usr/local/lib/libboost_system-mt.a
graphcut_test_bin: /usr/local/lib/libboost_chrono-mt.a
graphcut_test_bin: /usr/local/lib/libboost_date_time-mt.a
graphcut_test_bin: /usr/local/lib/libboost_atomic-mt.a
graphcut_test_bin: /usr/local/lib/libmpfr.dylib
graphcut_test_bin: /usr/local/lib/libgmp.dylib
graphcut_test_bin: /usr/local/lib/libboost_thread-mt.a
graphcut_test_bin: /usr/local/lib/libboost_chrono-mt.a
graphcut_test_bin: /usr/local/lib/libboost_system-mt.a
graphcut_test_bin: /usr/local/lib/libboost_date_time-mt.a
graphcut_test_bin: /usr/local/lib/libboost_atomic-mt.a
graphcut_test_bin: /System/Library/Frameworks/OpenGL.framework/OpenGL
graphcut_test_bin: imgui/libimgui.a
graphcut_test_bin: glfw/src/libglfw3.a
graphcut_test_bin: glad/libglad.a
graphcut_test_bin: libtinyexpr.a
graphcut_test_bin: CMakeFiles/graphcut_test_bin.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/vector_cat/gits/OTMapping/cmake-build-release-1/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable graphcut_test_bin"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/graphcut_test_bin.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/graphcut_test_bin.dir/build: graphcut_test_bin

.PHONY : CMakeFiles/graphcut_test_bin.dir/build

CMakeFiles/graphcut_test_bin.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/graphcut_test_bin.dir/cmake_clean.cmake
.PHONY : CMakeFiles/graphcut_test_bin.dir/clean

CMakeFiles/graphcut_test_bin.dir/depend:
	cd /Users/vector_cat/gits/OTMapping/cmake-build-release-1 && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/vector_cat/gits/OTMapping /Users/vector_cat/gits/OTMapping /Users/vector_cat/gits/OTMapping/cmake-build-release-1 /Users/vector_cat/gits/OTMapping/cmake-build-release-1 /Users/vector_cat/gits/OTMapping/cmake-build-release-1/CMakeFiles/graphcut_test_bin.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/graphcut_test_bin.dir/depend
