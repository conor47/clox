SRC_DIR := src
BUILD_DIR := build

SOURCES := $(wildcard $(SRC_DIR)/*.c)
OBJECTS := $(SOURCES:$(SRC_DIR)/%.c=$(BUILD_DIR)/%.o)

TARGET := build/program

CC := gcc
CFLAGS := -c

all: $(TARGET)

$(TARGET): $(OBJECTS)
	$(CC) $(OBJECTS) -o $(TARGET)

$(BUILD_DIR)/%.o: $(SRC_DIR)/%.c
	$(CC) $(CFLAGS) $< -o $@

$(shell mkdir -p $(BUILD_DIR))

clean:
	rm -rf $(BUILD_DIR)

TEST_SRC_DIR := tests
UNITY_DIR := tests/unity
TEST_SOURCES := $(wildcard $(TEST_SRC_DIR)/*.c)
TEST_OBJECTS := $(TEST_SOURCES:$(TEST_SRC_DIR)/%.c=$(BUILD_DIR)/%.o)
UNITY_SRC := $(UNITY_DIR)/unity.c
UNITY_OBJ := $(UNITY_SRC:$(UNITY_DIR)/%.c=$(BUILD_DIR)/%.o)

test: $(TEST_OBJECTS) $(UNITY_OBJ) $(filter-out $(BUILD_DIR)/main.o, $(OBJECTS))
	$(CC) -o $(BUILD_DIR)/test_runner $^
	./$(BUILD_DIR)/test_runner


$(BUILD_DIR)/%.o: $(TEST_SRC_DIR)/%.c
	$(CC) -I$(SRC_DIR) -I$(UNITY_DIR) -c $< -o $@

$(BUILD_DIR)/%.o: $(UNITY_DIR)/%.c
	$(CC) -c $< -o $@