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

ani_int test_TupleValue_GetItem_Boolean([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getBooleanTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    ASSERT_EQ(env->FindModule("Lentry/src/main/src/ets/TupleOperations;", &module), ANI_OK);
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

ani_int test_TupleValue_GetItem_Char([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getCharTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    ASSERT_EQ(env->FindModule("Lentry/src/main/src/ets/TupleOperations;", &module), ANI_OK);
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

ani_int test_TupleValue_GetItem_Byte([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
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

    ASSERT_EQ(env->FindModule("Lentry/src/main/src/ets/TupleOperations;", &module), ANI_OK);
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

ani_int test_TupleValue_GetItem_Short([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
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

    ASSERT_EQ(env->FindModule("Lentry/src/main/src/ets/TupleOperations;", &module), ANI_OK);
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

ani_int test_TupleValue_GetItem_Int([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
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

    ASSERT_EQ(env->FindModule("Lentry/src/main/src/ets/TupleOperations;", &module), ANI_OK);
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

ani_int test_TupleValue_GetItem_Long([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
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

    ASSERT_EQ(env->FindModule("Lentry/src/main/src/ets/TupleOperations;", &module), ANI_OK);
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

ani_int test_TupleValue_GetItem_Float([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
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

    ASSERT_EQ(env->FindModule("Lentry/src/main/src/ets/TupleOperations;", &module), ANI_OK);
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

ani_int test_TupleValue_GetItem_Double([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
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

    ASSERT_EQ(env->FindModule("Lentry/src/main/src/ets/TupleOperations;", &module), ANI_OK);
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

ani_int test_TupleValue_GetItem_Ref([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
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

    ASSERT_EQ(env->FindModule("Lentry/src/main/src/ets/TupleOperations;", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);

    tuple = static_cast<ani_tuple_value>(resultRef);
    const std::array<ani_double, 5U> expectedArrayValues = {EXPECTED_RESULT_1, EXPECTED_RESULT_2, EXPECTED_RESULT_3,
                                                            EXPECTED_RESULT_4, EXPECTED_RESULT_5};
    ani_ref result{};
    ASSERT_EQ(env->TupleValue_GetItem_Ref(tuple, 1U, &result), ANI_OK);

    auto internalArr = reinterpret_cast<ani_array_double>(result);
    std::vector<double> elem(expectedArrayValues.size());
    ASSERT_EQ(env->Array_GetRegion_Double(internalArr, 0, elem.size(), elem.data()), ANI_OK);

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

ani_int test_TupleValue_SetItem_Boolean([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getBooleanTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    ASSERT_EQ(env->FindModule("Lentry/src/main/src/ets/TupleOperations;", &module), ANI_OK);
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

ani_int test_TupleValue_SetItem_Char([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getCharTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    ASSERT_EQ(env->FindModule("Lentry/src/main/src/ets/TupleOperations;", &module), ANI_OK);
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

ani_int test_TupleValue_SetItem_Byte([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getByteTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    ASSERT_EQ(env->FindModule("Lentry/src/main/src/ets/TupleOperations;", &module), ANI_OK);
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

ani_int test_TupleValue_SetItem_Short([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getShortTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    ASSERT_EQ(env->FindModule("Lentry/src/main/src/ets/TupleOperations;", &module), ANI_OK);
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

ani_int test_TupleValue_SetItem_Int([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getIntTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    ASSERT_EQ(env->FindModule("Lentry/src/main/src/ets/TupleOperations;", &module), ANI_OK);
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

ani_int test_TupleValue_SetItem_Long([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getLongTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    ASSERT_EQ(env->FindModule("Lentry/src/main/src/ets/TupleOperations;", &module), ANI_OK);
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

ani_int test_TupleValue_SetItem_Float([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getFloatTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    ASSERT_EQ(env->FindModule("Lentry/src/main/src/ets/TupleOperations;", &module), ANI_OK);
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

ani_int test_TupleValue_SetItem_Double([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getDoubleTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    ASSERT_EQ(env->FindModule("Lentry/src/main/src/ets/TupleOperations;", &module), ANI_OK);
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

ani_int test_TupleValue_SetItem_Ref([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getReferenceTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;
    ani_size copiedSize = 0;
    ani_ref result{};

    ASSERT_EQ(env->FindModule("Lentry/src/main/src/ets/TupleOperations;", &module), ANI_OK);
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

ani_int test_TupleValue_GetNumberOfItems([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const char *moduleName = "entry/src/main/src/ets/TupleOperations";
    const char *tupleGetterName = "getTestPrimitiveTuple";
    std::string moduleDescriptor = "L" + std::string(moduleName) + ";";
    ani_module mod{};
    ASSERT_EQ(env->FindModule(moduleDescriptor.c_str(), &mod), ANI_OK);

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
#endif // ARKTS_ANI_TEST_TUPLEOPERATIONS_H
