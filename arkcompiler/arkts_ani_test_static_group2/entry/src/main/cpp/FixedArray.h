/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#ifndef ARKTS_ANI_TEST_FIXEDARRAY_H
#define ARKTS_ANI_TEST_FIXEDARRAY_H
#include "Common.h"

const ani_size ZERO = 0;
const ani_size OFFSET_0 = 0;
const ani_size OFFSET_2 = 2;
const ani_size OFFSET_5 = 5;
const ani_size LENGTH_1 = 1;
const ani_size LENGTH_2 = 2;
const ani_size LENGTH_3 = 3;
const ani_size LENGTH_4 = 4;
const ani_size LENGTH_6 = 6;
const ani_size LENGTH_10 = 10;
const float TEST_VALUE_1 = 1.0F;
const float TEST_VALUE_2 = 2.0F;
const float TEST_VALUE_3 = 3.0F;
const float TEST_VALUE_4 = 4.0F;
const float TEST_VALUE_5 = 5.0F;
const ani_byte TEST_UPDATE_1 = 30U;
const ani_byte TEST_UPDATE_2 = 40U;
const ani_byte TEST_UPDATE_3 = 50U;
const ani_byte TEST_UPDATE_4 = 22U;
const ani_byte TEST_UPDATE_5 = 44U;
const ani_byte TEST_UPDATE_6 = 33U;
const ani_byte TEST_VAL_1 = 1U;
const ani_byte TEST_VAL_2 = 2U;
const ani_byte TEST_VAL_3 = 3U;
const ani_byte TEST_VAL_4 = 4U;
const ani_byte TEST_VAL_5 = 4U;
const short TEST_VL_1 = 1;
const short TEST_VL_2 = 2;
const short TEST_VL_3 = 3;
const short TEST_VL_4 = 4;
const short TEST_VL_5 = 5;
const short TEST_UPT_1 = 1;
const short TEST_UPT_2 = 2;
const short TEST_UPT_3 = 3;
const short TEST_UPT_4 = 4;
const short TEST_UPT_5 = 5;
const ani_size MINI_LENGTH = 10;
const ani_size MID_LENGTH = 50;
const ani_size BIG_LENGTH = 200;
const ani_size ARRAYSIZE_10K = 10240U;
const ani_size ARRAYSIZE_100K = 102400U;

