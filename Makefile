SRC_DIR := src
BUILD_DIR := build

# Sources and objects for the main program
SOURCES := $(wildcard $(SRC_DIR)/*.c)
# Exclude main.c for the test build
TESTABLE_SOURCES := $(filter-out $(SRC_DIR)/main.c, $(SOURCES))
OBJECTS := $(SOURCES:$(SRC_DIR)/%.c=$(BUILD_DIR)/%.o)
TESTABLE_OBJECTS := $(TESTABLE_SOURCES:$(SRC_DIR)/%.c=$(BUILD_DIR)/%.o)

TARGET := $(BUILD_DIR)/program

CC := gcc
CFLAGS := -I$(SRC_DIR) -I$(UNITY_DIR) -c

all: $(TARGET)

$(TARGET): $(OBJECTS)
	$(CC) $^ -o $@

$(BUILD_DIR)/%.o: $(SRC_DIR)/%.c
	$(CC) $(CFLAGS) $< -o $@

# Test configuration
TEST_SRC_DIR := tests
UNITY_DIR := tests/unity
TEST_RUNNER_SRC := $(TEST_SRC_DIR)/all_tests.c
UNITY_SRC := $(UNITY_DIR)/unity.c

# Objects for tests and Unity
TEST_RUNNER_OBJ := $(TEST_RUNNER_SRC:$(TEST_SRC_DIR)/%.c=$(BUILD_DIR)/%.o)
UNITY_OBJ := $(UNITY_SRC:$(UNITY_DIR)/%.c=$(BUILD_DIR)/%.o)
TEST_OBJECTS := $(filter-out $(BUILD_DIR)/all_tests.o, $(patsubst $(TEST_SRC_DIR)/%.c,$(BUILD_DIR)/%.o,$(wildcard $(TEST_SRC_DIR)/*.c)))

test: $(TEST_RUNNER_OBJ) $(UNITY_OBJ) $(TEST_OBJECTS) $(filter-out $(BUILD_DIR)/main.o, $(OBJECTS))
	$(CC) $^ -o $(BUILD_DIR)/test_runner
	./$(BUILD_DIR)/test_runner

$(BUILD_DIR)/%.o: $(TEST_SRC_DIR)/%.c
	$(CC) -Isrc -Itests/unity -c $< -o $@



$(BUILD_DIR)/%.o: $(UNITY_DIR)/%.c
	$(CC) $(CFLAGS) $< -o $@

$(shell mkdir -p $(BUILD_DIR))

clean:
	rm -rf $(BUILD_DIR)
