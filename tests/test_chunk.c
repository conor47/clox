#include "unity.h"
#include "chunk.h"

void setUp(void) {
}

void tearDown(void) {
}

void test_function_chunkInitialize(void) {
    Chunk chunk;
    initChunk(&chunk);
    TEST_ASSERT_NULL(chunk.code);
    TEST_ASSERT_NULL(chunk.lines);
    TEST_ASSERT_EQUAL_INT(0,chunk.count);
    TEST_ASSERT_EQUAL_INT(0,chunk.capacity);
}

int main(void) {
    UNITY_BEGIN();
    RUN_TEST(test_function_chunkInitialize);
    return UNITY_END();
}
