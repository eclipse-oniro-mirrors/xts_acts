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

ani_int test_Variable_GetValue_Boolean([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_namespace ns = nullptr;
    ASSERT_EQ(env->FindNamespace("entry.src.main.src.ets.VariableOperations.anyns", &ns), ANI_OK);
    ASSERT_NE(ns, nullptr);

    ani_variable variable = nullptr;
    ASSERT_EQ(env->Namespace_FindVariable(ns, "aBoolValueB", &variable), ANI_OK);
    ASSERT_NE(variable, nullptr);

    ani_boolean z = ANI_FALSE;
    ASSERT_EQ(env->Variable_GetValue_Boolean(variable, &z), ANI_OK);
    ASSERT_EQ(z, ani_boolean(ANI_FALSE));

    return ANI_TRUE;
}

ani_int test_Variable_GetValue_Boolean_02([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_namespace ns = nullptr;
    ASSERT_EQ(env->FindNamespace("entry.src.main.src.ets.VariableOperations.anyns", &ns), ANI_OK);
    ASSERT_NE(ns, nullptr);

    ani_variable variable {};
    ASSERT_EQ(env->Namespace_FindVariable(ns, "aBoolValueB", &variable), ANI_OK);
    ASSERT_NE(variable, nullptr);

    ani_boolean z = ANI_FALSE;
    ASSERT_EQ(env->c_api->Variable_GetValue_Boolean(nullptr, variable, &z), ANI_INVALID_ARGS);

    return ANI_TRUE;
}

ani_int test_Variable_GetValue_Boolean_03([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_namespace ns = nullptr;
    ASSERT_EQ(env->FindNamespace("entry.src.main.src.ets.VariableOperations.anyns", &ns), ANI_OK);
    ASSERT_NE(ns, nullptr);

    ani_variable variable {};
    ASSERT_EQ(env->Namespace_FindVariable(ns, "aNameValueB", &variable), ANI_OK);
    ASSERT_NE(variable, nullptr);

    ani_boolean z = ANI_FALSE;
    ASSERT_EQ(env->Variable_GetValue_Boolean(variable, &z), ANI_INVALID_TYPE);

    return ANI_TRUE;
}

ani_int test_Variable_GetValue_Boolean_04([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_boolean z = ANI_FALSE;
    ASSERT_EQ(env->Variable_GetValue_Boolean(nullptr, &z), ANI_INVALID_ARGS);

    return ANI_TRUE;
}

ani_int test_Variable_GetValue_Boolean_05([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_namespace ns = nullptr;
    ASSERT_EQ(env->FindNamespace("entry.src.main.src.ets.VariableOperations.anyns", &ns), ANI_OK);
    ASSERT_NE(ns, nullptr);
    
    ani_variable variable {};
    ASSERT_EQ(env->Namespace_FindVariable(ns, "aBoolValueB", &variable), ANI_OK);
    ASSERT_NE(variable, nullptr);

    ASSERT_EQ(env->Variable_GetValue_Boolean(variable, nullptr), ANI_INVALID_ARGS);

    return ANI_TRUE;
}

ani_int test_Variable_GetValue_Byte([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_namespace ns = nullptr;
    ASSERT_EQ(env->FindNamespace("entry.src.main.src.ets.VariableOperations.anyns", &ns), ANI_OK);
    ASSERT_NE(ns, nullptr);

    ani_variable variable{};
    ASSERT_EQ(env->Namespace_FindVariable(ns, "aByteValueB", &variable), ANI_OK);
    ASSERT_NE(variable, nullptr);

    ani_byte x = 3;
    ASSERT_EQ(env->Variable_GetValue_Byte(variable, &x), ANI_OK);
    ASSERT_EQ(x, ani_byte{2});

    return ANI_TRUE;
}

ani_int test_Variable_GetValue_Byte_02([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_namespace ns = nullptr;
    ASSERT_EQ(env->FindNamespace("entry.src.main.src.ets.VariableOperations.anyns", &ns), ANI_OK);
    ASSERT_NE(ns, nullptr);

    ani_variable variable {};
    ASSERT_EQ(env->Namespace_FindVariable(ns, "aByteValueB", &variable), ANI_OK);
    ASSERT_NE(variable, nullptr);

    ani_byte x = 0;
    ASSERT_EQ(env->c_api->Variable_GetValue_Byte(nullptr, variable, &x), ANI_INVALID_ARGS);

    return ANI_TRUE;
}

ani_int test_Variable_GetValue_Byte_03([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_namespace ns = nullptr;
    ASSERT_EQ(env->FindNamespace("entry.src.main.src.ets.VariableOperations.anyns", &ns), ANI_OK);
    ASSERT_NE(ns, nullptr);

    ani_variable variable {};
    ASSERT_EQ(env->Namespace_FindVariable(ns, "aBoolValueB", &variable), ANI_OK);
    ASSERT_NE(variable, nullptr);

    ani_byte x = 0;
    ASSERT_EQ(env->Variable_GetValue_Byte(variable, &x), ANI_INVALID_TYPE);

    return ANI_TRUE;
}

ani_int test_Variable_GetValue_Byte_04([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_byte x = 0;
    ASSERT_EQ(env->Variable_GetValue_Byte(nullptr, &x), ANI_INVALID_ARGS);

    return ANI_TRUE;
}

ani_int test_Variable_GetValue_Byte_05([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_namespace ns = nullptr;
    ASSERT_EQ(env->FindNamespace("entry.src.main.src.ets.VariableOperations.anyns", &ns), ANI_OK);
    ASSERT_NE(ns, nullptr);

    ani_variable variable {};
    ASSERT_EQ(env->Namespace_FindVariable(ns, "aByteValueB", &variable), ANI_OK);
    ASSERT_NE(variable, nullptr);

    ASSERT_EQ(env->Variable_GetValue_Byte(variable, nullptr), ANI_INVALID_ARGS);

    return ANI_TRUE;
}

ani_int test_Variable_GetValue_Char([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_namespace ns = nullptr;
    ASSERT_EQ(env->FindNamespace("entry.src.main.src.ets.VariableOperations.anyns", &ns), ANI_OK);
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

ani_int test_Variable_GetValue_Char_02([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_namespace ns = nullptr;
    ASSERT_EQ(env->FindNamespace("entry.src.main.src.ets.VariableOperations.anyns", &ns), ANI_OK);
    ASSERT_NE(ns, nullptr);

    ani_variable variable {};
    ASSERT_EQ(env->Namespace_FindVariable(ns, "aCharValueB", &variable), ANI_OK);
    ASSERT_NE(variable, nullptr);

    ani_char x = '\0';
    ASSERT_EQ(env->c_api->Variable_GetValue_Char(nullptr, variable, &x), ANI_INVALID_ARGS);

    return ANI_TRUE;
}

ani_int test_Variable_GetValue_Char_03([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_namespace ns = nullptr;
    ASSERT_EQ(env->FindNamespace("entry.src.main.src.ets.VariableOperations.anyns", &ns), ANI_OK);
    ASSERT_NE(ns, nullptr);

    ani_variable variable {};
    ASSERT_EQ(env->Namespace_FindVariable(ns, "aBoolValueB", &variable), ANI_OK);
    ASSERT_NE(variable, nullptr);

    ani_char x = '\0';
    ASSERT_EQ(env->Variable_GetValue_Char(variable, &x), ANI_INVALID_TYPE);

    return ANI_TRUE;
}

ani_int test_Variable_GetValue_Char_04([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_char x = '\0';
    ASSERT_EQ(env->Variable_GetValue_Char(nullptr, &x), ANI_INVALID_ARGS);

    return ANI_TRUE;
}

ani_int test_Variable_GetValue_Char_05([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_namespace ns = nullptr;
    ASSERT_EQ(env->FindNamespace("entry.src.main.src.ets.VariableOperations.anyns", &ns), ANI_OK);
    ASSERT_NE(ns, nullptr);

    ani_variable variable {};
    ASSERT_EQ(env->Namespace_FindVariable(ns, "aCharValueB", &variable), ANI_OK);
    ASSERT_NE(variable, nullptr);

    ASSERT_EQ(env->Variable_GetValue_Char(variable, nullptr), ANI_INVALID_ARGS);

    return ANI_TRUE;
}

ani_int test_Variable_GetValue_Double([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_double EXPECTED_DOUBLEVALUE = 3.0;
    ani_namespace ns = nullptr;
    ASSERT_EQ(env->FindNamespace("entry.src.main.src.ets.VariableOperations.anyns", &ns), ANI_OK);
    ASSERT_NE(ns, nullptr);

    ani_variable variable{};
    ASSERT_EQ(env->Namespace_FindVariable(ns, "aDoubleValueB", &variable), ANI_OK);
    ASSERT_NE(variable, nullptr);

    ani_double x = ani_double(0.0);
    ASSERT_EQ(env->Variable_GetValue_Double(variable, &x), ANI_OK);
    ASSERT_EQ(x, EXPECTED_DOUBLEVALUE);

    return ANI_TRUE;
}

ani_int test_Variable_GetValue_Double_02([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_namespace ns = nullptr;
    ASSERT_EQ(env->FindNamespace("entry.src.main.src.ets.VariableOperations.anyns", &ns), ANI_OK);
    ASSERT_NE(ns, nullptr);

    ani_variable variable {};
    ASSERT_EQ(env->Namespace_FindVariable(ns, "aDoubleValueB", &variable), ANI_OK);
    ASSERT_NE(variable, nullptr);

    ani_double x = 0.0;
    ASSERT_EQ(env->c_api->Variable_GetValue_Double(nullptr, variable, &x), ANI_INVALID_ARGS);

    return ANI_TRUE;
}

ani_int test_Variable_GetValue_Double_03([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_namespace ns = nullptr;
    ASSERT_EQ(env->FindNamespace("entry.src.main.src.ets.VariableOperations.anyns", &ns), ANI_OK);
    ASSERT_NE(ns, nullptr);

    ani_variable variable {};
    ASSERT_EQ(env->Namespace_FindVariable(ns, "aBool", &variable), ANI_OK);
    ASSERT_NE(variable, nullptr);

    ani_double x = 0.0;
    ASSERT_EQ(env->Variable_GetValue_Double(variable, &x), ANI_INVALID_TYPE);

    return ANI_TRUE;
}

ani_int test_Variable_GetValue_Double_04([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_double x = 0.0;
    ASSERT_EQ(env->Variable_GetValue_Double(nullptr, &x), ANI_INVALID_ARGS);

    return ANI_TRUE;
}

ani_int test_Variable_GetValue_Double_05([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_namespace ns = nullptr;
    ASSERT_EQ(env->FindNamespace("entry.src.main.src.ets.VariableOperations.anyns", &ns), ANI_OK);
    ASSERT_NE(ns, nullptr);
    
    ani_variable variable {};
    ASSERT_EQ(env->Namespace_FindVariable(ns, "aDoubleValueB", &variable), ANI_OK);
    ASSERT_NE(variable, nullptr);

    ASSERT_EQ(env->Variable_GetValue_Double(variable, nullptr), ANI_INVALID_ARGS);

    return ANI_TRUE;
}

ani_int test_Variable_GetValue_Float([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_namespace ns = nullptr;
    ASSERT_EQ(env->FindNamespace("entry.src.main.src.ets.VariableOperations.anyns", &ns), ANI_OK);
    ASSERT_NE(ns, nullptr);

    ani_variable var;
    ASSERT_EQ(env->Namespace_FindVariable(ns, "floatValueB", &var), ANI_OK);
    ASSERT_NE(var, nullptr);

    ani_float value{3};
    ASSERT_EQ(env->Variable_GetValue_Float(var, &value), ANI_OK);
    ASSERT_EQ(value, ani_float{3});

    return ANI_TRUE;
}

ani_int test_Variable_GetValue_Float_02([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_namespace ns = nullptr;
    ASSERT_EQ(env->FindNamespace("entry.src.main.src.ets.VariableOperations.anyns", &ns), ANI_OK);
    ASSERT_NE(ns, nullptr);

    ani_variable variable {};
    ASSERT_EQ(env->Namespace_FindVariable(ns, "floatValueB", &variable), ANI_OK);
    ASSERT_NE(variable, nullptr);

    ani_float x = 0.0F;
    ASSERT_EQ(env->c_api->Variable_GetValue_Float(nullptr, variable, &x), ANI_INVALID_ARGS);

    return ANI_TRUE;
}

ani_int test_Variable_GetValue_Float_03([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_namespace ns = nullptr;
    ASSERT_EQ(env->FindNamespace("entry.src.main.src.ets.VariableOperations.anyns", &ns), ANI_OK);
    ASSERT_NE(ns, nullptr);

    ani_variable variable {};
    ASSERT_EQ(env->Namespace_FindVariable(ns, "aBool", &variable), ANI_OK);
    ASSERT_NE(variable, nullptr);

    ani_float x = 0.0F;
    ASSERT_EQ(env->Variable_GetValue_Float(variable, &x), ANI_INVALID_TYPE);

    return ANI_TRUE;
}

ani_int test_Variable_GetValue_Float_04([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_float x = 0.0F;
    ASSERT_EQ(env->Variable_GetValue_Float(nullptr, &x), ANI_INVALID_ARGS);

    return ANI_TRUE;
}

ani_int test_Variable_GetValue_Float_05([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_namespace ns = nullptr;
    ASSERT_EQ(env->FindNamespace("entry.src.main.src.ets.VariableOperations.anyns", &ns), ANI_OK);
    ASSERT_NE(ns, nullptr);

    ani_variable variable {};
    ASSERT_EQ(env->Namespace_FindVariable(ns, "floatValueB", &variable), ANI_OK);
    ASSERT_NE(variable, nullptr);

    ASSERT_EQ(env->Variable_GetValue_Float(variable, nullptr), ANI_INVALID_ARGS);

    return ANI_TRUE;
}

ani_int test_Variable_GetValue_Int([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_namespace ns = nullptr;
    ASSERT_EQ(env->FindNamespace("entry.src.main.src.ets.VariableOperations.anyns", &ns), ANI_OK);
    ASSERT_NE(ns, nullptr);

    ani_variable variable{};
    ASSERT_EQ(env->Namespace_FindVariable(ns, "i", &variable), ANI_OK);
    ASSERT_NE(variable, nullptr);

    ani_int x = ani_int(0);
    ASSERT_EQ(env->Variable_GetValue_Int(variable, &x), ANI_OK);
    ASSERT_EQ(x, ani_int(3U));

    return ANI_TRUE;
}

ani_int test_Variable_GetValue_Int_02([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_namespace ns = nullptr;
    ASSERT_EQ(env->FindNamespace("entry.src.main.src.ets.VariableOperations.anyns", &ns), ANI_OK);
    ASSERT_NE(ns, nullptr);

    ani_variable variable {};
    ASSERT_EQ(env->Namespace_FindVariable(ns, "i", &variable), ANI_OK);
    ASSERT_NE(variable, nullptr);

    ani_int x = 0;
    ASSERT_EQ(env->c_api->Variable_GetValue_Int(nullptr, variable, &x), ANI_INVALID_ARGS);

    return ANI_TRUE;
}

ani_int test_Variable_GetValue_Int_03([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_namespace ns = nullptr;
    ASSERT_EQ(env->FindNamespace("entry.src.main.src.ets.VariableOperations.anyns", &ns), ANI_OK);
    ASSERT_NE(ns, nullptr);

    ani_variable variable {};
    ASSERT_EQ(env->Namespace_FindVariable(ns, "aBool", &variable), ANI_OK);
    ASSERT_NE(variable, nullptr);

    ani_int x = 0;
    ASSERT_EQ(env->Variable_GetValue_Int(variable, &x), ANI_INVALID_TYPE);

    return ANI_TRUE;
}

ani_int test_Variable_GetValue_Int_04([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_int x = 0;
    ASSERT_EQ(env->Variable_GetValue_Int(nullptr, &x), ANI_INVALID_ARGS);

    return ANI_TRUE;
}

ani_int test_Variable_GetValue_Int_05([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_namespace ns = nullptr;
    ASSERT_EQ(env->FindNamespace("entry.src.main.src.ets.VariableOperations.anyns", &ns), ANI_OK);
    ASSERT_NE(ns, nullptr);

    ani_variable variable {};
    ASSERT_EQ(env->Namespace_FindVariable(ns, "i", &variable), ANI_OK);
    ASSERT_NE(variable, nullptr);

    ASSERT_EQ(env->Variable_GetValue_Int(variable, nullptr), ANI_INVALID_ARGS);

    return ANI_TRUE;
}

ani_int test_Variable_GetValue_Long([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_namespace ns = nullptr;
    ASSERT_EQ(env->FindNamespace("entry.src.main.src.ets.VariableOperations.anyns", &ns), ANI_OK);
    ASSERT_NE(ns, nullptr);

    ani_variable variable{};
    ASSERT_EQ(env->Namespace_FindVariable(ns, "l", &variable), ANI_OK);
    ASSERT_NE(variable, nullptr);

    ani_long x = ani_long(0L);
    ASSERT_EQ(env->Variable_GetValue_Long(variable, &x), ANI_OK);
    ASSERT_EQ(x, ani_long(3L));
    return ANI_TRUE;
}

ani_int test_Variable_GetValue_Long_02([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_namespace ns = nullptr;
    ASSERT_EQ(env->FindNamespace("entry.src.main.src.ets.VariableOperations.anyns", &ns), ANI_OK);
    ASSERT_NE(ns, nullptr);

    ani_variable variable {};
    ASSERT_EQ(env->Namespace_FindVariable(ns, "l", &variable), ANI_OK);
    ASSERT_NE(variable, nullptr);

    ani_long x = 0L;
    ASSERT_EQ(env->c_api->Variable_GetValue_Long(nullptr, variable, &x), ANI_INVALID_ARGS);

    return ANI_TRUE;
}

ani_int test_Variable_GetValue_Long_03([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_namespace ns = nullptr;
    ASSERT_EQ(env->FindNamespace("entry.src.main.src.ets.VariableOperations.anyns", &ns), ANI_OK);
    ASSERT_NE(ns, nullptr);

    ani_variable variable {};
    ASSERT_EQ(env->Namespace_FindVariable(ns, "aBool", &variable), ANI_OK);
    ASSERT_NE(variable, nullptr);

    ani_long x = 0L;
    ASSERT_EQ(env->Variable_GetValue_Long(variable, &x), ANI_INVALID_TYPE);

    return ANI_TRUE;
}

ani_int test_Variable_GetValue_Long_04([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_long x = 0L;
    ASSERT_EQ(env->Variable_GetValue_Long(nullptr, &x), ANI_INVALID_ARGS);

    return ANI_TRUE;
}

ani_int test_Variable_GetValue_Long_05([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_namespace ns = nullptr;
    ASSERT_EQ(env->FindNamespace("entry.src.main.src.ets.VariableOperations.anyns", &ns), ANI_OK);
    ASSERT_NE(ns, nullptr);

    ani_variable variable {};
    ASSERT_EQ(env->Namespace_FindVariable(ns, "l", &variable), ANI_OK);
    ASSERT_NE(variable, nullptr);

    ASSERT_EQ(env->Variable_GetValue_Long(variable, nullptr), ANI_INVALID_ARGS);

    return ANI_TRUE;
}

ani_int test_Variable_GetValue_Ref([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_namespace ns = nullptr;
    ASSERT_EQ(env->FindNamespace("entry.src.main.src.ets.VariableOperations.anyns", &ns), ANI_OK);
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

ani_int test_Variable_GetValue_Ref_02([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_namespace ns = nullptr;
    ASSERT_EQ(env->FindNamespace("entry.src.main.src.ets.VariableOperations.anyns", &ns), ANI_OK);
    ASSERT_NE(ns, nullptr);

    ani_variable variable {};
    ASSERT_EQ(env->Namespace_FindVariable(ns, "aNameValueB", &variable), ANI_OK);
    ASSERT_NE(variable, nullptr);

    ani_ref nameRef = nullptr;
    ASSERT_EQ(env->c_api->Variable_GetValue_Ref(nullptr, variable, &nameRef), ANI_INVALID_ARGS);

    return ANI_TRUE;
}

ani_int test_Variable_GetValue_Ref_03([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_namespace ns = nullptr;
    ASSERT_EQ(env->FindNamespace("entry.src.main.src.ets.VariableOperations.anyns", &ns), ANI_OK);
    ASSERT_NE(ns, nullptr);

    ani_variable variable {};
    ASSERT_EQ(env->Namespace_FindVariable(ns, "aBool", &variable), ANI_OK);
    ASSERT_NE(variable, nullptr);

    ani_ref nameRef = nullptr;
    ASSERT_EQ(env->Variable_GetValue_Ref(variable, &nameRef), ANI_INVALID_TYPE);

    return ANI_TRUE;
}

ani_int test_Variable_GetValue_Ref_04([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_namespace ns = nullptr;
    ASSERT_EQ(env->FindNamespace("entry.src.main.src.ets.VariableOperations.anyns", &ns), ANI_OK);
    ASSERT_NE(ns, nullptr);

    ani_variable variable {};
    ani_ref nameRef = nullptr;
    ASSERT_EQ(env->Variable_GetValue_Ref(variable, &nameRef), ANI_INVALID_ARGS);

    return ANI_TRUE;
}

ani_int test_Variable_GetValue_Ref_05([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_namespace ns = nullptr;
    ASSERT_EQ(env->FindNamespace("entry.src.main.src.ets.VariableOperations.anyns", &ns), ANI_OK);
    ASSERT_NE(ns, nullptr);

    ani_variable variable {};
    ASSERT_EQ(env->Namespace_FindVariable(ns, "aNameValueB", &variable), ANI_OK);
    ASSERT_NE(variable, nullptr);

    ASSERT_EQ(env->Variable_GetValue_Ref(variable, nullptr), ANI_INVALID_ARGS);

    return ANI_TRUE;
}

ani_int test_Variable_GetValue_Short([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_namespace ns = nullptr;
    ASSERT_EQ(env->FindNamespace("entry.src.main.src.ets.VariableOperations.anyns", &ns), ANI_OK);
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

ani_int test_Variable_GetValue_Short_02([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_namespace ns = nullptr;
    ASSERT_EQ(env->FindNamespace("entry.src.main.src.ets.VariableOperations.anyns", &ns), ANI_OK);
    ASSERT_NE(ns, nullptr);

    ani_variable variable {};
    ASSERT_EQ(env->Namespace_FindVariable(ns, "shortValueB", &variable), ANI_OK);
    ASSERT_NE(variable, nullptr);

    ani_short x = 0;
    ASSERT_EQ(env->c_api->Variable_GetValue_Short(nullptr, variable, &x), ANI_INVALID_ARGS);

    return ANI_TRUE;
}

ani_int test_Variable_GetValue_Short_03([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_namespace ns = nullptr;
    ASSERT_EQ(env->FindNamespace("entry.src.main.src.ets.VariableOperations.anyns", &ns), ANI_OK);
    ASSERT_NE(ns, nullptr);

    ani_variable variable {};
    ASSERT_EQ(env->Namespace_FindVariable(ns, "aBool", &variable), ANI_OK);
    ASSERT_NE(variable, nullptr);

    ani_short x = 0;
    ASSERT_EQ(env->Variable_GetValue_Short(variable, &x), ANI_INVALID_TYPE);

    return ANI_TRUE;
}

ani_int test_Variable_GetValue_Short_04([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_short x = 0;
    ASSERT_EQ(env->Variable_GetValue_Short(nullptr, &x), ANI_INVALID_ARGS);

    return ANI_TRUE;
}

ani_int test_Variable_GetValue_Short_05([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_namespace ns = nullptr;
    ASSERT_EQ(env->FindNamespace("entry.src.main.src.ets.VariableOperations.anyns", &ns), ANI_OK);
    ASSERT_NE(ns, nullptr);

    ani_variable variable {};
    ASSERT_EQ(env->Namespace_FindVariable(ns, "shortValueB", &variable), ANI_OK);
    ASSERT_NE(variable, nullptr);

    ASSERT_EQ(env->Variable_GetValue_Short(variable, nullptr), ANI_INVALID_ARGS);

    return ANI_TRUE;
}

ani_int test_Variable_SetValue_Boolean([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const char *namespacePath = "entry.src.main.src.ets.VariableOperations.anyns";
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

ani_int test_Variable_SetValue_Boolean_02([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const char *namespacePath = "entry.src.main.src.ets.VariableOperations.anyns";
    ani_namespace ns = nullptr;
    ASSERT_EQ(env->FindNamespace(namespacePath, &ns), ANI_OK);
    ASSERT_NE(ns, nullptr);

    ani_variable variable {};
    ASSERT_EQ(env->Namespace_FindVariable(ns, "aBool", &variable), ANI_OK);
    ASSERT_NE(variable, nullptr);

    ani_boolean value = ANI_TRUE;
    ASSERT_EQ(env->c_api->Variable_SetValue_Boolean(nullptr, variable, value), ANI_INVALID_ARGS);

    return ANI_TRUE;
}

ani_int test_Variable_SetValue_Boolean_03([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const char *namespacePath = "entry.src.main.src.ets.VariableOperations.anyns";
    ani_namespace ns = nullptr;
    ASSERT_EQ(env->FindNamespace(namespacePath, &ns), ANI_OK);
    ASSERT_NE(ns, nullptr);

    ani_variable variable {};
    ASSERT_EQ(env->Namespace_FindVariable(ns, "aByte", &variable), ANI_OK);
    ASSERT_NE(variable, nullptr);

    ani_boolean value = ANI_TRUE;
    ASSERT_EQ(env->Variable_SetValue_Boolean(variable, value), ANI_INVALID_TYPE);

    return ANI_TRUE;
}

ani_int test_Variable_SetValue_Boolean_04([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_boolean value = ANI_TRUE;
    ASSERT_EQ(env->Variable_SetValue_Boolean(nullptr, value), ANI_INVALID_ARGS);

    return ANI_TRUE;
}

ani_int test_Variable_SetValue_Boolean_05([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const char *namespacePath = "entry.src.main.src.ets.VariableOperations.anyns";
    ani_namespace ns = nullptr;
    ASSERT_EQ(env->FindNamespace(namespacePath, &ns), ANI_OK);
    ASSERT_NE(ns, nullptr);

    ani_variable variable {};
    ASSERT_EQ(env->Namespace_FindVariable(ns, "aBool", &variable), ANI_OK);
    ASSERT_NE(variable, nullptr);

    const ani_int value = 10U;
    ASSERT_EQ(env->c_api->Variable_SetValue_Boolean(env, variable, value), ANI_OK);
    ani_boolean result = ANI_FALSE;
    ASSERT_EQ(env->Variable_GetValue_Boolean(variable, &result), ANI_OK);

    return ANI_TRUE;
}

ani_int test_Variable_SetValue_Boolean_07([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const char *namespacePath = "entry.src.main.src.ets.VariableOperations.anyns";
    ani_namespace ns = nullptr;
    ASSERT_EQ(env->FindNamespace(namespacePath, &ns), ANI_OK);
    ASSERT_NE(ns, nullptr);

    ani_variable variable {};
    ASSERT_EQ(env->Namespace_FindVariable(ns, "aBool", &variable), ANI_OK);
    ASSERT_NE(variable, nullptr);

    const ani_boolean values[] = {ANI_TRUE, ANI_FALSE, ANI_TRUE};
    ani_boolean result = ANI_FALSE;
    for (ani_boolean value : values) {
        ASSERT_EQ(env->Variable_SetValue_Boolean(variable, value), ANI_OK);
        ASSERT_EQ(env->Variable_GetValue_Boolean(variable, &result), ANI_OK);
        ASSERT_EQ(result, value);
    }

    return ANI_TRUE;
}

ani_int test_Variable_SetValue_Boolean_09([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const char *namespacePath = "entry.src.main.src.ets.VariableOperations.anyns";
    ani_namespace ns = nullptr;
    ASSERT_EQ(env->FindNamespace(namespacePath, &ns), ANI_OK);
    ASSERT_NE(ns, nullptr);

    ani_variable variable1 {};
    ASSERT_EQ(env->Namespace_FindVariable(ns, "aBool", &variable1), ANI_OK);
    ASSERT_NE(variable1, nullptr);

    ani_boolean getValue1 = ANI_FALSE;
    ani_boolean val1 = ANI_TRUE;
    ASSERT_EQ(env->Variable_SetValue_Boolean(variable1, val1), ANI_OK);
    ASSERT_EQ(env->Variable_GetValue_Boolean(variable1, &getValue1), ANI_OK);
    ASSERT_EQ(getValue1, val1);

    ani_variable variable2 {};
    ASSERT_EQ(env->Namespace_FindVariable(ns, "testValueBool", &variable2), ANI_OK);
    ASSERT_NE(variable2, nullptr);

    ani_boolean getValue2 = ANI_FALSE;
    ani_boolean val2 = ANI_FALSE;
    ASSERT_EQ(env->Variable_SetValue_Boolean(variable2, val2), ANI_OK);
    ASSERT_EQ(env->Variable_GetValue_Boolean(variable2, &getValue2), ANI_OK);
    ASSERT_EQ(getValue2, val2);

    return ANI_TRUE;
}

ani_int test_Variable_SetValue_Byte([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_namespace ns = nullptr;
    const char *namespacePath = "entry.src.main.src.ets.VariableOperations.anyns";
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

ani_int test_Variable_SetValue_Byte_02([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_namespace ns = nullptr;
    const char *namespacePath = "entry.src.main.src.ets.VariableOperations.anyns";
    ASSERT_EQ(env->FindNamespace(namespacePath, &ns), ANI_OK);
    ASSERT_NE(ns, nullptr);

    ani_variable variable {};
    ASSERT_EQ(env->Namespace_FindVariable(ns, "aByte", &variable), ANI_OK);
    ASSERT_NE(variable, nullptr);

    const ani_byte value = 1U;
    ASSERT_EQ(env->c_api->Variable_SetValue_Byte(nullptr, variable, value), ANI_INVALID_ARGS);

    return ANI_TRUE;
}

ani_int test_Variable_SetValue_Byte_03([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_namespace ns = nullptr;
    const char *namespacePath = "entry.src.main.src.ets.VariableOperations.anyns";
    ASSERT_EQ(env->FindNamespace(namespacePath, &ns), ANI_OK);
    ASSERT_NE(ns, nullptr);

    ani_variable variable {};
    ASSERT_EQ(env->Namespace_FindVariable(ns, "aDouble", &variable), ANI_OK);
    ASSERT_NE(variable, nullptr);

    const ani_byte value = 1U;
    ASSERT_EQ(env->Variable_SetValue_Byte(variable, value), ANI_INVALID_TYPE);

    return ANI_TRUE;
}

ani_int test_Variable_SetValue_Byte_04([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_byte value = 1U;
    ASSERT_EQ(env->Variable_SetValue_Byte(nullptr, value), ANI_INVALID_ARGS);

    return ANI_TRUE;
}

ani_int test_Variable_SetValue_Byte_05([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_namespace ns = nullptr;
    const char *namespacePath = "entry.src.main.src.ets.VariableOperations.anyns";
    ASSERT_EQ(env->FindNamespace(namespacePath, &ns), ANI_OK);
    ASSERT_NE(ns, nullptr);

    ani_variable variable {};
    ASSERT_EQ(env->Namespace_FindVariable(ns, "aByte", &variable), ANI_OK);
    ASSERT_NE(variable, nullptr);

    ani_short value = std::numeric_limits<ani_short>::max();
    ASSERT_EQ(env->Variable_SetValue_Byte(variable, value), ANI_OK);
    ani_byte result = 0;
    ASSERT_EQ(env->Variable_GetValue_Byte(variable, &result), ANI_OK);

    return ANI_TRUE;
}

ani_int test_Variable_SetValue_Byte_07([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_namespace ns = nullptr;
    const char *namespacePath = "entry.src.main.src.ets.VariableOperations.anyns";
    ASSERT_EQ(env->FindNamespace(namespacePath, &ns), ANI_OK);
    ASSERT_NE(ns, nullptr);

    ani_variable variable {};
    ASSERT_EQ(env->Namespace_FindVariable(ns, "aByte", &variable), ANI_OK);
    ASSERT_NE(variable, nullptr);

    const ani_byte values[] = {40U, 0, -10};
    ani_byte result = 0;
    for (ani_byte value : values) {
        ASSERT_EQ(env->Variable_SetValue_Byte(variable, value), ANI_OK);
        ASSERT_EQ(env->Variable_GetValue_Byte(variable, &result), ANI_OK);
        ASSERT_EQ(result, value);
    }

    return ANI_TRUE;
}

ani_int test_Variable_SetValue_Byte_09([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_namespace ns = nullptr;
    const char *namespacePath = "entry.src.main.src.ets.VariableOperations.anyns";
    ASSERT_EQ(env->FindNamespace(namespacePath, &ns), ANI_OK);
    ASSERT_NE(ns, nullptr);

    ani_variable variable1 {};
    ASSERT_EQ(env->Namespace_FindVariable(ns, "aByte", &variable1), ANI_OK);
    ASSERT_NE(variable1, nullptr);

    ani_byte getValue1 = 0;
    const ani_byte val1 = 30U;
    ASSERT_EQ(env->Variable_SetValue_Byte(variable1, val1), ANI_OK);
    ASSERT_EQ(env->Variable_GetValue_Byte(variable1, &getValue1), ANI_OK);
    ASSERT_EQ(getValue1, val1);

    ani_variable variable2 {};
    ASSERT_EQ(env->Namespace_FindVariable(ns, "testValueByte", &variable2), ANI_OK);
    ASSERT_NE(variable2, nullptr);

    ani_byte getValue2 = 0;
    const ani_byte val2 = 60U;
    ASSERT_EQ(env->Variable_SetValue_Byte(variable2, val2), ANI_OK);
    ASSERT_EQ(env->Variable_GetValue_Byte(variable2, &getValue2), ANI_OK);
    ASSERT_EQ(getValue2, val2);

    return ANI_TRUE;
}

ani_int test_Variable_SetValue_Char([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const char *namespacePath = "entry.src.main.src.ets.VariableOperations.anyns";
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

ani_int test_Variable_SetValue_Char_02([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const char *namespacePath = "entry.src.main.src.ets.VariableOperations.anyns";
    ani_namespace ns = nullptr;
    ASSERT_EQ(env->FindNamespace(namespacePath, &ns), ANI_OK);
    ASSERT_NE(ns, nullptr);

    ani_variable variable {};
    ASSERT_EQ(env->Namespace_FindVariable(ns, "aChar", &variable), ANI_OK);
    ASSERT_NE(variable, nullptr);

    const ani_char value = 'B';
    ASSERT_EQ(env->c_api->Variable_SetValue_Char(nullptr, variable, value), ANI_INVALID_ARGS);

    return ANI_TRUE;
}

ani_int test_Variable_SetValue_Char_03([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const char *namespacePath = "entry.src.main.src.ets.VariableOperations.anyns";
    ani_namespace ns = nullptr;
    ASSERT_EQ(env->FindNamespace(namespacePath, &ns), ANI_OK);
    ASSERT_NE(ns, nullptr);

    ani_variable variable {};
    ASSERT_EQ(env->Namespace_FindVariable(ns, "aDouble", &variable), ANI_OK);
    ASSERT_NE(variable, nullptr);

    const ani_char value = 'B';
    ASSERT_EQ(env->Variable_SetValue_Char(variable, value), ANI_INVALID_TYPE);

    return ANI_TRUE;
}

ani_int test_Variable_SetValue_Char_04([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_char value = 'B';
    ASSERT_EQ(env->Variable_SetValue_Char(nullptr, value), ANI_INVALID_ARGS);

    return ANI_TRUE;
}

ani_int test_Variable_SetValue_Char_05([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const char *namespacePath = "entry.src.main.src.ets.VariableOperations.anyns";
    ani_namespace ns = nullptr;
    ASSERT_EQ(env->FindNamespace(namespacePath, &ns), ANI_OK);
    ASSERT_NE(ns, nullptr);

    ani_variable variable {};
    ASSERT_EQ(env->Namespace_FindVariable(ns, "aChar", &variable), ANI_OK);
    ASSERT_NE(variable, nullptr);

    ani_double value = std::numeric_limits<double>::max();
    ASSERT_EQ(env->Variable_SetValue_Char(variable, value), ANI_OK);

    return ANI_TRUE;
}

ani_int test_Variable_SetValue_Char_07([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const char *namespacePath = "entry.src.main.src.ets.VariableOperations.anyns";
    ani_namespace ns = nullptr;
    ASSERT_EQ(env->FindNamespace(namespacePath, &ns), ANI_OK);
    ASSERT_NE(ns, nullptr);

    ani_variable variable {};
    ASSERT_EQ(env->Namespace_FindVariable(ns, "aChar", &variable), ANI_OK);
    ASSERT_NE(variable, nullptr);

    const ani_char values[] = {'X', 'Y', 'Z'};
    ani_char result = '\0';
    for (ani_char value : values) {
        ASSERT_EQ(env->Variable_SetValue_Char(variable, value), ANI_OK);
        ASSERT_EQ(env->Variable_GetValue_Char(variable, &result), ANI_OK);
        ASSERT_EQ(result, value);
    }

    return ANI_TRUE;
}

ani_int test_Variable_SetValue_Char_09([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const char *namespacePath = "entry.src.main.src.ets.VariableOperations.anyns";
    ani_namespace ns = nullptr;
    ASSERT_EQ(env->FindNamespace(namespacePath, &ns), ANI_OK);
    ASSERT_NE(ns, nullptr);

    ani_variable variable1 {};
    ASSERT_EQ(env->Namespace_FindVariable(ns, "aChar", &variable1), ANI_OK);
    ASSERT_NE(variable1, nullptr);

    ani_char getValue1 = '\0';
    const ani_char val1 = 'G';
    ASSERT_EQ(env->Variable_SetValue_Char(variable1, val1), ANI_OK);
    ASSERT_EQ(env->Variable_GetValue_Char(variable1, &getValue1), ANI_OK);
    ASSERT_EQ(getValue1, val1);

    ani_variable variable2 {};
    ASSERT_EQ(env->Namespace_FindVariable(ns, "testValueChar", &variable2), ANI_OK);
    ASSERT_NE(variable2, nullptr);

    ani_char getValue2 = '\0';
    const ani_char val2 = 'K';
    ASSERT_EQ(env->Variable_SetValue_Char(variable2, val2), ANI_OK);
    ASSERT_EQ(env->Variable_GetValue_Char(variable2, &getValue2), ANI_OK);
    ASSERT_EQ(getValue2, val2);

    return ANI_TRUE;
}

ani_int test_Variable_SetValue_Double([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_namespace ns = nullptr;
    ASSERT_EQ(env->FindNamespace("entry.src.main.src.ets.VariableOperations.anyns", &ns), ANI_OK);
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

ani_int test_Variable_SetValue_Double_02([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_namespace ns = nullptr;
    ASSERT_EQ(env->FindNamespace("entry.src.main.src.ets.VariableOperations.anyns", &ns), ANI_OK);
    ASSERT_NE(ns, nullptr);

    ani_variable variable {};
    ASSERT_EQ(env->Namespace_FindVariable(ns, "aDouble", &variable), ANI_OK);
    ASSERT_NE(variable, nullptr);

    const ani_double value = 2.0F;
    ASSERT_EQ(env->c_api->Variable_SetValue_Double(nullptr, variable, value), ANI_INVALID_ARGS);

    return ANI_TRUE;
}

ani_int test_Variable_SetValue_Double_03([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_namespace ns = nullptr;
    ASSERT_EQ(env->FindNamespace("entry.src.main.src.ets.VariableOperations.anyns", &ns), ANI_OK);
    ASSERT_NE(ns, nullptr);

    ani_variable variable {};
    ASSERT_EQ(env->Namespace_FindVariable(ns, "i", &variable), ANI_OK);
    ASSERT_NE(variable, nullptr);

    const ani_double value = 5.0F;
    ASSERT_EQ(env->c_api->Variable_SetValue_Double(nullptr, variable, value), ANI_INVALID_ARGS);

    return ANI_TRUE;
}

ani_int test_Variable_SetValue_Double_04([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_namespace ns = nullptr;
    ASSERT_EQ(env->FindNamespace("entry.src.main.src.ets.VariableOperations.anyns", &ns), ANI_OK);
    ASSERT_NE(ns, nullptr);

    ani_variable variable {};
    ASSERT_EQ(env->Namespace_FindVariable(ns, "aBool", &variable), ANI_OK);
    ASSERT_NE(variable, nullptr);

    const ani_double value = 2.0F;
    ASSERT_EQ(env->Variable_SetValue_Double(variable, value), ANI_INVALID_TYPE);

    return ANI_TRUE;
}

ani_int test_Variable_SetValue_Double_05([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_double value = 2.0F;
    ASSERT_EQ(env->Variable_SetValue_Double(nullptr, value), ANI_INVALID_ARGS);

    return ANI_TRUE;
}

ani_int test_Variable_SetValue_Double_07([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_namespace ns = nullptr;
    ASSERT_EQ(env->FindNamespace("entry.src.main.src.ets.VariableOperations.anyns", &ns), ANI_OK);
    ASSERT_NE(ns, nullptr);

    ani_variable variable {};
    ASSERT_EQ(env->Namespace_FindVariable(ns, "aDouble", &variable), ANI_OK);
    ASSERT_NE(variable, nullptr);

    const ani_double values[] = {3.14F, 0, -9.42F};
    ani_double result = 0.0F;
    for (ani_double value : values) {
        ASSERT_EQ(env->Variable_SetValue_Double(variable, value), ANI_OK);
        ASSERT_EQ(env->Variable_GetValue_Double(variable, &result), ANI_OK);
        ASSERT_EQ(result, value);
    }

    return ANI_TRUE;
}

ani_int test_Variable_SetValue_Double_09([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_namespace ns = nullptr;
    ASSERT_EQ(env->FindNamespace("entry.src.main.src.ets.VariableOperations.anyns", &ns), ANI_OK);
    ASSERT_NE(ns, nullptr);

    ani_variable variable1 {};
    ASSERT_EQ(env->Namespace_FindVariable(ns, "aDouble", &variable1), ANI_OK);
    ASSERT_NE(variable1, nullptr);

    ani_double getValue1 = 0.0F;
    const ani_double val1 = 3.14F;
    ASSERT_EQ(env->Variable_SetValue_Double(variable1, val1), ANI_OK);
    ASSERT_EQ(env->Variable_GetValue_Double(variable1, &getValue1), ANI_OK);
    ASSERT_EQ(getValue1, val1);

    ani_variable variable2 {};
    ASSERT_EQ(env->Namespace_FindVariable(ns, "testValueDouble", &variable2), ANI_OK);
    ASSERT_NE(variable2, nullptr);

    ani_double getValue2 = 0.0F;
    const ani_double val2 = 6.28F;
    ASSERT_EQ(env->Variable_SetValue_Double(variable2, val2), ANI_OK);
    ASSERT_EQ(env->Variable_GetValue_Double(variable2, &getValue2), ANI_OK);
    ASSERT_EQ(getValue2, val2);

    return ANI_TRUE;
}

ani_int test_Variable_SetValue_Float([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_namespace ns = nullptr;
    ASSERT_EQ(env->FindNamespace("entry.src.main.src.ets.VariableOperations.anyns", &ns), ANI_OK);
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

ani_int test_Variable_SetValue_Float_02([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_namespace ns = nullptr;
    ASSERT_EQ(env->FindNamespace("entry.src.main.src.ets.VariableOperations.anyns", &ns), ANI_OK);
    ASSERT_NE(ns, nullptr);

    ani_variable variable {};
    ASSERT_EQ(env->Namespace_FindVariable(ns, "floatValue", &variable), ANI_OK);
    ASSERT_NE(variable, nullptr);

    const ani_float value = 6.28F;
    ASSERT_EQ(env->c_api->Variable_SetValue_Float(nullptr, variable, value), ANI_INVALID_ARGS);

    return ANI_TRUE;
}

ani_int test_Variable_SetValue_Float_03([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_namespace ns = nullptr;
    ASSERT_EQ(env->FindNamespace("entry.src.main.src.ets.VariableOperations.anyns", &ns), ANI_OK);
    ASSERT_NE(ns, nullptr);

    ani_variable variable {};
    ASSERT_EQ(env->Namespace_FindVariable(ns, "intValue", &variable), ANI_OK);
    ASSERT_NE(variable, nullptr);

    const ani_float value = 6.28F;
    ASSERT_EQ(env->Variable_SetValue_Float(variable, value), ANI_INVALID_TYPE);

    return ANI_TRUE;
}

ani_int test_Variable_SetValue_Float_04([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_float value = 6.28F;
    ASSERT_EQ(env->Variable_SetValue_Float(nullptr, value), ANI_INVALID_ARGS);

    return ANI_TRUE;
}

ani_int test_Variable_SetValue_Float_05([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_namespace ns = nullptr;
    ASSERT_EQ(env->FindNamespace("entry.src.main.src.ets.VariableOperations.anyns", &ns), ANI_OK);
    ASSERT_NE(ns, nullptr);

    ani_variable variable {};
    ASSERT_EQ(env->Namespace_FindVariable(ns, "floatValue", &variable), ANI_OK);
    ASSERT_NE(variable, nullptr);

    ani_double maxValue = std::numeric_limits<double>::max();
    ASSERT_EQ(env->Variable_SetValue_Float(variable, maxValue), ANI_OK);
    ani_float result = 0.0F;
    ASSERT_EQ(env->Variable_GetValue_Float(variable, &result), ANI_OK);

    return ANI_TRUE;
}

ani_int test_Variable_SetValue_Float_07([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_namespace ns = nullptr;
    ASSERT_EQ(env->FindNamespace("entry.src.main.src.ets.VariableOperations.anyns", &ns), ANI_OK);
    ASSERT_NE(ns, nullptr);

    ani_variable variable {};
    ASSERT_EQ(env->Namespace_FindVariable(ns, "floatValue", &variable), ANI_OK);
    ASSERT_NE(variable, nullptr);

    const ani_float values[] = {3.14F, 0, -9.42F};
    ani_float result = 0.0F;
    for (ani_float value : values) {
        ASSERT_EQ(env->Variable_SetValue_Float(variable, value), ANI_OK);
        ASSERT_EQ(env->Variable_GetValue_Float(variable, &result), ANI_OK);
        ASSERT_EQ(result, value);
    }

    return ANI_TRUE;
}

ani_int test_Variable_SetValue_Float_09([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_namespace ns = nullptr;
    ASSERT_EQ(env->FindNamespace("entry.src.main.src.ets.VariableOperations.anyns", &ns), ANI_OK);
    ASSERT_NE(ns, nullptr);

    ani_variable variable1 {};
    ASSERT_EQ(env->Namespace_FindVariable(ns, "floatValue", &variable1), ANI_OK);
    ASSERT_NE(variable1, nullptr);

    ani_float getValue1 = 0.0F;
    const ani_float val1 = 3.14F;
    ASSERT_EQ(env->Variable_SetValue_Float(variable1, val1), ANI_OK);
    ASSERT_EQ(env->Variable_GetValue_Float(variable1, &getValue1), ANI_OK);
    ASSERT_EQ(getValue1, val1);

    ani_variable variable2 {};
    ASSERT_EQ(env->Namespace_FindVariable(ns, "testValueFloat", &variable2), ANI_OK);
    ASSERT_NE(variable2, nullptr);

    ani_float getValue2 = 0.0F;
    const ani_float val2 = 6.28F;
    ASSERT_EQ(env->Variable_SetValue_Float(variable2, val2), ANI_OK);
    ASSERT_EQ(env->Variable_GetValue_Float(variable2, &getValue2), ANI_OK);
    ASSERT_EQ(getValue2, val2);

    return ANI_TRUE;
}

ani_int test_Variable_SetValue_Int([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_namespace ns = nullptr;
    ASSERT_EQ(env->FindNamespace("entry.src.main.src.ets.VariableOperations.anyns", &ns), ANI_OK);
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

ani_int test_Variable_SetValue_Int_02([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_namespace ns = nullptr;
    ASSERT_EQ(env->FindNamespace("entry.src.main.src.ets.VariableOperations.anyns", &ns), ANI_OK);
    ASSERT_NE(ns, nullptr);

    ani_variable variable {};
    ASSERT_EQ(env->Namespace_FindVariable(ns, "intValue", &variable), ANI_OK);
    ASSERT_NE(variable, nullptr);

    const ani_int value = 6U;
    ASSERT_EQ(env->c_api->Variable_SetValue_Int(nullptr, variable, value), ANI_INVALID_ARGS);

    return ANI_TRUE;
}

ani_int test_Variable_SetValue_Int_03([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_namespace ns = nullptr;
    ASSERT_EQ(env->FindNamespace("entry.src.main.src.ets.VariableOperations.anyns", &ns), ANI_OK);
    ASSERT_NE(ns, nullptr);

    ani_variable variable {};
    ASSERT_EQ(env->Namespace_FindVariable(ns, "floatValue", &variable), ANI_OK);
    ASSERT_NE(variable, nullptr);

    const ani_int value = 6U;
    ASSERT_EQ(env->Variable_SetValue_Int(variable, value), ANI_INVALID_TYPE);

    return ANI_TRUE;
}

ani_int test_Variable_SetValue_Int_04([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_int value = 6U;
    ASSERT_EQ(env->Variable_SetValue_Int(nullptr, value), ANI_INVALID_ARGS);

    return ANI_TRUE;
}

ani_int test_Variable_SetValue_Int_05([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_namespace ns = nullptr;
    ASSERT_EQ(env->FindNamespace("entry.src.main.src.ets.VariableOperations.anyns", &ns), ANI_OK);
    ASSERT_NE(ns, nullptr);

    ani_variable variable {};
    ASSERT_EQ(env->Namespace_FindVariable(ns, "intValue", &variable), ANI_OK);
    ASSERT_NE(variable, nullptr);

    ani_long value = std::numeric_limits<int64_t>::max();
    ASSERT_EQ(env->Variable_SetValue_Int(variable, value), ANI_OK);
    ani_int result = 0;
    ASSERT_EQ(env->Variable_GetValue_Int(variable, &result), ANI_OK);

    return ANI_TRUE;
}

ani_int test_Variable_SetValue_Int_07([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_namespace ns = nullptr;
    ASSERT_EQ(env->FindNamespace("entry.src.main.src.ets.VariableOperations.anyns", &ns), ANI_OK);
    ASSERT_NE(ns, nullptr);

    ani_variable variable {};
    ASSERT_EQ(env->Namespace_FindVariable(ns, "intValue", &variable), ANI_OK);
    ASSERT_NE(variable, nullptr);

    const ani_int values[] = {3U, 0, -9};
    ani_int result = 0;
    for (ani_int value : values) {
        ASSERT_EQ(env->Variable_SetValue_Int(variable, value), ANI_OK);
        ASSERT_EQ(env->Variable_GetValue_Int(variable, &result), ANI_OK);
        ASSERT_EQ(result, value);
    }

    return ANI_TRUE;
}

ani_int test_Variable_SetValue_Int_09([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_namespace ns = nullptr;
    ASSERT_EQ(env->FindNamespace("entry.src.main.src.ets.VariableOperations.anyns", &ns), ANI_OK);
    ASSERT_NE(ns, nullptr);

    ani_variable variable1 {};
    ASSERT_EQ(env->Namespace_FindVariable(ns, "intValue", &variable1), ANI_OK);
    ASSERT_NE(variable1, nullptr);

    ani_int getValue1 = 0;
    const ani_int val1 = 3U;
    ASSERT_EQ(env->Variable_SetValue_Int(variable1, val1), ANI_OK);
    ASSERT_EQ(env->Variable_GetValue_Int(variable1, &getValue1), ANI_OK);
    ASSERT_EQ(getValue1, val1);

    ani_variable variable2 {};
    ASSERT_EQ(env->Namespace_FindVariable(ns, "testValueInt", &variable2), ANI_OK);
    ASSERT_NE(variable2, nullptr);

    ani_int getValue2 = 0;
    const ani_int val2 = 6U;
    ASSERT_EQ(env->Variable_SetValue_Int(variable2, val2), ANI_OK);
    ASSERT_EQ(env->Variable_GetValue_Int(variable2, &getValue2), ANI_OK);
    ASSERT_EQ(getValue2, val2);

    return ANI_TRUE;
}

ani_int test_Variable_SetValue_Long([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_namespace ns = nullptr;
    ASSERT_EQ(env->FindNamespace("entry.src.main.src.ets.VariableOperations.anyns", &ns), ANI_OK);
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

ani_int test_Variable_SetValue_Long_02([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_namespace ns = nullptr;
    ASSERT_EQ(env->FindNamespace("entry.src.main.src.ets.VariableOperations.anyns", &ns), ANI_OK);
    ASSERT_NE(ns, nullptr);

    ani_variable variable {};
    ASSERT_EQ(env->Namespace_FindVariable(ns, "longValue", &variable), ANI_OK);
    ASSERT_NE(variable, nullptr);
    const ani_long value = 6L;
    ASSERT_EQ(env->c_api->Variable_SetValue_Long(nullptr, variable, value), ANI_INVALID_ARGS);

    return ANI_TRUE;
}

ani_int test_Variable_SetValue_Long_03([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_namespace ns = nullptr;
    ASSERT_EQ(env->FindNamespace("entry.src.main.src.ets.VariableOperations.anyns", &ns), ANI_OK);
    ASSERT_NE(ns, nullptr);

    ani_variable variable {};
    ASSERT_EQ(env->Namespace_FindVariable(ns, "floatValue", &variable), ANI_OK);
    ASSERT_NE(variable, nullptr);

    const ani_long value = 6L;
    ASSERT_EQ(env->Variable_SetValue_Long(variable, value), ANI_INVALID_TYPE);

    return ANI_TRUE;
}

ani_int test_Variable_SetValue_Long_04([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_long value = 6L;
    ASSERT_EQ(env->Variable_SetValue_Long(nullptr, value), ANI_INVALID_ARGS);

    return ANI_TRUE;
}

ani_int test_Variable_SetValue_Long_05([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_namespace ns = nullptr;
    ASSERT_EQ(env->FindNamespace("entry.src.main.src.ets.VariableOperations.anyns", &ns), ANI_OK);
    ASSERT_NE(ns, nullptr);

    ani_variable variable {};
    ASSERT_EQ(env->Namespace_FindVariable(ns, "longValue", &variable), ANI_OK);
    ASSERT_NE(variable, nullptr);

    ani_double value = std::numeric_limits<double>::max();
    ASSERT_EQ(env->Variable_SetValue_Long(variable, value), ANI_OK);
    ani_long result = 0L;
    ASSERT_EQ(env->Variable_GetValue_Long(variable, &result), ANI_OK);

    return ANI_TRUE;
}

ani_int test_Variable_SetValue_Long_07([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_namespace ns = nullptr;
    ASSERT_EQ(env->FindNamespace("entry.src.main.src.ets.VariableOperations.anyns", &ns), ANI_OK);
    ASSERT_NE(ns, nullptr);

    ani_variable variable {};
    ASSERT_EQ(env->Namespace_FindVariable(ns, "longValue", &variable), ANI_OK);
    ASSERT_NE(variable, nullptr);

    const ani_long values[] = {3L, 0, -9};
    ani_long result = 0L;
    for (ani_long value : values) {
        ASSERT_EQ(env->Variable_SetValue_Long(variable, value), ANI_OK);
        ASSERT_EQ(env->Variable_GetValue_Long(variable, &result), ANI_OK);
        ASSERT_EQ(result, value);
    }

    return ANI_TRUE;
}

ani_int test_Variable_SetValue_Long_09([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_namespace ns = nullptr;
    ASSERT_EQ(env->FindNamespace("entry.src.main.src.ets.VariableOperations.anyns", &ns), ANI_OK);
    ASSERT_NE(ns, nullptr);

    ani_variable variable1 {};
    ASSERT_EQ(env->Namespace_FindVariable(ns, "longValue", &variable1), ANI_OK);
    ASSERT_NE(variable1, nullptr);

    ani_long getValue1 = 0L;
    const ani_long val1 = 3L;
    ASSERT_EQ(env->Variable_SetValue_Long(variable1, val1), ANI_OK);
    ASSERT_EQ(env->Variable_GetValue_Long(variable1, &getValue1), ANI_OK);
    ASSERT_EQ(getValue1, val1);

    ani_variable variable2 {};
    ASSERT_EQ(env->Namespace_FindVariable(ns, "testValueLong", &variable2), ANI_OK);
    ASSERT_NE(variable2, nullptr);

    ani_long getValue2 = 0L;
    const ani_long val2 = 6L;
    ASSERT_EQ(env->Variable_SetValue_Long(variable2, val2), ANI_OK);
    ASSERT_EQ(env->Variable_GetValue_Long(variable2, &getValue2), ANI_OK);
    ASSERT_EQ(getValue2, val2);

    return ANI_TRUE;
}

ani_int test_Variable_SetValue_Ref([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_size EXPECTED_LENGTH = 7U;
    ani_namespace ns = nullptr;
    ASSERT_EQ(env->FindNamespace("entry.src.main.src.ets.VariableOperations.anyns", &ns), ANI_OK);
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

ani_int test_Variable_SetValue_Ref_02([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_namespace ns = nullptr;
    ASSERT_EQ(env->FindNamespace("entry.src.main.src.ets.VariableOperations.anyns", &ns), ANI_OK);
    ASSERT_NE(ns, nullptr);

    ani_variable variable {};
    ASSERT_EQ(env->Namespace_FindVariable(ns, "stringValue", &variable), ANI_OK);
    ASSERT_NE(variable, nullptr);

    ani_string string = {};
    auto status = env->String_NewUTF8("abcdefg", 7U, &string);
    ASSERT_EQ(status, ANI_OK);
    ASSERT_EQ(env->c_api->Variable_SetValue_Ref(nullptr, variable, string), ANI_INVALID_ARGS);

    return ANI_TRUE;
}

ani_int test_Variable_SetValue_Ref_03([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_namespace ns = nullptr;
    ASSERT_EQ(env->FindNamespace("entry.src.main.src.ets.VariableOperations.anyns", &ns), ANI_OK);
    ASSERT_NE(ns, nullptr);

    ani_variable variable {};
    ASSERT_EQ(env->Namespace_FindVariable(ns, "shortValue", &variable), ANI_OK);
    ASSERT_NE(variable, nullptr);

    ani_string value = {};
    auto status = env->String_NewUTF8("abcdefg", 7U, &value);
    ASSERT_EQ(status, ANI_OK);
    ASSERT_EQ(env->Variable_SetValue_Ref(variable, value), ANI_INVALID_TYPE);

    return ANI_TRUE;
}

ani_int test_Variable_SetValue_Ref_04([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_string value = {};
    auto status = env->String_NewUTF8("abcdefg", 7U, &value);
    ASSERT_EQ(status, ANI_OK);
    ASSERT_EQ(env->Variable_SetValue_Ref(nullptr, value), ANI_INVALID_ARGS);

    return ANI_TRUE;
}

ani_int test_Variable_SetValue_Ref_05([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_namespace ns = nullptr;
    ASSERT_EQ(env->FindNamespace("entry.src.main.src.ets.VariableOperations.anyns", &ns), ANI_OK);
    ASSERT_NE(ns, nullptr);

    ani_variable variable {};
    ASSERT_EQ(env->Namespace_FindVariable(ns, "stringValue", &variable), ANI_OK);
    ASSERT_NE(variable, nullptr);

    ASSERT_EQ(env->Variable_SetValue_Ref(variable, nullptr), ANI_INVALID_ARGS);

    return ANI_TRUE;
}

ani_int test_Variable_SetValue_Ref_07([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_namespace ns = nullptr;
    ASSERT_EQ(env->FindNamespace("entry.src.main.src.ets.VariableOperations.anyns", &ns), ANI_OK);
    ASSERT_NE(ns, nullptr);

    ani_variable variable {};
    ASSERT_EQ(env->Namespace_FindVariable(ns, "stringValue", &variable), ANI_OK);
    ASSERT_NE(variable, nullptr);

    ani_string string = {};
    ASSERT_EQ(env->String_NewUTF8("abcdefg", 7U, &string), ANI_OK);
    ASSERT_EQ(env->Variable_SetValue_Ref(variable, string), ANI_OK);

    ASSERT_EQ(env->String_NewUTF8("xxxx", 4U, &string), ANI_OK);
    ASSERT_EQ(env->Variable_SetValue_Ref(variable, string), ANI_OK);

    ASSERT_EQ(env->String_NewUTF8("hello world", 11U, &string), ANI_OK);
    ASSERT_EQ(env->Variable_SetValue_Ref(variable, string), ANI_OK);

    ani_ref result = nullptr;
    ASSERT_EQ(env->Variable_GetValue_Ref(variable, &result), ANI_OK);
    auto str = static_cast<ani_string>(result);
    std::array<char, 20U> buffer {};
    ani_size strSize = 0U;
    ASSERT_EQ(env->String_GetUTF8SubString(str, 0U, 11U, buffer.data(), buffer.size(), &strSize), ANI_OK);
    ASSERT_EQ(strSize, 11U);
    ASSERT_STREQ(buffer.data(), "hello world");

    ASSERT_EQ(env->Variable_GetValue_Ref(variable, &result), ANI_OK);
    str = static_cast<ani_string>(result);
    ASSERT_EQ(env->String_GetUTF8SubString(str, 0U, 11U, buffer.data(), buffer.size(), &strSize), ANI_OK);
    ASSERT_EQ(strSize, 11U);
    ASSERT_STREQ(buffer.data(), "hello world");

    return ANI_TRUE;
}

ani_int test_Variable_SetValue_Ref_09([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_namespace ns = nullptr;
    ASSERT_EQ(env->FindNamespace("entry.src.main.src.ets.VariableOperations.anyns", &ns), ANI_OK);
    ASSERT_NE(ns, nullptr);

    ani_variable variable1 {};
    ASSERT_EQ(env->Namespace_FindVariable(ns, "stringValue", &variable1), ANI_OK);
    ASSERT_NE(variable1, nullptr);

    ani_string string = {};
    ASSERT_EQ(env->String_NewUTF8("XYZ", 3U, &string), ANI_OK);
    ASSERT_EQ(env->Variable_SetValue_Ref(variable1, string), ANI_OK);
    ani_ref getValue1 = nullptr;
    ASSERT_EQ(env->Variable_GetValue_Ref(variable1, &getValue1), ANI_OK);
    auto str = static_cast<ani_string>(getValue1);
    std::array<char, 10U> buffer {};
    ani_size strSize = 0U;
    ASSERT_EQ(env->String_GetUTF8SubString(str, 0U, 3U, buffer.data(), buffer.size(), &strSize), ANI_OK);
    ASSERT_EQ(strSize, 3U);
    ASSERT_STREQ(buffer.data(), "XYZ");

    ani_variable variable2 {};
    ASSERT_EQ(env->Namespace_FindVariable(ns, "testValueRef", &variable2), ANI_OK);
    ASSERT_NE(variable2, nullptr);

    ASSERT_EQ(env->String_NewUTF8("UVW", 3U, &string), ANI_OK);
    ASSERT_EQ(env->Variable_SetValue_Ref(variable2, string), ANI_OK);
    ani_ref getValue2 = nullptr;
    ASSERT_EQ(env->Variable_GetValue_Ref(variable2, &getValue2), ANI_OK);
    str = static_cast<ani_string>(getValue2);
    ASSERT_EQ(env->String_GetUTF8SubString(str, 0U, 3U, buffer.data(), buffer.size(), &strSize), ANI_OK);
    ASSERT_EQ(strSize, 3U);
    ASSERT_STREQ(buffer.data(), "UVW");

    return ANI_TRUE;
}

ani_int test_Variable_SetValue_Short([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_namespace ns = nullptr;
    ASSERT_EQ(env->FindNamespace("entry.src.main.src.ets.VariableOperations.anyns", &ns), ANI_OK);
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

ani_int test_Variable_SetValue_Short_02([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_namespace ns = nullptr;
    ASSERT_EQ(env->FindNamespace("entry.src.main.src.ets.VariableOperations.anyns", &ns), ANI_OK);
    ASSERT_NE(ns, nullptr);

    ani_variable variable {};
    ASSERT_EQ(env->Namespace_FindVariable(ns, "shortValue", &variable), ANI_OK);
    ASSERT_NE(variable, nullptr);

    const ani_short value = 6U;
    ASSERT_EQ(env->c_api->Variable_SetValue_Short(nullptr, variable, value), ANI_INVALID_ARGS);

    return ANI_TRUE;
}

ani_int test_Variable_SetValue_Short_03([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_namespace ns = nullptr;
    ASSERT_EQ(env->FindNamespace("entry.src.main.src.ets.VariableOperations.anyns", &ns), ANI_OK);
    ASSERT_NE(ns, nullptr);

    ani_variable variable {};
    ASSERT_EQ(env->Namespace_FindVariable(ns, "floatValue", &variable), ANI_OK);
    ASSERT_NE(variable, nullptr);

    const ani_short value = 6U;
    ASSERT_EQ(env->Variable_SetValue_Short(variable, value), ANI_INVALID_TYPE);

    return ANI_TRUE;
}

ani_int test_Variable_SetValue_Short_04([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_short value = 6U;
    ASSERT_EQ(env->Variable_SetValue_Short(nullptr, value), ANI_INVALID_ARGS);

    return ANI_TRUE;
}

ani_int test_Variable_SetValue_Short_05([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_namespace ns = nullptr;
    ASSERT_EQ(env->FindNamespace("entry.src.main.src.ets.VariableOperations.anyns", &ns), ANI_OK);
    ASSERT_NE(ns, nullptr);

    ani_variable variable {};
    ASSERT_EQ(env->Namespace_FindVariable(ns, "shortValue", &variable), ANI_OK);
    ASSERT_NE(variable, nullptr);

    ani_long maxValue = std::numeric_limits<int64_t>::max();
    ASSERT_EQ(env->Variable_SetValue_Short(variable, maxValue), ANI_OK);
    ani_short result = 0U;
    ASSERT_EQ(env->Variable_GetValue_Short(variable, &result), ANI_OK);

    return ANI_TRUE;
}

ani_int test_Variable_SetValue_Short_07([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_namespace ns = nullptr;
    ASSERT_EQ(env->FindNamespace("entry.src.main.src.ets.VariableOperations.anyns", &ns), ANI_OK);
    ASSERT_NE(ns, nullptr);

    ani_variable variable {};
    ASSERT_EQ(env->Namespace_FindVariable(ns, "shortValue", &variable), ANI_OK);
    ASSERT_NE(variable, nullptr);

    const ani_short values[] = {3U, 0, -9};
    ani_short result = 0U;
    for (ani_short value : values) {
        ASSERT_EQ(env->Variable_SetValue_Short(variable, value), ANI_OK);
        ASSERT_EQ(env->Variable_GetValue_Short(variable, &result), ANI_OK);
        ASSERT_EQ(result, value);
    }

    return ANI_TRUE;
}

ani_int test_Variable_SetValue_Short_09([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_namespace ns = nullptr;
    ASSERT_EQ(env->FindNamespace("entry.src.main.src.ets.VariableOperations.anyns", &ns), ANI_OK);
    ASSERT_NE(ns, nullptr);

    ani_variable variable1 {};
    ASSERT_EQ(env->Namespace_FindVariable(ns, "shortValue", &variable1), ANI_OK);
    ASSERT_NE(variable1, nullptr);

    ani_short getValue1 = 0U;
    const ani_short val1 = 3U;
    ASSERT_EQ(env->Variable_SetValue_Short(variable1, val1), ANI_OK);
    ASSERT_EQ(env->Variable_GetValue_Short(variable1, &getValue1), ANI_OK);
    ASSERT_EQ(getValue1, val1);

    ani_variable variable2 {};
    ASSERT_EQ(env->Namespace_FindVariable(ns, "testValueShort", &variable2), ANI_OK);
    ASSERT_NE(variable2, nullptr);

    ani_short getValue2 = 0U;
    const ani_short val2 = 6U;
    ASSERT_EQ(env->Variable_SetValue_Short(variable2, val2), ANI_OK);
    ASSERT_EQ(env->Variable_GetValue_Short(variable2, &getValue2), ANI_OK);
    ASSERT_EQ(getValue2, val2);

    return ANI_TRUE;
}
#endif // ARKTS_ANI_TEST_VARIABLEOPERATIONS_H
