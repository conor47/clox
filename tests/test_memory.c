#include "unity.h"
#include "chunk.h"
#include "memory.h"

// Test GROW_CAPACITY macro correctly initializes a new chunk to a capacity of 8
void test_macro_growCapacity_initialize_to_8(void) {
    Chunk chunk;
    initChunk(&chunk);
    int newCapacity = GROW_CAPACITY(chunk.capacity);
    TEST_ASSERT_EQUAL_INT(8, newCapacity);
}

// Test GROW_CAPACITY macro correctly doubles chunk capacity when capacity is greater than 8
void test_macro_growCapacity_double_capacity(void) {
    Chunk chunk;
    initChunk(&chunk);
    int capacity1 = GROW_CAPACITY(chunk.capacity);
    chunk.capacity = capacity1;
    int capacity2 = GROW_CAPACITY(chunk.capacity);
    chunk.capacity = capacity2;
    int capacity3 = GROW_CAPACITY(chunk.capacity);
    TEST_ASSERT_EQUAL_INT(8, capacity1);
    TEST_ASSERT_EQUAL_INT(16, capacity2);
    TEST_ASSERT_EQUAL_INT(32, capacity3);
}

// Test GROW_ARRAY macro 
void test_GROW_ARRAY(void) {
    int* numbers = NULL; 
    int oldCount = 0;
    int newCount = 8; 

    numbers = GROW_ARRAY(int, numbers, oldCount, newCount);

    TEST_ASSERT_NOT_NULL(numbers); 
    TEST_ASSERT_EQUAL_PTR(numbers, reallocate(NULL, 0, sizeof(int) * newCount)); 

    FREE_ARRAY(int, numbers, newCount);
}