ani_int test_FixedArray_GetLength([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_fixedarray_byte array = nullptr;
    ASSERT_EQ(env->FixedArray_New_Byte(LENGTH_5, &array), ANI_OK);
    ani_size length = 0;
    ASSERT_EQ(env->FixedArray_GetLength(array, &length), ANI_OK);
    ASSERT_EQ(length, LENGTH_5);
    return ANI_TRUE;
}

ani_int test_FixedArray_GetLength_01([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_fixedarray_byte array = nullptr;
    ASSERT_EQ(env->FixedArray_New_Byte(LENGTH_5, &array), ANI_OK);
    ani_size length = 0;
    ASSERT_EQ(env->FixedArray_GetLength(array, &length), ANI_OK);
    ASSERT_EQ(length, LENGTH_5);
    return ANI_TRUE;
}

ani_int test_FixedArray_GetLength_02([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_size arraySize = LENGTH_5;
    ani_size length = 0;
    ani_fixedarray_boolean array = nullptr;
    ASSERT_EQ(env_->FixedArray_New_Boolean(arraySize, &array), ANI_OK);
    ASSERT_EQ(env_->FixedArray_GetLength(array, &length), ANI_OK);
    ASSERT_EQ(length, arraySize);
    arraySize = arraySize + 1U;
    ani_fixedarray_char array2 = nullptr;
    ASSERT_EQ(env_->FixedArray_New_Char(arraySize, &array2), ANI_OK);
    ASSERT_EQ(env_->FixedArray_GetLength(array2, &length), ANI_OK);
    ASSERT_EQ(length, arraySize);
    arraySize = arraySize + 1U;
    ani_fixedarray_byte array3 = nullptr;
    ASSERT_EQ(env_->FixedArray_New_Byte(arraySize, &array3), ANI_OK);
    ASSERT_EQ(env_->FixedArray_GetLength(array3, &length), ANI_OK);
    ASSERT_EQ(length, arraySize);
    arraySize = arraySize + 1U;
    ani_fixedarray_short array4 = nullptr;
    ASSERT_EQ(env_->FixedArray_New_Short(arraySize, &array4), ANI_OK);
    ASSERT_EQ(env_->FixedArray_GetLength(array4, &length), ANI_OK);
    ASSERT_EQ(length, arraySize);
    arraySize = arraySize + 1U;
    ani_fixedarray_int array5 = nullptr;
    ASSERT_EQ(env_->FixedArray_New_Int(arraySize, &array5), ANI_OK);
    ASSERT_EQ(env_->FixedArray_GetLength(array5, &length), ANI_OK);
    ASSERT_EQ(length, arraySize);
    arraySize = arraySize + 1U;
    ani_fixedarray_long array6 = nullptr;
    ASSERT_EQ(env_->FixedArray_New_Long(arraySize, &array6), ANI_OK);
    ASSERT_EQ(env_->FixedArray_GetLength(array6, &length), ANI_OK);
    ASSERT_EQ(length, arraySize);
    arraySize = arraySize + 1U;
    ani_fixedarray_float array7 = nullptr;
    ASSERT_EQ(env_->FixedArray_New_Float(arraySize, &array7), ANI_OK);
    ASSERT_EQ(env_->FixedArray_GetLength(array7, &length), ANI_OK);
    ASSERT_EQ(length, arraySize);
    arraySize = arraySize + 1U;
    ani_fixedarray_double array8 = nullptr;
    ASSERT_EQ(env_->FixedArray_New_Double(arraySize, &array8), ANI_OK);
    ASSERT_EQ(env_->FixedArray_GetLength(array8, &length), ANI_OK);
    ASSERT_EQ(length, arraySize);
    return ANI_TRUE;
}

ani_int test_FixedArray_Boolean([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_fixedarray_boolean array = nullptr;
    ASSERT_EQ(env->FixedArray_New_Boolean(LENGTH_5, &array), ANI_OK);
    ani_boolean nativeBuffer[LENGTH_10] = {ANI_TRUE};
    ASSERT_EQ(env->FixedArray_GetRegion_Boolean(array, OFFSET_0, LENGTH_1, nativeBuffer), ANI_OK);
    ASSERT_EQ(env->FixedArray_SetRegion_Boolean(array, OFFSET_0, LENGTH_5, nativeBuffer), ANI_OK);
    return ANI_TRUE;
}

ani_int test_FixedArray_Boolean_01([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_fixedarray_boolean array = nullptr;
    ASSERT_EQ(env_->FixedArray_New_Boolean(LENGTH_5, &array), ANI_OK);
    ani_boolean nativeBuffer[LENGTH_10] = {ANI_TRUE};
    ASSERT_EQ(env_->FixedArray_GetRegion_Boolean(array, OFFSET_0, LENGTH_1, nullptr), ANI_INVALID_ARGS);
    ASSERT_EQ(env_->FixedArray_GetRegion_Boolean(array, OFFSET_0, LENGTH_5, nativeBuffer), ANI_OUT_OF_RANGE);
    return ANI_TRUE;
}

ani_int test_FixedArray_Boolean_02([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env_->FindClass("fixedarray_region_boolean_test.ArrayClass", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_ref ref = nullptr;
    ASSERT_EQ(env_->Class_GetStaticFieldByName_Ref(cls, "array", &ref), ANI_OK);
    ASSERT_NE(ref, nullptr);

    auto array = reinterpret_cast<ani_fixedarray_boolean>(ref);
    ani_boolean nativeBuffer[LENGTH_5] = {ANI_FALSE};

    ASSERT_EQ(env_->FixedArray_GetRegion_Boolean(array, OFFSET_0, LENGTH_5, nativeBuffer), ANI_OK);
    ASSERT_EQ(nativeBuffer[0U], ANI_TRUE);
    ASSERT_EQ(nativeBuffer[1U], ANI_TRUE);
    ASSERT_EQ(nativeBuffer[2U], ANI_TRUE);
    ASSERT_EQ(nativeBuffer[3U], ANI_TRUE);
    ASSERT_EQ(nativeBuffer[4U], ANI_TRUE);

    ASSERT_EQ(env_->Class_CallStaticMethodByName_Void(cls, "changeStaticArray", nullptr), ANI_OK);
    ASSERT_EQ(env_->FixedArray_GetRegion_Boolean(array, OFFSET_0, LENGTH_5, nativeBuffer), ANI_OK);
    ASSERT_EQ(nativeBuffer[0U], ANI_TRUE);
    ASSERT_EQ(nativeBuffer[1U], ANI_TRUE);
    ASSERT_EQ(nativeBuffer[2U], ANI_FALSE);
    ASSERT_EQ(nativeBuffer[3U], ANI_TRUE);
    ASSERT_EQ(nativeBuffer[4U], ANI_FALSE);
    return ANI_TRUE;
}

ani_int test_FixedArray_Boolean_03([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env_->FindClass("fixedarray_region_boolean_test.ArrayClass", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_ref ref = nullptr;
    ASSERT_EQ(env_->Class_GetStaticFieldByName_Ref(cls, "array", &ref), ANI_OK);
    ASSERT_NE(ref, nullptr);

    auto array = reinterpret_cast<ani_fixedarray_boolean>(ref);
    ani_boolean nativeBuffer[LENGTH_5] = {ANI_FALSE, ANI_FALSE, ANI_FALSE};
    ASSERT_EQ(env_->FixedArray_SetRegion_Boolean(array, OFFSET_0, LENGTH_5, nativeBuffer), ANI_OK);

    ani_boolean result = ANI_FALSE;
    ASSERT_EQ(env_->Class_CallStaticMethodByName_Boolean(cls, "checkStaticArray", nullptr, &result), ANI_OK);
    ASSERT_EQ(result, ANI_TRUE);
    return ANI_TRUE;
}

ani_int test_FixedArray_Boolean_04([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_fixedarray_boolean array = nullptr;
    ASSERT_EQ(env_->FixedArray_New_Boolean(LENGTH_5, &array), ANI_OK);

    std::array<ani_boolean, LENGTH_5> nativeBuffer = {ANI_TRUE, ANI_FALSE, ANI_TRUE, ANI_FALSE, ANI_TRUE};
    ASSERT_EQ(env_->FixedArray_SetRegion_Boolean(array, OFFSET_0, LENGTH_5, nativeBuffer.data()), ANI_OK);

    std::array<ani_boolean, LENGTH_5> nativeBuffer2 = {ANI_FALSE};
    ASSERT_EQ(env_->FixedArray_GetRegion_Boolean(array, OFFSET_0, LENGTH_5, nativeBuffer2.data()), ANI_OK);

    for (ani_size i = 0; i < LENGTH_5; i++) {
        ASSERT_EQ(env_->FixedArray_SetRegion_Boolean(array, OFFSET_0, LENGTH_5, nativeBuffer.data()), ANI_OK);
    }
    ASSERT_EQ(env_->FixedArray_GetRegion_Boolean(array, OFFSET_0, LENGTH_5, nativeBuffer2.data()), ANI_OK);

    std::array<ani_boolean, LENGTH_5> nativeBuffer3 = {ANI_FALSE, ANI_TRUE, ANI_FALSE, ANI_TRUE, ANI_FALSE};
    ASSERT_EQ(env_->FixedArray_SetRegion_Boolean(array, OFFSET_0, LENGTH_5, nativeBuffer3.data()), ANI_OK);
    for (ani_size i = 0; i < LENGTH_5; i++) {
        ASSERT_EQ(env_->FixedArray_SetRegion_Boolean(array, OFFSET_0, LENGTH_5, nativeBuffer.data()), ANI_OK);
    }
    ASSERT_EQ(env_->FixedArray_SetRegion_Boolean(array, OFFSET_0, LENGTH_5, nativeBuffer3.data()), ANI_OK);
    ASSERT_EQ(env_->FixedArray_GetRegion_Boolean(array, OFFSET_0, LENGTH_5, nativeBuffer2.data()), ANI_OK);

    ASSERT_EQ(env_->FixedArray_SetRegion_Boolean(array, OFFSET_0, LENGTH_5, nativeBuffer.data()), ANI_OK);
    for (ani_size i = 0; i < LENGTH_5; i++) {
        ASSERT_EQ(env_->FixedArray_GetRegion_Boolean(array, OFFSET_0, LENGTH_5, nativeBuffer2.data()), ANI_OK);
    }
    return ANI_TRUE;
}

ani_int test_FixedArray_Boolean_05([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_fixedarray_boolean array = nullptr;
    ASSERT_EQ(env_->FixedArray_New_Boolean(LENGTH_5, &array), ANI_OK);

    std::array<ani_boolean, LENGTH_5> nativeBuffer = {ANI_TRUE, ANI_FALSE, ANI_TRUE, ANI_FALSE, ANI_TRUE};
    std::array<ani_boolean, LENGTH_5> nativeBuffer2 = {ANI_FALSE};
    for (ani_int i = 0; i < LENGTH_5; i++) {
        ASSERT_EQ(env_->FixedArray_SetRegion_Boolean(array, OFFSET_0, LENGTH_5, nativeBuffer.data()), ANI_OK);
    }
    ASSERT_EQ(env_->FixedArray_GetRegion_Boolean(array, OFFSET_0, LENGTH_5, nativeBuffer2.data()), ANI_OK);

    for (ani_int i = 0; i < LENGTH_5; i++) {
        ASSERT_EQ(env_->FixedArray_SetRegion_Boolean(array, OFFSET_0, LENGTH_5, nativeBuffer.data()), ANI_OK);
    }
    for (ani_int i = 0; i < LENGTH_5; i++) {
        ASSERT_EQ(env_->FixedArray_GetRegion_Boolean(array, OFFSET_0, LENGTH_5, nativeBuffer2.data()), ANI_OK);
    }

    for (ani_int i = 0; i < LENGTH_5; i++) {
        ASSERT_EQ(env_->FixedArray_SetRegion_Boolean(array, OFFSET_0, LENGTH_5, nativeBuffer.data()), ANI_OK);
        ASSERT_EQ(env_->FixedArray_GetRegion_Boolean(array, OFFSET_0, LENGTH_5, nativeBuffer2.data()), ANI_OK);
    }
    return ANI_TRUE;
}

ani_int test_FixedArray_Byte([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_fixedarray_byte array = nullptr;
    ASSERT_EQ(env->FixedArray_New_Byte(LENGTH_5, &array), ANI_OK);
    ani_byte nativeBuffer[LENGTH_10] = {0};
    ASSERT_EQ(env->FixedArray_GetRegion_Byte(array, OFFSET_0, LENGTH_1, nativeBuffer), ANI_OK);
    ASSERT_EQ(env->FixedArray_SetRegion_Byte(array, OFFSET_0, LENGTH_5, nativeBuffer), ANI_OK);
    return ANI_TRUE;
}

ani_int test_FixedArray_Byte_01([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_fixedarray_byte array = nullptr;
    ASSERT_EQ(env_->FixedArray_New_Byte(LENGTH_5, &array), ANI_OK);
    ani_byte nativeBuffer[LENGTH_10] = {0};
    ASSERT_EQ(env_->FixedArray_GetRegion_Byte(array, OFFSET_0, LENGTH_1, nullptr), ANI_INVALID_ARGS);
    ASSERT_EQ(env_->FixedArray_GetRegion_Byte(array, OFFSET_0, LENGTH_10, nativeBuffer), ANI_OUT_OF_RANGE);
    ASSERT_EQ(env_->FixedArray_GetRegion_Byte(array, OFFSET_0, LENGTH_1, nativeBuffer), ANI_OK);
    return ANI_TRUE;
}

ani_int test_FixedArray_Byte_02([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env_->FindClass("fixedarray_region_byte_test.ArrayClass", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_ref ref = nullptr;
    ASSERT_EQ(env_->Class_GetStaticFieldByName_Ref(cls, "array", &ref), ANI_OK);
    ASSERT_NE(ref, nullptr);

    auto array = reinterpret_cast<ani_fixedarray_byte>(ref);
    ani_byte nativeBuffer[LENGTH_5] = {0};
    const ani_size offset5 = 0;
    const ani_size len5 = LENGTH_5;

    ASSERT_EQ(env_->FixedArray_GetRegion_Byte(array, offset5, len5, nativeBuffer), ANI_OK);
    ASSERT_EQ(nativeBuffer[0U], TEST_VALUE_1);
    ASSERT_EQ(nativeBuffer[1U], TEST_VALUE_2);
    ASSERT_EQ(nativeBuffer[2U], TEST_VALUE_3);
    ASSERT_EQ(nativeBuffer[3U], TEST_VALUE_4);
    ASSERT_EQ(nativeBuffer[4U], TEST_VALUE_5);

    ASSERT_EQ(env_->Class_CallStaticMethodByName_Void(cls, "changeStaticArray", nullptr), ANI_OK);
    ASSERT_EQ(env_->FixedArray_GetRegion_Byte(array, offset5, len5, nativeBuffer), ANI_OK);
    ASSERT_EQ(nativeBuffer[0U], TEST_VALUE_1);
    ASSERT_EQ(nativeBuffer[1U], TEST_VALUE_2);
    ASSERT_EQ(nativeBuffer[2U], TEST_UPDATE_4);
    ASSERT_EQ(nativeBuffer[3U], TEST_VALUE_4);
    ASSERT_EQ(nativeBuffer[4U], TEST_UPDATE_5);
    return ANI_TRUE;
}

ani_int test_FixedArray_Byte_03([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env_->FindClass("fixedarray_region_byte_test.ArrayClass", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_ref ref = nullptr;
    ASSERT_EQ(env_->Class_GetStaticFieldByName_Ref(cls, "array", &ref), ANI_OK);
    ASSERT_NE(ref, nullptr);

    auto array = reinterpret_cast<ani_fixedarray_byte>(ref);
    ani_byte nativeBuffer[LENGTH_3] = {TEST_UPDATE_4, TEST_UPDATE_6, TEST_UPDATE_5};
    ASSERT_EQ(env_->FixedArray_SetRegion_Byte(array, OFFSET_2, LENGTH_3, nativeBuffer), ANI_OK);

    ani_boolean result = ANI_FALSE;
    ASSERT_EQ(env_->Class_CallStaticMethodByName_Boolean(cls, "checkStaticArray", nullptr, &result), ANI_OK);
    ASSERT_EQ(result, ANI_TRUE);
    return ANI_TRUE;
}

ani_int test_FixedArray_Byte_04([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_fixedarray_byte array = nullptr;
    ASSERT_EQ(env_->FixedArray_New_Byte(LENGTH_5, &array), ANI_OK);

    const ani_byte minByteValue = -128;
    const ani_byte maxByteValue = 127;
    std::array<ani_byte, LENGTH_5> nativeBuffer = {minByteValue, maxByteValue, static_cast<ani_byte>(0),
                                                   static_cast<ani_byte>(-1), static_cast<ani_byte>(1)};
    ASSERT_EQ(env_->FixedArray_SetRegion_Byte(array, OFFSET_0, LENGTH_5, nativeBuffer.data()), ANI_OK);

    std::array<ani_byte, LENGTH_5> nativeBuffer2 = {};
    ASSERT_EQ(env_->FixedArray_GetRegion_Byte(array, OFFSET_0, LENGTH_5, nativeBuffer2.data()), ANI_OK);
    ASSERT_EQ(nativeBuffer2[0U], minByteValue);
    ASSERT_EQ(nativeBuffer2[1U], maxByteValue);
    ASSERT_EQ(nativeBuffer2[2U], static_cast<ani_byte>(0));
    ASSERT_EQ(nativeBuffer2[3U], static_cast<ani_byte>(-1));
    ASSERT_EQ(nativeBuffer2[4U], static_cast<ani_byte>(1));
    return ANI_TRUE;
}

ani_int test_FixedArray_Byte_05([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_fixedarray_byte array = nullptr;
    ASSERT_EQ(env_->FixedArray_New_Byte(LENGTH_5, &array), ANI_OK);

    std::array<ani_byte, LENGTH_5> nativeBuffer = {TEST_VAL_1, TEST_VAL_2, TEST_VAL_3, TEST_VAL_4,
                                                   TEST_VAL_5};
    ASSERT_EQ(env_->FixedArray_SetRegion_Byte(array, OFFSET_0, LENGTH_5, nativeBuffer.data()), ANI_OK);

    std::array<ani_byte, LENGTH_5> nativeBuffer2 = {};
    ASSERT_EQ(env_->FixedArray_GetRegion_Byte(array, OFFSET_0, LENGTH_5, nativeBuffer2.data()), ANI_OK);

    for (ani_size i = 0; i < LENGTH_5; i++) {
        ASSERT_EQ(env_->FixedArray_SetRegion_Byte(array, OFFSET_0, LENGTH_5, nativeBuffer.data()), ANI_OK);
    }
    ASSERT_EQ(env_->FixedArray_GetRegion_Byte(array, OFFSET_0, LENGTH_5, nativeBuffer2.data()), ANI_OK);

    std::array<ani_byte, LENGTH_5> nativeBuffer3 = {TEST_VAL_1, TEST_VAL_3, TEST_VAL_5, TEST_VAL_2,
                                                    TEST_VAL_4};
    ASSERT_EQ(env_->FixedArray_SetRegion_Byte(array, OFFSET_0, LENGTH_5, nativeBuffer3.data()), ANI_OK);
    for (ani_int i = 0; i < LENGTH_5; i++) {
        ASSERT_EQ(env_->FixedArray_SetRegion_Byte(array, OFFSET_0, LENGTH_5, nativeBuffer.data()), ANI_OK);
    }
    ASSERT_EQ(env_->FixedArray_SetRegion_Byte(array, OFFSET_0, LENGTH_5, nativeBuffer3.data()), ANI_OK);
    ASSERT_EQ(env_->FixedArray_GetRegion_Byte(array, OFFSET_0, LENGTH_5, nativeBuffer2.data()), ANI_OK);

    ASSERT_EQ(env_->FixedArray_SetRegion_Byte(array, OFFSET_0, LENGTH_5, nativeBuffer.data()), ANI_OK);
    for (ani_size i = 0; i < LENGTH_5; i++) {
        ASSERT_EQ(env_->FixedArray_GetRegion_Byte(array, OFFSET_0, LENGTH_5, nativeBuffer2.data()), ANI_OK);
    }
    return ANI_TRUE;
}

ani_int test_FixedArray_Byte_06([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_fixedarray_byte array = nullptr;
    ASSERT_EQ(env_->FixedArray_New_Byte(LENGTH_5, &array), ANI_OK);

    std::array<ani_byte, LENGTH_5> nativeBuffer = {TEST_VAL_1, TEST_VAL_2, TEST_VAL_3, TEST_VAL_4,
                                                   TEST_VAL_5};
    std::array<ani_byte, LENGTH_5> nativeBuffer2 = {};
    for (ani_int i = 0; i < LENGTH_5; i++) {
        ASSERT_EQ(env_->FixedArray_SetRegion_Byte(array, OFFSET_0, LENGTH_5, nativeBuffer.data()), ANI_OK);
    }
    ASSERT_EQ(env_->FixedArray_GetRegion_Byte(array, OFFSET_0, LENGTH_5, nativeBuffer2.data()), ANI_OK);

    for (ani_int i = 0; i < LENGTH_5; i++) {
        ASSERT_EQ(env_->FixedArray_SetRegion_Byte(array, OFFSET_0, LENGTH_5, nativeBuffer.data()), ANI_OK);
    }
    for (ani_int i = 0; i < LENGTH_5; i++) {
        ASSERT_EQ(env_->FixedArray_GetRegion_Byte(array, OFFSET_0, LENGTH_5, nativeBuffer2.data()), ANI_OK);
    }
    for (ani_int i = 0; i < LENGTH_5; i++) {
        ASSERT_EQ(env_->FixedArray_SetRegion_Byte(array, OFFSET_0, LENGTH_5, nativeBuffer.data()), ANI_OK);
        ASSERT_EQ(env_->FixedArray_GetRegion_Byte(array, OFFSET_0, LENGTH_5, nativeBuffer2.data()), ANI_OK);
    }
    return ANI_TRUE;
}

ani_int test_FixedArray_Char([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_fixedarray_char array = nullptr;
    ASSERT_EQ(env->FixedArray_New_Char(LENGTH_5, &array), ANI_OK);
    ani_char nativeBuffer[LENGTH_5] = {0};
    ASSERT_EQ(env->FixedArray_GetRegion_Char(array, OFFSET_0, LENGTH_1, nativeBuffer), ANI_OK);
    ASSERT_EQ(env->FixedArray_SetRegion_Char(array, OFFSET_0, LENGTH_5, nativeBuffer), ANI_OK);
    return ANI_TRUE;
}

ani_int test_FixedArray_Char_01([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_fixedarray_char array = nullptr;
    ASSERT_EQ(env_->FixedArray_New_Char(LENGTH_5, &array), ANI_OK);
    ani_char nativeBuffer[LENGTH_5] = {0};
    ASSERT_EQ(env_->FixedArray_GetRegion_Char(array, OFFSET_0, LENGTH_1, nullptr), ANI_INVALID_ARGS);
    ASSERT_EQ(env_->FixedArray_GetRegion_Char(array, OFFSET_5, LENGTH_10, nativeBuffer), ANI_OUT_OF_RANGE);
    ASSERT_EQ(env_->FixedArray_GetRegion_Char(array, OFFSET_0, LENGTH_1, nativeBuffer), ANI_OK);
    return ANI_TRUE;
}

ani_int test_FixedArray_Char_02([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_fixedarray_char array = nullptr;
    ASSERT_EQ(env_->FixedArray_New_Char(LENGTH_10, &array), ANI_OK);

    const std::array<ani_char, LENGTH_10> nativeBuffer = {'a', '0', '\n', '\r', '\t', '\b', '\a', '\v', '\f', '\0'};
    ASSERT_EQ(env_->FixedArray_SetRegion_Char(array, OFFSET_0, LENGTH_10, nativeBuffer.data()), ANI_OK);

    std::array<ani_char, LENGTH_10> nativeBuffer2 = {};
    ASSERT_EQ(env_->FixedArray_GetRegion_Char(array, OFFSET_0, LENGTH_10, nativeBuffer2.data()), ANI_OK);
    ASSERT_EQ(nativeBuffer2[0U], 'a');
    ASSERT_EQ(nativeBuffer2[1U], '0');
    ASSERT_EQ(nativeBuffer2[2U], '\n');
    ASSERT_EQ(nativeBuffer2[3U], '\r');
    ASSERT_EQ(nativeBuffer2[4U], '\t');
    ASSERT_EQ(nativeBuffer2[5U], '\b');
    ASSERT_EQ(nativeBuffer2[6U], '\a');
    ASSERT_EQ(nativeBuffer2[7U], '\v');
    ASSERT_EQ(nativeBuffer2[8U], '\f');
    ASSERT_EQ(nativeBuffer2[9U], '\0');
    return ANI_TRUE;
}

ani_int test_FixedArray_Char_03([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_fixedarray_char array = nullptr;
    ASSERT_EQ(env_->FixedArray_New_Char(LENGTH_5, &array), ANI_OK);

    std::array<ani_char, LENGTH_5> nativeBuffer = {'a', 'b', 'c', 'd', 'e'};
    ASSERT_EQ(env_->FixedArray_SetRegion_Char(array, OFFSET_0, LENGTH_5, nativeBuffer.data()), ANI_OK);
    std::array<ani_char, LENGTH_5> nativeBuffer2 = {};
    ASSERT_EQ(env_->FixedArray_GetRegion_Char(array, OFFSET_0, LENGTH_5, nativeBuffer2.data()), ANI_OK);

    for (ani_size i = 0; i < LENGTH_5; i++) {
        ASSERT_EQ(env_->FixedArray_SetRegion_Char(array, OFFSET_0, LENGTH_5, nativeBuffer.data()), ANI_OK);
    }
    ASSERT_EQ(env_->FixedArray_GetRegion_Char(array, OFFSET_0, LENGTH_5, nativeBuffer2.data()), ANI_OK);

    std::array<ani_char, LENGTH_5> nativeBuffer3 = {'a', 'c', 'e', 'x', 'y'};
    ASSERT_EQ(env_->FixedArray_SetRegion_Char(array, OFFSET_0, LENGTH_5, nativeBuffer3.data()), ANI_OK);
    for (ani_int i = 0; i < LENGTH_5; i++) {
        ASSERT_EQ(env_->FixedArray_SetRegion_Char(array, OFFSET_0, LENGTH_5, nativeBuffer.data()), ANI_OK);
    }
    ASSERT_EQ(env_->FixedArray_SetRegion_Char(array, OFFSET_0, LENGTH_5, nativeBuffer3.data()), ANI_OK);
    ASSERT_EQ(env_->FixedArray_GetRegion_Char(array, OFFSET_0, LENGTH_5, nativeBuffer2.data()), ANI_OK);

    ASSERT_EQ(env_->FixedArray_SetRegion_Char(array, OFFSET_0, LENGTH_5, nativeBuffer.data()), ANI_OK);
    for (ani_size i = 0; i < LENGTH_5; i++) {
        ASSERT_EQ(env_->FixedArray_GetRegion_Char(array, OFFSET_0, LENGTH_5, nativeBuffer2.data()), ANI_OK);
    }
    return ANI_TRUE;
}

ani_int test_FixedArray_Char_04([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_fixedarray_char array = nullptr;
    ASSERT_EQ(env_->FixedArray_New_Char(LENGTH_5, &array), ANI_OK);

    std::array<ani_char, LENGTH_5> nativeBuffer = {'a', 'b', 'c', 'd', 'e'};
    std::array<ani_char, LENGTH_5> nativeBuffer2 = {};
    for (ani_int i = 0; i < LENGTH_5; i++) {
        ASSERT_EQ(env_->FixedArray_SetRegion_Char(array, OFFSET_0, LENGTH_5, nativeBuffer.data()), ANI_OK);
    }
    ASSERT_EQ(env_->FixedArray_GetRegion_Char(array, OFFSET_0, LENGTH_5, nativeBuffer2.data()), ANI_OK);

    for (ani_int i = 0; i < LENGTH_5; i++) {
        ASSERT_EQ(env_->FixedArray_SetRegion_Char(array, OFFSET_0, LENGTH_5, nativeBuffer.data()), ANI_OK);
    }
    for (ani_int i = 0; i < LENGTH_5; i++) {
        ASSERT_EQ(env_->FixedArray_GetRegion_Char(array, OFFSET_0, LENGTH_5, nativeBuffer2.data()), ANI_OK);
    }

    for (ani_int i = 0; i < LENGTH_5; i++) {
        ASSERT_EQ(env_->FixedArray_SetRegion_Char(array, OFFSET_0, LENGTH_5, nativeBuffer.data()), ANI_OK);
        ASSERT_EQ(env_->FixedArray_GetRegion_Char(array, OFFSET_0, LENGTH_5, nativeBuffer2.data()), ANI_OK);
    }
    return ANI_TRUE;
}

ani_int test_FixedArray_Short([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_fixedarray_short array = nullptr;
    ASSERT_EQ(env->FixedArray_New_Short(LENGTH_5, &array), ANI_OK);
    ani_short nativeBuffer[LENGTH_10] = {0};
    ASSERT_EQ(env->FixedArray_GetRegion_Short(array, OFFSET_0, LENGTH_1, nativeBuffer), ANI_OK);
    ASSERT_EQ(env->FixedArray_SetRegion_Short(array, OFFSET_0, LENGTH_5, nativeBuffer), ANI_OK);
    return ANI_TRUE;
}

ani_int test_FixedArray_Short_01([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_fixedarray_short array = nullptr;
    ASSERT_EQ(env_->FixedArray_New_Short(LENGTH_5, &array), ANI_OK);
    ani_short nativeBuffer[LENGTH_10] = {0};
    ASSERT_EQ(env_->FixedArray_GetRegion_Short(array, OFFSET_0, LENGTH_1, nullptr), ANI_INVALID_ARGS);
    ASSERT_EQ(env_->FixedArray_GetRegion_Short(array, OFFSET_5, LENGTH_10, nativeBuffer), ANI_OUT_OF_RANGE);
    ASSERT_EQ(env_->FixedArray_GetRegion_Short(array, OFFSET_0, LENGTH_1, nativeBuffer), ANI_OK);
    return ANI_TRUE;
}

ani_int test_FixedArray_Short_02([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env_->FindClass("fixedarray_region_short_test.ArrayClass", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_ref ref = nullptr;
    ASSERT_EQ(env_->Class_GetStaticFieldByName_Ref(cls, "array", &ref), ANI_OK);
    ASSERT_NE(ref, nullptr);

    auto array = reinterpret_cast<ani_fixedarray_short>(ref);
    ani_short nativeBuffer[LENGTH_5] = {0};

    ASSERT_EQ(env_->FixedArray_GetRegion_Short(array, OFFSET_0, LENGTH_5, nativeBuffer), ANI_OK);
    ASSERT_EQ(nativeBuffer[0U], TEST_VAL_1);
    ASSERT_EQ(nativeBuffer[1U], TEST_VAL_2);
    ASSERT_EQ(nativeBuffer[2U], TEST_VAL_3);
    ASSERT_EQ(nativeBuffer[3U], TEST_VAL_4);
    ASSERT_EQ(nativeBuffer[4U], TEST_VAL_5);

    ASSERT_EQ(env_->Class_CallStaticMethodByName_Void(cls, "changeStaticArray", nullptr), ANI_OK);
    ASSERT_EQ(env_->FixedArray_GetRegion_Short(array, OFFSET_0, LENGTH_5, nativeBuffer), ANI_OK);
    ASSERT_EQ(nativeBuffer[0U], TEST_UPDATE_1);
    ASSERT_EQ(nativeBuffer[1U], TEST_UPDATE_2);
    ASSERT_EQ(nativeBuffer[2U], TEST_UPDATE_3);
    ASSERT_EQ(nativeBuffer[3U], TEST_UPDATE_4);
    ASSERT_EQ(nativeBuffer[4U], TEST_UPDATE_5);
    return ANI_TRUE;
}

ani_int test_FixedArray_Short_03([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env_->FindClass("fixedarray_region_short_test.ArrayClass", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_ref ref = nullptr;
    ASSERT_EQ(env_->Class_GetStaticFieldByName_Ref(cls, "array", &ref), ANI_OK);
    ASSERT_NE(ref, nullptr);

    auto array = reinterpret_cast<ani_fixedarray_short>(ref);
    ani_short nativeBuffer[LENGTH_3] = {TEST_UPT_4, TEST_UPT_3, TEST_UPT_5};

    ASSERT_EQ(env_->FixedArray_SetRegion_Short(array, OFFSET_2, LENGTH_3, nativeBuffer), ANI_OK);

    ani_boolean result = ANI_FALSE;
    ASSERT_EQ(env_->Class_CallStaticMethodByName_Boolean(cls, "checkStaticArray", nullptr, &result), ANI_OK);
    ASSERT_EQ(result, ANI_TRUE);
    return ANI_TRUE;
}

ani_int test_FixedArray_Short_04([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_fixedarray_short array = nullptr;
    ASSERT_EQ(env_->FixedArray_New_Short(LENGTH_5, &array), ANI_OK);
    const ani_short maxShortValue = 32767;
    const ani_short minShortValue = -32768;
    const std::array<ani_short, LENGTH_5> nativeBuffer = {minShortValue, maxShortValue, 0, -1, 1};
    ASSERT_EQ(env_->FixedArray_SetRegion_Short(array, OFFSET_0, LENGTH_5, nativeBuffer.data()), ANI_OK);

    std::array<ani_short, LENGTH_5> nativeBuffer2 = {};
    ASSERT_EQ(env_->FixedArray_GetRegion_Short(array, OFFSET_0, LENGTH_5, nativeBuffer2.data()), ANI_OK);
    ASSERT_EQ(nativeBuffer2[0U], minShortValue);
    ASSERT_EQ(nativeBuffer2[1U], maxShortValue);
    ASSERT_EQ(nativeBuffer2[2U], 0);
    ASSERT_EQ(nativeBuffer2[3U], -1);
    return ANI_TRUE;
}

ani_int test_FixedArray_Short_05([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_fixedarray_short array = nullptr;
    ASSERT_EQ(env_->FixedArray_New_Short(LENGTH_5, &array), ANI_OK);

    std::array<ani_short, LENGTH_5> nativeBuffer = {TEST_VL_1, TEST_VL_2, TEST_VL_3, TEST_VL_4, TEST_VL_5};
    ASSERT_EQ(env_->FixedArray_SetRegion_Short(array, OFFSET_0, LENGTH_5, nativeBuffer.data()), ANI_OK);

    std::array<ani_short, LENGTH_5> nativeBuffer2 = {};
    ASSERT_EQ(env_->FixedArray_GetRegion_Short(array, OFFSET_0, LENGTH_5, nativeBuffer2.data()), ANI_OK);

    for (ani_size i = 0; i < LENGTH_5; i++) {
        ASSERT_EQ(env_->FixedArray_SetRegion_Short(array, OFFSET_0, LENGTH_5, nativeBuffer.data()), ANI_OK);
    }
    ASSERT_EQ(env_->FixedArray_GetRegion_Short(array, OFFSET_0, LENGTH_5, nativeBuffer2.data()), ANI_OK);

    std::array<ani_short, LENGTH_5> nativeBuffer3 = {TEST_VAL_1, TEST_VAL_3, TEST_VAL_5, TEST_VAL_2, TEST_VAL_4};
    ASSERT_EQ(env_->FixedArray_SetRegion_Short(array, OFFSET_0, LENGTH_5, nativeBuffer3.data()), ANI_OK);
    for (ani_int i = 0; i < LENGTH_5; i++) {
        ASSERT_EQ(env_->FixedArray_SetRegion_Short(array, OFFSET_0, LENGTH_5, nativeBuffer.data()), ANI_OK);
    }
    ASSERT_EQ(env_->FixedArray_SetRegion_Short(array, OFFSET_0, LENGTH_5, nativeBuffer3.data()), ANI_OK);
    ASSERT_EQ(env_->FixedArray_GetRegion_Short(array, OFFSET_0, LENGTH_5, nativeBuffer2.data()), ANI_OK);

    ASSERT_EQ(env_->FixedArray_SetRegion_Short(array, OFFSET_0, LENGTH_5, nativeBuffer.data()), ANI_OK);
    for (ani_size i = 0; i < LENGTH_5; i++) {
        ASSERT_EQ(env_->FixedArray_GetRegion_Short(array, OFFSET_0, LENGTH_5, nativeBuffer2.data()), ANI_OK);
    }
    return ANI_TRUE;
}

ani_int test_FixedArray_Short_06([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_fixedarray_short array = nullptr;
    ASSERT_EQ(env_->FixedArray_New_Short(LENGTH_5, &array), ANI_OK);

    std::array<ani_short, LENGTH_5> nativeBuffer = {TEST_VL_1, TEST_VL_2, TEST_VL_3, TEST_VL_4, TEST_VL_5};
    std::array<ani_short, LENGTH_5> nativeBuffer2 = {};
    for (ani_int i = 0; i < LENGTH_5; i++) {
        ASSERT_EQ(env_->FixedArray_SetRegion_Short(array, OFFSET_0, LENGTH_5, nativeBuffer.data()), ANI_OK);
    }
    ASSERT_EQ(env_->FixedArray_GetRegion_Short(array, OFFSET_0, LENGTH_5, nativeBuffer2.data()), ANI_OK);

    for (ani_int i = 0; i < LENGTH_5; i++) {
        ASSERT_EQ(env_->FixedArray_SetRegion_Short(array, OFFSET_0, LENGTH_5, nativeBuffer.data()), ANI_OK);
    }
    for (ani_int i = 0; i < LENGTH_5; i++) {
        ASSERT_EQ(env_->FixedArray_GetRegion_Short(array, OFFSET_0, LENGTH_5, nativeBuffer2.data()), ANI_OK);
    }

    for (ani_int i = 0; i < LENGTH_5; i++) {
        ASSERT_EQ(env_->FixedArray_SetRegion_Short(array, OFFSET_0, LENGTH_5, nativeBuffer.data()), ANI_OK);
        ASSERT_EQ(env_->FixedArray_GetRegion_Short(array, OFFSET_0, LENGTH_5, nativeBuffer2.data()), ANI_OK);
    }
    return ANI_TRUE;
}

ani_int test_FixedArray_Int([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_fixedarray_int array = nullptr;
    ASSERT_EQ(env->FixedArray_New_Int(LENGTH_5, &array), ANI_OK);
    ani_int nativeBuffer[LENGTH_10] = {0};
    ASSERT_EQ(env->FixedArray_GetRegion_Int(array, OFFSET_0, LENGTH_5, nativeBuffer), ANI_OK);
    ASSERT_EQ(env->FixedArray_SetRegion_Int(array, OFFSET_0, LENGTH_5, nativeBuffer), ANI_OK);
    return ANI_TRUE;
}

ani_int test_FixedArray_Int_01([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_fixedarray_int array = nullptr;
    ASSERT_EQ(env_->FixedArray_New_Int(LENGTH_5, &array), ANI_OK);
    ani_int nativeBuffer[LENGTH_10] = {0};
    const ani_size offset1 = -1;
    ASSERT_EQ(env_->FixedArray_SetRegion_Int(array, offset1, LENGTH_2, nativeBuffer), ANI_OUT_OF_RANGE);
    ASSERT_EQ(env_->FixedArray_SetRegion_Int(array, OFFSET_5, LENGTH_10, nativeBuffer), ANI_OUT_OF_RANGE);
    ASSERT_EQ(env_->FixedArray_SetRegion_Int(array, OFFSET_0, LENGTH_5, nativeBuffer), ANI_OK);
    return ANI_TRUE;
}

ani_int test_FixedArray_Int_02([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_fixedarray_int array = nullptr;
    ASSERT_EQ(env_->FixedArray_New_Int(LENGTH_5, &array), ANI_OK);
    ani_int nativeBuffer[LENGTH_10] = {0};
    ASSERT_EQ(env_->FixedArray_GetRegion_Int(array, OFFSET_0, LENGTH_1, nullptr), ANI_INVALID_ARGS);
    ASSERT_EQ(env_->FixedArray_GetRegion_Int(array, OFFSET_5, LENGTH_10, nativeBuffer), ANI_OUT_OF_RANGE);
    ASSERT_EQ(env_->FixedArray_GetRegion_Int(array, OFFSET_0, LENGTH_5, nativeBuffer), ANI_OK);
    return ANI_TRUE;
}

ani_int test_FixedArray_Int_03([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env_->FindClass("fixedarray_region_int_test.ArrayClass", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_ref ref = nullptr;
    ASSERT_EQ(env_->Class_GetStaticFieldByName_Ref(cls, "array", &ref), ANI_OK);
    ASSERT_NE(ref, nullptr);

    auto array = reinterpret_cast<ani_fixedarray_int>(ref);
    ani_int nativeBuffer[LENGTH_5] = {0};

    ASSERT_EQ(env_->FixedArray_GetRegion_Int(array, OFFSET_0, LENGTH_5, nativeBuffer), ANI_OK);
    ASSERT_EQ(nativeBuffer[0U], TEST_VAL_1);
    ASSERT_EQ(nativeBuffer[1U], TEST_VAL_2);
    ASSERT_EQ(nativeBuffer[2U], TEST_VAL_3);
    ASSERT_EQ(nativeBuffer[3U], TEST_VAL_4);
    ASSERT_EQ(nativeBuffer[4U], TEST_VAL_5);

    ASSERT_EQ(env_->Class_CallStaticMethodByName_Void(cls, "changeStaticArray", nullptr), ANI_OK);
    ASSERT_EQ(env_->FixedArray_GetRegion_Int(array, OFFSET_0, LENGTH_5, nativeBuffer), ANI_OK);
    ASSERT_EQ(nativeBuffer[0U], TEST_VAL_1);
    ASSERT_EQ(nativeBuffer[1U], TEST_VAL_2);
    ASSERT_EQ(nativeBuffer[2U], TEST_UPT_4);
    ASSERT_EQ(nativeBuffer[3U], TEST_VAL_4);
    ASSERT_EQ(nativeBuffer[4U], TEST_UPT_5);
    return ANI_TRUE;
}

ani_int test_FixedArray_Int_04([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env_->FindClass("fixedarray_region_int_test.ArrayClass", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_ref ref = nullptr;
    ASSERT_EQ(env_->Class_GetStaticFieldByName_Ref(cls, "array", &ref), ANI_OK);
    ASSERT_NE(ref, nullptr);

    auto array = reinterpret_cast<ani_fixedarray_int>(ref);
    ani_int nativeBuffer[LENGTH_3] = {TEST_UPT_4, TEST_UPT_3, TEST_UPT_5};

    ASSERT_EQ(env_->FixedArray_SetRegion_Int(array, OFFSET_2, LENGTH_3, nativeBuffer), ANI_OK);

    ani_boolean result = ANI_FALSE;
    ASSERT_EQ(env_->Class_CallStaticMethodByName_Boolean(cls, "checkStaticArray", nullptr, &result), ANI_OK);
    ASSERT_EQ(result, ANI_TRUE);
    return ANI_TRUE;
}

ani_int test_FixedArray_Int_05([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_fixedarray_int array = nullptr;
    ASSERT_EQ(env_->FixedArray_New_Int(LENGTH_5, &array), ANI_OK);

    const std::array<ani_int, LENGTH_5> nativeBuffer = {-2147483648, 2147483647, 0, -1, 1};
    ASSERT_EQ(env_->FixedArray_SetRegion_Int(array, OFFSET_0, LENGTH_5, nativeBuffer.data()), ANI_OK);

    std::array<ani_int, LENGTH_5> nativeBuffer2 = {};
    ASSERT_EQ(env_->FixedArray_GetRegion_Int(array, OFFSET_0, LENGTH_5, nativeBuffer2.data()), ANI_OK);
    const ani_int minIntValue = -2147483648;
    const ani_int maxIntValue = 2147483647;
    ASSERT_EQ(nativeBuffer2[0U], minIntValue);
    ASSERT_EQ(nativeBuffer2[1U], maxIntValue);
    ASSERT_EQ(nativeBuffer2[2U], 0);
    ASSERT_EQ(nativeBuffer2[3U], -1);
    ASSERT_EQ(nativeBuffer2[4U], 1);
    return ANI_TRUE;
}

ani_int test_FixedArray_Int_06([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_fixedarray_int array = nullptr;
    ASSERT_EQ(env_->FixedArray_New_Int(LENGTH_5, &array), ANI_OK);

    std::array<ani_int, LENGTH_5> nativeBuffer = {TEST_VAL_1, TEST_VAL_2, TEST_VAL_3, TEST_VAL_4, TEST_VAL_5};
    ASSERT_EQ(env_->FixedArray_SetRegion_Int(array, OFFSET_0, LENGTH_5, nativeBuffer.data()), ANI_OK);

    std::array<ani_int, LENGTH_5> nativeBuffer2 = {};
    ASSERT_EQ(env_->FixedArray_GetRegion_Int(array, OFFSET_0, LENGTH_5, nativeBuffer2.data()), ANI_OK);

    for (ani_size i = 0; i < LENGTH_5; i++) {
        ASSERT_EQ(env_->FixedArray_SetRegion_Int(array, OFFSET_0, LENGTH_5, nativeBuffer.data()), ANI_OK);
    }
    ASSERT_EQ(env_->FixedArray_GetRegion_Int(array, OFFSET_0, LENGTH_5, nativeBuffer2.data()), ANI_OK);

    std::array<ani_int, LENGTH_5> nativeBuffer3 = {TEST_VAL_1, TEST_VAL_3, TEST_VAL_5, TEST_VAL_2, TEST_VAL_4};
    ASSERT_EQ(env_->FixedArray_SetRegion_Int(array, OFFSET_0, LENGTH_5, nativeBuffer3.data()), ANI_OK);
    for (ani_int i = 0; i < LENGTH_5; i++) {
        ASSERT_EQ(env_->FixedArray_SetRegion_Int(array, OFFSET_0, LENGTH_5, nativeBuffer.data()), ANI_OK);
    }
    ASSERT_EQ(env_->FixedArray_SetRegion_Int(array, OFFSET_0, LENGTH_5, nativeBuffer3.data()), ANI_OK);
    ASSERT_EQ(env_->FixedArray_GetRegion_Int(array, OFFSET_0, LENGTH_5, nativeBuffer2.data()), ANI_OK);

    ASSERT_EQ(env_->FixedArray_SetRegion_Int(array, OFFSET_0, LENGTH_5, nativeBuffer.data()), ANI_OK);
    for (ani_size i = 0; i < LENGTH_5; i++) {
        ASSERT_EQ(env_->FixedArray_GetRegion_Int(array, OFFSET_0, LENGTH_5, nativeBuffer2.data()), ANI_OK);
    }
    return ANI_TRUE;
}

ani_int test_FixedArray_Int_07([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_fixedarray_int array = nullptr;
    ASSERT_EQ(env_->FixedArray_New_Int(LENGTH_5, &array), ANI_OK);

    std::array<ani_int, LENGTH_5> nativeBuffer = {TEST_VAL_1, TEST_VAL_2, TEST_VAL_3, TEST_VAL_4, TEST_VAL_5};
    std::array<ani_int, LENGTH_5> nativeBuffer2 = {};
    for (ani_int i = 0; i < LENGTH_5; i++) {
        ASSERT_EQ(env_->FixedArray_SetRegion_Int(array, OFFSET_0, LENGTH_5, nativeBuffer.data()), ANI_OK);
    }
    ASSERT_EQ(env_->FixedArray_GetRegion_Int(array, OFFSET_0, LENGTH_5, nativeBuffer2.data()), ANI_OK);

    for (ani_int i = 0; i < LENGTH_5; i++) {
        ASSERT_EQ(env_->FixedArray_SetRegion_Int(array, OFFSET_0, LENGTH_5, nativeBuffer.data()), ANI_OK);
    }
    for (ani_int i = 0; i < LENGTH_5; i++) {
        ASSERT_EQ(env_->FixedArray_GetRegion_Int(array, OFFSET_0, LENGTH_5, nativeBuffer2.data()), ANI_OK);
    }

    for (ani_int i = 0; i < LENGTH_5; i++) {
        ASSERT_EQ(env_->FixedArray_SetRegion_Int(array, OFFSET_0, LENGTH_5, nativeBuffer.data()), ANI_OK);
        ASSERT_EQ(env_->FixedArray_GetRegion_Int(array, OFFSET_0, LENGTH_5, nativeBuffer2.data()), ANI_OK);
    }
    return ANI_TRUE;
}

ani_int test_FixedArray_Long([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_fixedarray_long array = nullptr;
    ASSERT_EQ(env->FixedArray_New_Long(LENGTH_5, &array), ANI_OK);
    ani_long nativeBuffer[LENGTH_10] = {0};
    ASSERT_EQ(env->FixedArray_GetRegion_Long(array, OFFSET_0, LENGTH_1, nativeBuffer), ANI_OK);
    ASSERT_EQ(env->FixedArray_SetRegion_Long(array, OFFSET_0, LENGTH_5, nativeBuffer), ANI_OK);
    return ANI_TRUE;
}

ani_int test_FixedArray_Long_01([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_fixedarray_long array = nullptr;
    ASSERT_EQ(env_->FixedArray_New_Long(LENGTH_5, &array), ANI_OK);
    ani_long nativeBuffer[LENGTH_10] = {0};
    const ani_size offset1 = -1;
    ASSERT_EQ(env_->FixedArray_SetRegion_Long(array, offset1, LENGTH_2, nativeBuffer), ANI_OUT_OF_RANGE);
    ASSERT_EQ(env_->FixedArray_SetRegion_Long(array, OFFSET_5, LENGTH_10, nativeBuffer), ANI_OUT_OF_RANGE);
    ASSERT_EQ(env_->FixedArray_SetRegion_Long(array, OFFSET_0, LENGTH_5, nativeBuffer), ANI_OK);
    return ANI_TRUE;
}

ani_int test_FixedArray_Long_02([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_fixedarray_long array = nullptr;
    ASSERT_EQ(env_->FixedArray_New_Long(LENGTH_5, &array), ANI_OK);
    ani_long nativeBuffer[LENGTH_10] = {0};
    ASSERT_EQ(env_->FixedArray_GetRegion_Long(array, OFFSET_0, LENGTH_1, nullptr), ANI_INVALID_ARGS);
    ASSERT_EQ(env_->FixedArray_GetRegion_Long(array, OFFSET_5, LENGTH_10, nativeBuffer), ANI_OUT_OF_RANGE);
    ASSERT_EQ(env_->FixedArray_GetRegion_Long(array, OFFSET_0, LENGTH_1, nativeBuffer), ANI_OK);
    return ANI_TRUE;
}

ani_int test_FixedArray_Long_03([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env_->FindClass("fixedarray_region_long_test.ArrayClass", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_ref ref = nullptr;
    ASSERT_EQ(env_->Class_GetStaticFieldByName_Ref(cls, "array", &ref), ANI_OK);
    ASSERT_NE(ref, nullptr);

    auto array = reinterpret_cast<ani_fixedarray_long>(ref);
    ani_long nativeBuffer[LENGTH_5] = {0};
    ASSERT_EQ(env_->FixedArray_GetRegion_Long(array, OFFSET_0, LENGTH_5, nativeBuffer), ANI_OK);
    ASSERT_EQ(nativeBuffer[0U], TEST_VAL_1);
    ASSERT_EQ(nativeBuffer[1U], TEST_VAL_2);
    ASSERT_EQ(nativeBuffer[2U], TEST_VAL_3);
    ASSERT_EQ(nativeBuffer[3U], TEST_VAL_4);
    ASSERT_EQ(nativeBuffer[4U], TEST_VAL_5);

    ASSERT_EQ(env_->Class_CallStaticMethodByName_Void(cls, "changeStaticArray", nullptr), ANI_OK);
    ASSERT_EQ(env_->FixedArray_GetRegion_Long(array, OFFSET_0, LENGTH_5, nativeBuffer), ANI_OK);
    ASSERT_EQ(nativeBuffer[0U], TEST_VAL_1);
    ASSERT_EQ(nativeBuffer[1U], TEST_VAL_2);
    ASSERT_EQ(nativeBuffer[2U], TEST_UPT_4);
    ASSERT_EQ(nativeBuffer[3U], TEST_VAL_4);
    ASSERT_EQ(nativeBuffer[4U], TEST_UPT_5);
    return ANI_TRUE;
}

ani_int test_FixedArray_Long_04([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env_->FindClass("fixedarray_region_long_test.ArrayClass", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_ref ref = nullptr;
    ASSERT_EQ(env_->Class_GetStaticFieldByName_Ref(cls, "array", &ref), ANI_OK);
    ASSERT_NE(ref, nullptr);

    auto array = reinterpret_cast<ani_fixedarray_long>(ref);
    ani_long nativeBuffer[LENGTH_3] = {TEST_UPT_4, TEST_UPT_3, TEST_UPT_5};
    ASSERT_EQ(env_->FixedArray_SetRegion_Long(array, OFFSET_2, LENGTH_3, nativeBuffer), ANI_OK);

    ani_boolean result = ANI_FALSE;
    ASSERT_EQ(env_->Class_CallStaticMethodByName_Boolean(cls, "checkStaticArray", nullptr, &result), ANI_OK);
    ASSERT_EQ(result, ANI_TRUE);
    return ANI_TRUE;
}

ani_int test_FixedArray_Long_05([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_fixedarray_long array = nullptr;
    ASSERT_EQ(env_->FixedArray_New_Long(LENGTH_5, &array), ANI_OK);
    ani_long max = std::numeric_limits<int64_t>::max();
    ani_long min = std::numeric_limits<int64_t>::min();
    const std::array<ani_long, LENGTH_5> nativeBuffer = {min, max, 0, -1, 1};
    ASSERT_EQ(env_->FixedArray_SetRegion_Long(array, OFFSET_0, LENGTH_5, nativeBuffer.data()), ANI_OK);

    std::array<ani_long, LENGTH_5> nativeBuffer2 = {};
    ASSERT_EQ(env_->FixedArray_GetRegion_Long(array, OFFSET_0, LENGTH_5, nativeBuffer2.data()), ANI_OK);
    ASSERT_EQ(nativeBuffer2[0U], min);
    ASSERT_EQ(nativeBuffer2[1U], max);
    ASSERT_EQ(nativeBuffer2[2U], 0);
    ASSERT_EQ(nativeBuffer2[3U], -1);
    ASSERT_EQ(nativeBuffer2[4U], 1);
    return ANI_TRUE;
}

ani_int test_FixedArray_Long_06([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_fixedarray_long array = nullptr;
    ASSERT_EQ(env_->FixedArray_New_Long(LENGTH_5, &array), ANI_OK);

    std::array<ani_long, LENGTH_5> nativeBuffer = {TEST_VAL_1, TEST_VAL_2, TEST_VAL_3, TEST_VAL_4, TEST_VAL_5};
    ASSERT_EQ(env_->FixedArray_SetRegion_Long(array, OFFSET_0, LENGTH_5, nativeBuffer.data()), ANI_OK);

    std::array<ani_long, LENGTH_5> nativeBuffer2 = {};
    ASSERT_EQ(env_->FixedArray_GetRegion_Long(array, OFFSET_0, LENGTH_5, nativeBuffer2.data()), ANI_OK);

    for (ani_size i = 0; i < LENGTH_5; i++) {
        ASSERT_EQ(env_->FixedArray_SetRegion_Long(array, OFFSET_0, LENGTH_5, nativeBuffer.data()), ANI_OK);
    }
    ASSERT_EQ(env_->FixedArray_GetRegion_Long(array, OFFSET_0, LENGTH_5, nativeBuffer2.data()), ANI_OK);

    std::array<ani_long, LENGTH_5> nativeBuffer3 = {TEST_VAL_1, TEST_VAL_3, TEST_VAL_5, TEST_VAL_2, TEST_VAL_4};
    ASSERT_EQ(env_->FixedArray_SetRegion_Long(array, OFFSET_0, LENGTH_5, nativeBuffer3.data()), ANI_OK);
    for (ani_int i = 0; i < LENGTH_5; i++) {
        ASSERT_EQ(env_->FixedArray_SetRegion_Long(array, OFFSET_0, LENGTH_5, nativeBuffer.data()), ANI_OK);
    }
    ASSERT_EQ(env_->FixedArray_SetRegion_Long(array, OFFSET_0, LENGTH_5, nativeBuffer3.data()), ANI_OK);
    ASSERT_EQ(env_->FixedArray_GetRegion_Long(array, OFFSET_0, LENGTH_5, nativeBuffer2.data()), ANI_OK);

    ASSERT_EQ(env_->FixedArray_SetRegion_Long(array, OFFSET_0, LENGTH_5, nativeBuffer.data()), ANI_OK);
    for (ani_size i = 0; i < LENGTH_5; i++) {
        ASSERT_EQ(env_->FixedArray_GetRegion_Long(array, OFFSET_0, LENGTH_5, nativeBuffer2.data()), ANI_OK);
    }
    return ANI_TRUE;
}

ani_int test_FixedArray_Long_07([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_fixedarray_long array = nullptr;
    ASSERT_EQ(env_->FixedArray_New_Long(LENGTH_5, &array), ANI_OK);

    std::array<ani_long, LENGTH_5> nativeBuffer = {TEST_VAL_1, TEST_VAL_2, TEST_VAL_3, TEST_VAL_4, TEST_VAL_5};
    std::array<ani_long, LENGTH_5> nativeBuffer2 = {};
    for (ani_int i = 0; i < LENGTH_5; i++) {
        ASSERT_EQ(env_->FixedArray_SetRegion_Long(array, OFFSET_0, LENGTH_5, nativeBuffer.data()), ANI_OK);
    }
    ASSERT_EQ(env_->FixedArray_GetRegion_Long(array, OFFSET_0, LENGTH_5, nativeBuffer2.data()), ANI_OK);

    for (ani_int i = 0; i < LENGTH_5; i++) {
        ASSERT_EQ(env_->FixedArray_SetRegion_Long(array, OFFSET_0, LENGTH_5, nativeBuffer.data()), ANI_OK);
    }
    for (ani_int i = 0; i < LENGTH_5; i++) {
        ASSERT_EQ(env_->FixedArray_GetRegion_Long(array, OFFSET_0, LENGTH_5, nativeBuffer2.data()), ANI_OK);
    }

    for (ani_int i = 0; i < LENGTH_5; i++) {
        ASSERT_EQ(env_->FixedArray_SetRegion_Long(array, OFFSET_0, LENGTH_5, nativeBuffer.data()), ANI_OK);
        ASSERT_EQ(env_->FixedArray_GetRegion_Long(array, OFFSET_0, LENGTH_5, nativeBuffer2.data()), ANI_OK);
    }
    return ANI_TRUE;
}

ani_int test_FixedArray_Float([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_fixedarray_float array = nullptr;
    ASSERT_EQ(env->FixedArray_New_Float(LENGTH_5, &array), ANI_OK);
    ani_float nativeBuffer[LENGTH_5] = {TEST_VALUE_1, TEST_VALUE_2, TEST_VALUE_3, TEST_VALUE_4, TEST_VALUE_5};
    ASSERT_EQ(env->FixedArray_GetRegion_Float(array, OFFSET_0, LENGTH_1, nativeBuffer), ANI_OK);
    ASSERT_EQ(env->FixedArray_SetRegion_Float(array, OFFSET_0, LENGTH_5, nativeBuffer), ANI_OK);
    return ANI_TRUE;
}

ani_int test_FixedArray_Float_01([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_fixedarray_float array = nullptr;
    ASSERT_EQ(env_->FixedArray_New_Float(LENGTH_5, &array), ANI_OK);
    ani_float nativeBuffer[LENGTH_5] = {TEST_VALUE_1, TEST_VALUE_2, TEST_VALUE_3, TEST_VALUE_4, TEST_VALUE_5};
    const ani_size offset1 = -1;
    ASSERT_EQ(env_->FixedArray_SetRegion_Float(array, offset1, LENGTH_2, nativeBuffer), ANI_OUT_OF_RANGE);
    ASSERT_EQ(env_->FixedArray_SetRegion_Float(array, OFFSET_5, LENGTH_10, nativeBuffer), ANI_OUT_OF_RANGE);
    ASSERT_EQ(env_->FixedArray_SetRegion_Float(array, OFFSET_0, LENGTH_5, nativeBuffer), ANI_OK);
    return ANI_TRUE;
}

ani_int test_FixedArray_Float_02([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_fixedarray_float array = nullptr;
    ASSERT_EQ(env_->FixedArray_New_Float(LENGTH_5, &array), ANI_OK);
    ani_float nativeBuffer[LENGTH_5] = {TEST_VALUE_1, TEST_VALUE_2, TEST_VALUE_3, TEST_VALUE_4, TEST_VALUE_5};
    ASSERT_EQ(env_->FixedArray_GetRegion_Float(array, OFFSET_0, LENGTH_1, nullptr), ANI_INVALID_ARGS);
    ASSERT_EQ(env_->FixedArray_GetRegion_Float(array, OFFSET_5, LENGTH_10, nativeBuffer), ANI_OUT_OF_RANGE);
    ASSERT_EQ(env_->FixedArray_GetRegion_Float(array, OFFSET_0, LENGTH_1, nativeBuffer), ANI_OK);
    return ANI_TRUE;
}

ani_int test_FixedArray_Float_03([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env_->FindClass("fixedarray_region_float_test.ArrayClass", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_ref ref = nullptr;
    ASSERT_EQ(env_->Class_GetStaticFieldByName_Ref(cls, "array", &ref), ANI_OK);
    ASSERT_NE(ref, nullptr);

    auto array = reinterpret_cast<ani_fixedarray_float>(ref);
    ani_float nativeBuffer[LENGTH_5] = {0.0};
    const double epsilon = 1e-6;  // Define acceptable tolerance

    ASSERT_EQ(env_->FixedArray_GetRegion_Float(array, OFFSET_0, LENGTH_5, nativeBuffer), ANI_OK);
    ASSERT_EQ(nativeBuffer[0U], TEST_VALUE_1-epsilon);
    ASSERT_EQ(nativeBuffer[1U], TEST_VALUE_2-epsilon);
    ASSERT_EQ(nativeBuffer[2U], TEST_VALUE_3-epsilon);
    ASSERT_EQ(nativeBuffer[3U], TEST_VALUE_4-epsilon);
    ASSERT_EQ(nativeBuffer[4U], TEST_VALUE_5-epsilon);

    ASSERT_EQ(env_->Class_CallStaticMethodByName_Void(cls, "changeStaticArray", nullptr), ANI_OK);
    ASSERT_EQ(env_->FixedArray_GetRegion_Float(array, OFFSET_0, LENGTH_5, nativeBuffer), ANI_OK);
    ASSERT_EQ(nativeBuffer[0U], TEST_VALUE_1-epsilon);
    ASSERT_EQ(nativeBuffer[1U], TEST_VALUE_2-epsilon);
    ASSERT_EQ(nativeBuffer[2U], TEST_UPDATE_4-epsilon);
    ASSERT_EQ(nativeBuffer[3U], TEST_VALUE_4-epsilon);
    ASSERT_EQ(nativeBuffer[4U], TEST_UPDATE_5-epsilon);
    return ANI_TRUE;
}

ani_int test_FixedArray_Float_04([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env_->FindClass("fixedarray_region_float_test.ArrayClass", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_ref ref = nullptr;
    ASSERT_EQ(env_->Class_GetStaticFieldByName_Ref(cls, "array", &ref), ANI_OK);
    ASSERT_NE(ref, nullptr);

    auto array = reinterpret_cast<ani_fixedarray_float>(ref);
    ani_float nativeBuffer[LENGTH_3] = {TEST_UPDATE_4, TEST_UPDATE_6, TEST_UPDATE_5};

    ASSERT_EQ(env_->FixedArray_SetRegion_Float(array, OFFSET_2, LENGTH_3, nativeBuffer), ANI_OK);

    ani_boolean result = ANI_FALSE;
    ASSERT_EQ(env_->Class_CallStaticMethodByName_Boolean(cls, "checkStaticArray", nullptr, &result), ANI_OK);
    ASSERT_EQ(result, ANI_TRUE);
    return ANI_TRUE;
}

ani_int test_FixedArray_Float_05([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_fixedarray_float array = nullptr;
    ASSERT_EQ(env_->FixedArray_New_Float(LENGTH_6, &array), ANI_OK);
    ani_float max = std::numeric_limits<float>::max();
    ani_float minPositive = std::numeric_limits<float>::min();
    ani_float min = -std::numeric_limits<float>::max();
    const std::array<ani_float, LENGTH_6> nativeBuffer = {minPositive, max, min, 0.0F, -1.0F, 1.0F};
    ASSERT_EQ(env_->FixedArray_SetRegion_Float(array, OFFSET_0, LENGTH_6, nativeBuffer.data()), ANI_OK);

    std::array<ani_float, LENGTH_6> nativeBuffer2 = {};
    ASSERT_EQ(env_->FixedArray_GetRegion_Float(array, OFFSET_0, LENGTH_6, nativeBuffer2.data()), ANI_OK);
    ASSERT_EQ(nativeBuffer2[0U], minPositive);
    ASSERT_EQ(nativeBuffer2[1U], max);
    ASSERT_EQ(nativeBuffer2[2U], min);
    ASSERT_EQ(nativeBuffer2[3U], 0.0F);
    ASSERT_EQ(nativeBuffer2[4U], -1.0F);
    return ANI_TRUE;
}

ani_int test_FixedArray_Float_06([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_fixedarray_float array = nullptr;
    ASSERT_EQ(env_->FixedArray_New_Float(LENGTH_5, &array), ANI_OK);

    std::array<ani_float, LENGTH_5> nativeBuffer = {TEST_VALUE_1, TEST_VALUE_2, TEST_VALUE_3, TEST_VALUE_4,
                                                    TEST_VALUE_5};
    ASSERT_EQ(env_->FixedArray_SetRegion_Float(array, OFFSET_0, LENGTH_5, nativeBuffer.data()), ANI_OK);

    std::array<ani_float, LENGTH_5> nativeBuffer2 = {};
    ASSERT_EQ(env_->FixedArray_GetRegion_Float(array, OFFSET_0, LENGTH_5, nativeBuffer2.data()), ANI_OK);

    for (ani_size i = 0; i < LENGTH_5; i++) {
        ASSERT_EQ(env_->FixedArray_SetRegion_Float(array, OFFSET_0, LENGTH_5, nativeBuffer.data()), ANI_OK);
    }
    ASSERT_EQ(env_->FixedArray_GetRegion_Float(array, OFFSET_0, LENGTH_5, nativeBuffer2.data()), ANI_OK);

    std::array<ani_float, LENGTH_5> nativeBuffer3 = {TEST_VALUE_1, TEST_VALUE_3, TEST_VALUE_5, TEST_VALUE_2,
                                                     TEST_VALUE_4};
    ASSERT_EQ(env_->FixedArray_SetRegion_Float(array, OFFSET_0, LENGTH_5, nativeBuffer3.data()), ANI_OK);
    for (ani_int i = 0; i < LENGTH_3; i++) {
        ASSERT_EQ(env_->FixedArray_SetRegion_Float(array, OFFSET_0, LENGTH_5, nativeBuffer.data()), ANI_OK);
    }
    ASSERT_EQ(env_->FixedArray_SetRegion_Float(array, OFFSET_0, LENGTH_5, nativeBuffer3.data()), ANI_OK);
    ASSERT_EQ(env_->FixedArray_GetRegion_Float(array, OFFSET_0, LENGTH_5, nativeBuffer2.data()), ANI_OK);

    ASSERT_EQ(env_->FixedArray_SetRegion_Float(array, OFFSET_0, LENGTH_5, nativeBuffer.data()), ANI_OK);
    for (ani_size i = 0; i < LENGTH_5; i++) {
        ASSERT_EQ(env_->FixedArray_GetRegion_Float(array, OFFSET_0, LENGTH_5, nativeBuffer2.data()), ANI_OK);
    }
    return ANI_TRUE;
}

ani_int test_FixedArray_Float_07([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_fixedarray_float array = nullptr;
    ASSERT_EQ(env_->FixedArray_New_Float(LENGTH_5, &array), ANI_OK);

    std::array<ani_float, LENGTH_5> nativeBuffer = {TEST_VALUE_1, TEST_VALUE_2, TEST_VALUE_3, TEST_VALUE_4,
                                                    TEST_VALUE_5};
    std::array<ani_float, LENGTH_5> nativeBuffer2 = {};
    for (ani_int i = 0; i < LENGTH_3; i++) {
        ASSERT_EQ(env_->FixedArray_SetRegion_Float(array, OFFSET_0, LENGTH_5, nativeBuffer.data()), ANI_OK);
    }
    ASSERT_EQ(env_->FixedArray_GetRegion_Float(array, OFFSET_0, LENGTH_5, nativeBuffer2.data()), ANI_OK);

    for (ani_int i = 0; i < LENGTH_3; i++) {
        ASSERT_EQ(env_->FixedArray_SetRegion_Float(array, OFFSET_0, LENGTH_5, nativeBuffer.data()), ANI_OK);
    }
    for (ani_int i = 0; i < LENGTH_3; i++) {
        ASSERT_EQ(env_->FixedArray_GetRegion_Float(array, OFFSET_0, LENGTH_5, nativeBuffer2.data()), ANI_OK);
    }

    for (ani_int i = 0; i < LENGTH_3; i++) {
        ASSERT_EQ(env_->FixedArray_SetRegion_Float(array, OFFSET_0, LENGTH_5, nativeBuffer.data()), ANI_OK);
        ASSERT_EQ(env_->FixedArray_GetRegion_Float(array, OFFSET_0, LENGTH_5, nativeBuffer2.data()), ANI_OK);
    }
    return ANI_TRUE;
}

ani_int test_FixedArray_Double([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_fixedarray_double array = nullptr;
    ASSERT_EQ(env->FixedArray_New_Double(LENGTH_5, &array), ANI_OK);
    ani_double nativeBuffer[LENGTH_10] = {TEST_VALUE_1, TEST_VALUE_2, TEST_VALUE_3, TEST_VALUE_4, TEST_VALUE_5};
    ASSERT_EQ(env->FixedArray_GetRegion_Double(array, OFFSET_0, LENGTH_1, nativeBuffer), ANI_OK);
    ASSERT_EQ(env->FixedArray_SetRegion_Double(array, OFFSET_0, LENGTH_5, nativeBuffer), ANI_OK);
    return ANI_TRUE;
}

ani_int test_FixedArray_Double_01([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_fixedarray_double array = nullptr;
    ASSERT_EQ(env_->FixedArray_New_Double(LENGTH_5, &array), ANI_OK);
    ani_double nativeBuffer[LENGTH_5] = {TEST_VALUE_1, TEST_VALUE_2, TEST_VALUE_3, TEST_VALUE_4, TEST_VALUE_5};
    const ani_size offset1 = -1;
    ASSERT_EQ(env_->FixedArray_SetRegion_Double(array, offset1, LENGTH_2, nativeBuffer), ANI_OUT_OF_RANGE);
    ASSERT_EQ(env_->FixedArray_SetRegion_Double(array, OFFSET_5, LENGTH_10, nativeBuffer), ANI_OUT_OF_RANGE);
    ASSERT_EQ(env_->FixedArray_SetRegion_Double(array, OFFSET_0, LENGTH_5, nativeBuffer), ANI_OK);
    return ANI_TRUE;
}

ani_int test_FixedArray_Double_02([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_fixedarray_double array = nullptr;
    ASSERT_EQ(env_->FixedArray_New_Double(LENGTH_5, &array), ANI_OK);
    ani_double nativeBuffer[LENGTH_10] = {TEST_VALUE_1, TEST_VALUE_2, TEST_VALUE_3, TEST_VALUE_4, TEST_VALUE_5};
    ASSERT_EQ(env_->FixedArray_GetRegion_Double(array, OFFSET_0, LENGTH_1, nullptr), ANI_INVALID_ARGS);
    ASSERT_EQ(env_->FixedArray_GetRegion_Double(array, OFFSET_5, LENGTH_10, nativeBuffer), ANI_OUT_OF_RANGE);
    ASSERT_EQ(env_->FixedArray_GetRegion_Double(array, OFFSET_0, LENGTH_1, nativeBuffer), ANI_OK);
    return ANI_TRUE;
}

ani_int test_FixedArray_Double_03([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env_->FindClass("fixedarray_region_double_test.ArrayClass", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_ref ref = nullptr;
    ASSERT_EQ(env_->Class_GetStaticFieldByName_Ref(cls, "array", &ref), ANI_OK);
    ASSERT_NE(ref, nullptr);

    auto array = reinterpret_cast<ani_fixedarray_double>(ref);
    ani_double nativeBuffer[LENGTH_5] = {0.0};
    const ani_size offset5 = 0;
    const ani_size len5 = 5;
    const double epsilon = 1e-6;  // Define acceptable tolerance

    ASSERT_EQ(env_->FixedArray_GetRegion_Double(array, offset5, len5, nativeBuffer), ANI_OK);
    ASSERT_EQ(nativeBuffer[0U], TEST_VALUE_1-epsilon);
    ASSERT_EQ(nativeBuffer[1U], TEST_VALUE_2-epsilon);
    ASSERT_EQ(nativeBuffer[2U], TEST_VALUE_3-epsilon);
    ASSERT_EQ(nativeBuffer[3U], TEST_VALUE_4-epsilon);
    ASSERT_EQ(nativeBuffer[4U], TEST_VALUE_5-epsilon);

    ASSERT_EQ(env_->Class_CallStaticMethodByName_Void(cls, "changeStaticArray", nullptr), ANI_OK);
    ASSERT_EQ(env_->FixedArray_GetRegion_Double(array, offset5, len5, nativeBuffer), ANI_OK);
    ASSERT_EQ(nativeBuffer[0U], TEST_VALUE_1-epsilon);
    ASSERT_EQ(nativeBuffer[1U], TEST_VALUE_2-epsilon);
    ASSERT_EQ(nativeBuffer[2U], TEST_UPDATE_4-epsilon);
    ASSERT_EQ(nativeBuffer[3U], TEST_VALUE_4-epsilon);
    ASSERT_EQ(nativeBuffer[4U], TEST_UPDATE_5-epsilon);
    return ANI_TRUE;
}

ani_int test_FixedArray_Double_04([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env_->FindClass("fixedarray_region_double_test.ArrayClass", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_ref ref = nullptr;
    ASSERT_EQ(env_->Class_GetStaticFieldByName_Ref(cls, "array", &ref), ANI_OK);
    ASSERT_NE(ref, nullptr);

    auto array = reinterpret_cast<ani_fixedarray_double>(ref);
    ani_double nativeBuffer[LENGTH_3] = {TEST_UPDATE_4, TEST_UPDATE_6, TEST_UPDATE_5};
    ASSERT_EQ(env_->FixedArray_SetRegion_Double(array, OFFSET_2, LENGTH_3, nativeBuffer), ANI_OK);

    ani_boolean result = ANI_FALSE;
    ASSERT_EQ(env_->Class_CallStaticMethodByName_Boolean(cls, "checkStaticArray", nullptr, &result), ANI_OK);
    ASSERT_EQ(result, ANI_TRUE);
    return ANI_TRUE;
}

ani_int test_FixedArray_Double_05([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_fixedarray_double array = nullptr;
    ASSERT_EQ(env_->FixedArray_New_Double(LENGTH_6, &array), ANI_OK);

    ani_double max = std::numeric_limits<double>::max();
    ani_double minPositive = std::numeric_limits<double>::min();
    ani_double min = -std::numeric_limits<double>::max();

    const std::array<ani_double, LENGTH_6> nativeBuffer = {minPositive, max, min, 0.0, -1.0, 1.0};
    ASSERT_EQ(env_->FixedArray_SetRegion_Double(array, OFFSET_0, LENGTH_6, nativeBuffer.data()), ANI_OK);

    std::array<ani_double, LENGTH_6> nativeBuffer2 = {};
    ASSERT_EQ(env_->FixedArray_GetRegion_Double(array, OFFSET_0, LENGTH_6, nativeBuffer2.data()), ANI_OK);
    ASSERT_EQ(nativeBuffer2[0U], minPositive);
    ASSERT_EQ(nativeBuffer2[1U], max);
    ASSERT_EQ(nativeBuffer2[2U], min);
    ASSERT_EQ(nativeBuffer2[3U], 0.0);
    ASSERT_EQ(nativeBuffer2[4U], -1.0);
    return ANI_TRUE;
}

ani_int test_FixedArray_Double_06([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_fixedarray_double array = nullptr;
    ASSERT_EQ(env_->FixedArray_New_Double(LENGTH_5, &array), ANI_OK);

    std::array<ani_double, LENGTH_5> nativeBuffer = {TEST_VALUE_1, TEST_VALUE_2, TEST_VALUE_3, TEST_VALUE_4,
                                                     TEST_VALUE_5};
    ASSERT_EQ(env_->FixedArray_SetRegion_Double(array, OFFSET_0, LENGTH_5, nativeBuffer.data()), ANI_OK);
    std::array<ani_double, LENGTH_5> nativeBuffer2 = {};
    ASSERT_EQ(env_->FixedArray_GetRegion_Double(array, OFFSET_0, LENGTH_5, nativeBuffer2.data()), ANI_OK);

    for (ani_size i = 0; i < LENGTH_5; i++) {
        ASSERT_EQ(env_->FixedArray_SetRegion_Double(array, OFFSET_0, LENGTH_5, nativeBuffer.data()), ANI_OK);
    }
    ASSERT_EQ(env_->FixedArray_GetRegion_Double(array, OFFSET_0, LENGTH_5, nativeBuffer2.data()), ANI_OK);

    std::array<ani_double, LENGTH_5> nativeBuffer3 = {TEST_VALUE_1, TEST_VALUE_3, TEST_VALUE_5, TEST_VALUE_2,
                                                      TEST_VALUE_4};
    ASSERT_EQ(env_->FixedArray_SetRegion_Double(array, OFFSET_0, LENGTH_5, nativeBuffer3.data()), ANI_OK);
    for (ani_int i = 0; i < LENGTH_3; i++) {
        ASSERT_EQ(env_->FixedArray_SetRegion_Double(array, OFFSET_0, LENGTH_5, nativeBuffer.data()), ANI_OK);
    }
    ASSERT_EQ(env_->FixedArray_SetRegion_Double(array, OFFSET_0, LENGTH_5, nativeBuffer3.data()), ANI_OK);
    ASSERT_EQ(env_->FixedArray_GetRegion_Double(array, OFFSET_0, LENGTH_5, nativeBuffer2.data()), ANI_OK);

    ASSERT_EQ(env_->FixedArray_SetRegion_Double(array, OFFSET_0, LENGTH_5, nativeBuffer.data()), ANI_OK);
    for (ani_size i = 0; i < LENGTH_5; i++) {
        ASSERT_EQ(env_->FixedArray_GetRegion_Double(array, OFFSET_0, LENGTH_5, nativeBuffer2.data()), ANI_OK);
    }
    return ANI_TRUE;
}

ani_int test_FixedArray_Double_07([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_fixedarray_double array = nullptr;
    ASSERT_EQ(env_->FixedArray_New_Double(LENGTH_5, &array), ANI_OK);

    std::array<ani_double, LENGTH_5> nativeBuffer = {TEST_VALUE_1, TEST_VALUE_2, TEST_VALUE_3, TEST_VALUE_4,
                                                     TEST_VALUE_5};
    std::array<ani_double, LENGTH_5> nativeBuffer2 = {};
    for (ani_int i = 0; i < LENGTH_3; i++) {
        ASSERT_EQ(env_->FixedArray_SetRegion_Double(array, OFFSET_0, LENGTH_5, nativeBuffer.data()), ANI_OK);
    }
    ASSERT_EQ(env_->FixedArray_GetRegion_Double(array, OFFSET_0, LENGTH_5, nativeBuffer2.data()), ANI_OK);

    for (ani_int i = 0; i < LENGTH_3; i++) {
        ASSERT_EQ(env_->FixedArray_SetRegion_Double(array, OFFSET_0, LENGTH_5, nativeBuffer.data()), ANI_OK);
    }
    for (ani_int i = 0; i < LENGTH_3; i++) {
        ASSERT_EQ(env_->FixedArray_GetRegion_Double(array, OFFSET_0, LENGTH_5, nativeBuffer2.data()), ANI_OK);
    }

    for (ani_int i = 0; i < LENGTH_3; i++) {
        ASSERT_EQ(env_->FixedArray_SetRegion_Double(array, OFFSET_0, LENGTH_5, nativeBuffer.data()), ANI_OK);
        ASSERT_EQ(env_->FixedArray_GetRegion_Double(array, OFFSET_0, LENGTH_5, nativeBuffer2.data()), ANI_OK);
    }
    return ANI_TRUE;
}

// NOLINTBEGIN(cppcoreguidelines-pro-type-vararg)
template <typename R, typename... Args>
ani_int DoCallFunction(ani_env *env, std::optional<R> *result, ani_function fn, Args &&...args)
{
    std::conditional_t<std::is_same_v<R, void>, std::nullopt_t, R> value {};
    ani_status status;

    if constexpr (std::is_same_v<R, ani_boolean>) {
        status = env->Function_Call_Boolean(fn, &value, std::forward<Args>(args)...);
    } else if constexpr (std::is_same_v<R, ani_byte>) {
        status = env->Function_Call_Byte(fn, &value, std::forward<Args>(args)...);
    } else if constexpr (std::is_same_v<R, ani_char>) {
        status = env->Function_Call_Char(fn, &value, std::forward<Args>(args)...);
    } else if constexpr (std::is_same_v<R, ani_short>) {
        status = env->Function_Call_Short(fn, &value, std::forward<Args>(args)...);
    } else if constexpr (std::is_same_v<R, ani_int>) {
        status = env->Function_Call_Int(fn, &value, std::forward<Args>(args)...);
    } else if constexpr (std::is_same_v<R, ani_long>) {
        status = env->Function_Call_Long(fn, &value, std::forward<Args>(args)...);
    } else if constexpr (std::is_same_v<R, ani_float>) {
        status = env->Function_Call_Float(fn, &value, std::forward<Args>(args)...);
    } else if constexpr (std::is_same_v<R, ani_double>) {
        status = env->Function_Call_Double(fn, &value, std::forward<Args>(args)...);
    } else if constexpr (std::is_same_v<R, void>) {
        status = env->Function_Call_Void(fn, std::forward<Args>(args)...);
        value = std::nullopt;
    } else if constexpr (std::is_same_v<R, ani_ref> || std::is_same_v<R, ani_tuple_value> ||
        std::is_same_v<R, ani_object>) {
        ani_ref resultRef {};
        status = env->Function_Call_Ref(fn, &resultRef, std::forward<Args>(args)...);
        value = static_cast<R>(resultRef);
    } else {
        enum { INCORRECT_TEMPLATE_TYPE = false };
        static_assert(INCORRECT_TEMPLATE_TYPE, "Incorrect template type");
    }

    if (status == ANI_PENDING_ERROR) {
        ASSERT_EQ(env->DescribeError(), ANI_OK);
    }
    ASSERT_EQ(status, ANI_OK);

    result->emplace(value);
    return ANI_TRUE;
}
// NOLINTEND(cppcoreguidelines-pro-type-vararg)

template <typename R, typename... Args>
ani_int CallEtsFunctionImpl(ani_env *env, std::optional<R> *result, const std::string &moduleDescriptor,
                            const std::string &fnName, Args &&...args)
{
    ani_module mod {};
    ASSERT_EQ(env->FindModule(moduleDescriptor.c_str(), &mod), ANI_OK);
    ani_function fn {};
    ASSERT_EQ(env->Module_FindFunction(mod, fnName.c_str(), nullptr, &fn), ANI_OK);
    ASSERT_EQ(DoCallFunction(env, result, fn, std::forward<Args>(args)...), ANI_TRUE);
    return ANI_TRUE;
}

/// Call function with name `fnName` from module denoted by `moduleDescriptor`
template <typename R, typename... Args>
R CallEtsFunction(ani_env *env, const std::string &moduleName, const std::string &fnName, Args &&...args)
{
    std::optional<R> result;
    CallEtsFunctionImpl(env, &result, moduleName, fnName, std::forward<Args>(args)...);
    if constexpr (!std::is_same_v<R, void>) {
        return result.value();
    }
}

ani_int test_FixedArray_Get_Ref([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const char *tmpName = "entry.src.main.src.ets.FixedArray";
    auto array = static_cast<ani_fixedarray_ref>(CallEtsFunction<ani_ref>(env, tmpName, "getArray1"));
    const ani_size index1 = 1;
    const ani_size index2 = 2;
    ani_ref ref1 = nullptr;
    ani_ref ref2 = nullptr;
    ani_boolean isNull;
    ASSERT_EQ(env->FixedArray_Get_Ref(array, index1, &ref1), ANI_OK);
    return ANI_TRUE;
}

ani_int test_FixedArray_Get_Ref_01([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_ref ref = nullptr;
    const ani_size index = 0;
    const ani_size invalidIndex = 5;
    ASSERT_EQ(env_->FixedArray_Get_Ref(nullptr, index, &ref), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_FixedArray_Get_Ref_02([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    const ani_size index1 = 1;
    const ani_size index2 = 2;
    ani_ref ref1 = nullptr;
    ani_ref ref2 = nullptr;
    ani_boolean isNull;
    ASSERT_EQ(env_->Reference_IsNull(ref1, &isNull), ANI_OK);
    ASSERT_EQ(isNull, ANI_TRUE);
    ASSERT_EQ(env_->Reference_IsNull(ref2, &isNull), ANI_OK);
    ASSERT_EQ(isNull, ANI_FALSE);
    return ANI_TRUE;
}

ani_int test_FixedArray_New_Ref([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls = nullptr;
    ASSERT_EQ(env->FindClass("std.core.String", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    // Test zero length
    ani_fixedarray_ref zeroLengthArray = nullptr;
    ASSERT_EQ(env->FixedArray_New_Ref(cls, ZERO, nullptr, &zeroLengthArray), ANI_OK);
    ASSERT_NE(zeroLengthArray, nullptr);
    return ANI_TRUE;
}

ani_int test_FixedArray_New_Ref_01([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_class cls = nullptr;
    ASSERT_EQ(env_->FindClass("std.core.String", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_fixedarray_ref array = nullptr;
    // Test null result pointer
    ASSERT_EQ(env_->FixedArray_New_Ref(cls, LENGTH_5, nullptr, nullptr), ANI_INVALID_ARGS);

    // Test null class
    ASSERT_EQ(env_->FixedArray_New_Ref(nullptr, LENGTH_5, nullptr, &array), ANI_INVALID_ARGS);

    if (sizeof(ani_size) > sizeof(uint32_t)) {
        ani_size maxLength = std::numeric_limits<uint32_t>::max() + ani_size(1);
        ASSERT_EQ(env_->FixedArray_New_Ref(cls, maxLength, nullptr, &array), ANI_INVALID_ARGS);
    }
    return ANI_TRUE;
}

ani_int test_FixedArray_New_Ref_02([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_class cls = nullptr;
    ASSERT_EQ(env_->FindClass("std.core.String", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    // Test zero length
    ani_fixedarray_ref zeroLengthArray = nullptr;
    ASSERT_EQ(env_->FixedArray_New_Ref(cls, ZERO, nullptr, &zeroLengthArray), ANI_OK);
    ASSERT_NE(zeroLengthArray, nullptr);
    ani_size zeroLengthSize = 0;
    ASSERT_EQ(env_->FixedArray_GetLength(zeroLengthArray, &zeroLengthSize), ANI_OK);
    ASSERT_EQ(zeroLengthSize, ZERO);

    ani_fixedarray_ref array = nullptr;
    ani_size size = 0;

    // Test creating array with undefined initial element
    ani_ref undefinedRef = nullptr;
    ASSERT_EQ(env_->GetUndefined(&undefinedRef), ANI_OK);
    ASSERT_EQ(env_->FixedArray_New_Ref(cls, LENGTH_5, undefinedRef, &array), ANI_OK);
    ASSERT_NE(array, nullptr);
    ASSERT_EQ(env_->FixedArray_GetLength(array, &size), ANI_OK);
    ASSERT_EQ(size, LENGTH_5);

    // Test creating array with null initial element
    ani_ref nullRef = nullptr;
    ASSERT_EQ(env_->GetNull(&nullRef), ANI_OK);
    ASSERT_EQ(env_->FixedArray_New_Ref(cls, LENGTH_5, nullRef, &array), ANI_OK);
    ASSERT_NE(array, nullptr);
    ASSERT_EQ(env_->FixedArray_GetLength(array, &size), ANI_OK);
    ASSERT_EQ(size, LENGTH_5);

    // Test creating array with initial element
    ani_string str = nullptr;
    const char *utf8String = "test";
    const ani_size stringLength = strlen(utf8String);
    ASSERT_EQ(env_->String_NewUTF8(utf8String, stringLength, &str), ANI_OK);
    ASSERT_NE(str, nullptr);
    ani_fixedarray_ref array2 = nullptr;
    ASSERT_EQ(env_->FixedArray_New_Ref(cls, stringLength, str, &array2), ANI_OK);
    ASSERT_NE(array2, nullptr);

    // Verify initial element was set for all elements
    for (ani_size i = 0; i < stringLength; i++) {
        ani_ref element = nullptr;
        ASSERT_EQ(env_->FixedArray_Get_Ref(array2, i, &element), ANI_OK);
        ani_size resultSize = 0;
        char utfBuffer[LENGTH_10] = {0};
        ASSERT_EQ(env_->String_GetUTF8SubString(reinterpret_cast<ani_string>(element), ZERO, stringLength, utfBuffer,
                                                sizeof(utfBuffer), &resultSize),
                  ANI_OK);
        ASSERT_EQ(utfBuffer, utf8String);
    }
    return ANI_TRUE;
}


ani_int test_FixedArray_New_Ref_03([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_class cls = nullptr;
    ASSERT_EQ(env_->FindClass("std.core.String", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_fixedarray_ref array1 = nullptr;
    ani_fixedarray_ref array2 = nullptr;
    ani_fixedarray_ref array3 = nullptr;
    ani_size size = 0;

    ani_ref undefinedRef = nullptr;
    ASSERT_EQ(env_->GetUndefined(&undefinedRef), ANI_OK);
    ASSERT_EQ(env_->FixedArray_New_Ref(cls, MINI_LENGTH, undefinedRef, &array1), ANI_OK);
    ASSERT_NE(array1, nullptr);
    ASSERT_EQ(env_->FixedArray_GetLength(array1, &size), ANI_OK);
    ASSERT_EQ(size, MINI_LENGTH);

    ASSERT_EQ(env_->FixedArray_New_Ref(cls, MID_LENGTH, undefinedRef, &array2), ANI_OK);
    ASSERT_NE(array2, nullptr);
    ASSERT_EQ(env_->FixedArray_GetLength(array2, &size), ANI_OK);
    ASSERT_EQ(size, MID_LENGTH);

    ASSERT_EQ(env_->FixedArray_New_Ref(cls, BIG_LENGTH, undefinedRef, &array3), ANI_OK);
    ASSERT_NE(array3, nullptr);
    ASSERT_EQ(env_->FixedArray_GetLength(array3, &size), ANI_OK);
    ASSERT_EQ(size, BIG_LENGTH);
    return ANI_TRUE;
}

ani_int test_FixedArray_New_Ref_04([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_class cls = nullptr;
    ASSERT_EQ(env_->FindClass("std.core.String", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_ref undefinedRef = nullptr;
    ASSERT_EQ(env_->GetUndefined(&undefinedRef), ANI_OK);
    for (ani_int i = 0; i < LENGTH_3; i++) {
        ani_fixedarray_ref array = nullptr;
        ASSERT_EQ(env_->FixedArray_New_Ref(cls, LENGTH_5, undefinedRef, &array), ANI_OK);
        ASSERT_NE(array, nullptr);
    }
    return ANI_TRUE;
}

ani_int test_FixedArray_New_Ref_05([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_class cls = nullptr;
    ASSERT_EQ(env_->FindClass("std.core.String", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_string str = nullptr;
    auto status = env_->String_NewUTF8("", 0U, &str);
    ASSERT_EQ(status, ANI_OK);
    ASSERT_NE(str, nullptr);

    const ani_size maxNum = std::numeric_limits<uint32_t>::max();
    ani_fixedarray_ref array1 = nullptr;
    ani_ref undefinedRef = nullptr;
    ASSERT_EQ(env_->GetUndefined(&undefinedRef), ANI_OK);
    ASSERT_EQ(env_->FixedArray_New_Ref(cls, ZERO, undefinedRef, &array1), ANI_OK);
    ASSERT_NE(array1, nullptr);

    ani_fixedarray_ref array2 = nullptr;
    ASSERT_EQ(env_->FixedArray_New_Ref(cls, maxNum, undefinedRef, &array2), ANI_OUT_OF_MEMORY);

    ani_fixedarray_ref array3 = nullptr;
    ASSERT_EQ(env_->FixedArray_New_Ref(cls, ZERO, str, &array3), ANI_PENDING_ERROR);

    ani_fixedarray_ref array4 = nullptr;
    ASSERT_EQ(env_->FixedArray_New_Ref(cls, maxNum, str, &array4), ANI_PENDING_ERROR);
    return ANI_TRUE;
}

ani_int test_FixedArray_New_Ref_06([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_fixedarray_boolean array = nullptr;
    ani_fixedarray_boolean array1 = nullptr;
    ASSERT_EQ(env_->FixedArray_New_Boolean(ARRAYSIZE_10K, &array), ANI_OK);
    ASSERT_EQ(env_->FixedArray_New_Boolean(ARRAYSIZE_100K, &array1), ANI_OK);
    ani_fixedarray_char array2 = nullptr;
    ani_fixedarray_char array22 = nullptr;
    ASSERT_EQ(env_->FixedArray_New_Char(ARRAYSIZE_10K, &array2), ANI_OK);
    ASSERT_EQ(env_->FixedArray_New_Char(ARRAYSIZE_100K, &array22), ANI_OK);
    ani_fixedarray_byte array3 = nullptr;
    ani_fixedarray_byte array33 = nullptr;
    ASSERT_EQ(env_->FixedArray_New_Byte(ARRAYSIZE_10K, &array3), ANI_OK);
    ASSERT_EQ(env_->FixedArray_New_Byte(ARRAYSIZE_100K, &array33), ANI_OK);
    ani_fixedarray_short array4 = nullptr;
    ani_fixedarray_short array44 = nullptr;
    ASSERT_EQ(env_->FixedArray_New_Short(ARRAYSIZE_10K, &array4), ANI_OK);
    ASSERT_EQ(env_->FixedArray_New_Short(ARRAYSIZE_100K, &array44), ANI_OK);
    ani_fixedarray_int array5 = nullptr;
    ani_fixedarray_int array55 = nullptr;
    ASSERT_EQ(env_->FixedArray_New_Int(ARRAYSIZE_10K, &array5), ANI_OK);
    ASSERT_EQ(env_->FixedArray_New_Int(ARRAYSIZE_100K, &array55), ANI_OK);
    ani_fixedarray_long array6 = nullptr;
    ani_fixedarray_long array66 = nullptr;
    ASSERT_EQ(env_->FixedArray_New_Long(ARRAYSIZE_10K, &array6), ANI_OK);
    ASSERT_EQ(env_->FixedArray_New_Long(ARRAYSIZE_100K, &array66), ANI_OK);
    ani_fixedarray_float array7 = nullptr;
    ani_fixedarray_float array77 = nullptr;
    ASSERT_EQ(env_->FixedArray_New_Float(ARRAYSIZE_10K, &array7), ANI_OK);
    ASSERT_EQ(env_->FixedArray_New_Float(ARRAYSIZE_100K, &array77), ANI_OK);
    ani_fixedarray_double array8 = nullptr;
    ani_fixedarray_double array88 = nullptr;
    ASSERT_EQ(env_->FixedArray_New_Double(ARRAYSIZE_10K, &array8), ANI_OK);
    ASSERT_EQ(env_->FixedArray_New_Double(ARRAYSIZE_100K, &array88), ANI_OK);
    return ANI_TRUE;
}

ani_int test_FixedArray_Set_Ref([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const char *tmpName = "entry.src.main.src.ets.FixedArray";
    auto array = static_cast<ani_fixedarray_ref>(CallEtsFunction<ani_ref>(env, tmpName, "getArray2"));

    auto newValue1 = static_cast<ani_ref>(CallEtsFunction<ani_ref>(env, tmpName, "getNewString1"));
    const ani_size index1 = 0;
    ASSERT_EQ(env->FixedArray_Set_Ref(array, index1, newValue1), ANI_OK);
    return ANI_TRUE;
}

ani_int test_FixedArray_Set_Ref_01([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_fixedarray_ref array = nullptr;
    ani_class cls = nullptr;
    ASSERT_EQ(env_->FindClass("std.core.String", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);
    std::string_view rawString {"1234"};
    ani_string str {};
    ASSERT_EQ(env_->String_NewUTF8(rawString.data(), rawString.length(), &str), ANI_OK);
    ASSERT_EQ(env_->FixedArray_New_Ref(cls, LENGTH_3, str, &array), ANI_OK);
    const ani_size index = 0;
    const ani_size invalidIndex = 5;
    ASSERT_EQ(env_->FixedArray_Set_Ref(nullptr, index, str), ANI_INVALID_ARGS);
    ASSERT_EQ(env_->FixedArray_Set_Ref(array, invalidIndex, str), ANI_OUT_OF_RANGE);
    return ANI_TRUE;
}

ani_int test_FixedArray_Set_Ref_02([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    const ani_size index1 = 0;
    const ani_size index2 = 2;
    return ANI_TRUE;
}

ani_int test_FixedArray_Set_Ref_03([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_fixedarray_ref array = nullptr;
    ani_class cls = nullptr;
    ASSERT_EQ(env_->FindClass("std.core.String", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);
    std::string_view rawString {"1234"};
    ani_string str {};
    ASSERT_EQ(env_->String_NewUTF8(rawString.data(), rawString.length(), &str), ANI_OK);
    ASSERT_EQ(env_->FixedArray_New_Ref(cls, LENGTH_3, str, &array), ANI_OK);

    const ani_size errorIndex = -1;
    ASSERT_EQ(env_->FixedArray_Set_Ref(array, errorIndex, str), ANI_OUT_OF_RANGE);
    return ANI_TRUE;
}

ani_int test_FixedArray_Set_Ref_04([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_fixedarray_ref array = nullptr;
    ani_class cls = nullptr;
    ASSERT_EQ(env_->FindClass("std.core.String", &cls), ANI_OK);
    std::string_view rawString {"1234"};
    ani_string str {};
    ASSERT_EQ(env_->String_NewUTF8(rawString.data(), rawString.length(), &str), ANI_OK);
    ASSERT_EQ(env_->FixedArray_New_Ref(cls, LENGTH_5, str, &array), ANI_OK);

    std::string_view newString1 {"New String 1!"};
    ani_string newStr1 {};
    ASSERT_EQ(env_->String_NewUTF8(newString1.data(), newString1.length(), &newStr1), ANI_OK);

    const ani_size index1 = 1;
    ASSERT_EQ(env_->FixedArray_Set_Ref(array, index1, newStr1), ANI_OK);
    ani_ref ref1 = nullptr;
    ASSERT_EQ(env_->FixedArray_Get_Ref(array, index1, &ref1), ANI_OK);

    std::string result {};
    GetStdString(env_, static_cast<ani_string>(ref1), result);
    ASSERT_STREQ(result.c_str(), "New String 1!");

    for (ani_size i = 0; i < LENGTH_5; i++) {
        ASSERT_EQ(env_->FixedArray_Set_Ref(array, index1, newStr1), ANI_OK);
    }
    ASSERT_EQ(env_->FixedArray_Get_Ref(array, index1, &ref1), ANI_OK);
    GetStdString(env_, static_cast<ani_string>(ref1), result);
    ASSERT_STREQ(result.c_str(), "New String 1!");

    const ani_size index2 = 2;

    std::string_view newString2 {"New String 2!"};
    ani_string newStr2 {};
    ASSERT_EQ(env_->String_NewUTF8(newString2.data(), newString2.length(), &newStr2), ANI_OK);

    ASSERT_EQ(env_->FixedArray_Set_Ref(array, index1, newStr1), ANI_OK);
    ASSERT_EQ(env_->FixedArray_Set_Ref(array, index2, newStr2), ANI_OK);
    for (ani_int i = 0; i < LENGTH_5; i++) {
        ASSERT_EQ(env_->FixedArray_Set_Ref(array, index1, newStr2), ANI_OK);
        ASSERT_EQ(env_->FixedArray_Set_Ref(array, index2, newStr1), ANI_OK);
    }
    ASSERT_EQ(env_->FixedArray_Get_Ref(array, index1, &ref1), ANI_OK);
    ani_ref ref2 = nullptr;
    std::string result2 {};
    ASSERT_EQ(env_->FixedArray_Get_Ref(array, index2, &ref2), ANI_OK);
    GetStdString(env_, static_cast<ani_string>(ref1), result);
    GetStdString(env_, static_cast<ani_string>(ref2), result2);
    ASSERT_STREQ(result.c_str(), "New String 2!");
    ASSERT_STREQ(result2.c_str(), "New String 1!");

    ASSERT_EQ(env_->FixedArray_Set_Ref(array, index1, newStr1), ANI_OK);
    for (ani_size i = 0; i < LENGTH_5; i++) {
        ASSERT_EQ(env_->FixedArray_Get_Ref(array, index1, &ref1), ANI_OK);
        GetStdString(env_, static_cast<ani_string>(ref1), result);
        ASSERT_STREQ(result.c_str(), "New String 1!");
    }
    return ANI_TRUE;
}

ani_int test_FixedArray_Set_Ref_05([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_fixedarray_ref array = nullptr;
    ani_class cls = nullptr;
    ASSERT_EQ(env_->FindClass("std.core.String", &cls), ANI_OK);
    std::string_view rawString {"1234"};
    ani_string str {};
    ASSERT_EQ(env_->String_NewUTF8(rawString.data(), rawString.length(), &str), ANI_OK);
    ASSERT_EQ(env_->FixedArray_New_Ref(cls, LENGTH_3, str, &array), ANI_OK);
    ani_ref ref1 = nullptr;
    
    std::string_view newString1 {"New String 1!"};
    ani_string newStr1 {};
    ASSERT_EQ(env_->String_NewUTF8(newString1.data(), newString1.length(), &newStr1), ANI_OK);
    
    const ani_size index1 = 1;
    for (ani_int i = 0; i < LENGTH_3; i++) {
        ASSERT_EQ(env_->FixedArray_Set_Ref(array, index1, newStr1), ANI_OK);
    }
    ASSERT_EQ(env_->FixedArray_Get_Ref(array, index1, &ref1), ANI_OK);
    std::string result {};
    GetStdString(env_, static_cast<ani_string>(ref1), result);
    ASSERT_STREQ(result.c_str(), "New String 1!");

    for (ani_int i = 0; i < LENGTH_3; i++) {
        ASSERT_EQ(env_->FixedArray_Set_Ref(array, index1, newStr1), ANI_OK);
    }
    for (ani_int i = 0; i < LENGTH_3; i++) {
        ASSERT_EQ(env_->FixedArray_Get_Ref(array, index1, &ref1), ANI_OK);
    }
    GetStdString(env_, static_cast<ani_string>(ref1), result);
    ASSERT_STREQ(result.c_str(), "New String 1!");

    for (ani_int i = 0; i < LENGTH_3; i++) {
        ASSERT_EQ(env_->FixedArray_Set_Ref(array, index1, newStr1), ANI_OK);
        ASSERT_EQ(env_->FixedArray_Get_Ref(array, index1, &ref1), ANI_OK);
    }
    GetStdString(env_, static_cast<ani_string>(ref1), result);
    ASSERT_STREQ(result.c_str(), "New String 1!");
    return ANI_TRUE;
}
#endif // ARKTS_ANI_TEST_FIXEDARRAY_H
