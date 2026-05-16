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

#ifndef ARKTS_ANI_TEST_TUPLEOPERATIONS_H
#define ARKTS_ANI_TEST_TUPLEOPERATIONS_H
#include "Common.h"

const int32_t LOOP_COUNT = 3;
const int ARRAY_SIZE = 5;
const ani_size STRING_SIZE = 6;

ani_int test_TupleValue_GetItem_Boolean([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getBooleanTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);
    tuple = static_cast<ani_tuple_value>(resultRef);

    ani_boolean result = ANI_FALSE;
    ASSERT_EQ(env->TupleValue_GetItem_Boolean(tuple, 0U, &result), ANI_OK);
    ASSERT_EQ(result, ANI_TRUE);

    return ANI_TRUE;
}

ani_int test_TupleValue_GetItem_Boolean_02([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getBooleanTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);
    tuple = static_cast<ani_tuple_value>(resultRef);

    ani_boolean result = ANI_FALSE;
    ASSERT_EQ(env->c_api->TupleValue_GetItem_Boolean(nullptr, tuple, 0U, &result), ANI_INVALID_ARGS);

    return ANI_TRUE;
}

ani_int test_TupleValue_GetItem_Boolean_03([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_boolean result = ANI_FALSE;
    ASSERT_EQ(env->TupleValue_GetItem_Boolean(nullptr, 0U, &result), ANI_INVALID_ARGS);

    return ANI_TRUE;
}

ani_int test_TupleValue_GetItem_Boolean_04([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getBooleanTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);
    tuple = static_cast<ani_tuple_value>(resultRef);

    ani_boolean result = ANI_FALSE;
    ASSERT_EQ(env->TupleValue_GetItem_Boolean(tuple, 6U, &result), ANI_OUT_OF_RANGE);

    return ANI_TRUE;
}

ani_int test_TupleValue_GetItem_Boolean_05([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getBooleanTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);
    tuple = static_cast<ani_tuple_value>(resultRef);

    ani_boolean result = ANI_FALSE;
    ASSERT_EQ(env->TupleValue_GetItem_Boolean(tuple, -1U, &result), ANI_OUT_OF_RANGE);

    return ANI_TRUE;
}

ani_int test_TupleValue_GetItem_Boolean_06([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getBooleanTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);
    tuple = static_cast<ani_tuple_value>(resultRef);

    const ani_size maxNum = std::numeric_limits<ani_size>::max();
    ani_boolean result = ANI_FALSE;
    ASSERT_EQ(env->TupleValue_GetItem_Boolean(tuple, maxNum, &result), ANI_OUT_OF_RANGE);

    return ANI_TRUE;
}

ani_int test_TupleValue_GetItem_Boolean_07([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getBooleanTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);

    tuple = static_cast<ani_tuple_value>(resultRef);
    const std::array<ani_boolean, 5U> expectedValues = {ANI_TRUE, ANI_FALSE, ANI_TRUE, ANI_TRUE, ANI_FALSE};
    ani_boolean result = ANI_FALSE;
    for (size_t i = 0; i < expectedValues.size(); ++i) {
        ASSERT_EQ(env->TupleValue_GetItem_Boolean(tuple, i, &result), ANI_OK);
        ASSERT_EQ(result, expectedValues[i]);
    }

    return ANI_TRUE;
}

ani_int test_TupleValue_GetItem_Boolean_08([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getBooleanTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);
    tuple = static_cast<ani_tuple_value>(resultRef);

    ASSERT_EQ(env->TupleValue_GetItem_Boolean(tuple, 0U, nullptr), ANI_INVALID_ARGS);

    return ANI_TRUE;
}

ani_int test_TupleValue_GetItem_Boolean_09([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getBooleanTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);
    tuple = static_cast<ani_tuple_value>(resultRef);

    for (int32_t i = 0; i < LOOP_COUNT; i++) {
        ani_boolean result = ANI_FALSE;
        ASSERT_EQ(env->TupleValue_GetItem_Boolean(tuple, 0U, &result), ANI_OK);
        ASSERT_EQ(result, ANI_TRUE);
    }

    return ANI_TRUE;
}

ani_int test_TupleValue_GetItem_Boolean_10([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getEmptyTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);
    tuple = static_cast<ani_tuple_value>(resultRef);

    ani_boolean result;
    ASSERT_EQ(env->TupleValue_GetItem_Boolean(tuple, 0, &result), ANI_OUT_OF_RANGE);
    ASSERT_EQ(env->TupleValue_SetItem_Boolean(tuple, 0, false), ANI_OUT_OF_RANGE);

    return ANI_TRUE;
}

ani_int test_TupleValue_GetItem_Byte([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getByteTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    static constexpr ani_byte EXPECTED_RESULT = 125;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);
    tuple = static_cast<ani_tuple_value>(resultRef);

    ani_byte result = 0;
    ASSERT_EQ(env->TupleValue_GetItem_Byte(tuple, 0U, &result), ANI_OK);
    ASSERT_EQ(result, EXPECTED_RESULT);

    return ANI_TRUE;
}

ani_int test_TupleValue_GetItem_Byte_02([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getByteTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);
    tuple = static_cast<ani_tuple_value>(resultRef);

    ani_byte result = 0;
    ASSERT_EQ(env->c_api->TupleValue_GetItem_Byte(nullptr, tuple, 0U, &result), ANI_INVALID_ARGS);

    return ANI_TRUE;
}

ani_int test_TupleValue_GetItem_Byte_03([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getByteTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);
    tuple = static_cast<ani_tuple_value>(resultRef);

    ani_byte result = 0;
    ASSERT_EQ(env->TupleValue_GetItem_Byte(nullptr, 0U, &result), ANI_INVALID_ARGS);

    return ANI_TRUE;
}

ani_int test_TupleValue_GetItem_Byte_04([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getByteTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);
    tuple = static_cast<ani_tuple_value>(resultRef);

    ani_byte result = 0;
    ASSERT_EQ(env->TupleValue_GetItem_Byte(tuple, 6U, &result), ANI_OUT_OF_RANGE);

    return ANI_TRUE;
}

ani_int test_TupleValue_GetItem_Byte_05([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getByteTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);
    tuple = static_cast<ani_tuple_value>(resultRef);

    ani_byte result = 0;
    ASSERT_EQ(env->TupleValue_GetItem_Byte(tuple, -1U, &result), ANI_OUT_OF_RANGE);

    return ANI_TRUE;
}

ani_int test_TupleValue_GetItem_Byte_06([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getByteTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);
    tuple = static_cast<ani_tuple_value>(resultRef);

    const ani_size maxNum = std::numeric_limits<ani_size>::max();
    ani_byte result = 0;
    ASSERT_EQ(env->TupleValue_GetItem_Byte(tuple, maxNum, &result), ANI_OUT_OF_RANGE);

    return ANI_TRUE;
}

ani_int test_TupleValue_GetItem_Byte_07([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getByteTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    static constexpr ani_byte EXPECTED_RESULT = 125;
    static constexpr ani_byte EXPECTED_RESULT_2 = 126;
    static constexpr ani_byte EXPECTED_RESULT_3 = 127;
    static constexpr ani_byte EXPECTED_RESULT_4 = 1;
    static constexpr ani_byte EXPECTED_RESULT_5 = 2;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);

    tuple = static_cast<ani_tuple_value>(resultRef);
    const std::array<ani_byte, 5U> expectedValues = {EXPECTED_RESULT, EXPECTED_RESULT_2, EXPECTED_RESULT_3,
                                                     EXPECTED_RESULT_4, EXPECTED_RESULT_5};
    ani_byte result = 0;
    for (size_t i = 0; i < expectedValues.size(); ++i) {
        ASSERT_EQ(env->TupleValue_GetItem_Byte(tuple, i, &result), ANI_OK);
        ASSERT_EQ(result, expectedValues[i]);
    }

    return ANI_TRUE;
}

ani_int test_TupleValue_GetItem_Byte_08([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getByteTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);
    tuple = static_cast<ani_tuple_value>(resultRef);

    ASSERT_EQ(env->TupleValue_GetItem_Byte(tuple, 0U, nullptr), ANI_INVALID_ARGS);

    return ANI_TRUE;
}

ani_int test_TupleValue_GetItem_Byte_09([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getByteTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    static constexpr ani_byte EXPECTED_RESULT = 125;
    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);
    tuple = static_cast<ani_tuple_value>(resultRef);

    for (int32_t i = 0; i < LOOP_COUNT; i++) {
        ani_byte result = 0;
        ASSERT_EQ(env->TupleValue_GetItem_Byte(tuple, 0U, &result), ANI_OK);
        ASSERT_EQ(result, EXPECTED_RESULT);
    }

    return ANI_TRUE;
}

ani_int test_TupleValue_GetItem_Char([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getCharTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);
    tuple = static_cast<ani_tuple_value>(resultRef);

    ani_char result = '\0';
    ASSERT_EQ(env->TupleValue_GetItem_Char(tuple, 0U, &result), ANI_OK);
    ASSERT_EQ(result, 'H');

    return ANI_TRUE;
}

ani_int test_TupleValue_GetItem_Char_02([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getCharTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);
    tuple = static_cast<ani_tuple_value>(resultRef);

    ani_char result = '\0';
    ASSERT_EQ(env->c_api->TupleValue_GetItem_Char(nullptr, tuple, 0U, &result), ANI_INVALID_ARGS);

    return ANI_TRUE;
}

ani_int test_TupleValue_GetItem_Char_03([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getReferenceTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);
    tuple = static_cast<ani_tuple_value>(resultRef);

    ani_char result = '\0';
    ASSERT_EQ(env->TupleValue_GetItem_Char(tuple, 0U, &result), ANI_INVALID_TYPE);

    return ANI_TRUE;
}

ani_int test_TupleValue_GetItem_Char_04([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getCharTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);
    tuple = static_cast<ani_tuple_value>(resultRef);

    ani_char result = '\0';
    ASSERT_EQ(env->TupleValue_GetItem_Char(nullptr, 0U, &result), ANI_INVALID_ARGS);

    return ANI_TRUE;
}

ani_int test_TupleValue_GetItem_Char_05([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getCharTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);
    tuple = static_cast<ani_tuple_value>(resultRef);

    ani_char result = '\0';
    ASSERT_EQ(env->TupleValue_GetItem_Char(tuple, 6U, &result), ANI_OUT_OF_RANGE);

    return ANI_TRUE;
}

ani_int test_TupleValue_GetItem_Char_06([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getCharTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);
    tuple = static_cast<ani_tuple_value>(resultRef);

    ani_char result = '\0';
    ASSERT_EQ(env->TupleValue_GetItem_Char(tuple, -1U, &result), ANI_OUT_OF_RANGE);

    return ANI_TRUE;
}

ani_int test_TupleValue_GetItem_Char_07([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getCharTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);
    tuple = static_cast<ani_tuple_value>(resultRef);

    const ani_size maxNum = std::numeric_limits<ani_size>::max();
    ani_char result = '\0';
    ASSERT_EQ(env->TupleValue_GetItem_Char(tuple, maxNum, &result), ANI_OUT_OF_RANGE);

    return ANI_TRUE;
}

ani_int test_TupleValue_GetItem_Char_08([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getCharTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);

    tuple = static_cast<ani_tuple_value>(resultRef);
    const std::array<ani_char, 5U> expectedValues = {'H', 'e', 'l', 'l', 'o'};
    ani_char result = '\0';
    for (size_t i = 0; i < expectedValues.size(); ++i) {
        ASSERT_EQ(env->TupleValue_GetItem_Char(tuple, i, &result), ANI_OK);
        ASSERT_EQ(result, expectedValues[i]);
    }

    return ANI_TRUE;
}

ani_int test_TupleValue_GetItem_Char_09([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getCharTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);
    tuple = static_cast<ani_tuple_value>(resultRef);

    ASSERT_EQ(env->TupleValue_GetItem_Char(tuple, 0U, nullptr), ANI_INVALID_ARGS);

    return ANI_TRUE;
}

ani_int test_TupleValue_GetItem_Char_10([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getCharTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);
    tuple = static_cast<ani_tuple_value>(resultRef);

    for (int32_t i = 0; i < LOOP_COUNT; i++) {
        ani_char result = '\0';
        ASSERT_EQ(env->TupleValue_GetItem_Char(tuple, 0U, &result), ANI_OK);
        ASSERT_EQ(result, 'H');
    }

    return ANI_TRUE;
}

ani_int test_TupleValue_GetItem_Char_11([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getCharTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);
    tuple = static_cast<ani_tuple_value>(resultRef);

    ani_boolean booleanValue = ANI_FALSE;
    ASSERT_EQ(env->TupleValue_GetItem_Boolean(tuple, 0U, &booleanValue), ANI_INVALID_TYPE);
    ASSERT_EQ(env->TupleValue_SetItem_Boolean(tuple, 0U, booleanValue), ANI_OK);

    std::string function1 = "getTestPrimitiveTuple";
    ani_module module1;
    ani_function functionHandle1;
    ani_ref resultRef1;
    ani_tuple_value boxedPrimitivesTuple;
    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module1), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module1, function1.c_str(), nullptr, &functionHandle1), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle1, &resultRef1), ANI_OK);
    boxedPrimitivesTuple = static_cast<ani_tuple_value>(resultRef1);
    ani_char charValue = ANI_FALSE;
    ASSERT_EQ(env->TupleValue_GetItem_Char(boxedPrimitivesTuple, 0U, &charValue), ANI_INVALID_TYPE);
    ASSERT_EQ(env->TupleValue_SetItem_Char(boxedPrimitivesTuple, 0U, charValue), ANI_OK);

    return ANI_TRUE;
}

