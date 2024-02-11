#include "unity.h"
#include "chunk.h"
#include "memory.h"

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