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

#ifndef ARKTS_ANI_TEST_VARIABLEOPERATIONS_H
#define ARKTS_ANI_TEST_VARIABLEOPERATIONS_H
#include "Common.h"

ani_int test_Namespace_FindVariable([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const char *namespacePath = "Lentry/src/main/src/ets/VariableOperations/anyns;";

    ani_namespace ns = nullptr;
    ASSERT_EQ(env->FindNamespace(namespacePath, &ns), ANI_OK);
    ASSERT_NE(ns, nullptr);

    ani_variable variable{};
    ASSERT_EQ(env->Namespace_FindVariable(ns, "i", &variable), ANI_OK);
    ASSERT_NE(variable, nullptr);

    return ANI_TRUE;
}

ani_int test_Variable_GetValue_Long([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_namespace ns = nullptr;
    ASSERT_EQ(env->FindNamespace("Lentry/src/main/src/ets/VariableOperations/anyns;", &ns), ANI_OK);
    ASSERT_NE(ns, nullptr);

    ani_variable variable{};
    ASSERT_EQ(env->Namespace_FindVariable(ns, "l", &variable), ANI_OK);
    ASSERT_NE(variable, nullptr);

    ani_long x = ani_long(0L);
    ASSERT_EQ(env->Variable_GetValue_Long(variable, &x), ANI_OK);
    ASSERT_EQ(x, ani_long(3L));
    return ANI_TRUE;
}

ani_int test_Variable_SetValue_Long([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_namespace ns = nullptr;
    ASSERT_EQ(env->FindNamespace("Lentry/src/main/src/ets/VariableOperations/anyns;", &ns), ANI_OK);
    ASSERT_NE(ns, nullptr);

    ani_variable variable{};
    ASSERT_EQ(env->Namespace_FindVariable(ns, "longValue", &variable), ANI_OK);
    ASSERT_NE(variable, nullptr);

    ani_long result = 0L;
    ASSERT_EQ(env->Variable_GetValue_Long(variable, &result), ANI_OK);
    ASSERT_EQ(result, 3L);

    const ani_long value = 6L;
    ASSERT_EQ(env->Variable_SetValue_Long(variable, value), ANI_OK);
    ASSERT_EQ(env->Variable_GetValue_Long(variable, &result), ANI_OK);
    ASSERT_EQ(result, value);
    return ANI_TRUE;
}

ani_int test_Variable_GetValue_Int([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_namespace ns = nullptr;
    ASSERT_EQ(env->FindNamespace("Lentry/src/main/src/ets/VariableOperations/anyns;", &ns), ANI_OK);
    ASSERT_NE(ns, nullptr);

    ani_variable variable{};
    ASSERT_EQ(env->Namespace_FindVariable(ns, "i", &variable), ANI_OK);
    ASSERT_NE(variable, nullptr);

    ani_int x = ani_int(0);
    ASSERT_EQ(env->Variable_GetValue_Int(variable, &x), ANI_OK);
    ASSERT_EQ(x, ani_int(3U));
    return ANI_TRUE;
}

ani_int test_Variable_SetValue_Int([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_namespace ns = nullptr;
    ASSERT_EQ(env->FindNamespace("Lentry/src/main/src/ets/VariableOperations/anyns;", &ns), ANI_OK);
    ASSERT_NE(ns, nullptr);

    ani_variable variable{};
    ASSERT_EQ(env->Namespace_FindVariable(ns, "intValue", &variable), ANI_OK);
    ASSERT_NE(variable, nullptr);

    const ani_int EXPECTED_INT_VALUE = 3;
    ani_int result = 0;
    ASSERT_EQ(env->Variable_GetValue_Int(variable, &result), ANI_OK);
    ASSERT_EQ(result, EXPECTED_INT_VALUE);

    const ani_int value = 6;
    ASSERT_EQ(env->Variable_SetValue_Int(variable, value), ANI_OK);
    ASSERT_EQ(env->Variable_GetValue_Int(variable, &result), ANI_OK);
    ASSERT_EQ(result, value);
    return ANI_TRUE;
}

ani_int test_Variable_GetValue_Double([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_double EXPECTED_DOUBLEVALUE = 3.0;
    ani_namespace ns = nullptr;
    ASSERT_EQ(env->FindNamespace("Lentry/src/main/src/ets/VariableOperations/anyns;", &ns), ANI_OK);
    ASSERT_NE(ns, nullptr);

    ani_variable variable{};
    ASSERT_EQ(env->Namespace_FindVariable(ns, "aDoubleValueB", &variable), ANI_OK);
    ASSERT_NE(variable, nullptr);

    ani_double x = ani_double(0.0);
    ASSERT_EQ(env->Variable_GetValue_Double(variable, &x), ANI_OK);
    ASSERT_EQ(x, EXPECTED_DOUBLEVALUE);
    return ANI_TRUE;
}

ani_int test_Variable_SetValue_Double([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_namespace ns = nullptr;
    ASSERT_EQ(env->FindNamespace("Lentry/src/main/src/ets/VariableOperations/anyns;", &ns), ANI_OK);
    ASSERT_NE(ns, nullptr);

    ani_variable variable{};
    ASSERT_EQ(env->Namespace_FindVariable(ns, "aDouble", &variable), ANI_OK);
    ASSERT_NE(variable, nullptr);

    ani_double result = 0;
    const ani_double expected_result = 3.0;
    ASSERT_EQ(env->Variable_GetValue_Double(variable, &result), ANI_OK);
    ASSERT_EQ(result, expected_result);

    const ani_double value = 6.0;
    ASSERT_EQ(env->Variable_SetValue_Double(variable, value), ANI_OK);
    ASSERT_EQ(env->Variable_GetValue_Double(variable, &result), ANI_OK);
    ASSERT_EQ(result, value);
    return ANI_TRUE;
}

ani_int test_Variable_GetValue_Ref([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_namespace ns = nullptr;
    ASSERT_EQ(env->FindNamespace("Lentry/src/main/src/ets/VariableOperations/anyns;", &ns), ANI_OK);
    ASSERT_NE(ns, nullptr);

    ani_variable variable{};
    ASSERT_EQ(env->Namespace_FindVariable(ns, "aNameValueB", &variable), ANI_OK);
    ASSERT_NE(variable, nullptr);

    ani_ref nameRef = nullptr;
    ASSERT_EQ(env->Variable_GetValue_Ref(variable, &nameRef), ANI_OK);

    ani_string name = static_cast<ani_string>(nameRef);
    const ani_size BUFFER_SIZE = 6;
    const ani_size EXPECTED_SUBSTR_LEN = 3;
    std::array<char, BUFFER_SIZE> buffer{};
    ani_size nameSize = 0;
    ASSERT_EQ(
        env->String_GetUTF8SubString(
            name, 0, EXPECTED_SUBSTR_LEN, buffer.data(), buffer.size(), &nameSize
        ),
        ANI_OK);
    ASSERT_EQ(std::strcmp(buffer.data(), "Dam"), ANI_OK);
    return ANI_TRUE;
}

ani_int test_Variable_GetValue_Boolean([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_namespace ns = nullptr;
    ASSERT_EQ(env->FindNamespace("Lentry/src/main/src/ets/VariableOperations/anyns;", &ns), ANI_OK);
    ASSERT_NE(ns, nullptr);

    ani_variable variable = nullptr;
    ASSERT_EQ(env->Namespace_FindVariable(ns, "aBoolValueB", &variable), ANI_OK);
    ASSERT_NE(variable, nullptr);

    ani_boolean z = ANI_FALSE;
    ASSERT_EQ(env->Variable_GetValue_Boolean(variable, &z), ANI_OK);
    ASSERT_EQ(z, ani_boolean(ANI_FALSE));
    return ANI_TRUE;
}

ani_int test_Variable_SetValue_Boolean([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const char *namespacePath = "Lentry/src/main/src/ets/VariableOperations/anyns;";
    ani_namespace ns = nullptr;
    ASSERT_EQ(env->FindNamespace(namespacePath, &ns), ANI_OK);
    ASSERT_NE(ns, nullptr);

    ani_variable variable{};
    ASSERT_EQ(env->Namespace_FindVariable(ns, "aBool", &variable), ANI_OK);
    ASSERT_NE(variable, nullptr);

    ani_boolean value = ANI_TRUE;
    ASSERT_EQ(env->Variable_SetValue_Boolean(variable, value), ANI_OK);

    ani_boolean result = ANI_FALSE;
    ASSERT_EQ(env->Variable_GetValue_Boolean(variable, &result), ANI_OK);
    ASSERT_EQ(result, value);
    return ANI_TRUE;
}

ani_int test_Variable_SetValue_Char([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const char *namespacePath = "Lentry/src/main/src/ets/VariableOperations/anyns;";
    ani_namespace ns = nullptr;
    ASSERT_EQ(env->FindNamespace(namespacePath, &ns), ANI_OK);
    ASSERT_NE(ns, nullptr);

    ani_variable variable{};
    ASSERT_EQ(env->Namespace_FindVariable(ns, "aChar", &variable), ANI_OK);
    ASSERT_NE(variable, nullptr);

    ani_char value = 'B';
    ASSERT_EQ(env->Variable_SetValue_Char(variable, value), ANI_OK);

    ani_char result = '\0';
    ASSERT_EQ(env->Variable_GetValue_Char(variable, &result), ANI_OK);
    ASSERT_EQ(result, value);
    return ANI_TRUE;
}

ani_int test_Variable_SetValue_Byte([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_namespace ns = nullptr;
    const char *namespacePath = "Lentry/src/main/src/ets/VariableOperations/anyns;";
    ASSERT_EQ(env->FindNamespace(namespacePath, &ns), ANI_OK);
    ASSERT_NE(ns, nullptr);

    ani_variable variable{};
    ASSERT_EQ(env->Namespace_FindVariable(ns, "aByte", &variable), ANI_OK);
    ASSERT_NE(variable, nullptr);

    ani_byte value = 1U;
    ASSERT_EQ(env->Variable_SetValue_Byte(variable, value), ANI_OK);
    ani_byte result = 0;
    ASSERT_EQ(env->Variable_GetValue_Byte(variable, &result), ANI_OK);
    ASSERT_EQ(result, value);

    return ANI_TRUE;
}

ani_int test_Variable_SetValue_Short([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_namespace ns = nullptr;
    ASSERT_EQ(env->FindNamespace("Lentry/src/main/src/ets/VariableOperations/anyns;", &ns), ANI_OK);
    ASSERT_NE(ns, nullptr);

    ani_variable variable{};
    ASSERT_EQ(env->Namespace_FindVariable(ns, "shortValue", &variable), ANI_OK);
    ASSERT_NE(variable, nullptr);

    ani_short result = 0U;
    const ani_short value = 6U;
    ASSERT_EQ(env->Variable_SetValue_Short(variable, value), ANI_OK);
    ASSERT_EQ(env->Variable_GetValue_Short(variable, &result), ANI_OK);
    ASSERT_EQ(result, value);

    return ANI_TRUE;
}

ani_int test_Variable_SetValue_Float([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_namespace ns = nullptr;
    ASSERT_EQ(env->FindNamespace("Lentry/src/main/src/ets/VariableOperations/anyns;", &ns), ANI_OK);
    ASSERT_NE(ns, nullptr);

    ani_variable variable{};
    ASSERT_EQ(env->Namespace_FindVariable(ns, "floatValue", &variable), ANI_OK);
    ASSERT_NE(variable, nullptr);

    ani_float result = 0.0F;
    const ani_float value = 6.28F;
    ASSERT_EQ(env->Variable_SetValue_Float(variable, value), ANI_OK);
    ASSERT_EQ(env->Variable_GetValue_Float(variable, &result), ANI_OK);
    ASSERT_EQ(result, value);

    return ANI_TRUE;
}

ani_int test_Variable_SetValue_Ref([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_size EXPECTED_LENGTH = 7U;
    ani_namespace ns = nullptr;
    ASSERT_EQ(env->FindNamespace("Lentry/src/main/src/ets/VariableOperations/anyns;", &ns), ANI_OK);
    ASSERT_NE(ns, nullptr);

    ani_variable variable{};
    ASSERT_EQ(env->Namespace_FindVariable(ns, "stringValue", &variable), ANI_OK);
    ASSERT_NE(variable, nullptr);

    ani_ref ref = nullptr;
    std::array<char, 10U> buffer{};
    ani_string newString = {};
    ASSERT_EQ(env->String_NewUTF8("abcdefg", EXPECTED_LENGTH, &newString), ANI_OK);
    ASSERT_EQ(env->Variable_SetValue_Ref(variable, newString), ANI_OK);

    ASSERT_EQ(env->Variable_GetValue_Ref(variable, &ref), ANI_OK);
    auto str = static_cast<ani_string>(ref);
    ani_size strSize = 0U;
    ASSERT_EQ(env->String_GetUTF8SubString(str, 0U, EXPECTED_LENGTH, buffer.data(), buffer.size(), &strSize), ANI_OK);
    ASSERT_EQ(strSize, EXPECTED_LENGTH);
    ASSERT_EQ(memcmp(buffer.data(), "abcdefg", EXPECTED_LENGTH), 0);

    return ANI_TRUE;
}

ani_int test_Variable_GetValue_Char([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_namespace ns = nullptr;
    ASSERT_EQ(env->FindNamespace("Lentry/src/main/src/ets/VariableOperations/anyns;", &ns), ANI_OK);
    ASSERT_NE(ns, nullptr);

    ani_variable variable{};
    ASSERT_EQ(env->Namespace_FindVariable(ns, "aCharValueB", &variable), ANI_OK);
    ASSERT_NE(variable, nullptr);

    ani_char x = '\0';
    ani_char expected = 'A';
    ASSERT_EQ(env->Variable_GetValue_Char(variable, &x), ANI_OK);
    ASSERT_EQ(x, expected);

    return ANI_TRUE;
}

ani_int test_Variable_GetValue_Byte([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_namespace ns = nullptr;
    ASSERT_EQ(env->FindNamespace("Lentry/src/main/src/ets/VariableOperations/anyns;", &ns), ANI_OK);
    ASSERT_NE(ns, nullptr);

    ani_variable variable{};
    ASSERT_EQ(env->Namespace_FindVariable(ns, "aByteValueB", &variable), ANI_OK);
    ASSERT_NE(variable, nullptr);

    ani_byte x = 3;
    ASSERT_EQ(env->Variable_GetValue_Byte(variable, &x), ANI_OK);
    ASSERT_EQ(x, ani_byte{2});

    return ANI_TRUE;
}

ani_int test_Variable_GetValue_Short([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_namespace ns = nullptr;
    ASSERT_EQ(env->FindNamespace("Lentry/src/main/src/ets/VariableOperations/anyns;", &ns), ANI_OK);
    ASSERT_NE(ns, nullptr);

    ani_variable variable{};
    ASSERT_EQ(env->Namespace_FindVariable(ns, "shortValueB", &variable), ANI_OK);
    ASSERT_NE(variable, nullptr);

    const ani_short EXPECTED_SHORT_VALUE = 3;
    ani_short value = ani_short(0);
    ASSERT_EQ(env->Variable_GetValue_Short(variable, &value), ANI_OK);
    ASSERT_EQ(value, EXPECTED_SHORT_VALUE);
    return ANI_TRUE;
}

ani_int test_Variable_GetValue_Float([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_namespace ns = nullptr;
    ASSERT_EQ(env->FindNamespace("Lentry/src/main/src/ets/VariableOperations/anyns;", &ns), ANI_OK);
    ASSERT_NE(ns, nullptr);

    ani_variable var;
    ASSERT_EQ(env->Namespace_FindVariable(ns, "floatValueB", &var), ANI_OK);
    ASSERT_NE(var, nullptr);

    ani_float value{3};
    ASSERT_EQ(env->Variable_GetValue_Float(var, &value), ANI_OK);
    ASSERT_EQ(value, ani_float{3});
    return ANI_TRUE;
}
#endif // ARKTS_ANI_TEST_VARIABLEOPERATIONS_H
