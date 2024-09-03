# Compiler
CXX = g++

# Directories
SRC_DIR = .
BUILD_DIR = build

# Source files
SRC_FILES = $(wildcard $(SRC_DIR)/*.cpp)

# Output files
DEBUG_OUTPUT = $(BUILD_DIR)/helloworld_debug
RELEASE_OUTPUT = $(BUILD_DIR)/helloworld_release

# Compiler flags
# -pedantic-errors flag will cause the compiler to issue an error for any code that violates the standard.
# -Wall -Weffc++ -Wextra -Wconversion -Wsign-conversion flags will enable additional warnings.
# -Werror flag will treat all warnings as errors.
# -std=c++23 flag will compile the code using the C++23 standard.
DEBUG_FLAGS = -ggdb -O0 -fdiagnostics-color=always -pedantic-errors -Wall -Weffc++ -Wextra -Wconversion -Wsign-conversion -Werror -std=c++23
RELEASE_FLAGS = -O3 -DNDEBUG -fdiagnostics-color=always -std=c++23

# Targets
all: debug release

debug: $(SRC_FILES)
	@mkdir -p $(BUILD_DIR)
	$(CXX) $(DEBUG_FLAGS) $^ -o $(DEBUG_OUTPUT)

# $^ is an automatic variable that represents all the prerequisites of the target.

release: $(SRC_FILES)
	@mkdir -p $(BUILD_DIR)
	$(CXX) $(RELEASE_FLAGS) $^ -o $(RELEASE_OUTPUT)

clean:
	rm -rf $(BUILD_DIR)

# In a makefile, .PHONY is a special target that marks other targets as "phony."
# Phony targets are not actual files; they are just names for commands to be executed.
# This is useful to avoid conflicts with files that might have the same name as the target.

.PHONY: all debug release clean