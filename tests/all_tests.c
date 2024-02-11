#include "unity.h"

void test_function_chunkInitialize(void);
void test_function_chunkInitializeConstants(void);
void test_macro_growCapacity_initialize_to_8(void);
void test_macro_growCapacity_double_capacity(void);

void setUp(void) {
}

void tearDown(void) {
}

int main(void) {
    UNITY_BEGIN();
    RUN_TEST(test_function_chunkInitialize);
    RUN_TEST(test_function_chunkInitializeConstants);
    RUN_TEST(test_macro_growCapacity_initialize_to_8);
    RUN_TEST(test_macro_growCapacity_double_capacity);
    return UNITY_END();
}
