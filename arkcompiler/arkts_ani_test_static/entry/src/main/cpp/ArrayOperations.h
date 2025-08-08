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

#ifndef ARKTS_ANI_TEST_ARRAYOPERATIONS_H
#define ARKTS_ANI_TEST_ARRAYOPERATIONS_H
#include "Common.h"

ani_boolean test_array_region_byte([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ASSERT_NE(env, nullptr);
    const ani_size OFFSET_0 = 0;
    const ani_size LENGTH_5 = 5;
    ani_array_byte array = nullptr;
    ASSERT_EQ(env->Array_New_Byte(LENGTH_5, &array), ANI_OK);

    const ani_byte minByteValue = -128;
    const ani_byte maxByteValue = 127;
    std::array<ani_byte, LENGTH_5> nativeBuffer = {minByteValue, maxByteValue, static_cast<ani_byte>(0),
                                                   static_cast<ani_byte>(-1), static_cast<ani_byte>(1)};
    ASSERT_EQ(env->Array_SetRegion_Byte(array, OFFSET_0, LENGTH_5, nativeBuffer.data()), ANI_OK);

    std::array<ani_byte, LENGTH_5> nativeBuffer2 = {};
    ASSERT_EQ(env->Array_GetRegion_Byte(array, OFFSET_0, LENGTH_5, nativeBuffer2.data()), ANI_OK);
    return ANI_TRUE;
}

ani_boolean test_array_region_char([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ASSERT_NE(env, nullptr);
    ani_array_char array = nullptr;

    const ani_size LENGTH_10 = 10;
    const ani_size OFFSET_0 = 0;
    ASSERT_EQ(env->Array_New_Char(LENGTH_10, &array), ANI_OK);

    const std::array<ani_char, LENGTH_10> nativeBuffer = {'a', '0', '\n', '\r', '\t', '\b', '\a', '\v', '\f', '\0'};
    ASSERT_EQ(env->Array_SetRegion_Char(array, OFFSET_0, LENGTH_10, nativeBuffer.data()), ANI_OK);

    std::array<ani_char, LENGTH_10> nativeBuffer2 = {};
    ASSERT_EQ(env->Array_GetRegion_Char(array, OFFSET_0, LENGTH_10, nativeBuffer2.data()), ANI_OK);
    return ANI_TRUE;
}

ani_boolean test_array_region_boolean([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ASSERT_NE(env, nullptr);
    ani_array_boolean array = nullptr;
    const ani_size OFFSET_0 = 0;
    const ani_size LENGTH_5 = 5;
    ASSERT_EQ(env->Array_New_Boolean(LENGTH_5, &array), ANI_OK);

    std::array<ani_boolean, LENGTH_5> nativeBuffer = {ANI_TRUE, ANI_FALSE, ANI_TRUE, ANI_FALSE, ANI_TRUE};
    std::array<ani_boolean, LENGTH_5> nativeBuffer2 = {ANI_FALSE};
    ASSERT_EQ(env->Array_SetRegion_Boolean(array, OFFSET_0, LENGTH_5, nativeBuffer.data()), ANI_OK);
    ASSERT_EQ(env->Array_GetRegion_Boolean(array, OFFSET_0, LENGTH_5, nativeBuffer2.data()), ANI_OK);
    return ANI_TRUE;
}

ani_boolean test_array_region_double([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ASSERT_NE(env, nullptr);
    ani_array_double array = nullptr;
    const ani_size OFFSET_0 = 0;
    const ani_size LENGTH_5 = 5;
    ASSERT_EQ(env->Array_New_Double(LENGTH_5, &array), ANI_OK);

    std::array<ani_double, LENGTH_5> nativeBuffer = {1.0, 2.0, 3.0, 4.0, 5.0};
    std::array<ani_double, LENGTH_5> nativeBuffer2 = {0.0};
    ASSERT_EQ(env->Array_SetRegion_Double(array, OFFSET_0, LENGTH_5, nativeBuffer.data()), ANI_OK);
    ASSERT_EQ(env->Array_GetRegion_Double(array, OFFSET_0, LENGTH_5, nativeBuffer2.data()), ANI_OK);
    return ANI_TRUE;
}

ani_boolean test_array_region_float([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ASSERT_NE(env, nullptr);
    ani_array_float array = nullptr;
    const ani_size OFFSET_0 = 0;
    const ani_size LENGTH_5 = 5;
    ASSERT_EQ(env->Array_New_Float(LENGTH_5, &array), ANI_OK);

    std::array<ani_float, LENGTH_5> nativeBuffer = {1.0f, 2.0f, 3.0f, 4.0f, 5.0f};
    std::array<ani_float, LENGTH_5> nativeBuffer2 = {0.0f};
    ASSERT_EQ(env->Array_SetRegion_Float(array, OFFSET_0, LENGTH_5, nativeBuffer.data()), ANI_OK);
    ASSERT_EQ(env->Array_GetRegion_Float(array, OFFSET_0, LENGTH_5, nativeBuffer2.data()), ANI_OK);
    return ANI_TRUE;
}

ani_boolean test_array_region_int([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ASSERT_NE(env, nullptr);
    ani_array_int array = nullptr;
    const ani_size OFFSET_0 = 0;
    const ani_size LENGTH_5 = 5;
    ASSERT_EQ(env->Array_New_Int(LENGTH_5, &array), ANI_OK);

    std::array<ani_int, LENGTH_5> nativeBuffer = {1, 2, 3, 4, 5};
    std::array<ani_int, LENGTH_5> nativeBuffer2 = {0};
    ASSERT_EQ(env->Array_SetRegion_Int(array, OFFSET_0, LENGTH_5, nativeBuffer.data()), ANI_OK);
    ASSERT_EQ(env->Array_GetRegion_Int(array, OFFSET_0, LENGTH_5, nativeBuffer2.data()), ANI_OK);
    return ANI_TRUE;
}

ani_boolean test_array_region_long([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ASSERT_NE(env, nullptr);
    ani_array_long array = nullptr;
    const ani_size OFFSET_0 = 0;
    const ani_size LENGTH_5 = 5;
    ASSERT_EQ(env->Array_New_Long(LENGTH_5, &array), ANI_OK);

    std::array<ani_long, LENGTH_5> nativeBuffer = {1, 2, 3, 4, 5};
    std::array<ani_long, LENGTH_5> nativeBuffer2 = {0};
    ASSERT_EQ(env->Array_SetRegion_Long(array, OFFSET_0, LENGTH_5, nativeBuffer.data()), ANI_OK);
    ASSERT_EQ(env->Array_GetRegion_Long(array, OFFSET_0, LENGTH_5, nativeBuffer2.data()), ANI_OK);
    return ANI_TRUE;
}

ani_boolean test_array_region_short([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ASSERT_NE(env, nullptr);
    ani_array_short array = nullptr;
    const ani_size OFFSET_0 = 0;
    const ani_size LENGTH_5 = 5;
    ASSERT_EQ(env->Array_New_Short(LENGTH_5, &array), ANI_OK);

    std::array<ani_short, LENGTH_5> nativeBuffer = {1, 2, 3, 4, 5};
    std::array<ani_short, LENGTH_5> nativeBuffer2 = {0};
    ASSERT_EQ(env->Array_SetRegion_Short(array, OFFSET_0, LENGTH_5, nativeBuffer.data()), ANI_OK);
    ASSERT_EQ(env->Array_GetRegion_Short(array, OFFSET_0, LENGTH_5, nativeBuffer2.data()), ANI_OK);
    return ANI_TRUE;
}

ani_boolean test_array_set_with_get_ref([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ASSERT_NE(env, nullptr);

    ani_class cls = {};
    ani_object obj = {};
    const ani_size OFFSET_0 = 0;
    const ani_size LENGTH_5 = 5;
    ASSERT_EQ(GetClsData(env, &obj, &cls), ANI_TRUE);

    ani_array_ref array = nullptr;
    ASSERT_EQ(env->Array_New_Ref(cls, LENGTH_5, nullptr, &array), ANI_OK);

    ASSERT_EQ(env->Array_Set_Ref(array, OFFSET_0, obj), ANI_OK);
    ani_ref ref1 = nullptr;
    ASSERT_EQ(env->Array_Get_Ref(array, OFFSET_0, &ref1), ANI_OK);
    return ANI_TRUE;
}

ani_boolean test_array_getLength([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ASSERT_NE(env, nullptr);
    ani_array_byte array = nullptr;
    const ani_size OFFSET_0 = 0;
    const ani_size LENGTH_5 = 5;
    ASSERT_EQ(env->Array_New_Byte(LENGTH_5, &array), ANI_OK);
    ani_size length = 0;
    ASSERT_EQ(env->Array_GetLength(array, &length), ANI_OK);
    ASSERT_EQ(length, LENGTH_5);
    return ANI_TRUE;
}

ani_boolean test_array_CreateBuffer([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ASSERT_NE(env, nullptr);
    ani_arraybuffer arrayBuffer;
    int8_t *data = nullptr;
    const ani_size OFFSET_0 = 0;
    const ani_size LENGTH_5 = 5;
    auto status = env->CreateArrayBuffer(LENGTH_5, reinterpret_cast<void **>(&data), &arrayBuffer);
    ASSERT_EQ(status, ANI_OK);
    ASSERT_NE(arrayBuffer, nullptr);
    ASSERT_NE(data, nullptr);

    data[0U] = 1U;
    data[1U] = 2U;
    data[2U] = 3U;

    int8_t *resultData;
    size_t resultLength;
    status = env->ArrayBuffer_GetInfo(arrayBuffer, reinterpret_cast<void **>(&resultData), &resultLength);
    ASSERT_EQ(status, ANI_OK);
    ASSERT_EQ(resultData, data);
    ASSERT_EQ(resultLength, LENGTH_5);
    ASSERT_EQ(resultData[0U], 1U);
    ASSERT_EQ(resultData[1U], 2U);
    ASSERT_EQ(resultData[2U], 3U);
    return ANI_TRUE;
}

#endif // ARKTS_ANI_TEST_ARRAYOPERATIONS_H
