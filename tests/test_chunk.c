#include "unity.h"
#include "chunk.h"
#include "memory.h"

void setUp(void) {
}

void tearDown(void) {
}

// Test initChunk correctly initilializes a given chunk
void test_function_chunkInitialize(void) {
    Chunk chunk;
    initChunk(&chunk);
    TEST_ASSERT_NULL(chunk.code);
    TEST_ASSERT_NULL(chunk.lines);
    TEST_ASSERT_EQUAL_INT(0,chunk.count);
    TEST_ASSERT_EQUAL_INT(0,chunk.capacity);
}

// Test initChunk correctly initializes a given chunks constants field
void test_function_chunkInitializeConstants(void) {
    Chunk chunk;
    initChunk(&chunk);
    TEST_ASSERT_NULL(chunk.constants.values);
    TEST_ASSERT_EQUAL_INT(0,chunk.constants.capacity);
    TEST_ASSERT_EQUAL_INT(0,chunk.constants.count);
}

// Test GROW_CAPACITY macro correctly initializes a new chunk to a capacity of 8
void test_macro_growCapacity(void) {
    Chunk chunk;
    initChunk(&chunk);
    int newCapacity = GROW_CAPACITY(chunk.capacity);
    TEST_ASSERT_EQUAL_INT(8, newCapacity);
}

int main(void) {
    UNITY_BEGIN();
    RUN_TEST(test_function_chunkInitialize);
    RUN_TEST(test_function_chunkInitializeConstants);
    RUN_TEST(test_macro_growCapacity);
    return UNITY_END();
}
