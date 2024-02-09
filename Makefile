# Define source and build directories
SRC_DIR := src
BUILD_DIR := build

# Automatically find all C source files
SOURCES := $(wildcard $(SRC_DIR)/*.c)
# Convert the .c filenames to .o filenames in the build directory
OBJECTS := $(SOURCES:$(SRC_DIR)/%.c=$(BUILD_DIR)/%.o)

# Target executable name
TARGET := build/program

# Compiler
CC := gcc
CFLAGS := -c

# Default target
all: $(TARGET)

$(TARGET): $(OBJECTS)
	$(CC) $(OBJECTS) -o $(TARGET)

$(BUILD_DIR)/%.o: $(SRC_DIR)/%.c
	$(CC) $(CFLAGS) $< -o $@

# Create the build directory if it doesn't exist
$(shell mkdir -p $(BUILD_DIR))

clean:
	rm -rf $(BUILD_DIR)
