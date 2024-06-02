# Makefile for C projects

# Compiler and Linker
CC := gcc

# The target executable name
TARGET := bin/main

# Flags, Libraries and Includes
CFLAGS := -Wall -g -Iinclude
LDFLAGS := -Llib
LDLIBS := -lm

# Find all .c files in the src directory
SOURCES := $(wildcard src/*.c)
# Replace the .c from SOURCES with .o to obtain object files
OBJECTS := $(SOURCES:src/%.c=obj/%.o)

# Default target
all: $(TARGET)

# Rule to link the program
$(TARGET): $(OBJECTS)
	@mkdir -p bin
	$(CC) $(LDFLAGS) $^ -o $@ $(LDLIBS)

# Rule to compile source files to object files
obj/%.o: src/%.c
	@mkdir -p obj
	$(CC) $(CFLAGS) -c $< -o $@

# Clean up the build
clean:
	@rm -rf obj bin

# Run main app
run: $(TARGET)
	./bin/main

# Phony targets for cleanliness
.PHONY: all clean run