ani_int test_TupleValue_GetItem_Short([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getShortTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    static constexpr ani_short EXPECTED_RESULT = 300;
    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);
    tuple = static_cast<ani_tuple_value>(resultRef);

    ani_short result = 0;
    ASSERT_EQ(env->TupleValue_GetItem_Short(tuple, 0U, &result), ANI_OK);
    ASSERT_EQ(result, EXPECTED_RESULT);

    return ANI_TRUE;
}

ani_int test_TupleValue_GetItem_Short_02([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getShortTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);
    tuple = static_cast<ani_tuple_value>(resultRef);

    ani_short result = 0;
    ASSERT_EQ(env->c_api->TupleValue_GetItem_Short(nullptr, tuple, 0U, &result), ANI_INVALID_ARGS);

    return ANI_TRUE;
}

ani_int test_TupleValue_GetItem_Short_03([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_short result = 0;
    ASSERT_EQ(env->TupleValue_GetItem_Short(nullptr, 0U, &result), ANI_INVALID_ARGS);

    return ANI_TRUE;
}

ani_int test_TupleValue_GetItem_Short_04([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getShortTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);
    tuple = static_cast<ani_tuple_value>(resultRef);

    ani_short result = 0;
    ASSERT_EQ(env->TupleValue_GetItem_Short(tuple, 6U, &result), ANI_OUT_OF_RANGE);

    return ANI_TRUE;
}

ani_int test_TupleValue_GetItem_Short_05([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getShortTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);
    tuple = static_cast<ani_tuple_value>(resultRef);

    ani_short result = 0;
    ASSERT_EQ(env->TupleValue_GetItem_Short(tuple, -1U, &result), ANI_OUT_OF_RANGE);

    return ANI_TRUE;
}

ani_int test_TupleValue_GetItem_Short_06([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getShortTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);
    tuple = static_cast<ani_tuple_value>(resultRef);

    const ani_size maxNum = std::numeric_limits<ani_size>::max();
    ani_short result = 0;
    ASSERT_EQ(env->TupleValue_GetItem_Short(tuple, maxNum, &result), ANI_OUT_OF_RANGE);

    return ANI_TRUE;
}

ani_int test_TupleValue_GetItem_Short_07([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getShortTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    static constexpr ani_short EXPECTED_RESULT = 300;
    static constexpr ani_short EXPECTED_RESULT_2 = 350;
    static constexpr ani_short EXPECTED_RESULT_3 = 200;
    static constexpr ani_short EXPECTED_RESULT_4 = 100;
    static constexpr ani_short EXPECTED_RESULT_5 = 50;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);

    tuple = static_cast<ani_tuple_value>(resultRef);
    const std::array<ani_short, 5U> expectedValues = {EXPECTED_RESULT, EXPECTED_RESULT_2, EXPECTED_RESULT_3,
                                                      EXPECTED_RESULT_4, EXPECTED_RESULT_5};
    ani_short result = 0;
    for (size_t i = 0; i < expectedValues.size(); ++i) {
        ASSERT_EQ(env->TupleValue_GetItem_Short(tuple, i, &result), ANI_OK);
        ASSERT_EQ(result, expectedValues[i]);
    }

    return ANI_TRUE;
}

ani_int test_TupleValue_GetItem_Short_08([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getShortTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);
    tuple = static_cast<ani_tuple_value>(resultRef);

    ASSERT_EQ(env->TupleValue_GetItem_Short(tuple, 0U, nullptr), ANI_INVALID_ARGS);

    return ANI_TRUE;
}

ani_int test_TupleValue_GetItem_Short_09([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getShortTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    static constexpr ani_short EXPECTED_RESULT = 300;
    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);
    tuple = static_cast<ani_tuple_value>(resultRef);

    for (int32_t i = 0; i < LOOP_COUNT; i++) {
        ani_short result = 0;
        ASSERT_EQ(env->TupleValue_GetItem_Short(tuple, 0U, &result), ANI_OK);
        ASSERT_EQ(result, EXPECTED_RESULT);
    }

    return ANI_TRUE;
}

ani_int test_TupleValue_GetItem_Int([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getIntTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    static constexpr ani_int EXPECTED_RESULT = 300U;
    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);
    tuple = static_cast<ani_tuple_value>(resultRef);

    ani_int result = 0U;
    ASSERT_EQ(env->TupleValue_GetItem_Int(tuple, 0U, &result), ANI_OK);
    ASSERT_EQ(result, EXPECTED_RESULT);

    return ANI_TRUE;
}

ani_int test_TupleValue_GetItem_Int_02([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getIntTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);
    tuple = static_cast<ani_tuple_value>(resultRef);

    ani_int result = 0U;
    ASSERT_EQ(env->c_api->TupleValue_GetItem_Int(nullptr, tuple, 0U, &result), ANI_INVALID_ARGS);

    return ANI_TRUE;
}

ani_int test_TupleValue_GetItem_Int_03([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getIntTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);
    tuple = static_cast<ani_tuple_value>(resultRef);

    ani_int result = 0U;
    ASSERT_EQ(env->TupleValue_GetItem_Int(nullptr, 0U, &result), ANI_INVALID_ARGS);

    return ANI_TRUE;
}

ani_int test_TupleValue_GetItem_Int_04([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getIntTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);
    tuple = static_cast<ani_tuple_value>(resultRef);

    ani_int result = 0U;
    ASSERT_EQ(env->TupleValue_GetItem_Int(tuple, 6U, &result), ANI_OUT_OF_RANGE);

    return ANI_TRUE;
}

ani_int test_TupleValue_GetItem_Int_05([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getIntTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);
    tuple = static_cast<ani_tuple_value>(resultRef);

    ani_int result = 0U;
    ASSERT_EQ(env->TupleValue_GetItem_Int(tuple, -1U, &result), ANI_OUT_OF_RANGE);

    return ANI_TRUE;
}

ani_int test_TupleValue_GetItem_Int_06([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getIntTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);
    tuple = static_cast<ani_tuple_value>(resultRef);

    const ani_size maxNum = std::numeric_limits<ani_size>::max();
    ani_int result = 0U;
    ASSERT_EQ(env->TupleValue_GetItem_Int(tuple, maxNum, &result), ANI_OUT_OF_RANGE);

    return ANI_TRUE;
}

ani_int test_TupleValue_GetItem_Int_07([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getIntTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    static constexpr ani_int EXPECTED_RESULT = 300U;
    static constexpr ani_int EXPECTED_RESULT_2 = 350U;
    static constexpr ani_int EXPECTED_RESULT_3 = 200U;
    static constexpr ani_int EXPECTED_RESULT_4 = 100U;
    static constexpr ani_int EXPECTED_RESULT_5 = 50U;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);

    tuple = static_cast<ani_tuple_value>(resultRef);
    const std::array<ani_int, 5U> expectedValues = {EXPECTED_RESULT, EXPECTED_RESULT_2, EXPECTED_RESULT_3,
                                                    EXPECTED_RESULT_4, EXPECTED_RESULT_5};
    ani_int result = 0;
    for (size_t i = 0; i < expectedValues.size(); ++i) {
        ASSERT_EQ(env->TupleValue_GetItem_Int(tuple, i, &result), ANI_OK);
        ASSERT_EQ(result, expectedValues[i]);
    }

    return ANI_TRUE;
}

ani_int test_TupleValue_GetItem_Int_08([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getIntTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);
    tuple = static_cast<ani_tuple_value>(resultRef);

    ASSERT_EQ(env->TupleValue_GetItem_Int(tuple, 0U, nullptr), ANI_INVALID_ARGS);

    return ANI_TRUE;
}

ani_int test_TupleValue_GetItem_Int_09([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getIntTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    static constexpr ani_int EXPECTED_RESULT = 300U;
    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);
    tuple = static_cast<ani_tuple_value>(resultRef);

    for (int32_t i = 0; i < LOOP_COUNT; i++) {
        ani_int result = 0U;
        ASSERT_EQ(env->TupleValue_GetItem_Int(tuple, 0U, &result), ANI_OK);
        ASSERT_EQ(result, EXPECTED_RESULT);
    }

    return ANI_TRUE;
}

ani_int test_TupleValue_GetItem_Long([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getLongTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    static constexpr ani_long EXPECTED_RESULT = 300L;
    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);
    tuple = static_cast<ani_tuple_value>(resultRef);

    ani_long result = 0L;
    ASSERT_EQ(env->TupleValue_GetItem_Long(tuple, 0U, &result), ANI_OK);
    ASSERT_EQ(result, EXPECTED_RESULT);

    return ANI_TRUE;
}

ani_int test_TupleValue_GetItem_Long_02([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getLongTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);
    tuple = static_cast<ani_tuple_value>(resultRef);

    ani_long result = 0L;
    ASSERT_EQ(env->c_api->TupleValue_GetItem_Long(nullptr, tuple, 0U, &result), ANI_INVALID_ARGS);

    return ANI_TRUE;
}

ani_int test_TupleValue_GetItem_Long_03([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_long result = 0L;
    ASSERT_EQ(env->TupleValue_GetItem_Long(nullptr, 0U, &result), ANI_INVALID_ARGS);

    return ANI_TRUE;
}

ani_int test_TupleValue_GetItem_Long_04([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getLongTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);
    tuple = static_cast<ani_tuple_value>(resultRef);

    ani_long result = 0L;
    ASSERT_EQ(env->TupleValue_GetItem_Long(tuple, 6U, &result), ANI_OUT_OF_RANGE);

    return ANI_TRUE;
}

ani_int test_TupleValue_GetItem_Long_05([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getLongTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);
    tuple = static_cast<ani_tuple_value>(resultRef);

    ani_long result = 0L;
    ASSERT_EQ(env->TupleValue_GetItem_Long(tuple, -1U, &result), ANI_OUT_OF_RANGE);

    return ANI_TRUE;
}

ani_int test_TupleValue_GetItem_Long_06([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getLongTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);
    tuple = static_cast<ani_tuple_value>(resultRef);

    const ani_size maxNum = std::numeric_limits<ani_size>::max();
    ani_long result = 0L;
    ASSERT_EQ(env->TupleValue_GetItem_Long(tuple, maxNum, &result), ANI_OUT_OF_RANGE);

    return ANI_TRUE;
}

ani_int test_TupleValue_GetItem_Long_07([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getLongTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    static constexpr ani_long EXPECTED_RESULT = 300L;
    static constexpr ani_long EXPECTED_RESULT_2 = 200L;
    static constexpr ani_long EXPECTED_RESULT_3 = 100L;
    static constexpr ani_long EXPECTED_RESULT_4 = 50L;
    static constexpr ani_long EXPECTED_RESULT_5 = 1000L;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);

    tuple = static_cast<ani_tuple_value>(resultRef);
    const std::array<ani_long, 5U> expectedValues = {EXPECTED_RESULT, EXPECTED_RESULT_2, EXPECTED_RESULT_3,
                                                     EXPECTED_RESULT_4, EXPECTED_RESULT_5};
    ani_long result = 0;
    for (size_t i = 0; i < expectedValues.size(); ++i) {
        ASSERT_EQ(env->TupleValue_GetItem_Long(tuple, i, &result), ANI_OK);
        ASSERT_EQ(result, expectedValues[i]);
    }

    return ANI_TRUE;
}

ani_int test_TupleValue_GetItem_Long_08([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getLongTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);
    tuple = static_cast<ani_tuple_value>(resultRef);

    ASSERT_EQ(env->TupleValue_GetItem_Long(tuple, 0U, nullptr), ANI_INVALID_ARGS);

    return ANI_TRUE;
}

ani_int test_TupleValue_GetItem_Long_09([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getLongTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    static constexpr ani_long EXPECTED_RESULT = 300L;
    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);
    tuple = static_cast<ani_tuple_value>(resultRef);

    for (int32_t i = 0; i < LOOP_COUNT; i++) {
        ani_long result = 0L;
        ASSERT_EQ(env->TupleValue_GetItem_Long(tuple, 0U, &result), ANI_OK);
        ASSERT_EQ(result, EXPECTED_RESULT);
    }

    return ANI_TRUE;
}

ani_int test_TupleValue_GetItem_Float([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getFloatTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    static constexpr ani_float EXPECTED_RESULT = 3.14F;
    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);
    tuple = static_cast<ani_tuple_value>(resultRef);

    ani_float result = 0.0F;
    ASSERT_EQ(env->TupleValue_GetItem_Float(tuple, 0U, &result), ANI_OK);
    ASSERT_EQ(result, EXPECTED_RESULT);

    return ANI_TRUE;
}

ani_int test_TupleValue_GetItem_Float_02([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getFloatTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);
    tuple = static_cast<ani_tuple_value>(resultRef);

    ani_float result = 0.0F;
    ASSERT_EQ(env->c_api->TupleValue_GetItem_Float(nullptr, tuple, 0U, &result), ANI_INVALID_ARGS);

    return ANI_TRUE;
}

ani_int test_TupleValue_GetItem_Float_03([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_float result = 0.0F;
    ASSERT_EQ(env->TupleValue_GetItem_Float(nullptr, 0U, &result), ANI_INVALID_ARGS);

    return ANI_TRUE;
}

ani_int test_TupleValue_GetItem_Float_04([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getFloatTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);
    tuple = static_cast<ani_tuple_value>(resultRef);

    ani_float result = 0.0F;
    ASSERT_EQ(env->TupleValue_GetItem_Float(tuple, 6U, &result), ANI_OUT_OF_RANGE);

    return ANI_TRUE;
}

ani_int test_TupleValue_GetItem_Float_05([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getFloatTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);
    tuple = static_cast<ani_tuple_value>(resultRef);

    ani_float result = 0.0F;
    ASSERT_EQ(env->TupleValue_GetItem_Float(tuple, -1U, &result), ANI_OUT_OF_RANGE);

    return ANI_TRUE;
}

ani_int test_TupleValue_GetItem_Float_06([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getFloatTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);
    tuple = static_cast<ani_tuple_value>(resultRef);

    const ani_size maxNum = std::numeric_limits<ani_size>::max();
    ani_float result = 0.0F;
    ASSERT_EQ(env->TupleValue_GetItem_Float(tuple, maxNum, &result), ANI_OUT_OF_RANGE);

    return ANI_TRUE;
}

ani_int test_TupleValue_GetItem_Float_07([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getFloatTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    static constexpr ani_float EXPECTED_RESULT = 3.14F;
    static constexpr ani_float EXPECTED_RESULT_2 = 2.71F;
    static constexpr ani_float EXPECTED_RESULT_3 = 1.61F;
    static constexpr ani_float EXPECTED_RESULT_4 = 0.59F;
    static constexpr ani_float EXPECTED_RESULT_5 = 10.0F;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);

    tuple = static_cast<ani_tuple_value>(resultRef);
    const std::array<ani_float, 5U> expectedValues = {EXPECTED_RESULT, EXPECTED_RESULT_2, EXPECTED_RESULT_3,
                                                      EXPECTED_RESULT_4, EXPECTED_RESULT_5};
    ani_float result = 0;
    for (size_t i = 0; i < expectedValues.size(); ++i) {
        ASSERT_EQ(env->TupleValue_GetItem_Float(tuple, i, &result), ANI_OK);
        ASSERT_EQ(result, expectedValues[i]);
    }

    return ANI_TRUE;
}

ani_int test_TupleValue_GetItem_Float_08([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getFloatTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);
    tuple = static_cast<ani_tuple_value>(resultRef);

    ASSERT_EQ(env->TupleValue_GetItem_Float(tuple, 0U, nullptr), ANI_INVALID_ARGS);

    return ANI_TRUE;
}

ani_int test_TupleValue_GetItem_Float_09([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getFloatTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    static constexpr ani_float EXPECTED_RESULT = 3.14F;
    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);
    tuple = static_cast<ani_tuple_value>(resultRef);

    for (int32_t i = 0; i < LOOP_COUNT; i++) {
        ani_float result = 0.0F;
        ASSERT_EQ(env->TupleValue_GetItem_Float(tuple, 0U, &result), ANI_OK);
        ASSERT_EQ(result, EXPECTED_RESULT);
    }

    return ANI_TRUE;
}

ani_int test_TupleValue_GetItem_Double([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getDoubleTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    static constexpr ani_double EXPECTED_RESULT = 3.14;
    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);
    tuple = static_cast<ani_tuple_value>(resultRef);

    ani_double result = 0.0;
    ASSERT_EQ(env->TupleValue_GetItem_Double(tuple, 0U, &result), ANI_OK);
    ASSERT_EQ(result, EXPECTED_RESULT);

    return ANI_TRUE;
}

ani_int test_TupleValue_GetItem_Double_02([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getDoubleTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);
    tuple = static_cast<ani_tuple_value>(resultRef);

    ani_double result = 0.0;
    ASSERT_EQ(env->c_api->TupleValue_GetItem_Double(nullptr, tuple, 0U, &result), ANI_INVALID_ARGS);

    return ANI_TRUE;
}

ani_int test_TupleValue_GetItem_Double_03([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_double result = 0.0;
    ASSERT_EQ(env->TupleValue_GetItem_Double(nullptr, 0U, &result), ANI_INVALID_ARGS);

    return ANI_TRUE;
}

ani_int test_TupleValue_GetItem_Double_04([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getDoubleTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);
    tuple = static_cast<ani_tuple_value>(resultRef);

    ani_double result = 0.0;
    ASSERT_EQ(env->TupleValue_GetItem_Double(tuple, 6U, &result), ANI_OUT_OF_RANGE);

    return ANI_TRUE;
}

ani_int test_TupleValue_GetItem_Double_05([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getDoubleTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);
    tuple = static_cast<ani_tuple_value>(resultRef);

    ani_double result = 0.0;
    ASSERT_EQ(env->TupleValue_GetItem_Double(tuple, -1U, &result), ANI_OUT_OF_RANGE);

    return ANI_TRUE;
}

ani_int test_TupleValue_GetItem_Double_06([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getDoubleTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);
    tuple = static_cast<ani_tuple_value>(resultRef);

    const ani_size maxNum = std::numeric_limits<ani_size>::max();
    ani_double result = 0.0;
    ASSERT_EQ(env->TupleValue_GetItem_Double(tuple, maxNum, &result), ANI_OUT_OF_RANGE);

    return ANI_TRUE;
}

ani_int test_TupleValue_GetItem_Double_07([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getDoubleTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    static constexpr ani_double EXPECTED_RESULT = 3.14;
    static constexpr ani_double EXPECTED_RESULT_2 = 2.71;
    static constexpr ani_double EXPECTED_RESULT_3 = 1.61;
    static constexpr ani_double EXPECTED_RESULT_4 = 0.59;
    static constexpr ani_double EXPECTED_RESULT_5 = 10.0;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);

    tuple = static_cast<ani_tuple_value>(resultRef);
    const std::array<ani_double, 5U> expectedValues = {EXPECTED_RESULT, EXPECTED_RESULT_2, EXPECTED_RESULT_3,
                                                       EXPECTED_RESULT_4, EXPECTED_RESULT_5};
    ani_double result = 0.0;
    for (size_t i = 0; i < expectedValues.size(); ++i) {
        ASSERT_EQ(env->TupleValue_GetItem_Double(tuple, i, &result), ANI_OK);
        ASSERT_EQ(result, expectedValues[i]);
    }

    return ANI_TRUE;
}

ani_int test_TupleValue_GetItem_Double_08([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getDoubleTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);
    tuple = static_cast<ani_tuple_value>(resultRef);

    ASSERT_EQ(env->TupleValue_GetItem_Double(tuple, 0U, nullptr), ANI_INVALID_ARGS);

    return ANI_TRUE;
}

ani_int test_TupleValue_GetItem_Double_09([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getDoubleTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    static constexpr ani_double EXPECTED_RESULT = 3.14;
    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);
    tuple = static_cast<ani_tuple_value>(resultRef);

    for (int32_t i = 0; i < LOOP_COUNT; i++) {
        ani_double result = 0.0;
        ASSERT_EQ(env->TupleValue_GetItem_Double(tuple, 0U, &result), ANI_OK);
        ASSERT_EQ(result, EXPECTED_RESULT);
    }

    return ANI_TRUE;
}

ani_int test_TupleValue_GetItem_Ref([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getReferenceTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;
    ani_size copiedSize = 0;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);
    tuple = static_cast<ani_tuple_value>(resultRef);

    ani_ref result {};
    ASSERT_EQ(env->TupleValue_GetItem_Ref(tuple, 0U, &result), ANI_OK);
    constexpr std::string_view EXPECTED_ELEM("Hello");
    auto internalStr = reinterpret_cast<ani_string>(result);
    std::array<char, EXPECTED_ELEM.size() + 1> elem {};
    ASSERT_EQ(env->String_GetUTF8SubString(internalStr, 0U, elem.size() - 1, elem.data(), elem.size(), &copiedSize),
              ANI_OK);
    ASSERT_EQ(copiedSize, EXPECTED_ELEM.size());
    ASSERT_EQ(std::strcmp(elem.data(), EXPECTED_ELEM.data()), ANI_OK);

    return ANI_TRUE;
}

ani_int test_TupleValue_GetItem_Ref_02([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getReferenceTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);
    tuple = static_cast<ani_tuple_value>(resultRef);

    ani_ref result {};
    ASSERT_EQ(env->c_api->TupleValue_GetItem_Ref(nullptr, tuple, 0U, &result), ANI_INVALID_ARGS);

    return ANI_TRUE;
}

ani_int test_TupleValue_GetItem_Ref_03([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_ref result {};
    ASSERT_EQ(env->TupleValue_GetItem_Ref(nullptr, 0U, &result), ANI_INVALID_ARGS);

    return ANI_TRUE;
}

ani_int test_TupleValue_GetItem_Ref_04([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getReferenceTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);
    tuple = static_cast<ani_tuple_value>(resultRef);

    ani_ref result {};
    ASSERT_EQ(env->TupleValue_GetItem_Ref(tuple, 4U, &result), ANI_OUT_OF_RANGE);

    return ANI_TRUE;
}

ani_int test_TupleValue_GetItem_Ref_05([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getReferenceTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);
    tuple = static_cast<ani_tuple_value>(resultRef);

    ani_ref result {};
    ASSERT_EQ(env->TupleValue_GetItem_Ref(tuple, -1U, &result), ANI_OUT_OF_RANGE);

    return ANI_TRUE;
}

ani_int test_TupleValue_GetItem_Ref_06([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getReferenceTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);
    tuple = static_cast<ani_tuple_value>(resultRef);

    ASSERT_EQ(env->TupleValue_GetItem_Ref(tuple, 0U, nullptr), ANI_INVALID_ARGS);

    return ANI_TRUE;
}

ani_int test_TupleValue_GetItem_Ref_07([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getReferenceTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);
    tuple = static_cast<ani_tuple_value>(resultRef);

    const ani_size maxNum = std::numeric_limits<ani_size>::max();
    ani_ref result {};
    ASSERT_EQ(env->TupleValue_GetItem_Ref(tuple, maxNum, &result), ANI_OUT_OF_RANGE);

    return ANI_TRUE;
}

ani_int test_TupleValue_GetItem_Ref_08([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getReferenceTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    static constexpr ani_size ARRAY_SIZE = 5;
    static constexpr ani_double EXPECTED_RESULT_1 = 1.0;
    static constexpr ani_double EXPECTED_RESULT_2 = 2.0;
    static constexpr ani_double EXPECTED_RESULT_3 = 3.0;
    static constexpr ani_double EXPECTED_RESULT_4 = 4.0;
    static constexpr ani_double EXPECTED_RESULT_5 = 5.0;
    ani_size copiedSize = 0;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);

    tuple = static_cast<ani_tuple_value>(resultRef);
    const std::array<ani_double, 5U> expectedArrayValues = {EXPECTED_RESULT_1, EXPECTED_RESULT_2, EXPECTED_RESULT_3,
                                                            EXPECTED_RESULT_4, EXPECTED_RESULT_5};
    ani_ref result{};
    ASSERT_EQ(env->TupleValue_GetItem_Ref(tuple, 1U, &result), ANI_OK);

    auto internalArr = reinterpret_cast<ani_fixedarray_double>(result);
    std::vector<double> elem(expectedArrayValues.size());
    ASSERT_EQ(env->FixedArray_GetRegion_Double(internalArr, 0, elem.size(), elem.data()), ANI_OK);

    for (size_t idx = 0; idx < expectedArrayValues.size(); ++idx) {
        ASSERT_EQ(elem[idx], expectedArrayValues[idx]);
    }

    ASSERT_EQ(env->TupleValue_GetItem_Ref(tuple, 0U, &result), ANI_OK);

    auto internalStr = reinterpret_cast<ani_string>(result);
    std::array<char, ARRAY_SIZE + 1> elem0{};
    ASSERT_EQ(env->String_GetUTF8SubString(internalStr, 0U, elem0.size() - 1, elem0.data(), elem0.size(), &copiedSize),
              ANI_OK);
    ASSERT_EQ(copiedSize, ARRAY_SIZE);
    ASSERT_EQ(std::strcmp(elem0.data(), "Hello"), ANI_OK);
    ASSERT_EQ(env->TupleValue_GetItem_Ref(tuple, 2U, &result), ANI_OK);

    auto internalStr2 = reinterpret_cast<ani_string>(result);
    std::array<char, ARRAY_SIZE + 1> elem2{};
    ASSERT_EQ(env->String_GetUTF8SubString(internalStr2, 0U, elem2.size() - 1, elem2.data(), elem2.size(), &copiedSize),
              ANI_OK);
    ASSERT_EQ(copiedSize, ARRAY_SIZE);
    ASSERT_EQ(std::strcmp(elem2.data(), "world"), ANI_OK);

    return ANI_TRUE;
}

ani_int test_TupleValue_GetItem_Ref_09([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getReferenceTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);
    tuple = static_cast<ani_tuple_value>(resultRef);

    for (int32_t i = 0; i < LOOP_COUNT; i++) {
        ani_ref result {};
        ASSERT_EQ(env->TupleValue_GetItem_Ref(tuple, 0U, &result), ANI_OK);
        constexpr std::string_view EXPECTED_ELEM("Hello");
        auto internalStr = reinterpret_cast<ani_string>(result);
        std::array<char, EXPECTED_ELEM.size() + 1> elem {};
        ani_size copiedSize = 0;
        ASSERT_EQ(
            env->String_GetUTF8SubString(internalStr, 0U, elem.size() - 1, elem.data(), elem.size(), &copiedSize),
            ANI_OK);
        ASSERT_EQ(copiedSize, EXPECTED_ELEM.size());
        ASSERT_EQ(std::strcmp(elem.data(), EXPECTED_ELEM.data()), ANI_OK);
    }

    return ANI_TRUE;
}

ani_int CheckStringValue(ani_env *env, ani_tuple_value tupleValue,
                         const ani_size index, const std::string_view &expectedStrView)
{
    ani_ref result {};
    ASSERT_EQ(env->TupleValue_GetItem_Ref(tupleValue, index, &result), ANI_OK);
    auto internalStr = reinterpret_cast<ani_string>(result);
    std::string stdString {};

    ani_size sz {};
    env->String_GetUTF8Size(internalStr, &sz);
    stdString.resize(sz + 1);
    ASSERT_EQ(env->String_GetUTF8SubString(internalStr, 0, sz, stdString.data(), stdString.size(), &sz), ANI_OK);
    stdString.resize(sz);

    // 修复：使用字符串内容比较而非C风格指针比较
    // 直接比较字符串对象，避免依赖c_str()返回的指针
    ASSERT_EQ(stdString, std::string(expectedStrView));
    
    return ANI_TRUE;
}

ani_int CheckDoubleValue(ani_env *env, ani_tuple_value tupleValue, const ani_size index,
                         const std::array<double, 5U> &array)
{
    ani_class doubleClass;
    ASSERT_EQ(env->FindClass("std.core.Double", &doubleClass), ANI_OK);
    ASSERT_EQ(doubleClass != nullptr, ANI_OK);
    ani_method doubleUnbox;
    env->Class_FindMethod(doubleClass, "toDouble", ":d", &doubleUnbox);
    ASSERT_EQ(doubleClass != nullptr, ANI_OK);

    ani_ref result {};
    ASSERT_EQ(env->TupleValue_GetItem_Ref(tupleValue, index, &result), ANI_OK);
    auto internalArr = reinterpret_cast<ani_array>(result);

    std::vector<ani_ref> elem(array.size());

    for (size_t idx = 0; idx < array.size(); ++idx) {
        ASSERT_EQ(env->Array_Get(internalArr, idx, &elem[idx]), ANI_OK);
        ani_double unboxedDouble = -1;
        ASSERT_EQ(
            // NOLINTNEXTLINE(cppcoreguidelines-pro-type-vararg)
            env->Object_CallMethod_Double(reinterpret_cast<ani_object>(elem[idx]), doubleUnbox, &unboxedDouble),
            ANI_OK);
        ASSERT_EQ(unboxedDouble, array[idx]);
    }
    
    return ANI_TRUE;
}

ani_int test_TupleValue_GetItem_Ref_10([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getReferenceTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);
    tuple = static_cast<ani_tuple_value>(resultRef);

    constexpr std::string_view EXPECTED_STR_VIEW1("Hello");
    constexpr std::string_view EXPECTED_STR_VIEW2("world");
    constexpr std::array<double, 5U> EXPECTED_ARRAY = {1, 2, 3, 4, 5};

    CheckStringValue(env, tuple, 0U, EXPECTED_STR_VIEW1);
    CheckDoubleValue(env, tuple, 1U, EXPECTED_ARRAY);
    CheckStringValue(env, tuple, 2U, EXPECTED_STR_VIEW2);

    ani_ref result {};
    ASSERT_EQ(env->TupleValue_GetItem_Ref(tuple, 0U, &result), ANI_OK);

    auto internalStr = reinterpret_cast<ani_string>(result);
    const ani_size maxNum = std::numeric_limits<ani_size>::max();
    ASSERT_EQ(env->TupleValue_SetItem_Ref(tuple, maxNum, internalStr), ANI_OUT_OF_RANGE);

    ani_string string {};
    static constexpr ani_size STRING_SIZE = 6;
    constexpr std::string_view STR_VIEW1("study");
    ASSERT_EQ(env->String_NewUTF8(STR_VIEW1.data(), STRING_SIZE, &string), ANI_OK);
    ASSERT_EQ(env->TupleValue_SetItem_Ref(tuple, 0U, string), ANI_OK);
    CheckStringValue(env, tuple, 0U, STR_VIEW1);

    std::string function1 = "getArray";
    ani_module module1;
    ani_function functionHandle1;
    ani_ref resultRef1;
    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module1), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module1, function1.c_str(), nullptr, &functionHandle1), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle1, &resultRef1), ANI_OK);
    const auto array = static_cast<ani_array>(resultRef1);
    ASSERT_EQ(env->TupleValue_SetItem_Ref(tuple, 1U, array), ANI_OK);

    constexpr std::array<double, 5U> EXPECTED_DOUBLE_ARRAY = {100.1, 200.2, 300.3, 400.4, 500.5};
    CheckDoubleValue(env, tuple, 1U, EXPECTED_DOUBLE_ARRAY);

    ani_string string2 {};
    constexpr std::string_view STR_VIEW2("power");
    ASSERT_EQ(env->String_NewUTF8(STR_VIEW2.data(), STRING_SIZE, &string2), ANI_OK);
    ASSERT_EQ(env->TupleValue_SetItem_Ref(tuple, 2U, string2), ANI_OK);
    CheckStringValue(env, tuple, 2U, STR_VIEW2);

    return ANI_TRUE;
}

ani_int test_TupleValue_SetItem_Boolean([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getBooleanTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);

    tuple = static_cast<ani_tuple_value>(resultRef);
    ani_boolean value = ANI_FALSE;
    ASSERT_EQ(env->TupleValue_SetItem_Boolean(tuple, 0U, value), ANI_OK);

    ani_boolean result = ANI_TRUE;
    ASSERT_EQ(env->TupleValue_GetItem_Boolean(tuple, 0U, &result), ANI_OK);
    ASSERT_EQ(result, value);

    return ANI_TRUE;
}

ani_int test_TupleValue_SetItem_Boolean_02([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getBooleanTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);

    tuple = static_cast<ani_tuple_value>(resultRef);
    ani_boolean value = ANI_FALSE;
    ASSERT_EQ(env->c_api->TupleValue_SetItem_Boolean(nullptr, tuple, 0U, value), ANI_INVALID_ARGS);

    return ANI_TRUE;
}

ani_int test_TupleValue_SetItem_Boolean_03([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_boolean value = ANI_FALSE;
    ASSERT_EQ(env->TupleValue_SetItem_Boolean(nullptr, 0U, value), ANI_INVALID_ARGS);

    return ANI_TRUE;
}

ani_int test_TupleValue_SetItem_Boolean_04([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getBooleanTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);

    tuple = static_cast<ani_tuple_value>(resultRef);
    ani_boolean value = ANI_FALSE;
    ASSERT_EQ(env->TupleValue_SetItem_Boolean(tuple, 6U, value), ANI_OUT_OF_RANGE);

    return ANI_TRUE;
}

ani_int test_TupleValue_SetItem_Boolean_05([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getBooleanTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);

    tuple = static_cast<ani_tuple_value>(resultRef);
    ani_boolean value = ANI_FALSE;
    ASSERT_EQ(env->TupleValue_SetItem_Boolean(tuple, -1U, value), ANI_OUT_OF_RANGE);

    return ANI_TRUE;
}

ani_int test_TupleValue_SetItem_Boolean_06([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getBooleanTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);

    tuple = static_cast<ani_tuple_value>(resultRef);
    for (int32_t i = 0; i < LOOP_COUNT; i++) {
        ani_boolean value = ANI_FALSE;
        ASSERT_EQ(env->TupleValue_SetItem_Boolean(tuple, 0U, value), ANI_OK);
        ani_boolean result = ANI_TRUE;
        ASSERT_EQ(env->TupleValue_GetItem_Boolean(tuple, 0U, &result), ANI_OK);
        ASSERT_EQ(result, value);
    }

    return ANI_TRUE;
}

ani_int test_TupleValue_SetItem_Char([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getCharTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);

    tuple = static_cast<ani_tuple_value>(resultRef);
    ani_char value = 'a';
    ASSERT_EQ(env->TupleValue_SetItem_Char(tuple, 0U, value), ANI_OK);

    ani_char result = '\0';
    ASSERT_EQ(env->TupleValue_GetItem_Char(tuple, 0U, &result), ANI_OK);
    ASSERT_EQ(result, value);

    return ANI_TRUE;
}

ani_int test_TupleValue_SetItem_Char_02([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getCharTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);

    tuple = static_cast<ani_tuple_value>(resultRef);
    ani_char value = 'a';
    ASSERT_EQ(env->c_api->TupleValue_SetItem_Char(nullptr, tuple, 0U, value), ANI_INVALID_ARGS);

    return ANI_TRUE;
}

ani_int test_TupleValue_SetItem_Char_03([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_char value = 'a';
    ASSERT_EQ(env->TupleValue_SetItem_Char(nullptr, 0U, value), ANI_INVALID_ARGS);

    return ANI_TRUE;
}

ani_int test_TupleValue_SetItem_Char_04([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getCharTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);

    tuple = static_cast<ani_tuple_value>(resultRef);
    ani_char value = 'a';
    ASSERT_EQ(env->TupleValue_SetItem_Char(tuple, 6U, value), ANI_OUT_OF_RANGE);

    return ANI_TRUE;
}

ani_int test_TupleValue_SetItem_Char_05([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getCharTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);

    tuple = static_cast<ani_tuple_value>(resultRef);
    ani_char value = 'a';
    ASSERT_EQ(env->TupleValue_SetItem_Char(tuple, -1U, value), ANI_OUT_OF_RANGE);

    return ANI_TRUE;
}

ani_int test_TupleValue_SetItem_Char_06([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getCharTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);

    tuple = static_cast<ani_tuple_value>(resultRef);
    for (int32_t i = 0; i < LOOP_COUNT; i++) {
        ani_char value = 'a';
        ASSERT_EQ(env->TupleValue_SetItem_Char(tuple, 0U, value), ANI_OK);
        ani_char result = '\0';
        ASSERT_EQ(env->TupleValue_GetItem_Char(tuple, 0U, &result), ANI_OK);
        ASSERT_EQ(result, value);
    }

    return ANI_TRUE;
}

ani_int test_TupleValue_SetItem_Byte([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getByteTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);

    tuple = static_cast<ani_tuple_value>(resultRef);
    ani_byte value = 1;
    ASSERT_EQ(env->TupleValue_SetItem_Byte(tuple, 0U, value), ANI_OK);

    ani_byte result = 0;
    ASSERT_EQ(env->TupleValue_GetItem_Byte(tuple, 0U, &result), ANI_OK);
    ASSERT_EQ(result, value);

    return ANI_TRUE;
}

ani_int test_TupleValue_SetItem_Byte_02([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getByteTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);

    tuple = static_cast<ani_tuple_value>(resultRef);
    ani_byte value = 1;
    ASSERT_EQ(env->c_api->TupleValue_SetItem_Byte(nullptr, tuple, 0U, value), ANI_INVALID_ARGS);

    return ANI_TRUE;
}

ani_int test_TupleValue_SetItem_Byte_03([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_byte value = 1;
    ASSERT_EQ(env->TupleValue_SetItem_Byte(nullptr, 0U, value), ANI_INVALID_ARGS);

    return ANI_TRUE;
}

ani_int test_TupleValue_SetItem_Byte_04([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getByteTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);

    tuple = static_cast<ani_tuple_value>(resultRef);
    ani_byte value = 1;
    ASSERT_EQ(env->TupleValue_SetItem_Byte(tuple, 6U, value), ANI_OUT_OF_RANGE);

    return ANI_TRUE;
}

ani_int test_TupleValue_SetItem_Byte_05([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getByteTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);

    tuple = static_cast<ani_tuple_value>(resultRef);
    ani_byte value = 1;
    ASSERT_EQ(env->TupleValue_SetItem_Byte(tuple, -1U, value), ANI_OUT_OF_RANGE);

    return ANI_TRUE;
}

ani_int test_TupleValue_SetItem_Byte_06([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getByteTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);

    tuple = static_cast<ani_tuple_value>(resultRef);
    for (int32_t i = 0; i < LOOP_COUNT; i++) {
        ani_byte value = 1;
        ASSERT_EQ(env->TupleValue_SetItem_Byte(tuple, 0U, value), ANI_OK);
        ani_byte result = 0;
        ASSERT_EQ(env->TupleValue_GetItem_Byte(tuple, 0U, &result), ANI_OK);
        ASSERT_EQ(result, value);
    }

    return ANI_TRUE;
}


ani_int test_TupleValue_SetItem_Short([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getShortTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);

    tuple = static_cast<ani_tuple_value>(resultRef);
    ani_short value = 1;
    ASSERT_EQ(env->TupleValue_SetItem_Short(tuple, 0U, value), ANI_OK);

    ani_short result = 0;
    ASSERT_EQ(env->TupleValue_GetItem_Short(tuple, 0U, &result), ANI_OK);
    ASSERT_EQ(result, value);

    return ANI_TRUE;
}

ani_int test_TupleValue_SetItem_Short_02([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getShortTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);

    tuple = static_cast<ani_tuple_value>(resultRef);
    ani_short value = 1;
    ASSERT_EQ(env->c_api->TupleValue_SetItem_Short(nullptr, tuple, 0U, value), ANI_INVALID_ARGS);

    return ANI_TRUE;
}

ani_int test_TupleValue_SetItem_Short_03([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_short value = 1;
    ASSERT_EQ(env->TupleValue_SetItem_Short(nullptr, 0U, value), ANI_INVALID_ARGS);

    return ANI_TRUE;
}

ani_int test_TupleValue_SetItem_Short_04([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getShortTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);

    tuple = static_cast<ani_tuple_value>(resultRef);
    ani_short value = 1;
    ASSERT_EQ(env->TupleValue_SetItem_Short(tuple, 6U, value), ANI_OUT_OF_RANGE);

    return ANI_TRUE;
}

ani_int test_TupleValue_SetItem_Short_05([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getShortTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);

    tuple = static_cast<ani_tuple_value>(resultRef);
    ani_short value = 1;
    ASSERT_EQ(env->TupleValue_SetItem_Short(tuple, -1U, value), ANI_OUT_OF_RANGE);

    return ANI_TRUE;
}

ani_int test_TupleValue_SetItem_Short_06([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getShortTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);

    tuple = static_cast<ani_tuple_value>(resultRef);
    for (int32_t i = 0; i < LOOP_COUNT; i++) {
        ani_short value = 1;
        ASSERT_EQ(env->TupleValue_SetItem_Short(tuple, 0U, value), ANI_OK);
        ani_short result = 0;
        ASSERT_EQ(env->TupleValue_GetItem_Short(tuple, 0U, &result), ANI_OK);
        ASSERT_EQ(result, value);
    }

    return ANI_TRUE;
}

ani_int test_TupleValue_SetItem_Int([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getIntTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);

    tuple = static_cast<ani_tuple_value>(resultRef);
    ani_int value = 1;
    ASSERT_EQ(env->TupleValue_SetItem_Int(tuple, 0U, value), ANI_OK);

    ani_int result = 0;
    ASSERT_EQ(env->TupleValue_GetItem_Int(tuple, 0U, &result), ANI_OK);
    ASSERT_EQ(result, value);

    return ANI_TRUE;
}

ani_int test_TupleValue_SetItem_Int_02([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getIntTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);

    tuple = static_cast<ani_tuple_value>(resultRef);
    ani_int value = 1;
    ASSERT_EQ(env->c_api->TupleValue_SetItem_Int(nullptr, tuple, 0U, value), ANI_INVALID_ARGS);

    return ANI_TRUE;
}

ani_int test_TupleValue_SetItem_Int_03([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_int value = 1;
    ASSERT_EQ(env->TupleValue_SetItem_Int(nullptr, 0U, value), ANI_INVALID_ARGS);

    return ANI_TRUE;
}

ani_int test_TupleValue_SetItem_Int_04([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getIntTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);

    tuple = static_cast<ani_tuple_value>(resultRef);
    ani_int value = 1;
    ASSERT_EQ(env->TupleValue_SetItem_Int(tuple, 6U, value), ANI_OUT_OF_RANGE);

    return ANI_TRUE;
}

ani_int test_TupleValue_SetItem_Int_05([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getIntTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);

    tuple = static_cast<ani_tuple_value>(resultRef);
    ani_int value = 1;
    ASSERT_EQ(env->TupleValue_SetItem_Int(tuple, -1U, value), ANI_OUT_OF_RANGE);

    return ANI_TRUE;
}

ani_int test_TupleValue_SetItem_Int_06([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getIntTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);

    tuple = static_cast<ani_tuple_value>(resultRef);
    for (int32_t i = 0; i < LOOP_COUNT; i++) {
        ani_int value = 1;
        ASSERT_EQ(env->TupleValue_SetItem_Int(tuple, 0U, value), ANI_OK);
        ani_int result = 0;
        ASSERT_EQ(env->TupleValue_GetItem_Int(tuple, 0U, &result), ANI_OK);
        ASSERT_EQ(result, value);
    }

    return ANI_TRUE;
}

ani_int test_TupleValue_SetItem_Long([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getLongTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);

    tuple = static_cast<ani_tuple_value>(resultRef);
    ani_long value = 1234567890L;
    ASSERT_EQ(env->TupleValue_SetItem_Long(tuple, 0U, value), ANI_OK);

    ani_long result = 0L;
    ASSERT_EQ(env->TupleValue_GetItem_Long(tuple, 0U, &result), ANI_OK);
    ASSERT_EQ(result, value);

    return ANI_TRUE;
}

ani_int test_TupleValue_SetItem_Long_02([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getLongTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);

    tuple = static_cast<ani_tuple_value>(resultRef);
    ani_long value = 1234567890L;
    ASSERT_EQ(env->c_api->TupleValue_SetItem_Long(nullptr, tuple, 0U, value), ANI_INVALID_ARGS);

    return ANI_TRUE;
}

ani_int test_TupleValue_SetItem_Long_03([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_long value = 1234567890L;
    ASSERT_EQ(env->TupleValue_SetItem_Long(nullptr, 0U, value), ANI_INVALID_ARGS);

    return ANI_TRUE;
}

ani_int test_TupleValue_SetItem_Long_04([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getLongTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);

    tuple = static_cast<ani_tuple_value>(resultRef);
    ani_long value = 1234567890L;
    ASSERT_EQ(env->TupleValue_SetItem_Long(tuple, 6U, value), ANI_OUT_OF_RANGE);

    return ANI_TRUE;
}

ani_int test_TupleValue_SetItem_Long_05([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getLongTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);

    tuple = static_cast<ani_tuple_value>(resultRef);
    ani_long value = 1234567890L;
    ASSERT_EQ(env->TupleValue_SetItem_Long(tuple, -1U, value), ANI_OUT_OF_RANGE);

    return ANI_TRUE;
}

ani_int test_TupleValue_SetItem_Long_06([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getLongTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);

    tuple = static_cast<ani_tuple_value>(resultRef);
    for (int32_t i = 0; i < LOOP_COUNT; i++) {
        ani_long value = 1234567890L;
        ASSERT_EQ(env->TupleValue_SetItem_Long(tuple, 0U, value), ANI_OK);
        ani_long result = 0;
        ASSERT_EQ(env->TupleValue_GetItem_Long(tuple, 0U, &result), ANI_OK);
        ASSERT_EQ(result, value);
    }

    return ANI_TRUE;
}

ani_int test_TupleValue_SetItem_Float([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getFloatTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);

    tuple = static_cast<ani_tuple_value>(resultRef);
    ani_float value = 1.23456789F;
    ASSERT_EQ(env->TupleValue_SetItem_Float(tuple, 0U, value), ANI_OK);

    ani_float result = 0.0F;
    ASSERT_EQ(env->TupleValue_GetItem_Float(tuple, 0U, &result), ANI_OK);
    ASSERT_EQ(result, value);

    return ANI_TRUE;
}

ani_int test_TupleValue_SetItem_Float_02([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getFloatTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);

    tuple = static_cast<ani_tuple_value>(resultRef);
    ani_float value = 1.23456789F;
    ASSERT_EQ(env->c_api->TupleValue_SetItem_Float(nullptr, tuple, 0U, value), ANI_INVALID_ARGS);

    return ANI_TRUE;
}

ani_int test_TupleValue_SetItem_Float_03([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_float value = 1.23456789F;
    ASSERT_EQ(env->TupleValue_SetItem_Float(nullptr, 0U, value), ANI_INVALID_ARGS);

    return ANI_TRUE;
}

ani_int test_TupleValue_SetItem_Float_04([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getFloatTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);

    tuple = static_cast<ani_tuple_value>(resultRef);
    ani_float value = 1.23456789F;
    ASSERT_EQ(env->TupleValue_SetItem_Float(tuple, 6U, value), ANI_OUT_OF_RANGE);

    return ANI_TRUE;
}

ani_int test_TupleValue_SetItem_Float_05([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getFloatTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);

    tuple = static_cast<ani_tuple_value>(resultRef);
    ani_float value = 1.23456789F;
    ASSERT_EQ(env->TupleValue_SetItem_Float(tuple, -1U, value), ANI_OUT_OF_RANGE);

    return ANI_TRUE;
}

ani_int test_TupleValue_SetItem_Float_06([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getFloatTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);

    tuple = static_cast<ani_tuple_value>(resultRef);
    for (int32_t i = 0; i < LOOP_COUNT; i++) {
        ani_float value = 1.23456789F;
        ASSERT_EQ(env->TupleValue_SetItem_Float(tuple, 0U, value), ANI_OK);
        ani_float result = 0.0F;
        ASSERT_EQ(env->TupleValue_GetItem_Float(tuple, 0U, &result), ANI_OK);
        ASSERT_EQ(result, value);
    }

    return ANI_TRUE;
}

ani_int test_TupleValue_SetItem_Double([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getDoubleTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);

    tuple = static_cast<ani_tuple_value>(resultRef);
    ani_double value = 123.456;
    ASSERT_EQ(env->TupleValue_SetItem_Double(tuple, 0U, value), ANI_OK);

    ani_double result = 0.0;
    ASSERT_EQ(env->TupleValue_GetItem_Double(tuple, 0U, &result), ANI_OK);
    ASSERT_EQ(result, value);

    return ANI_TRUE;
}

ani_int test_TupleValue_SetItem_Double_02([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getDoubleTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);

    tuple = static_cast<ani_tuple_value>(resultRef);
    ani_double value = 123.456;
    ASSERT_EQ(env->c_api->TupleValue_SetItem_Double(nullptr, tuple, 0U, value), ANI_INVALID_ARGS);

    return ANI_TRUE;
}

ani_int test_TupleValue_SetItem_Double_03([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_double value = 123.456;
    ASSERT_EQ(env->TupleValue_SetItem_Double(nullptr, 0U, value), ANI_INVALID_ARGS);

    return ANI_TRUE;
}

ani_int test_TupleValue_SetItem_Double_04([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getDoubleTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);

    tuple = static_cast<ani_tuple_value>(resultRef);
    ani_double value = 123.456;
    ASSERT_EQ(env->TupleValue_SetItem_Double(tuple, 6U, value), ANI_OUT_OF_RANGE);

    return ANI_TRUE;
}

ani_int test_TupleValue_SetItem_Double_05([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getDoubleTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);

    tuple = static_cast<ani_tuple_value>(resultRef);
    ani_double value = 123.456;
    ASSERT_EQ(env->TupleValue_SetItem_Double(tuple, -1U, value), ANI_OUT_OF_RANGE);

    return ANI_TRUE;
}

ani_int test_TupleValue_SetItem_Double_06([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getDoubleTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);

    tuple = static_cast<ani_tuple_value>(resultRef);
    for (int32_t i = 0; i < LOOP_COUNT; i++) {
        ani_double value = 123.456;
        ASSERT_EQ(env->TupleValue_SetItem_Double(tuple, 0U, value), ANI_OK);
        ani_double result = 0.0;
        ASSERT_EQ(env->TupleValue_GetItem_Double(tuple, 0U, &result), ANI_OK);
        ASSERT_EQ(result, value);
    }

    return ANI_TRUE;
}

ani_int test_TupleValue_SetItem_Ref([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getReferenceTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;
    ani_size copiedSize = 0;
    ani_ref result{};

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);

    tuple = static_cast<ani_tuple_value>(resultRef);
    static constexpr std::string_view EXPECTED_ELEM = "abcdef";
    ani_string string{};
    ASSERT_EQ(env->String_NewUTF8(EXPECTED_ELEM.data(), EXPECTED_ELEM.size(), &string), ANI_OK);

    std::array<char, EXPECTED_ELEM.size() + 1> elem{};
    ASSERT_EQ(env->TupleValue_SetItem_Ref(tuple, 0U, string), ANI_OK);
    ASSERT_EQ(env->TupleValue_GetItem_Ref(tuple, 0U, &result), ANI_OK);

    auto internalStr = reinterpret_cast<ani_string>(result);
    ASSERT_EQ(env->String_GetUTF8SubString(internalStr, 0U, elem.size() - 1, elem.data(), elem.size(), &copiedSize),
              ANI_OK);
    ASSERT_EQ(std::strcmp(elem.data(), EXPECTED_ELEM.data()), ANI_OK);
    ASSERT_EQ(env->TupleValue_SetItem_Ref(tuple, 2U, string), ANI_OK);
    ASSERT_EQ(env->TupleValue_GetItem_Ref(tuple, 2U, &result), ANI_OK);

    internalStr = reinterpret_cast<ani_string>(result);
    ASSERT_EQ(env->String_GetUTF8SubString(internalStr, 0U, elem.size() - 1, elem.data(), elem.size(), &copiedSize),
              ANI_OK);
    ASSERT_EQ(std::strcmp(elem.data(), EXPECTED_ELEM.data()), ANI_OK);

    return ANI_TRUE;
}

ani_int test_TupleValue_SetItem_Ref_02([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getReferenceTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);

    tuple = static_cast<ani_tuple_value>(resultRef);
    static constexpr std::string_view EXPECTED_ELEM = "abcdef";
    ani_string string {};
    ASSERT_EQ(env->String_NewUTF8(EXPECTED_ELEM.data(), EXPECTED_ELEM.size(), &string), ANI_OK);
    ASSERT_EQ(env->c_api->TupleValue_SetItem_Ref(nullptr, tuple, 0U, string), ANI_INVALID_ARGS);

    return ANI_TRUE;
}

ani_int test_TupleValue_SetItem_Ref_03([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getCharTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);

    tuple = static_cast<ani_tuple_value>(resultRef);
    static constexpr std::string_view EXPECTED_ELEM = "abcdef";
    ani_string string {};
    ASSERT_EQ(env->String_NewUTF8(EXPECTED_ELEM.data(), EXPECTED_ELEM.size(), &string), ANI_OK);
    ASSERT_EQ(env->TupleValue_SetItem_Ref(tuple, 0U, string), ANI_OK);

    return ANI_TRUE;
}

ani_int test_TupleValue_SetItem_Ref_04([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_string string {};
    static constexpr std::string_view EXPECTED_ELEM = "abcdef";
    ASSERT_EQ(env->String_NewUTF8(EXPECTED_ELEM.data(), EXPECTED_ELEM.size(), &string), ANI_OK);
    ASSERT_EQ(env->TupleValue_SetItem_Ref(nullptr, 0U, string), ANI_INVALID_ARGS);

    return ANI_TRUE;
}

ani_int test_TupleValue_SetItem_Ref_05([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getReferenceTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);

    tuple = static_cast<ani_tuple_value>(resultRef);
    static constexpr std::string_view EXPECTED_ELEM = "abcdef";
    ani_string string {};
    ASSERT_EQ(env->String_NewUTF8(EXPECTED_ELEM.data(), EXPECTED_ELEM.size(), &string), ANI_OK);
    ASSERT_EQ(env->TupleValue_SetItem_Ref(tuple, 4U, string), ANI_OUT_OF_RANGE);

    return ANI_TRUE;
}

ani_int test_TupleValue_SetItem_Ref_06([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getReferenceTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);

    tuple = static_cast<ani_tuple_value>(resultRef);
    static constexpr std::string_view EXPECTED_ELEM = "abcdef";
    ani_string string {};
    ASSERT_EQ(env->String_NewUTF8(EXPECTED_ELEM.data(), EXPECTED_ELEM.size(), &string), ANI_OK);
    ASSERT_EQ(env->TupleValue_SetItem_Ref(tuple, -1U, string), ANI_OUT_OF_RANGE);

    return ANI_TRUE;
}

ani_int test_TupleValue_SetItem_Ref_07([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getReferenceTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);

    tuple = static_cast<ani_tuple_value>(resultRef);
    ASSERT_EQ(env->TupleValue_SetItem_Ref(tuple, 0U, nullptr), ANI_INVALID_ARGS);

    return ANI_TRUE;
}

ani_int test_TupleValue_SetItem_Ref_08([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getReferenceTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);

    tuple = static_cast<ani_tuple_value>(resultRef);
    static constexpr std::string_view EXPECTED_ELEM = "abcdef";
    for (int32_t i = 0; i < LOOP_COUNT; i++) {
        ani_string string {};
        ASSERT_EQ(env->String_NewUTF8(EXPECTED_ELEM.data(), EXPECTED_ELEM.size(), &string), ANI_OK);
        ASSERT_EQ(env->TupleValue_SetItem_Ref(tuple, 0U, string), ANI_OK);
        ani_ref result {};
        ASSERT_EQ(env->TupleValue_GetItem_Ref(tuple, 0U, &result), ANI_OK);
        auto internalStr = reinterpret_cast<ani_string>(result);
        std::array<char, EXPECTED_ELEM.size() + 1> elem {};
        ani_size copiedSize = 0;
        ASSERT_EQ(
            env->String_GetUTF8SubString(internalStr, 0U, elem.size() - 1, elem.data(), elem.size(), &copiedSize),
            ANI_OK);
        ASSERT_EQ(copiedSize, EXPECTED_ELEM.size());
        ASSERT_EQ(std::strcmp(elem.data(), EXPECTED_ELEM.data()), ANI_OK);
    }

    return ANI_TRUE;
}

ani_int test_TupleValue_GetNumberOfItems([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const char *moduleName = "entry.src.main.src.ets.TupleOperations";
    const char *tupleGetterName = "getEmptyTuple";
    ani_module mod{};
    ASSERT_EQ(env->FindModule(moduleName, &mod), ANI_OK);

    ani_function fn{};
    ASSERT_EQ(env->Module_FindFunction(mod, tupleGetterName, nullptr, &fn), ANI_OK);

    ani_ref ref{};
    ASSERT_EQ(env->Function_Call_Ref(fn, &ref, 0), ANI_OK);

    ani_boolean isUndefined = ANI_TRUE;
    ASSERT_EQ(env->Reference_IsUndefined(ref, &isUndefined), ANI_OK);
    ASSERT_EQ(isUndefined, ANI_FALSE);

    ani_tuple_value tuple = static_cast<ani_tuple_value>(ref);
    ani_size length;
    ASSERT_EQ(env->TupleValue_GetNumberOfItems(tuple, &length), ANI_OK);
    ASSERT_EQ(length, 0U);

    return ANI_TRUE;
}

ani_int test_TupleValue_GetNumberOfItems_02([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const char *moduleName = "entry.src.main.src.ets.TupleOperations";
    const char *tupleGetterName = "getTestPrimitiveTuple";
    ani_module mod{};
    ASSERT_EQ(env->FindModule(moduleName, &mod), ANI_OK);

    ani_function fn{};
    ASSERT_EQ(env->Module_FindFunction(mod, tupleGetterName, nullptr, &fn), ANI_OK);

    ani_ref ref{};
    ASSERT_EQ(env->Function_Call_Ref(fn, &ref, 0), ANI_OK);

    ani_boolean isUndefined = ANI_TRUE;
    ASSERT_EQ(env->Reference_IsUndefined(ref, &isUndefined), ANI_OK);
    ASSERT_EQ(isUndefined, ANI_FALSE);

    ani_tuple_value tuple = static_cast<ani_tuple_value>(ref);
    ani_size length;
    ASSERT_EQ(env->TupleValue_GetNumberOfItems(tuple, &length), ANI_OK);
    ASSERT_EQ(length, 8U);

    return ANI_TRUE;
}

ani_int test_TupleValue_GetNumberOfItems_03([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const char *moduleName = "entry.src.main.src.ets.TupleOperations";
    const char *tupleGetterName = "getCharTuple";
    ani_module mod{};
    ASSERT_EQ(env->FindModule(moduleName, &mod), ANI_OK);

    ani_function fn{};
    ASSERT_EQ(env->Module_FindFunction(mod, tupleGetterName, nullptr, &fn), ANI_OK);

    ani_ref ref{};
    ASSERT_EQ(env->Function_Call_Ref(fn, &ref, 0), ANI_OK);

    ani_boolean isUndefined = ANI_TRUE;
    ASSERT_EQ(env->Reference_IsUndefined(ref, &isUndefined), ANI_OK);
    ASSERT_EQ(isUndefined, ANI_FALSE);

    ani_tuple_value tuple = static_cast<ani_tuple_value>(ref);
    ani_size length;
    ASSERT_EQ(env->TupleValue_GetNumberOfItems(tuple, &length), ANI_OK);

    constexpr std::array<char, 5U> EXPECTED_TUPLE = {'H', 'e', 'l', 'l', 'o'};

    ani_char currentChar;
    for (ani_size idx = 0; idx < length; ++idx) {
        env->TupleValue_GetItem_Char(tuple, idx, &currentChar);
        ASSERT_EQ(currentChar, EXPECTED_TUPLE[idx]);
    }

    return ANI_TRUE;
}

ani_int test_TupleValue_GetNumberOfItems_04([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const char *moduleName = "entry.src.main.src.ets.TupleOperations";
    const char *tupleGetterName = "getTestPrimitiveTuple";
    ani_module mod{};
    ASSERT_EQ(env->FindModule(moduleName, &mod), ANI_OK);

    ani_function fn{};
    ASSERT_EQ(env->Module_FindFunction(mod, tupleGetterName, nullptr, &fn), ANI_OK);

    ani_ref ref{};
    ASSERT_EQ(env->Function_Call_Ref(fn, &ref, 0), ANI_OK);

    ani_boolean isUndefined = ANI_TRUE;
    ASSERT_EQ(env->Reference_IsUndefined(ref, &isUndefined), ANI_OK);
    ASSERT_EQ(isUndefined, ANI_FALSE);

    ani_tuple_value tuple = static_cast<ani_tuple_value>(ref);
    ani_boolean resultBool;
    ASSERT_EQ(env->TupleValue_GetItem_Boolean(tuple, 0U, &resultBool), ANI_OK);
    ASSERT_EQ(resultBool, true);

    ASSERT_EQ(env->TupleValue_SetItem_Boolean(tuple, 0U, false), ANI_OK);
    ASSERT_EQ(env->TupleValue_GetItem_Boolean(tuple, 0U, &resultBool), ANI_OK);
    ASSERT_EQ(resultBool, false);
    
    ani_char resultChar;
    ASSERT_EQ(env->TupleValue_GetItem_Char(tuple, 1U, &resultChar), ANI_OK);
    ASSERT_EQ(resultChar, 'x');

    ASSERT_EQ(env->TupleValue_SetItem_Char(tuple, 1U, 'y'), ANI_OK);
    ASSERT_EQ(env->TupleValue_GetItem_Char(tuple, 1U, &resultChar), ANI_OK);
    ASSERT_EQ(resultChar, 'y');

    ani_byte resultByte;
    ASSERT_EQ(env->TupleValue_GetItem_Byte(tuple, 2U, &resultByte), ANI_OK);
    ASSERT_EQ(resultByte, 127U);

    ASSERT_EQ(env->TupleValue_SetItem_Byte(tuple, 2U, 100U), ANI_OK);
    ASSERT_EQ(env->TupleValue_GetItem_Byte(tuple, 2U, &resultByte), ANI_OK);
    ASSERT_EQ(resultByte, 100U);

    ani_short resultShort;
    ASSERT_EQ(env->TupleValue_GetItem_Short(tuple, 3U, &resultShort), ANI_OK);
    ASSERT_EQ(resultShort, 300U);

    ASSERT_EQ(env->TupleValue_SetItem_Short(tuple, 3U, 100U), ANI_OK);
    ASSERT_EQ(env->TupleValue_GetItem_Short(tuple, 3U, &resultShort), ANI_OK);
    ASSERT_EQ(resultShort, 100U);

    return ANI_TRUE;
}

ani_int test_TupleValue_GetNumberOfItems_05([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const char *moduleName = "entry.src.main.src.ets.TupleOperations";
    const char *tupleGetterName = "getTestPrimitiveTuple";
    ani_module mod{};
    ASSERT_EQ(env->FindModule(moduleName, &mod), ANI_OK);

    ani_function fn{};
    ASSERT_EQ(env->Module_FindFunction(mod, tupleGetterName, nullptr, &fn), ANI_OK);

    ani_ref ref{};
    ASSERT_EQ(env->Function_Call_Ref(fn, &ref, 0), ANI_OK);

    ani_boolean isUndefined = ANI_TRUE;
    ASSERT_EQ(env->Reference_IsUndefined(ref, &isUndefined), ANI_OK);
    ASSERT_EQ(isUndefined, ANI_FALSE);

    ani_tuple_value tuple = static_cast<ani_tuple_value>(ref);
    ani_int resultInt;
    ASSERT_EQ(env->TupleValue_GetItem_Int(tuple, 4U, &resultInt), ANI_OK);
    ASSERT_EQ(resultInt,  500U);

    ASSERT_EQ(env->TupleValue_SetItem_Int(tuple, 4U, -100L), ANI_OK);
    ASSERT_EQ(env->TupleValue_GetItem_Int(tuple, 4U, &resultInt), ANI_OK);
    ASSERT_EQ(resultInt, -100L);

    ani_long resultLong;
    ASSERT_EQ(env->TupleValue_GetItem_Long(tuple, 5U, &resultLong), ANI_OK);
    ASSERT_EQ(resultLong,  600U);

    ASSERT_EQ(env->TupleValue_SetItem_Long(tuple, 5U, -100L), ANI_OK);
    ASSERT_EQ(env->TupleValue_GetItem_Long(tuple, 5U, &resultLong), ANI_OK);
    ASSERT_EQ(resultLong, -100L);
    
    ani_float resultFloat;
    ASSERT_EQ(env->TupleValue_GetItem_Float(tuple, 6U, &resultFloat), ANI_OK);
    ASSERT_EQ(resultFloat,  100.0F);

    ASSERT_EQ(env->TupleValue_SetItem_Float(tuple, 6U, -100.0F), ANI_OK);
    ASSERT_EQ(env->TupleValue_GetItem_Float(tuple, 6U, &resultFloat), ANI_OK);
    ASSERT_EQ(resultFloat, -100.0F);

    ani_double resultDouble;
    ASSERT_EQ(env->TupleValue_GetItem_Double(tuple, 7U, &resultDouble), ANI_OK);
    ASSERT_EQ(resultDouble,  400.0F);

    ASSERT_EQ(env->TupleValue_SetItem_Double(tuple, 7U, -100.0F), ANI_OK);
    ASSERT_EQ(env->TupleValue_GetItem_Double(tuple, 7U, &resultDouble), ANI_OK);
    ASSERT_EQ(resultDouble, -100.0F);

    return ANI_TRUE;
}

ani_int test_TupleValue_GetNumberOfItems_06([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const char *moduleName = "entry.src.main.src.ets.TupleOperations";
    const char *tupleGetterName = "getBooleanTupleForGetNum";
    ani_module mod{};
    ASSERT_EQ(env->FindModule(moduleName, &mod), ANI_OK);

    ani_function fn{};
    ASSERT_EQ(env->Module_FindFunction(mod, tupleGetterName, nullptr, &fn), ANI_OK);

    ani_ref ref{};
    ASSERT_EQ(env->Function_Call_Ref(fn, &ref, 0), ANI_OK);

    ani_boolean isUndefined = ANI_TRUE;
    ASSERT_EQ(env->Reference_IsUndefined(ref, &isUndefined), ANI_OK);
    ASSERT_EQ(isUndefined, ANI_FALSE);

    ani_tuple_value tuple = static_cast<ani_tuple_value>(ref);
    constexpr std::array<ani_boolean, 5U> EXPECTED_TUPLE = {ANI_TRUE, ANI_FALSE, ANI_TRUE, ANI_FALSE, ANI_TRUE};
    constexpr std::array<ani_boolean, 5U> MODIFY_TUPLE = {ANI_FALSE, ANI_TRUE, ANI_FALSE, ANI_TRUE, ANI_FALSE};
    const ani_size maxNum = std::numeric_limits<ani_size>::max();
    ASSERT_EQ(env->TupleValue_SetItem_Boolean(tuple, maxNum, (MODIFY_TUPLE)[0]), ANI_OUT_OF_RANGE);
    ani_size length = 0U;
    ASSERT_EQ(env->TupleValue_GetNumberOfItems(tuple, &length), ANI_OK);
    for (ani_size i = 0; i < length; ++i) {
        ani_boolean resultBool;
        ASSERT_EQ(env->TupleValue_GetItem_Boolean(tuple, i, &resultBool), ANI_OK);
        ASSERT_EQ(resultBool,  EXPECTED_TUPLE[i]);

        ASSERT_EQ(env->TupleValue_SetItem_Boolean(tuple, i, MODIFY_TUPLE[i]), ANI_OK);
        ASSERT_EQ(env->TupleValue_GetItem_Boolean(tuple, i, &resultBool), ANI_OK);
        ASSERT_EQ(resultBool, MODIFY_TUPLE[i]);
    }

    return ANI_TRUE;
}

ani_int test_TupleValue_GetNumberOfItems_07([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const char *moduleName = "entry.src.main.src.ets.TupleOperations";
    const char *tupleGetterName = "getCharTuple";
    ani_module mod{};
    ASSERT_EQ(env->FindModule(moduleName, &mod), ANI_OK);

    ani_function fn{};
    ASSERT_EQ(env->Module_FindFunction(mod, tupleGetterName, nullptr, &fn), ANI_OK);

    ani_ref ref{};
    ASSERT_EQ(env->Function_Call_Ref(fn, &ref, 0), ANI_OK);

    ani_boolean isUndefined = ANI_TRUE;
    ASSERT_EQ(env->Reference_IsUndefined(ref, &isUndefined), ANI_OK);
    ASSERT_EQ(isUndefined, ANI_FALSE);

    ani_tuple_value tuple = static_cast<ani_tuple_value>(ref);
    constexpr std::array<char, 5U> EXPECTED_TUPLE = {'H', 'e', 'l', 'l', 'o'};
    constexpr std::array<char, 5U> MODIFY_TUPLE = {'p', 'o', 'w', 'e', 'r'};
    const ani_size maxNum = std::numeric_limits<ani_size>::max();
    ASSERT_EQ(env->TupleValue_SetItem_Char(tuple, maxNum, (MODIFY_TUPLE)[0]), ANI_OUT_OF_RANGE);
    ani_size length = 0U;
    ASSERT_EQ(env->TupleValue_GetNumberOfItems(tuple, &length), ANI_OK);
    for (ani_size i = 0; i < length; ++i) {
        ani_char resultChar;
        ASSERT_EQ(env->TupleValue_GetItem_Char(tuple, i, &resultChar), ANI_OK);
        ASSERT_EQ(resultChar,  EXPECTED_TUPLE[i]);

        ASSERT_EQ(env->TupleValue_SetItem_Char(tuple, i, MODIFY_TUPLE[i]), ANI_OK);
        ASSERT_EQ(env->TupleValue_GetItem_Char(tuple, i, &resultChar), ANI_OK);
        ASSERT_EQ(resultChar, MODIFY_TUPLE[i]);
    }

    return ANI_TRUE;
}

ani_int test_TupleValue_GetNumberOfItems_08([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const char *moduleName = "entry.src.main.src.ets.TupleOperations";
    const char *tupleGetterName = "getByteTuple";
    ani_module mod{};
    ASSERT_EQ(env->FindModule(moduleName, &mod), ANI_OK);

    ani_function fn{};
    ASSERT_EQ(env->Module_FindFunction(mod, tupleGetterName, nullptr, &fn), ANI_OK);

    ani_ref ref{};
    ASSERT_EQ(env->Function_Call_Ref(fn, &ref, 0), ANI_OK);

    ani_boolean isUndefined = ANI_TRUE;
    ASSERT_EQ(env->Reference_IsUndefined(ref, &isUndefined), ANI_OK);
    ASSERT_EQ(isUndefined, ANI_FALSE);

    ani_tuple_value tuple = static_cast<ani_tuple_value>(ref);
    constexpr std::array<ani_byte, 5U> EXPECTED_TUPLE = {125, 126, 127, 1, 2};
    constexpr std::array<ani_byte, 5U> MODIFY_TUPLE = {1, 2, 3, 4, 5};
    const ani_size maxNum = std::numeric_limits<ani_size>::max();
    ASSERT_EQ(env->TupleValue_SetItem_Byte(tuple, maxNum, (MODIFY_TUPLE)[0]), ANI_OUT_OF_RANGE);
    ani_size length = 0U;
    ASSERT_EQ(env->TupleValue_GetNumberOfItems(tuple, &length), ANI_OK);
    for (ani_size i = 0; i < length; ++i) {
        ani_byte resultByte;
        ASSERT_EQ(env->TupleValue_GetItem_Byte(tuple, i, &resultByte), ANI_OK);
        ASSERT_EQ(resultByte,  EXPECTED_TUPLE[i]);

        ASSERT_EQ(env->TupleValue_SetItem_Byte(tuple, i, MODIFY_TUPLE[i]), ANI_OK);
        ASSERT_EQ(env->TupleValue_GetItem_Byte(tuple, i, &resultByte), ANI_OK);
        ASSERT_EQ(resultByte, MODIFY_TUPLE[i]);
    }

    return ANI_TRUE;
}

ani_int test_TupleValue_GetNumberOfItems_09([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const char *moduleName = "entry.src.main.src.ets.TupleOperations";
    const char *tupleGetterName = "getShortTuple";
    ani_module mod{};
    ASSERT_EQ(env->FindModule(moduleName, &mod), ANI_OK);

    ani_function fn{};
    ASSERT_EQ(env->Module_FindFunction(mod, tupleGetterName, nullptr, &fn), ANI_OK);

    ani_ref ref{};
    ASSERT_EQ(env->Function_Call_Ref(fn, &ref, 0), ANI_OK);

    ani_boolean isUndefined = ANI_TRUE;
    ASSERT_EQ(env->Reference_IsUndefined(ref, &isUndefined), ANI_OK);
    ASSERT_EQ(isUndefined, ANI_FALSE);

    ani_tuple_value tuple = static_cast<ani_tuple_value>(ref);
    constexpr std::array<ani_short, 5U> EXPECTED_TUPLE = {300, 350, 200, 100, 50};
    constexpr std::array<ani_short, 5U> MODIFY_TUPLE = {100, 200, 300, 400, 500};
    const ani_size maxNum = std::numeric_limits<ani_size>::max();
    ASSERT_EQ(env->TupleValue_SetItem_Short(tuple, maxNum, (MODIFY_TUPLE)[0]), ANI_OUT_OF_RANGE);
    ani_size length = 0U;
    ASSERT_EQ(env->TupleValue_GetNumberOfItems(tuple, &length), ANI_OK);
    for (ani_size i = 0; i < length; ++i) {
        ani_short resultShort;
        ASSERT_EQ(env->TupleValue_GetItem_Short(tuple, i, &resultShort), ANI_OK);
        ASSERT_EQ(resultShort,  EXPECTED_TUPLE[i]);

        ASSERT_EQ(env->TupleValue_SetItem_Short(tuple, i, MODIFY_TUPLE[i]), ANI_OK);
        ASSERT_EQ(env->TupleValue_GetItem_Short(tuple, i, &resultShort), ANI_OK);
        ASSERT_EQ(resultShort, MODIFY_TUPLE[i]);
    }

    return ANI_TRUE;
}

ani_int test_TupleValue_GetNumberOfItems_10([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const char *moduleName = "entry.src.main.src.ets.TupleOperations";
    const char *tupleGetterName = "getIntTuple";
    ani_module mod{};
    ASSERT_EQ(env->FindModule(moduleName, &mod), ANI_OK);

    ani_function fn{};
    ASSERT_EQ(env->Module_FindFunction(mod, tupleGetterName, nullptr, &fn), ANI_OK);

    ani_ref ref{};
    ASSERT_EQ(env->Function_Call_Ref(fn, &ref, 0), ANI_OK);

    ani_boolean isUndefined = ANI_TRUE;
    ASSERT_EQ(env->Reference_IsUndefined(ref, &isUndefined), ANI_OK);
    ASSERT_EQ(isUndefined, ANI_FALSE);

    ani_tuple_value tuple = static_cast<ani_tuple_value>(ref);
    constexpr std::array<ani_int, 5U> EXPECTED_TUPLE = {300, 350, 200, 100, 50};
    constexpr std::array<ani_int, 5U> MODIFY_TUPLE = {100, 200, 300, 400, 500};
    const ani_size maxNum = std::numeric_limits<ani_size>::max();
    ASSERT_EQ(env->TupleValue_SetItem_Int(tuple, maxNum, (MODIFY_TUPLE)[0]), ANI_OUT_OF_RANGE);
    ani_size length = 0U;
    ASSERT_EQ(env->TupleValue_GetNumberOfItems(tuple, &length), ANI_OK);
    for (ani_size i = 0; i < length; ++i) {
        ani_int resultInt;
        ASSERT_EQ(env->TupleValue_GetItem_Int(tuple, i, &resultInt), ANI_OK);
        ASSERT_EQ(resultInt,  EXPECTED_TUPLE[i]);

        ASSERT_EQ(env->TupleValue_SetItem_Int(tuple, i, MODIFY_TUPLE[i]), ANI_OK);
        ASSERT_EQ(env->TupleValue_GetItem_Int(tuple, i, &resultInt), ANI_OK);
        ASSERT_EQ(resultInt, MODIFY_TUPLE[i]);
    }

    return ANI_TRUE;
}

ani_int test_TupleValue_GetNumberOfItems_11([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const char *moduleName = "entry.src.main.src.ets.TupleOperations";
    const char *tupleGetterName = "getLongTupleForGetNum";
    ani_module mod{};
    ASSERT_EQ(env->FindModule(moduleName, &mod), ANI_OK);

    ani_function fn{};
    ASSERT_EQ(env->Module_FindFunction(mod, tupleGetterName, nullptr, &fn), ANI_OK);
    ani_ref ref{};
    ASSERT_EQ(env->Function_Call_Ref(fn, &ref, 0), ANI_OK);
    ani_boolean isUndefined = ANI_TRUE;
    ASSERT_EQ(env->Reference_IsUndefined(ref, &isUndefined), ANI_OK);
    ASSERT_EQ(isUndefined, ANI_FALSE);
    ani_tuple_value tuple = static_cast<ani_tuple_value>(ref);
    constexpr std::array<ani_long, 5U> EXPECTED_TUPLE = {30000, 20000, 10000, 5000, 100000};
    constexpr std::array<ani_long, 5U> MODIFY_TUPLE = {190000, 290000, 390000, 490000, 590000};
    const ani_size maxNum = std::numeric_limits<ani_size>::max();
    ASSERT_EQ(env->TupleValue_SetItem_Long(tuple, maxNum, (MODIFY_TUPLE)[0]), ANI_OUT_OF_RANGE);

    ani_size length = 0U;
    ASSERT_EQ(env->TupleValue_GetNumberOfItems(tuple, &length), ANI_OK);

    for (ani_size i = 0; i < length; ++i) {
        ani_long resultLong;
        ASSERT_EQ(env->TupleValue_GetItem_Long(tuple, i, &resultLong), ANI_OK);
        ASSERT_EQ(resultLong,  EXPECTED_TUPLE[i]);

        ASSERT_EQ(env->TupleValue_SetItem_Long(tuple, i, MODIFY_TUPLE[i]), ANI_OK);
        ASSERT_EQ(env->TupleValue_GetItem_Long(tuple, i, &resultLong), ANI_OK);
        ASSERT_EQ(resultLong,  MODIFY_TUPLE[i]);
    }

    return ANI_TRUE;
}

ani_int test_TupleValue_GetNumberOfItems_12([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const char *moduleName = "entry.src.main.src.ets.TupleOperations";
    const char *tupleGetterName = "getFloatTuple";
    ani_module mod{};
    ASSERT_EQ(env->FindModule(moduleName, &mod), ANI_OK);

    ani_function fn{};
    ASSERT_EQ(env->Module_FindFunction(mod, tupleGetterName, nullptr, &fn), ANI_OK);

    ani_ref ref{};
    ASSERT_EQ(env->Function_Call_Ref(fn, &ref, 0), ANI_OK);

    ani_boolean isUndefined = ANI_TRUE;
    ASSERT_EQ(env->Reference_IsUndefined(ref, &isUndefined), ANI_OK);
    ASSERT_EQ(isUndefined, ANI_FALSE);

    ani_tuple_value tuple = static_cast<ani_tuple_value>(ref);
    constexpr std::array<ani_float, 5U> EXPECTED_TUPLE = {3.14, 2.71, 1.61, 0.59, 10.0};
    constexpr std::array<ani_float, 5U> MODIFY_TUPLE = {190000.12, 290000.34, 390000.56, 490000.78, 590000.09};
    const ani_size maxNum = std::numeric_limits<ani_size>::max();
    ASSERT_EQ(env->TupleValue_SetItem_Float(tuple, maxNum, (MODIFY_TUPLE)[0]), ANI_OUT_OF_RANGE);
    ani_size length = 0U;
    ASSERT_EQ(env->TupleValue_GetNumberOfItems(tuple, &length), ANI_OK);
    for (ani_size i = 0; i < length; ++i) {
        ani_float resultFloat;
        ASSERT_EQ(env->TupleValue_GetItem_Float(tuple, i, &resultFloat), ANI_OK);
        ASSERT_EQ(resultFloat,  EXPECTED_TUPLE[i]);

        ASSERT_EQ(env->TupleValue_SetItem_Float(tuple, i, MODIFY_TUPLE[i]), ANI_OK);
        ASSERT_EQ(env->TupleValue_GetItem_Float(tuple, i, &resultFloat), ANI_OK);
        ASSERT_EQ(resultFloat, MODIFY_TUPLE[i]);
    }

    return ANI_TRUE;
}

ani_int test_TupleValue_GetNumberOfItems_13([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const char *moduleName = "entry.src.main.src.ets.TupleOperations";
    const char *tupleGetterName = "getDoubleTupleForGetNum";
    ani_module mod{};
    ASSERT_EQ(env->FindModule(moduleName, &mod), ANI_OK);
    ani_function fn{};
    ASSERT_EQ(env->Module_FindFunction(mod, tupleGetterName, nullptr, &fn), ANI_OK);
    ani_ref ref{};
    ASSERT_EQ(env->Function_Call_Ref(fn, &ref, 0), ANI_OK);

    ani_boolean isUndefined = ANI_TRUE;
    ASSERT_EQ(env->Reference_IsUndefined(ref, &isUndefined), ANI_OK);
    ASSERT_EQ(isUndefined, ANI_FALSE);

    ani_tuple_value tuple = static_cast<ani_tuple_value>(ref);
    constexpr std::array<ani_double, 5U> EXPECTED_TUPLE = {3.145, 2.716, 1.611, 0.594, 10.08};
    constexpr std::array<ani_double, 5U> MODIFY_TUPLE = {190000.12, 290000.34, 390000.56, 490000.78, 590000.09};
    const ani_size maxNum = std::numeric_limits<ani_size>::max();
    ASSERT_EQ(env->TupleValue_SetItem_Double(tuple, maxNum, (MODIFY_TUPLE)[0]), ANI_OUT_OF_RANGE);

    ani_size length = 0U;
    ASSERT_EQ(env->TupleValue_GetNumberOfItems(tuple, &length), ANI_OK);

    for (ani_size i = 0; i < length; ++i) {
        ani_double resultDouble;
        ASSERT_EQ(env->TupleValue_GetItem_Double(tuple, i, &resultDouble), ANI_OK);
        ASSERT_EQ(resultDouble,  EXPECTED_TUPLE[i]);

        ASSERT_EQ(env->TupleValue_SetItem_Double(tuple, i, MODIFY_TUPLE[i]), ANI_OK);
        ASSERT_EQ(env->TupleValue_GetItem_Double(tuple, i, &resultDouble), ANI_OK);
        ASSERT_EQ(resultDouble, MODIFY_TUPLE[i]);
    }

    return ANI_TRUE;
}
#endif // ARKTS_ANI_TEST_TUPLEOPERATIONS_H
