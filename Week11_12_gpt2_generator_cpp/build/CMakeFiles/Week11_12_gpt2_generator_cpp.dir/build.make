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
CMAKE_SOURCE_DIR = /home/lap13385/Projects/Zalo_AI_Fresher_Training/Week11_12_gpt2_generator_cpp

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/lap13385/Projects/Zalo_AI_Fresher_Training/Week11_12_gpt2_generator_cpp/build

# Include any dependencies generated for this target.
include CMakeFiles/Week11_12_gpt2_generator_cpp.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/Week11_12_gpt2_generator_cpp.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/Week11_12_gpt2_generator_cpp.dir/flags.make

CMakeFiles/Week11_12_gpt2_generator_cpp.dir/main.cpp.o: CMakeFiles/Week11_12_gpt2_generator_cpp.dir/flags.make
CMakeFiles/Week11_12_gpt2_generator_cpp.dir/main.cpp.o: ../main.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/lap13385/Projects/Zalo_AI_Fresher_Training/Week11_12_gpt2_generator_cpp/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/Week11_12_gpt2_generator_cpp.dir/main.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/Week11_12_gpt2_generator_cpp.dir/main.cpp.o -c /home/lap13385/Projects/Zalo_AI_Fresher_Training/Week11_12_gpt2_generator_cpp/main.cpp

CMakeFiles/Week11_12_gpt2_generator_cpp.dir/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/Week11_12_gpt2_generator_cpp.dir/main.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/lap13385/Projects/Zalo_AI_Fresher_Training/Week11_12_gpt2_generator_cpp/main.cpp > CMakeFiles/Week11_12_gpt2_generator_cpp.dir/main.cpp.i

CMakeFiles/Week11_12_gpt2_generator_cpp.dir/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/Week11_12_gpt2_generator_cpp.dir/main.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/lap13385/Projects/Zalo_AI_Fresher_Training/Week11_12_gpt2_generator_cpp/main.cpp -o CMakeFiles/Week11_12_gpt2_generator_cpp.dir/main.cpp.s

# Object files for target Week11_12_gpt2_generator_cpp
Week11_12_gpt2_generator_cpp_OBJECTS = \
"CMakeFiles/Week11_12_gpt2_generator_cpp.dir/main.cpp.o"

# External object files for target Week11_12_gpt2_generator_cpp
Week11_12_gpt2_generator_cpp_EXTERNAL_OBJECTS =

Week11_12_gpt2_generator_cpp: CMakeFiles/Week11_12_gpt2_generator_cpp.dir/main.cpp.o
Week11_12_gpt2_generator_cpp: CMakeFiles/Week11_12_gpt2_generator_cpp.dir/build.make
Week11_12_gpt2_generator_cpp: CMakeFiles/Week11_12_gpt2_generator_cpp.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/lap13385/Projects/Zalo_AI_Fresher_Training/Week11_12_gpt2_generator_cpp/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable Week11_12_gpt2_generator_cpp"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/Week11_12_gpt2_generator_cpp.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/Week11_12_gpt2_generator_cpp.dir/build: Week11_12_gpt2_generator_cpp

.PHONY : CMakeFiles/Week11_12_gpt2_generator_cpp.dir/build

CMakeFiles/Week11_12_gpt2_generator_cpp.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/Week11_12_gpt2_generator_cpp.dir/cmake_clean.cmake
.PHONY : CMakeFiles/Week11_12_gpt2_generator_cpp.dir/clean

CMakeFiles/Week11_12_gpt2_generator_cpp.dir/depend:
	cd /home/lap13385/Projects/Zalo_AI_Fresher_Training/Week11_12_gpt2_generator_cpp/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/lap13385/Projects/Zalo_AI_Fresher_Training/Week11_12_gpt2_generator_cpp /home/lap13385/Projects/Zalo_AI_Fresher_Training/Week11_12_gpt2_generator_cpp /home/lap13385/Projects/Zalo_AI_Fresher_Training/Week11_12_gpt2_generator_cpp/build /home/lap13385/Projects/Zalo_AI_Fresher_Training/Week11_12_gpt2_generator_cpp/build /home/lap13385/Projects/Zalo_AI_Fresher_Training/Week11_12_gpt2_generator_cpp/build/CMakeFiles/Week11_12_gpt2_generator_cpp.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/Week11_12_gpt2_generator_cpp.dir/depend
