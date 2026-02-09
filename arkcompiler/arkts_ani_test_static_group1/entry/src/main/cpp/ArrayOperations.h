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

ani_boolean test_array_getLength([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ASSERT_NE(env, nullptr);
    ani_array array = nullptr;
    ani_ref undefinedRef {};
    ASSERT_EQ(env->GetUndefined(&undefinedRef), ANI_OK);
    const ani_size OFFSET_0 = 0;
    const ani_size LENGTH_5 = 5;
    ASSERT_EQ(env->Array_New(LENGTH_5, undefinedRef, &array), ANI_OK);
    ani_size length = 0;
    ASSERT_EQ(env->Array_GetLength(array, &length), ANI_OK);
    ASSERT_EQ(length, LENGTH_5);
    
    ani_size sz {};
    ASSERT_EQ(env->Array_New(5U, nullptr, &array), ANI_INVALID_ARGS);
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

ani_int test_Array_New_Set_Get([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_class intClass = nullptr;
    ani_method intUnbox = nullptr;
    ani_method intCtor = nullptr;
    env_->FindClass("std.core.Int", &intClass);
    env_->Class_FindMethod(intClass, "<ctor>", "i:", &intCtor);
    env_->Class_FindMethod(intClass, "toInt", ":i", &intUnbox);
    ani_size arrSize = 5U;
    ani_object boxedInt{};
    ani_array array{};
    ani_ref undefinedRef {};
    ASSERT_EQ(env_->GetUndefined(&undefinedRef), ANI_OK);
    ASSERT_EQ(env_->Array_New(arrSize, undefinedRef, &array), ANI_OK);
    ani_ref val{};
    for (ani_size it = 0; it < arrSize; ++it) {
        env_->Object_New(intClass, intCtor, &boxedInt, it);
        ASSERT_EQ(env_->Array_Set(array, it, boxedInt), ANI_OK);
        ASSERT_EQ(env_->Array_Get(array, it, &val), ANI_OK);
        ani_int unboxedInt = -1;
        ASSERT_EQ(env_->Object_CallMethod_Int(reinterpret_cast<ani_object>(val), intUnbox, &unboxedInt), ANI_OK);
        ASSERT_EQ(unboxedInt, it);
    }

    ani_object boxedInt2{};
    ani_array arrayInt{};
    ASSERT_EQ(env_->Array_New(arrSize, boxedInt, &arrayInt), ANI_OK);
    for (ani_size it = 0; it < arrSize; ++it) {
        env_->Object_New(intClass, intCtor, &boxedInt2, it);
        ASSERT_EQ(env_->Array_Set(arrayInt, it, boxedInt2), ANI_OK);
        ASSERT_EQ(env_->Array_Get(arrayInt, it, &val), ANI_OK);
        ani_int unboxedInt = -1;
        ASSERT_EQ(env_->Object_CallMethod_Int(reinterpret_cast<ani_object>(val), intUnbox, &unboxedInt), ANI_OK);
        ASSERT_EQ(unboxedInt, it);
    }
    return ANI_TRUE;
}

ani_int test_Array_Push_Pop([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_class intClass = nullptr;
    ani_method intUnbox = nullptr;
    ani_method intCtor = nullptr;
    env_->FindClass("std.core.Int", &intClass);
    env_->Class_FindMethod(intClass, "<ctor>", "i:", &intCtor);
    env_->Class_FindMethod(intClass, "toInt", ":i", &intUnbox);
    ani_size arrSize = 5U;
    ani_array array{};
    ani_ref undefinedRef {};
    ASSERT_EQ(env_->GetUndefined(&undefinedRef), ANI_OK);
    ASSERT_EQ(env_->Array_New(0U, undefinedRef, &array), ANI_OK);

    for (ani_size it = 0; it < arrSize; ++it) {
        ani_object boxedInt {};
        env_->Object_New(intClass, intCtor, &boxedInt, it);
        ASSERT_EQ(env_->Array_Push(array, boxedInt), ANI_OK);
    }
    ani_size len = -1;
    ASSERT_EQ(env_->Array_GetLength(array, &len), ANI_OK);
    ASSERT_EQ(len, arrSize);

    for (ani_int it = arrSize - 1; it >= 0; --it) {
        ani_ref boxedInt {};
        ASSERT_EQ(env_->Array_Pop(array, &boxedInt), ANI_OK);
        ani_int unboxedInt = -1;
        ASSERT_EQ(env_->Object_CallMethod_Int(reinterpret_cast<ani_object>(boxedInt), intUnbox, &unboxedInt), ANI_OK);
        ASSERT_EQ(unboxedInt, it);
    }
    ASSERT_EQ(env_->Array_GetLength(array, &len), ANI_OK);
    ASSERT_EQ(len, 0);
    return ANI_TRUE;
}
#endif // ARKTS_ANI_TEST_ARRAYOPERATIONS_H
