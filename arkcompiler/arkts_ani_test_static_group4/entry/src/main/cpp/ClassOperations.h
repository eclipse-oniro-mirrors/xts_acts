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

#ifndef ARKTS_ANI_TEST_CLASSOPERATIONS_H
#define ARKTS_ANI_TEST_CLASSOPERATIONS_H
#include "Common.h"

const ani_int VAL1 = 5U;
const ani_int VAL2 = 6U;
const ani_double VAL3 = 1.5;
const ani_double VAL4 = 2.5;
const size_t ARG_COUNT = 2U;
const ani_long VALL1 = 123;
const ani_long VALL2 = 456;
const ani_int VALL3 = 6U;
const ani_double VALR3 = 4.5;
const ani_double VALR4 = 7.5;
const ani_double VALD1 = 1.5;
const ani_double VALD2 = 2.5;
const ani_int VALD3 = 6U;
const ani_float FLOAT_VAL1 = 1.5F;
const ani_float FLOAT_VAL2 = 2.5F;
const ani_int VALF1 = 6U;

ani_int GetMethodDataBool([[maybe_unused]] ani_env *env, ani_class *clsResult, ani_static_method *methodResult)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodBool.Operations", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_static_method method;
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "or", "zz:z", &method), ANI_OK);
    ASSERT_NE(method, nullptr);

    *clsResult = cls;
    *methodResult = method;
    return ANI_TRUE;
}

ani_int GetMethodDataInt([[maybe_unused]] ani_env *env, ani_class *clsResult, ani_static_method *methodResult)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodInt.Operations", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_static_method method;
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "sum", "ii:i", &method), ANI_OK);
    ASSERT_NE(method, nullptr);

    *clsResult = cls;
    *methodResult = method;
    return ANI_TRUE;
}

ani_int GetMethodDataShort([[maybe_unused]] ani_env *env, ani_class *clsResult, ani_static_method *methodResult)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodShort.Operations", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_static_method method;
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "sum", "ss:s", &method), ANI_OK);
    ASSERT_NE(method, nullptr);

    *clsResult = cls;
    *methodResult = method;
    return ANI_TRUE;
}

ani_int GetMethodDataByte([[maybe_unused]] ani_env *env, ani_class *clsResult, ani_static_method *methodResult)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodByte.Operations", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_static_method method;
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "sum", "bb:b", &method), ANI_OK);
    ASSERT_NE(method, nullptr);

    *clsResult = cls;
    *methodResult = method;
    return ANI_TRUE;
}

ani_int GetMethodDataLong([[maybe_unused]] ani_env *env, ani_class *clsResult, ani_static_method *methodResult)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodLong.Operations", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_static_method method;
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "sum", "ll:l", &method), ANI_OK);
    ASSERT_NE(method, nullptr);

    *clsResult = cls;
    *methodResult = method;
    return ANI_TRUE;
}

ani_int GetMethodDataDouble([[maybe_unused]] ani_env *env, ani_class *clsResult, ani_static_method *methodResult)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodDouble.Operations", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_static_method method;
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "sum", "dd:d", &method), ANI_OK);
    ASSERT_NE(method, nullptr);

    *clsResult = cls;
    *methodResult = method;
    return ANI_TRUE;
}

ani_int GetMethodDataFloat([[maybe_unused]] ani_env *env, ani_class *clsResult, ani_static_method *methodResult)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodFloat.Operations", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_static_method method;
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "sum", "ff:f", &method), ANI_OK);
    ASSERT_NE(method, nullptr);

    *clsResult = cls;
    *methodResult = method;
    return ANI_TRUE;
}

ani_int GetMethodDataChar([[maybe_unused]] ani_env *env, ani_class *clsResult, ani_static_method *methodResult)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodChar.Operations", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_static_method method;
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "sub", "cc:c", &method), ANI_OK);
    ASSERT_NE(method, nullptr);

    *clsResult = cls;
    *methodResult = method;
    return ANI_TRUE;
}

ani_int GetMethodDataVoid([[maybe_unused]] ani_env *env, ani_class *clsResult, ani_static_method *voidMethodResult,
    ani_static_method *getMethodResult)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodVoid.Operations", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_static_method getMethod;
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "getCount", nullptr, &getMethod), ANI_OK);
    ASSERT_NE(getMethod, nullptr);

    ani_static_method voidMethod;
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "voidMethod", nullptr, &voidMethod), ANI_OK);
    ASSERT_NE(voidMethod, nullptr);

    *clsResult = cls;
    *voidMethodResult = voidMethod;
    *getMethodResult = getMethod;
    return ANI_TRUE;
}

ani_int GetCount([[maybe_unused]] ani_env *env, ani_class cls, ani_static_method getMethod, ani_int *value)
{
    ASSERT_EQ(env->Class_CallStaticMethod_Int(cls, getMethod, value), ANI_OK);
    return ANI_TRUE;
}

ani_int TestCombineScene([[maybe_unused]] ani_env *env, const char *className, ani_boolean expectedValue)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass(className, &cls), ANI_OK);
    ani_static_method method {};
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "funcA", "zz:z", &method), ANI_OK);

    ani_boolean value = expectedValue == ANI_TRUE ? ANI_FALSE : ANI_TRUE;
    ASSERT_EQ(env->Class_CallStaticMethod_Boolean(cls, method, &value, ANI_TRUE, ANI_FALSE), ANI_OK);
    ASSERT_EQ(value, expectedValue);

    ani_value args[2U];
    args[0U].z = ANI_TRUE;
    args[1U].z = ANI_FALSE;
    ani_boolean valueA = expectedValue == ANI_TRUE ? ANI_FALSE : ANI_TRUE;
    ASSERT_EQ(env->Class_CallStaticMethod_Boolean_A(cls, method, &valueA, args), ANI_OK);
    ASSERT_EQ(valueA, expectedValue);
    return ANI_TRUE;
}

ani_int TestCombineSceneInt([[maybe_unused]] ani_env *env, const char *className, ani_int val1, ani_int val2,
    ani_int expectedValue)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass(className, &cls), ANI_OK);
    ani_static_method method {};
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "funcA", "ii:i", &method), ANI_OK);

    ani_int value = 0;
    ASSERT_EQ(env->Class_CallStaticMethod_Int(cls, method, &value, val1, val2), ANI_OK);
    ASSERT_EQ(value, expectedValue);

    ani_value args[2U];
    args[0U].i = val1;
    args[1U].i = val2;
    ani_int valueA = 0;
    ASSERT_EQ(env->Class_CallStaticMethod_Int_A(cls, method, &valueA, args), ANI_OK);
    ASSERT_EQ(valueA, expectedValue);
    return ANI_TRUE;
}

ani_int TestCombineSceneShort([[maybe_unused]] ani_env *env, const char *className, ani_short val1, ani_short val2,
    ani_short expectedValue)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass(className, &cls), ANI_OK);
    ani_static_method method {};
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "funcA", "ss:s", &method), ANI_OK);

    ani_short value = 0;
    ASSERT_EQ(env->Class_CallStaticMethod_Short(cls, method, &value, val1, val2), ANI_OK);
    ASSERT_EQ(value, expectedValue);

    ani_value args[2U];
    args[0U].s = val1;
    args[1U].s = val2;
    ani_short valueA = 0;
    ASSERT_EQ(env->Class_CallStaticMethod_Short_A(cls, method, &valueA, args), ANI_OK);
    ASSERT_EQ(valueA, expectedValue);
    return ANI_TRUE;
}

ani_int TestCombineSceneByte([[maybe_unused]] ani_env *env, const char *className, ani_byte val1, ani_byte val2,
    ani_byte expectedValue)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass(className, &cls), ANI_OK);
    ani_static_method method {};
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "funcA", "bb:b", &method), ANI_OK);

    ani_byte value = 0;
    ASSERT_EQ(env->Class_CallStaticMethod_Byte(cls, method, &value, val1, val2), ANI_OK);
    ASSERT_EQ(value, expectedValue);

    ani_value args[2U];
    args[0U].b = val1;
    args[1U].b = val2;
    ani_byte valueA = 0;
    ASSERT_EQ(env->Class_CallStaticMethod_Byte_A(cls, method, &valueA, args), ANI_OK);
    ASSERT_EQ(valueA, expectedValue);
    return ANI_TRUE;
}

ani_int TestCombineSceneLong([[maybe_unused]] ani_env *env, const char *className, ani_long val1, ani_long val2,
    ani_long expectedValue)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass(className, &cls), ANI_OK);
    ani_static_method method {};
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "funcA", "ll:l", &method), ANI_OK);

    ani_long value = 0L;
    ASSERT_EQ(env->Class_CallStaticMethod_Long(cls, method, &value, val1, val2), ANI_OK);
    ASSERT_EQ(value, expectedValue);

    ani_value args[2U];
    args[0U].l = val1;
    args[1U].l = val2;
    ani_long valueA = 0L;
    ASSERT_EQ(env->Class_CallStaticMethod_Long_A(cls, method, &valueA, args), ANI_OK);
    ASSERT_EQ(valueA, expectedValue);
    return ANI_TRUE;
}

ani_int GetMethodDataButton([[maybe_unused]] ani_env *env, ani_class *clsResult, ani_static_method *methodResult)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodRef.Phone", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_static_method method;
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "get_button_names", nullptr, &method), ANI_OK);
    ASSERT_NE(method, nullptr);

    *clsResult = cls;
    *methodResult = method;
    return ANI_TRUE;
}

ani_int GetMethodDataString([[maybe_unused]] ani_env *env, ani_class *clsResult, ani_static_method *methodResult)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodRef.Phone", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_static_method method;
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "get_num_string", "ii:C{std.core.String}", &method), ANI_OK);
    ASSERT_NE(method, nullptr);

    *clsResult = cls;
    *methodResult = method;
    return ANI_TRUE;
}

ani_int CheckRefUp([[maybe_unused]] ani_env *env, ani_ref ref)
{
    auto string = reinterpret_cast<ani_string>(ref);
    ani_size result = 0U;
    ASSERT_EQ(env->String_GetUTF8Size(string, &result), ANI_OK);
    ASSERT_EQ(result, 2U);

    ani_size substrOffset = 0U;
    ani_size substrSize = result;
    const uint32_t bufferSize = 5U;
    char utfBuffer[bufferSize] = {};
    result = 0U;
    auto status =
        env->String_GetUTF8SubString(string, substrOffset, substrSize, utfBuffer, sizeof(utfBuffer), &result);
    ASSERT_EQ(status, ANI_OK);
    ASSERT_STREQ(utfBuffer, "UP");
    return ANI_TRUE;
}

ani_int CheckRefNum([[maybe_unused]] ani_env *env, ani_ref ref)
{
    auto string = reinterpret_cast<ani_string>(ref);
    ani_size result = 0U;
    ASSERT_EQ(env->String_GetUTF8Size(string, &result), ANI_OK);
    ani_size substrOffset = 0U;
    ani_size substrSize = result;
    const uint32_t bufferSize = 10U;
    char utfBuffer[bufferSize] = {};
    result = 0U;
    auto status =
        env->String_GetUTF8SubString(string, substrOffset, substrSize, utfBuffer, sizeof(utfBuffer), &result);
    ASSERT_EQ(status, ANI_OK);
    ASSERT_STREQ(utfBuffer, "INT5");
    return ANI_TRUE;
}

ani_int TestCombineSceneRef([[maybe_unused]] ani_env *env, const char *className, ani_int val1, ani_int val2)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass(className, &cls), ANI_OK);
    ani_static_method method {};
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "funcA", "ii:C{std.core.String}", &method), ANI_OK);

    ani_ref value = nullptr;
    ASSERT_EQ(env->Class_CallStaticMethod_Ref(cls, method, &value, val1, val2), ANI_OK);
    CheckRefNum(env, value);

    ani_value args[2U];
    args[0U].i = val1;
    args[1U].i = val2;
    ani_ref valueA = nullptr;
    ASSERT_EQ(env->Class_CallStaticMethod_Ref_A(cls, method, &valueA, args), ANI_OK);
    CheckRefNum(env, valueA);
    return ANI_TRUE;
}

ani_int TestCombineSceneDouble([[maybe_unused]] ani_env *env, const char *className, ani_double val1, ani_double val2,
    ani_double expectedValue)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass(className, &cls), ANI_OK);
    ani_static_method method {};
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "funcA", "dd:d", &method), ANI_OK);

    ani_double value = 0.0;
    ASSERT_EQ(env->Class_CallStaticMethod_Double(cls, method, &value, val1, val2), ANI_OK);
    ASSERT_EQ(value, expectedValue);

    ani_value args[2U];
    args[0U].d = val1;
    args[1U].d = val2;
    ani_double valueA = 0.0;
    ASSERT_EQ(env->Class_CallStaticMethod_Double_A(cls, method, &valueA, args), ANI_OK);
    ASSERT_EQ(valueA, expectedValue);
    return ANI_TRUE;
}

ani_int TestCombineSceneFloat([[maybe_unused]] ani_env *env, const char *className, ani_float val1, ani_float val2,
    ani_float expectedValue)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass(className, &cls), ANI_OK);
    ani_static_method method {};
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "funcA", "ff:f", &method), ANI_OK);

    ani_float value = 0.0;
    ASSERT_EQ(env->Class_CallStaticMethod_Float(cls, method, &value, val1, val2), ANI_OK);
    ASSERT_EQ(value, expectedValue);

    ani_value args[2U];
    args[0U].f = val1;
    args[1U].f = val2;
    ani_float valueA = 0.0;
    ASSERT_EQ(env->Class_CallStaticMethod_Float_A(cls, method, &valueA, args), ANI_OK);
    ASSERT_EQ(valueA, expectedValue);
    return ANI_TRUE;
}

ani_int TestCombineSceneChar([[maybe_unused]] ani_env *env, const char *className, ani_char val1, ani_char val2,
    ani_char expectedValue)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass(className, &cls), ANI_OK);
    ani_static_method method {};
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "funcA", "cc:c", &method), ANI_OK);

    ani_char value = '\0';
    ASSERT_EQ(env->Class_CallStaticMethod_Char(cls, method, &value, val1, val2), ANI_OK);
    ASSERT_EQ(value, expectedValue);

    ani_value args[2U];
    args[0U].c = val1;
    args[1U].c = val2;
    ani_char valueA = '\0';
    ASSERT_EQ(env->Class_CallStaticMethod_Char_A(cls, method, &valueA, args), ANI_OK);
    ASSERT_EQ(valueA, expectedValue);
    return ANI_TRUE;
}

typedef struct ParaValInt {
    ani_int val1;
    ani_int val2;
} ParaValInt;

ani_int TestCombineSceneVoid([[maybe_unused]] ani_env *env, const char *className, ParaValInt *val,
    ani_int expectedValue, bool doubleForArray = true)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass(className, &cls), ANI_OK);
    ani_static_method method {};
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "funcA", "ii:", &method), ANI_OK);
    ani_static_method getMethod {};
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "getCount", nullptr, &getMethod), ANI_OK);

    ani_int value = 0;
    ASSERT_EQ(env->Class_CallStaticMethod_Void(cls, method, val->val1, val->val2), ANI_OK);
    GetCount(env, cls, getMethod, &value);
    ASSERT_EQ(value, expectedValue);

    ani_value args[2U];
    args[0U].i = val->val1;
    args[1U].i = val->val2;
    ani_int valueA = 0;
    ASSERT_EQ(env->Class_CallStaticMethod_Void_A(cls, method, args), ANI_OK);
    GetCount(env, cls, getMethod, &valueA);
    ASSERT_EQ(valueA, doubleForArray ? value + val->val1 + val->val2 : expectedValue);
    return ANI_TRUE;
}

ani_boolean test_FindClass([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls = {};
    auto status = env->FindClass("entry.src.main.src.ets.ClassOperations.Person", &cls);
    ASSERT_EQ(status, ANI_OK);
    ASSERT_NE(cls, nullptr);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodBoolean([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls = {};
    auto status = env->FindClass("entry.src.main.src.ets.ClassOperations.Person", &cls);
    ASSERT_EQ(status, ANI_OK);
    ASSERT_NE(cls, nullptr);
    ani_static_method method = nullptr;
    status = env->Class_FindStaticMethod(cls, "or", "zz:z", &method);
    ASSERT_EQ(status, ANI_OK);
    ASSERT_NE(method, nullptr);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodBoolean_01([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method;
    GetMethodDataBool(env, &cls, &method);

    ani_boolean result = ANI_FALSE;
    ASSERT_EQ(env->c_api->Class_CallStaticMethod_Boolean(env, cls, method, &result, ANI_TRUE, ANI_FALSE), ANI_OK);
    ASSERT_EQ(result, ANI_TRUE);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodBoolean_02([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method;
    GetMethodDataBool(env, &cls, &method);

    ani_boolean result = ANI_FALSE;
    ASSERT_EQ(env->Class_CallStaticMethod_Boolean(cls, method, &result, ANI_TRUE, ANI_FALSE), ANI_OK);
    ASSERT_EQ(result, ANI_TRUE);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodBoolean_03([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method;
    GetMethodDataBool(env, &cls, &method);

    ani_value args[ARG_COUNT];
    args[0U].z = ANI_TRUE;
    args[1U].z = ANI_FALSE;

    ani_boolean result = ANI_FALSE;
    ASSERT_EQ(env->Class_CallStaticMethod_Boolean_A(cls, method, &result, args), ANI_OK);
    ASSERT_EQ(result, ANI_TRUE);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodBoolean_04([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method;
    GetMethodDataBool(env, &cls, &method);

    ani_boolean result = ANI_FALSE;
    ASSERT_EQ(env->Class_CallStaticMethod_Boolean(nullptr, method, &result, ANI_TRUE, ANI_FALSE), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodBoolean_05([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method;
    GetMethodDataBool(env, &cls, &method);

    ani_boolean result = ANI_FALSE;
    ASSERT_EQ(env->Class_CallStaticMethod_Boolean(cls, nullptr, &result, ANI_TRUE, ANI_FALSE), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodBoolean_06([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method;
    GetMethodDataBool(env, &cls, &method);

    ASSERT_EQ(env->Class_CallStaticMethod_Boolean(cls, method, nullptr, ANI_TRUE, ANI_FALSE), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodBoolean_07([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method;
    GetMethodDataBool(env, &cls, &method);

    ani_value args[ARG_COUNT];
    args[0U].z = ANI_TRUE;
    args[1U].z = ANI_FALSE;

    ani_boolean result = ANI_FALSE;
    ASSERT_EQ(env->Class_CallStaticMethod_Boolean_A(nullptr, method, &result, args), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodBoolean_08([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method;
    GetMethodDataBool(env, &cls, &method);

    ani_value args[ARG_COUNT];
    args[0U].z = ANI_TRUE;
    args[1U].z = ANI_FALSE;

    ani_boolean result = ANI_FALSE;
    ASSERT_EQ(env->Class_CallStaticMethod_Boolean_A(cls, nullptr, &result, args), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodBoolean_09([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method;
    GetMethodDataBool(env, &cls, &method);

    ani_value args[ARG_COUNT];
    args[0U].z = ANI_TRUE;
    args[1U].z = ANI_FALSE;

    ASSERT_EQ(env->Class_CallStaticMethod_Boolean_A(cls, method, nullptr, args), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodBoolean_10([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method;
    GetMethodDataBool(env, &cls, &method);

    ani_boolean result = ANI_FALSE;
    ASSERT_EQ(env->Class_CallStaticMethod_Boolean_A(cls, method, &result, nullptr), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodBoolean_11([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method;
    GetMethodDataBool(env, &cls, &method);

    ani_boolean result = ANI_FALSE;
    ASSERT_EQ(env->Class_CallStaticMethod_Boolean(cls, method, &result, 10U, 20U), ANI_OK);
    ASSERT_NE(result, ANI_FALSE);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodBoolean_12([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class clsA {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodBool.A", &clsA), ANI_OK);
    ani_static_method methodA;
    ASSERT_EQ(env->Class_FindStaticMethod(clsA, "funcA", "zz:z", &methodA), ANI_OK);

    ani_class clsB {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodBool.B", &clsB), ANI_OK);
    ani_static_method methodB;
    ASSERT_EQ(env->Class_FindStaticMethod(clsB, "funcB", "zz:z", &methodB), ANI_OK);

    ani_boolean valueA = ANI_FALSE;
    ASSERT_EQ(env->Class_CallStaticMethod_Boolean(clsA, methodA, &valueA, ANI_TRUE, ANI_FALSE), ANI_OK);
    ASSERT_EQ(valueA, ANI_TRUE);

    ani_boolean valueB = ANI_TRUE;
    ASSERT_EQ(env->Class_CallStaticMethod_Boolean(clsB, methodB, &valueB, ANI_TRUE, ANI_FALSE), ANI_OK);
    ASSERT_EQ(valueB, ANI_FALSE);

    ani_value args[ARG_COUNT];
    args[0U].z = ANI_TRUE;
    args[1U].z = ANI_FALSE;
    ani_boolean valueAA = ANI_FALSE;
    ASSERT_EQ(env->Class_CallStaticMethod_Boolean_A(clsA, methodA, &valueAA, args), ANI_OK);
    ASSERT_EQ(valueAA, ANI_TRUE);

    ani_boolean valueBA = ANI_TRUE;
    ASSERT_EQ(env->Class_CallStaticMethod_Boolean_A(clsB, methodB, &valueBA, args), ANI_OK);
    ASSERT_EQ(valueBA, ANI_FALSE);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodBoolean_13([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodBool.A", &cls), ANI_OK);
    ani_static_method methodA;
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "funcA", "zz:z", &methodA), ANI_OK);
    ani_static_method methodB;
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "funcA", "ii:i", &methodB), ANI_OK);

    ani_boolean value = ANI_FALSE;
    ASSERT_EQ(env->Class_CallStaticMethod_Boolean(cls, methodA, &value, ANI_TRUE, ANI_FALSE), ANI_OK);
    ASSERT_EQ(value, ANI_TRUE);

    ani_value args[ARG_COUNT];
    args[0U].z = ANI_TRUE;
    args[1U].z = ANI_FALSE;
    ani_boolean valueA = ANI_FALSE;
    ASSERT_EQ(env->Class_CallStaticMethod_Boolean_A(cls, methodA, &valueA, args), ANI_OK);
    ASSERT_EQ(valueA, ANI_TRUE);

    ani_int value2 = 0;
    ASSERT_EQ(env->Class_CallStaticMethod_Int(cls, methodB, &value2, 5U, 6U), ANI_OK);
    ASSERT_EQ(value2, 5U + 6U);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodBoolean_14([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodBool.A", &cls), ANI_OK);
    ani_static_method method;
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "funcB", "zz:z", &method), ANI_OK);

    ani_boolean value = ANI_FALSE;
    ASSERT_EQ(env->Class_CallStaticMethod_Boolean(cls, method, &value, ANI_TRUE, ANI_FALSE), ANI_OK);
    ASSERT_EQ(value, ANI_TRUE);

    ani_value args[ARG_COUNT];
    args[0U].z = ANI_TRUE;
    args[1U].z = ANI_FALSE;
    ani_boolean valueA = ANI_FALSE;
    ASSERT_EQ(env->Class_CallStaticMethod_Boolean_A(cls, method, &valueA, args), ANI_OK);
    ASSERT_EQ(valueA, ANI_TRUE);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodBoolean_15([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method {};
    GetMethodDataBool(env, &cls, &method);

    ani_boolean value = ANI_FALSE;
    ASSERT_EQ(env->c_api->Class_CallStaticMethod_Boolean(nullptr, cls, method, &value, ANI_TRUE, ANI_FALSE),
              ANI_INVALID_ARGS);
    ani_value args[2U];
    args[0U].z = ANI_TRUE;
    args[1U].z = ANI_FALSE;
    ASSERT_EQ(env->c_api->Class_CallStaticMethod_Boolean_A(nullptr, cls, method, &value, args), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodBoolean_16([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    TestCombineScene(env, "entry.src.main.src.ets.ClassOperationsMethodBool.C", ANI_TRUE);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodBoolean_17([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    TestCombineScene(env, "entry.src.main.src.ets.ClassOperationsMethodBool.D", ANI_FALSE);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodBoolean_18([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    TestCombineScene(env, "entry.src.main.src.ets.ClassOperationsMethodBool.E", ANI_TRUE);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodBoolean_19([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodBool.F", &cls), ANI_OK);
    ani_static_method method1 {};
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "increment", nullptr, &method1), ANI_OK);
    ani_static_method method2 {};
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "getCount", nullptr, &method2), ANI_OK);
    ASSERT_EQ(env->Class_CallStaticMethod_Void(cls, method1, ANI_TRUE, ANI_FALSE), ANI_OK);
    ani_boolean value = ANI_TRUE;
    ASSERT_EQ(env->Class_CallStaticMethod_Boolean(cls, method2, &value), ANI_OK);
    ASSERT_EQ(value, ANI_FALSE);

    ani_value args[2U];
    args[0U].z = ANI_TRUE;
    args[1U].z = ANI_FALSE;
    ani_boolean valueA = ANI_TRUE;
    ASSERT_EQ(env->Class_CallStaticMethod_Boolean_A(cls, method2, &valueA, args), ANI_OK);
    ASSERT_EQ(valueA, ANI_FALSE);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodBoolean_20([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodBool.G", &cls), ANI_OK);
    ani_static_method method1 {};
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "publicMethod", "zz:z", &method1), ANI_OK);
    ani_static_method method2 {};
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "callPrivateMethod", "zz:z", &method2), ANI_OK);
    ani_boolean value = ANI_FALSE;
    ASSERT_EQ(env->Class_CallStaticMethod_Boolean(cls, method1, &value, ANI_TRUE, ANI_FALSE), ANI_OK);
    ASSERT_EQ(value, ANI_TRUE);
    ASSERT_EQ(env->Class_CallStaticMethod_Boolean(cls, method2, &value, ANI_TRUE, ANI_FALSE), ANI_OK);
    ASSERT_EQ(value, ANI_FALSE);

    ani_value args[2U];
    args[0U].z = ANI_TRUE;
    args[1U].z = ANI_FALSE;
    ani_boolean valueA = ANI_FALSE;
    ASSERT_EQ(env->Class_CallStaticMethod_Boolean_A(cls, method1, &valueA, args), ANI_OK);
    ASSERT_EQ(valueA, ANI_TRUE);
    ASSERT_EQ(env->Class_CallStaticMethod_Boolean_A(cls, method2, &valueA, args), ANI_OK);
    ASSERT_EQ(valueA, ANI_FALSE);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodBoolean_21([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method {};
    GetMethodDataBool(env, &cls, &method);

    ani_boolean value {};
    ASSERT_EQ(env->Class_CallStaticMethod_Boolean(cls, method, &value, ANI_TRUE, ANI_FALSE), ANI_OK);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodBoolean_22([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method {};
    GetMethodDataBool(env, &cls, &method);

    ani_boolean value {};
    ani_value args[2U];
    args[0U].z = ANI_TRUE;
    args[1U].z = ANI_FALSE;
    ASSERT_EQ(env->Class_CallStaticMethod_Boolean_A(cls, method, &value, args), ANI_OK);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodInt([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls = {};
    auto status = env->FindClass("entry.src.main.src.ets.ClassOperations.Person", &cls);
    ASSERT_EQ(status, ANI_OK);
    ASSERT_NE(cls, nullptr);
    ani_static_method method = nullptr;
    status = env->Class_FindStaticMethod(cls, "sum", "ii:i", &method);
    ASSERT_EQ(status, ANI_OK);
    ASSERT_NE(method, nullptr);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodInt_01([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method;
    GetMethodDataInt(env, &cls, &method);

    ani_int sum;
    ASSERT_EQ(env->c_api->Class_CallStaticMethod_Int(env, cls, method, &sum, VAL1, VAL2), ANI_OK);
    ASSERT_EQ(sum, VAL1 + VAL2);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodInt_02([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method;
    GetMethodDataInt(env, &cls, &method);

    ani_int sum;
    ASSERT_EQ(env->Class_CallStaticMethod_Int(cls, method, &sum, VAL1, VAL2), ANI_OK);
    ASSERT_EQ(sum, VAL1 + VAL2);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodInt_03([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method;
    GetMethodDataInt(env, &cls, &method);

    ani_value args[ARG_COUNT];
    args[0U].i = VAL1;
    args[1U].i = VAL2;

    ani_int sum;
    ASSERT_EQ(env->Class_CallStaticMethod_Int_A(cls, method, &sum, args), ANI_OK);
    ASSERT_EQ(sum, VAL1 + VAL2);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodInt_04([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method;
    GetMethodDataInt(env, &cls, &method);

    ani_int sum;
    ASSERT_EQ(env->c_api->Class_CallStaticMethod_Int(env, nullptr, method, &sum, VAL1, VAL2), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodInt_05([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method;
    GetMethodDataInt(env, &cls, &method);

    ani_int sum;
    ASSERT_EQ(env->c_api->Class_CallStaticMethod_Int(env, cls, nullptr, &sum, VAL1, VAL2), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodInt_06([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method;
    GetMethodDataInt(env, &cls, &method);

    ASSERT_EQ(env->c_api->Class_CallStaticMethod_Int(env, cls, method, nullptr, VAL1, VAL2), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodInt_07([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method;
    GetMethodDataInt(env, &cls, &method);

    ani_int sum;
    ASSERT_EQ(env->Class_CallStaticMethod_Int(nullptr, method, &sum, VAL1, VAL2), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodInt_08([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method;
    GetMethodDataInt(env, &cls, &method);

    ani_int sum;
    ASSERT_EQ(env->Class_CallStaticMethod_Int(cls, nullptr, &sum, VAL1, VAL2), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodInt_09([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method;
    GetMethodDataInt(env, &cls, &method);

    ASSERT_EQ(env->Class_CallStaticMethod_Int(cls, method, nullptr, VAL1, VAL2), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodInt_10([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method;
    GetMethodDataInt(env, &cls, &method);

    ani_value args[ARG_COUNT];
    args[0U].i = VAL1;
    args[1U].i = VAL2;
    ani_int sum;
    ASSERT_EQ(env->Class_CallStaticMethod_Int_A(nullptr, method, &sum, args), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodInt_11([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method;
    GetMethodDataInt(env, &cls, &method);

    ani_value args[ARG_COUNT];
    args[0U].i = VAL1;
    args[1U].i = VAL2;
    ani_int sum;
    ASSERT_EQ(env->Class_CallStaticMethod_Int_A(nullptr, method, &sum, args), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodInt_12([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method;
    GetMethodDataInt(env, &cls, &method);

    ani_value args[ARG_COUNT];
    args[0U].i = VAL1;
    args[1U].i = VAL2;
    ASSERT_EQ(env->Class_CallStaticMethod_Int_A(cls, method, nullptr, args), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodInt_13([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method;
    GetMethodDataInt(env, &cls, &method);

    ani_int sum;
    ASSERT_EQ(env->Class_CallStaticMethod_Int_A(nullptr, method, &sum, nullptr), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodInt_14([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class clsA {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodInt.A", &clsA), ANI_OK);
    ani_static_method methodA;
    ASSERT_EQ(env->Class_FindStaticMethod(clsA, "funcA", "ii:i", &methodA), ANI_OK);

    ani_class clsB {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodInt.B", &clsB), ANI_OK);
    ani_static_method methodB;
    ASSERT_EQ(env->Class_FindStaticMethod(clsB, "funcB", "ii:i", &methodB), ANI_OK);

    ani_int valueA;
    ASSERT_EQ(env->Class_CallStaticMethod_Int(clsA, methodA, &valueA, VAL1, VAL2), ANI_OK);
    ASSERT_EQ(valueA, VAL1 + VAL2);

    ani_int valueB;
    ASSERT_EQ(env->Class_CallStaticMethod_Int(clsB, methodB, &valueB, VAL1, VAL2), ANI_OK);
    ASSERT_EQ(valueB, VAL2 - VAL1);

    ani_value args[ARG_COUNT];
    args[0U].i = VAL1;
    args[1U].i = VAL2;
    ani_int valueAA;
    ASSERT_EQ(env->Class_CallStaticMethod_Int_A(clsA, methodA, &valueAA, args), ANI_OK);
    ASSERT_EQ(valueAA, VAL1 + VAL2);

    ani_int valueBA;
    ASSERT_EQ(env->Class_CallStaticMethod_Int_A(clsB, methodB, &valueBA, args), ANI_OK);
    ASSERT_EQ(valueBA, VAL2 - VAL1);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodInt_15([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodInt.A", &cls), ANI_OK);
    ani_static_method methodA;
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "funcA", "ii:i", &methodA), ANI_OK);
    ani_static_method methodB;
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "funcA", "dd:d", &methodB), ANI_OK);

    ani_int value;
    ASSERT_EQ(env->Class_CallStaticMethod_Int(cls, methodA, &value, VAL1, VAL2), ANI_OK);
    ASSERT_EQ(value, VAL1 + VAL2);

    ani_value args[ARG_COUNT];
    args[0U].i = VAL1;
    args[1U].i = VAL2;
    ani_int valueA;
    ASSERT_EQ(env->Class_CallStaticMethod_Int_A(cls, methodA, &valueA, args), ANI_OK);
    ASSERT_EQ(valueA, VAL1 + VAL2);

    ani_double value2;
    ASSERT_EQ(env->Class_CallStaticMethod_Double(cls, methodB, &value2, VAL3, VAL4), ANI_OK);
    ASSERT_EQ(value2, VAL3 + VAL4);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodInt_16([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodInt.A", &cls), ANI_OK);
    ani_static_method method;
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "funcB", "ii:i", &method), ANI_OK);

    ani_int value;
    ASSERT_EQ(env->Class_CallStaticMethod_Int(cls, method, &value, VAL1, VAL2), ANI_OK);
    ASSERT_EQ(value, VAL1 + VAL2);

    ani_value args[ARG_COUNT];
    args[0U].i = VAL1;
    args[1U].i = VAL2;
    ani_int valueA;
    ASSERT_EQ(env->Class_CallStaticMethod_Int_A(cls, method, &valueA, args), ANI_OK);
    ASSERT_EQ(valueA, VAL1 + VAL2);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodInt_17([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method {};
    GetMethodDataInt(env, &cls, &method);

    ani_int value = 0;
    ASSERT_EQ(env->c_api->Class_CallStaticMethod_Int(nullptr, cls, method, &value, VAL3, VAL4), ANI_INVALID_ARGS);
    ani_value args[ARG_COUNT];
    args[0U].i = VAL1;
    args[1U].i = VAL2;
    ASSERT_EQ(env->c_api->Class_CallStaticMethod_Int_A(nullptr, cls, method, &value, args), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodInt_18([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    TestCombineSceneInt(env, "entry.src.main.src.ets.ClassOperationsMethodInt.C", VAL1, VAL2, VAL1 + VAL2);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodInt_19([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    TestCombineSceneInt(env, "entry.src.main.src.ets.ClassOperationsMethodInt.D", VAL1, VAL2, VAL2 - VAL1);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodInt_20([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    TestCombineSceneInt(env, "entry.src.main.src.ets.ClassOperationsMethodInt.E", VAL1, VAL2, VAL1 + VAL2);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodInt_21([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodInt.F", &cls), ANI_OK);
    ani_static_method method1 {};
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "increment", nullptr, &method1), ANI_OK);
    ani_static_method method2 {};
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "getCount", nullptr, &method2), ANI_OK);
    ASSERT_EQ(env->Class_CallStaticMethod_Void(cls, method1, VAL1, VAL2), ANI_OK);
    ani_int value = 0;
    ASSERT_EQ(env->Class_CallStaticMethod_Int(cls, method2, &value), ANI_OK);
    ASSERT_EQ(value, VAL1 + VAL2);

    ani_value args[ARG_COUNT];
    args[0U].i = VAL1;
    args[1U].i = VAL2;
    ani_int valueA = 0;
    ASSERT_EQ(env->Class_CallStaticMethod_Int_A(cls, method2, &valueA, args), ANI_OK);
    ASSERT_EQ(valueA, VAL1 + VAL2);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodInt_22([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodInt.G", &cls), ANI_OK);
    ani_static_method method1 {};
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "publicMethod", "ii:i", &method1), ANI_OK);
    ani_static_method method2 {};
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "callPrivateMethod", "ii:i", &method2), ANI_OK);
    ani_int value = 0;
    ASSERT_EQ(env->Class_CallStaticMethod_Int(cls, method1, &value, VAL1, VAL2), ANI_OK);
    ASSERT_EQ(value, VAL1 + VAL2);
    ASSERT_EQ(env->Class_CallStaticMethod_Int(cls, method2, &value, VAL1, VAL2), ANI_OK);
    ASSERT_EQ(value, VAL2 - VAL1);

    ani_value args[ARG_COUNT];
    args[0U].i = VAL1;
    args[1U].i = VAL2;
    ani_int valueA = 0;
    ASSERT_EQ(env->Class_CallStaticMethod_Int_A(cls, method1, &valueA, args), ANI_OK);
    ASSERT_EQ(valueA, VAL1 + VAL2);
    ASSERT_EQ(env->Class_CallStaticMethod_Int_A(cls, method2, &valueA, args), ANI_OK);
    ASSERT_EQ(valueA, VAL2 - VAL1);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodInt_23([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method {};
    GetMethodDataInt(env, &cls, &method);

    ani_int value {};
    ASSERT_EQ(env->Class_CallStaticMethod_Int(cls, method, &value, VAL1, VAL2), ANI_OK);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodInt_24([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method {};
    GetMethodDataInt(env, &cls, &method);

    ani_int value {};
    ani_value args[2U];
    args[0U].i = VAL1;
    args[1U].i = VAL2;
    ASSERT_EQ(env->Class_CallStaticMethod_Int_A(cls, method, &value, args), ANI_OK);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodShort([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method;
    GetMethodDataShort(env, &cls, &method);

    ani_short sum = 0;
    ASSERT_EQ(env->c_api->Class_CallStaticMethod_Short(env, cls, method, &sum, VAL1, VAL2), ANI_OK);
    ASSERT_EQ(sum, VAL1 + VAL2);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodShort_01([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method;
    GetMethodDataShort(env, &cls, &method);

    ani_short sum = 0;
    ASSERT_EQ(env->Class_CallStaticMethod_Short(cls, method, &sum, VAL1, VAL2), ANI_OK);
    ASSERT_EQ(sum, VAL1 + VAL2);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodShort_02([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method;
    GetMethodDataShort(env, &cls, &method);

    ani_value args[ARG_COUNT];
    args[0U].s = VAL1;
    args[1U].s = VAL2;

    ani_short sum = 0;
    ASSERT_EQ(env->Class_CallStaticMethod_Short_A(cls, method, &sum, args), ANI_OK);
    ASSERT_EQ(sum, VAL1 + VAL2);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodShort_03([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method;
    GetMethodDataShort(env, &cls, &method);

    ani_short sum = 0;
    ASSERT_EQ(env->Class_CallStaticMethod_Short(nullptr, method, &sum, VAL1, VAL2), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodShort_04([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method;
    GetMethodDataShort(env, &cls, &method);

    ani_short sum = 0;
    ASSERT_EQ(env->Class_CallStaticMethod_Short(cls, nullptr, &sum, VAL1, VAL2), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodShort_05([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method;
    GetMethodDataShort(env, &cls, &method);

    ASSERT_EQ(env->Class_CallStaticMethod_Short(cls, method, nullptr, VAL1, VAL2), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodShort_06([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method;
    GetMethodDataShort(env, &cls, &method);

    ani_value args[ARG_COUNT];
    args[0U].s = VAL1;
    args[1U].s = VAL2;

    ani_short sum = 0;
    ASSERT_EQ(env->Class_CallStaticMethod_Short_A(nullptr, method, &sum, args), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodShort_07([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method;
    GetMethodDataShort(env, &cls, &method);

    ani_value args[ARG_COUNT];
    args[0U].s = VAL1;
    args[1U].s = VAL2;

    ani_short sum = 0;
    ASSERT_EQ(env->Class_CallStaticMethod_Short_A(cls, nullptr, &sum, args), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodShort_08([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method;
    GetMethodDataShort(env, &cls, &method);

    ani_value args[ARG_COUNT];
    args[0U].s = VAL1;
    args[1U].s = VAL2;

    ASSERT_EQ(env->Class_CallStaticMethod_Short_A(cls, method, nullptr, args), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodShort_09([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method;
    GetMethodDataShort(env, &cls, &method);

    ani_short sum = 0;
    ASSERT_EQ(env->Class_CallStaticMethod_Short_A(cls, method, &sum, nullptr), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodShort_10([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class clsA {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodShort.A", &clsA), ANI_OK);
    ani_static_method methodA;
    ASSERT_EQ(env->Class_FindStaticMethod(clsA, "funcA", "ss:s", &methodA), ANI_OK);

    ani_class clsB {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodShort.B", &clsB), ANI_OK);
    ani_static_method methodB;
    ASSERT_EQ(env->Class_FindStaticMethod(clsB, "funcB", "ss:s", &methodB), ANI_OK);

    ani_short valueA = 0;
    ASSERT_EQ(env->Class_CallStaticMethod_Short(clsA, methodA, &valueA, VAL1, VAL2), ANI_OK);
    ASSERT_EQ(valueA, VAL1 + VAL2);

    ani_short valueB = 0;
    ASSERT_EQ(env->Class_CallStaticMethod_Short(clsB, methodB, &valueB, VAL1, VAL2), ANI_OK);
    ASSERT_EQ(valueB, 6U - 5U);

    ani_value args[ARG_COUNT];
    args[0U].s = VAL1;
    args[1U].s = VAL2;
    ani_short valueAA = 0;
    ASSERT_EQ(env->Class_CallStaticMethod_Short_A(clsA, methodA, &valueAA, args), ANI_OK);
    ASSERT_EQ(valueAA, VAL1 + VAL2);

    ani_short valueBA = 0;
    ASSERT_EQ(env->Class_CallStaticMethod_Short_A(clsB, methodB, &valueBA, args), ANI_OK);
    ASSERT_EQ(valueBA, 6U - 5U);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodShort_11([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodShort.A", &cls), ANI_OK);
    ani_static_method methodA;
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "funcA", "ss:s", &methodA), ANI_OK);
    ani_static_method methodB;
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "funcA", "ii:i", &methodB), ANI_OK);

    ani_short value = 0;
    ASSERT_EQ(env->Class_CallStaticMethod_Short(cls, methodA, &value, VAL1, VAL2), ANI_OK);
    ASSERT_EQ(value, VAL1 + VAL2);

    ani_value args[ARG_COUNT];
    args[0U].s = VAL1;
    args[1U].s = VAL2;
    ani_short valueA = 0;
    ASSERT_EQ(env->Class_CallStaticMethod_Short_A(cls, methodA, &valueA, args), ANI_OK);
    ASSERT_EQ(valueA, VAL1 + VAL2);

    ani_int value2;
    ASSERT_EQ(env->Class_CallStaticMethod_Int(cls, methodB, &value2, VAL2, VAL2), ANI_OK);
    ASSERT_EQ(value2, VAL2 + VAL2);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodShort_12([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodShort.A", &cls), ANI_OK);
    ani_static_method method;
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "funcB", "ss:s", &method), ANI_OK);

    ani_short value = 0;
    ASSERT_EQ(env->Class_CallStaticMethod_Short(cls, method, &value, VAL1, VAL2), ANI_OK);
    ASSERT_EQ(value, VAL1 + VAL2);

    ani_value args[ARG_COUNT];
    args[0U].s = VAL1;
    args[1U].s = VAL2;
    ani_short valueA = 0;
    ASSERT_EQ(env->Class_CallStaticMethod_Short_A(cls, method, &valueA, args), ANI_OK);
    ASSERT_EQ(valueA, VAL1 + VAL2);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodShort_13([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method {};
    GetMethodDataShort(env, &cls, &method);

    ani_short value = 0;
    ASSERT_EQ(env->c_api->Class_CallStaticMethod_Short(nullptr, cls, method, &value, VAL1, VAL2), ANI_INVALID_ARGS);
    ani_value args[2U];
    args[0U].s = VAL1;
    args[1U].s = VAL2;
    ASSERT_EQ(env->c_api->Class_CallStaticMethod_Short_A(nullptr, cls, method, &value, args), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodShort_14([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    TestCombineSceneShort(env, "entry.src.main.src.ets.ClassOperationsMethodShort.C", VAL1, VAL2, VAL1 + VAL2);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodShort_15([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    TestCombineSceneShort(env, "entry.src.main.src.ets.ClassOperationsMethodShort.D", VAL1, VAL2, VAL2 - VAL1);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodShort_16([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    TestCombineSceneShort(env, "entry.src.main.src.ets.ClassOperationsMethodShort.E", VAL1, VAL2, VAL1 + VAL2);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodShort_17([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodShort.F", &cls), ANI_OK);
    ani_static_method method1 {};
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "increment", nullptr, &method1), ANI_OK);
    ani_static_method method2 {};
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "getCount", nullptr, &method2), ANI_OK);
    ASSERT_EQ(env->Class_CallStaticMethod_Void(cls, method1, VAL1, VAL2), ANI_OK);
    ani_short value = 0;
    ASSERT_EQ(env->Class_CallStaticMethod_Short(cls, method2, &value), ANI_OK);
    ASSERT_EQ(value, VAL1 + VAL2);

    ani_value args[2U];
    args[0U].s = VAL1;
    args[1U].s = VAL2;
    ani_short valueA = 0;
    ASSERT_EQ(env->Class_CallStaticMethod_Short_A(cls, method2, &valueA, args), ANI_OK);
    ASSERT_EQ(valueA, VAL1 + VAL2);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodShort_18([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodShort.G", &cls), ANI_OK);
    ani_static_method method1 {};
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "publicMethod", "ss:s", &method1), ANI_OK);
    ani_static_method method2 {};
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "callPrivateMethod", "ss:s", &method2), ANI_OK);
    ani_short value = 0;
    ASSERT_EQ(env->Class_CallStaticMethod_Short(cls, method1, &value, VAL1, VAL2), ANI_OK);
    ASSERT_EQ(value, VAL1 + VAL2);
    ASSERT_EQ(env->Class_CallStaticMethod_Short(cls, method2, &value, VAL1, VAL2), ANI_OK);
    ASSERT_EQ(value, VAL2 - VAL1);

    ani_value args[2U];
    args[0U].s = VAL1;
    args[1U].s = VAL2;
    ani_short valueA = 0;
    ASSERT_EQ(env->Class_CallStaticMethod_Short_A(cls, method1, &valueA, args), ANI_OK);
    ASSERT_EQ(valueA, VAL1 + VAL2);
    ASSERT_EQ(env->Class_CallStaticMethod_Short_A(cls, method2, &valueA, args), ANI_OK);
    ASSERT_EQ(valueA, VAL2 - VAL1);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodShort_19([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method {};
    GetMethodDataShort(env, &cls, &method);

    ani_short value {};
    ASSERT_EQ(env->Class_CallStaticMethod_Short(cls, method, &value, VAL1, VAL2), ANI_OK);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodShort_20([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method {};
    GetMethodDataShort(env, &cls, &method);

    ani_short value {};
    ani_value args[2U];
    args[0U].s = VAL1;
    args[1U].s = VAL2;
    ASSERT_EQ(env->Class_CallStaticMethod_Short_A(cls, method, &value, args), ANI_OK);
    return ANI_TRUE;
}


ani_boolean test_Class_FindStaticMethodByte([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method;
    GetMethodDataByte(env, &cls, &method);

    ani_byte sum = 0;
    const ani_byte VALUE1 = 5U;
    const ani_byte VALUE2 = 6U;
    ASSERT_EQ(env->c_api->Class_CallStaticMethod_Byte(env, cls, method, &sum, VALUE1, VALUE2), ANI_OK);
    ASSERT_EQ(sum, VALUE1 + VALUE2);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodByte_01([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method;
    GetMethodDataByte(env, &cls, &method);

    ani_byte sum = 0;
    const ani_byte VALUE1 = 5U;
    const ani_byte VALUE2 = 6U;
    
    ASSERT_EQ(env->Class_CallStaticMethod_Byte(cls, method, &sum, VALUE1, VALUE2), ANI_OK);
    ASSERT_EQ(sum, VALUE1 + VALUE2);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodByte_02([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method;
    GetMethodDataByte(env, &cls, &method);

    ani_value args[ARG_COUNT];
    args[0U].b = VAL1;
    args[1U].b = VAL2;

    ani_byte sum = 0;
    ASSERT_EQ(env->Class_CallStaticMethod_Byte_A(cls, method, &sum, args), ANI_OK);
    ASSERT_EQ(sum, VAL1 + VAL2);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodByte_03([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method;
    GetMethodDataByte(env, &cls, &method);

    ani_byte sum = 0;
    ASSERT_EQ(env->Class_CallStaticMethod_Byte(nullptr, method, &sum, VAL1, VAL2), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodByte_04([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method;
    GetMethodDataByte(env, &cls, &method);

    ani_byte sum = 0;
    ASSERT_EQ(env->Class_CallStaticMethod_Byte(cls, nullptr, &sum, VAL1, VAL2), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodByte_05([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method;
    GetMethodDataByte(env, &cls, &method);

    ASSERT_EQ(env->Class_CallStaticMethod_Byte(cls, method, nullptr, VAL1, VAL2), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodByte_06([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method;
    GetMethodDataByte(env, &cls, &method);

    ani_value args[ARG_COUNT];
    args[0U].b = VAL1;
    args[1U].b = VAL2;

    ani_byte sum = 0;
    ASSERT_EQ(env->Class_CallStaticMethod_Byte_A(nullptr, method, &sum, args), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodByte_07([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method;
    GetMethodDataByte(env, &cls, &method);

    ani_value args[ARG_COUNT];
    args[0U].b = VAL1;
    args[1U].b = VAL2;

    ani_byte sum = 0;
    ASSERT_EQ(env->Class_CallStaticMethod_Byte_A(cls, nullptr, &sum, args), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodByte_08([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method;
    GetMethodDataByte(env, &cls, &method);

    ani_value args[ARG_COUNT];
    args[0U].b = VAL1;
    args[1U].b = VAL2;

    ASSERT_EQ(env->Class_CallStaticMethod_Byte_A(cls, method, nullptr, args), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodByte_09([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method;
    GetMethodDataByte(env, &cls, &method);

    ani_byte sum = 0;
    ASSERT_EQ(env->Class_CallStaticMethod_Byte_A(cls, method, &sum, nullptr), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodByte_10([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class clsA {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodByte.A", &clsA), ANI_OK);
    ani_static_method methodA;
    ASSERT_EQ(env->Class_FindStaticMethod(clsA, "funcA", "bb:b", &methodA), ANI_OK);

    ani_class clsB {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodByte.B", &clsB), ANI_OK);
    ani_static_method methodB;
    ASSERT_EQ(env->Class_FindStaticMethod(clsB, "funcB", "bb:b", &methodB), ANI_OK);

    ani_byte valueA = 0;
    ASSERT_EQ(env->Class_CallStaticMethod_Byte(clsA, methodA, &valueA, VAL1, VAL2), ANI_OK);
    ASSERT_EQ(valueA, VAL1 + VAL2);

    ani_byte valueB = 0;
    ASSERT_EQ(env->Class_CallStaticMethod_Byte(clsB, methodB, &valueB, VAL1, VAL2), ANI_OK);
    ASSERT_EQ(valueB, VAL2 - VAL1);

    ani_value args[ARG_COUNT];
    args[0U].b = VAL1;
    args[1U].b = VAL2;
    ani_byte valueAA = 0;
    ASSERT_EQ(env->Class_CallStaticMethod_Byte_A(clsA, methodA, &valueAA, args), ANI_OK);
    ASSERT_EQ(valueAA, VAL1 + VAL2);

    ani_byte valueBA = 0;
    ASSERT_EQ(env->Class_CallStaticMethod_Byte_A(clsB, methodB, &valueBA, args), ANI_OK);
    ASSERT_EQ(valueBA, VAL2 - VAL1);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodByte_11([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodByte.A", &cls), ANI_OK);
    ani_static_method methodA;
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "funcA", "bb:b", &methodA), ANI_OK);
    ani_static_method methodB;
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "funcA", "ii:i", &methodB), ANI_OK);

    ani_byte value = 0;
    ASSERT_EQ(env->Class_CallStaticMethod_Byte(cls, methodA, &value, VAL1, VAL2), ANI_OK);
    ASSERT_EQ(value, VAL1 + VAL2);

    ani_value args[ARG_COUNT];
    args[0U].b = VAL1;
    args[1U].b = VAL2;
    ani_byte valueA = 0;
    ASSERT_EQ(env->Class_CallStaticMethod_Byte_A(cls, methodA, &valueA, args), ANI_OK);
    ASSERT_EQ(valueA, VAL1 + VAL2);

    ani_int value2 = 0;
    ASSERT_EQ(env->Class_CallStaticMethod_Int(cls, methodB, &value2, VAL2, VAL2), ANI_OK);
    ASSERT_EQ(value2, VAL2 + VAL2);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodByte_12([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodByte.A", &cls), ANI_OK);
    ani_static_method method;
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "funcB", "bb:b", &method), ANI_OK);

    ani_byte value = 0;
    ASSERT_EQ(env->Class_CallStaticMethod_Byte(cls, method, &value, VAL1, VAL2), ANI_OK);
    ASSERT_EQ(value, VAL1 + VAL2);

    ani_value args[ARG_COUNT];
    args[0U].b = VAL1;
    args[1U].b = VAL2;
    ani_byte valueA = 0;
    ASSERT_EQ(env->Class_CallStaticMethod_Byte_A(cls, method, &valueA, args), ANI_OK);
    ASSERT_EQ(valueA, VAL1 + VAL2);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodByte_13([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method {};
    GetMethodDataByte(env, &cls, &method);

    ani_byte value = 0;
    ASSERT_EQ(env->c_api->Class_CallStaticMethod_Byte(nullptr, cls, method, &value, VAL1, VAL2), ANI_INVALID_ARGS);
    ani_value args[ARG_COUNT];
    args[0U].b = VAL1;
    args[1U].b = VAL2;
    ASSERT_EQ(env->c_api->Class_CallStaticMethod_Byte_A(nullptr, cls, method, &value, args), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodByte_14([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    TestCombineSceneByte(env, "entry.src.main.src.ets.ClassOperationsMethodByte.C", VAL1, VAL2, VAL1 + VAL2);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodByte_15([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    TestCombineSceneByte(env, "entry.src.main.src.ets.ClassOperationsMethodByte.D", VAL1, VAL2, VAL2 - VAL1);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodByte_16([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    TestCombineSceneByte(env, "entry.src.main.src.ets.ClassOperationsMethodByte.E", VAL1, VAL2, VAL1 + VAL2);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodByte_17([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodByte.F", &cls), ANI_OK);
    ani_static_method method1 {};
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "increment", nullptr, &method1), ANI_OK);
    ani_static_method method2 {};
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "getCount", nullptr, &method2), ANI_OK);
    ASSERT_EQ(env->Class_CallStaticMethod_Void(cls, method1, VAL1, VAL2), ANI_OK);
    ani_byte value = 0;
    ASSERT_EQ(env->Class_CallStaticMethod_Byte(cls, method2, &value), ANI_OK);
    ASSERT_EQ(value, VAL1 + VAL2);

    ani_value args[ARG_COUNT];
    args[0U].b = VAL1;
    args[1U].b = VAL2;
    ani_byte valueA = 0;
    ASSERT_EQ(env->Class_CallStaticMethod_Byte_A(cls, method2, &valueA, args), ANI_OK);
    ASSERT_EQ(valueA, VAL1 + VAL2);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodByte_18([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodByte.G", &cls), ANI_OK);
    ani_static_method method1 {};
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "publicMethod", "bb:b", &method1), ANI_OK);
    ani_static_method method2 {};
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "callPrivateMethod", "bb:b", &method2), ANI_OK);
    ani_byte value = 0;
    ASSERT_EQ(env->Class_CallStaticMethod_Byte(cls, method1, &value, VAL1, VAL2), ANI_OK);
    ASSERT_EQ(value, VAL1 + VAL2);
    ASSERT_EQ(env->Class_CallStaticMethod_Byte(cls, method2, &value, VAL1, VAL2), ANI_OK);
    ASSERT_EQ(value, VAL2 - VAL1);

    ani_value args[ARG_COUNT];
    args[0U].b = VAL1;
    args[1U].b = VAL2;
    ani_byte valueA = 0;
    ASSERT_EQ(env->Class_CallStaticMethod_Byte_A(cls, method1, &valueA, args), ANI_OK);
    ASSERT_EQ(valueA, VAL1 + VAL2);
    ASSERT_EQ(env->Class_CallStaticMethod_Byte_A(cls, method2, &valueA, args), ANI_OK);
    ASSERT_EQ(valueA, VAL2 - VAL1);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodLong([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method;
    GetMethodDataLong(env, &cls, &method);

    ani_long sum = 0L;
    const ani_long v1 = VALL1;
    const ani_long v2 = VALL2;
    ASSERT_EQ(env->c_api->Class_CallStaticMethod_Long(env, cls, method, &sum, v1, v2), ANI_OK);
    ASSERT_EQ(sum, v1 + v2);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodLong_01([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method;
    GetMethodDataLong(env, &cls, &method);

    ani_long sum = 0L;
    const ani_long v1 = VALL1;
    const ani_long v2 = VALL2;
    ASSERT_EQ(env->Class_CallStaticMethod_Long(cls, method, &sum, v1, v2), ANI_OK);
    ASSERT_EQ(sum, v1 + v2);
    return ANI_TRUE;
}


ani_boolean test_Class_FindStaticMethodLong_02([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method;
    GetMethodDataLong(env, &cls, &method);

    ani_value args[ARG_COUNT];
    args[0U].l = VALL1;
    args[1U].l = VALL2;

    ani_long sum = 0L;
    ASSERT_EQ(env->Class_CallStaticMethod_Long_A(cls, method, &sum, args), ANI_OK);
    ASSERT_EQ(sum, VALL1 + VALL2);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodLong_03([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method;
    GetMethodDataLong(env, &cls, &method);

    ani_long sum = 0L;
    ASSERT_EQ(env->Class_CallStaticMethod_Long(nullptr, method, &sum, VALL1, VALL2), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodLong_04([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method;
    GetMethodDataLong(env, &cls, &method);

    ani_long sum = 0L;
    ASSERT_EQ(env->Class_CallStaticMethod_Long(cls, nullptr, &sum, VALL1, VALL2), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodLong_05([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method;
    GetMethodDataLong(env, &cls, &method);

    ASSERT_EQ(env->Class_CallStaticMethod_Long(cls, method, nullptr, VALL1, VALL2), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodLong_06([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method;
    GetMethodDataLong(env, &cls, &method);

    ani_value args[ARG_COUNT];
    args[0U].l = VALL1;
    args[1U].l = VALL2;

    ani_long sum = 0L;
    ASSERT_EQ(env->Class_CallStaticMethod_Long_A(nullptr, method, &sum, args), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodLong_07([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method;
    GetMethodDataLong(env, &cls, &method);

    ani_value args[ARG_COUNT];
    args[0U].l = VALL1;
    args[1U].l = VALL2;

    ani_long sum = 0L;
    ASSERT_EQ(env->Class_CallStaticMethod_Long_A(nullptr, method, &sum, args), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodLong_08([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method;
    GetMethodDataLong(env, &cls, &method);

    ani_value args[ARG_COUNT];
    args[0U].l = VALL1;
    args[1U].l = VALL2;

    ani_long sum = 0L;
    ASSERT_EQ(env->Class_CallStaticMethod_Long_A(cls, nullptr, &sum, args), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodLong_09([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method;
    GetMethodDataLong(env, &cls, &method);

    ani_value args[ARG_COUNT];
    args[0U].l = VALL1;
    args[1U].l = VALL2;

    ASSERT_EQ(env->Class_CallStaticMethod_Long_A(cls, method, nullptr, args), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodLong_10([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method;
    GetMethodDataLong(env, &cls, &method);

    ani_long sum = 0L;
    ASSERT_EQ(env->Class_CallStaticMethod_Long_A(cls, method, &sum, nullptr), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodLong_11([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class clsA {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodLong.A", &clsA), ANI_OK);
    ani_static_method methodA;
    ASSERT_EQ(env->Class_FindStaticMethod(clsA, "funcA", "ll:l", &methodA), ANI_OK);

    ani_class clsB {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodLong.B", &clsB), ANI_OK);
    ani_static_method methodB;
    ASSERT_EQ(env->Class_FindStaticMethod(clsB, "funcB", "ll:l", &methodB), ANI_OK);

    ani_long valueA = 0L;
    ASSERT_EQ(env->Class_CallStaticMethod_Long(clsA, methodA, &valueA, VALL1, VALL2), ANI_OK);
    ASSERT_EQ(valueA, VALL1 + VALL2);

    ani_long valueB = 0L;
    ASSERT_EQ(env->Class_CallStaticMethod_Long(clsB, methodB, &valueB, VALL1, VALL2), ANI_OK);
    ASSERT_EQ(valueB, VALL2 - VALL1);

    ani_value args[ARG_COUNT];
    args[0U].l = VALL1;
    args[1U].l = VALL2;
    ani_long valueAA = 0L;
    ASSERT_EQ(env->Class_CallStaticMethod_Long_A(clsA, methodA, &valueAA, args), ANI_OK);
    ASSERT_EQ(valueAA, VALL1 + VALL2);

    ani_long valueBA = 0L;
    ASSERT_EQ(env->Class_CallStaticMethod_Long_A(clsB, methodB, &valueBA, args), ANI_OK);
    ASSERT_EQ(valueBA, VALL2 - VALL1);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodLong_12([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodLong.A", &cls), ANI_OK);
    ani_static_method methodA;
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "funcA", "ll:l", &methodA), ANI_OK);
    ani_static_method methodB;
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "funcA", "ii:i", &methodB), ANI_OK);

    ani_long value = 0L;
    ASSERT_EQ(env->Class_CallStaticMethod_Long(cls, methodA, &value, VALL1, VALL2), ANI_OK);
    ASSERT_EQ(value, VALL1 + VALL2);

    ani_value args[ARG_COUNT];
    args[0U].l = VALL1;
    args[1U].l = VALL2;
    ani_long valueA = 0L;
    ASSERT_EQ(env->Class_CallStaticMethod_Long_A(cls, methodA, &valueA, args), ANI_OK);
    ASSERT_EQ(valueA, VALL1 + VALL2);

    ani_int value2 = 0L;
    ASSERT_EQ(env->Class_CallStaticMethod_Int(cls, methodB, &value2, VALL3, VALL3), ANI_OK);
    ASSERT_EQ(value2, VALL3 + VALL3);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodLong_13([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodLong.A", &cls), ANI_OK);
    ani_static_method method;
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "funcB", "ll:l", &method), ANI_OK);

    ani_long value = 0L;
    ASSERT_EQ(env->Class_CallStaticMethod_Long(cls, method, &value, VALL1, VALL2), ANI_OK);
    ASSERT_EQ(value, VALL1 + VALL2);

    ani_value args[ARG_COUNT];
    args[0U].l = VALL1;
    args[1U].l = VALL2;
    ani_long valueA = 0L;
    ASSERT_EQ(env->Class_CallStaticMethod_Long_A(cls, method, &valueA, args), ANI_OK);
    ASSERT_EQ(valueA, VALL1 + VALL2);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodLong_14([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method;
    GetMethodDataLong(env, &cls, &method);

    ani_long value = 0L;
    ASSERT_EQ(env->c_api->Class_CallStaticMethod_Long(nullptr, cls, method, &value, VALL1, VALL2), ANI_INVALID_ARGS);
    ani_value args[2U];
    args[0U].l = VALL1;
    args[1U].l = VALL2;
    ASSERT_EQ(env->c_api->Class_CallStaticMethod_Long_A(nullptr, cls, method, &value, args), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodLong_15([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    TestCombineSceneLong(env, "call_static_method_long_test.C", VALL1, VALL2, VALL1 + VALL2);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodLong_16([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    TestCombineSceneLong(env, "call_static_method_long_test.D", VALL1, VALL2, VALL2 - VALL1);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodLong_17([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    TestCombineSceneLong(env, "call_static_method_long_test.E", VALL1, VALL2, VALL1 + VALL2);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodLong_18([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodLong.F", &cls), ANI_OK);
    ani_static_method method1 {};
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "increment", nullptr, &method1), ANI_OK);
    ani_static_method method2 {};
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "getCount", nullptr, &method2), ANI_OK);
    ASSERT_EQ(env->Class_CallStaticMethod_Void(cls, method1, VALL1, VALL2), ANI_OK);
    ani_long value = 0L;
    ASSERT_EQ(env->Class_CallStaticMethod_Long(cls, method2, &value), ANI_OK);
    ASSERT_EQ(value, VALL1 + VALL2);

    ani_value args[2U];
    args[0U].l = VALL1;
    args[1U].l = VALL2;
    ani_long valueA = 0L;
    ASSERT_EQ(env->Class_CallStaticMethod_Long_A(cls, method2, &valueA, args), ANI_OK);
    ASSERT_EQ(valueA, VALL1 + VALL2);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodLong_19([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodLong.G", &cls), ANI_OK);
    ani_static_method method1 {};
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "publicMethod", "ll:l", &method1), ANI_OK);
    ani_static_method method2 {};
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "callPrivateMethod", "ll:l", &method2), ANI_OK);
    ani_long value = 0L;
    ASSERT_EQ(env->Class_CallStaticMethod_Long(cls, method1, &value, VALL1, VALL2), ANI_OK);
    ASSERT_EQ(value, VALL1 + VALL2);
    ASSERT_EQ(env->Class_CallStaticMethod_Long(cls, method2, &value, VALL1, VALL2), ANI_OK);
    ASSERT_EQ(value, VALL2 - VALL1);

    ani_value args[2U];
    args[0U].l = VALL1;
    args[1U].l = VALL2;
    ani_long valueA = 0L;
    ASSERT_EQ(env->Class_CallStaticMethod_Long_A(cls, method1, &valueA, args), ANI_OK);
    ASSERT_EQ(valueA, VALL1 + VALL2);
    ASSERT_EQ(env->Class_CallStaticMethod_Long_A(cls, method2, &valueA, args), ANI_OK);
    ASSERT_EQ(valueA, VALL2 - VALL1);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodRef([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method = nullptr;
    GetMethodDataButton(env, &cls, &method);

    ani_ref ref = nullptr;
    ASSERT_EQ(env->Class_CallStaticMethod_Ref(cls, method, &ref), ANI_OK);
    ASSERT_NE(ref, nullptr);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodRef_01([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method = nullptr;
    GetMethodDataButton(env, &cls, &method);

    ani_ref ref = nullptr;
    ASSERT_EQ(env->c_api->Class_CallStaticMethod_Ref(env, cls, method, &ref), ANI_OK);
    ASSERT_NE(ref, nullptr);

    auto string = reinterpret_cast<ani_string>(ref);
    ani_size result = 0U;
    ASSERT_EQ(env->String_GetUTF8Size(string, &result), ANI_OK);
    ASSERT_EQ(result, 2U);

    ani_size substrOffset = 0U;
    ani_size substrSize = result;
    const uint32_t bufferSize = 5U;
    char utfBuffer[bufferSize] = {};
    result = 0U;
    auto status =
        env->String_GetUTF8SubString(string, substrOffset, substrSize, utfBuffer, sizeof(utfBuffer), &result);
    ASSERT_EQ(status, ANI_OK);
    ASSERT_STREQ(utfBuffer, "UP");
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodRef_02([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method = nullptr;
    GetMethodDataString(env, &cls, &method);

    ani_ref ref = nullptr;
    ASSERT_EQ(env->Class_CallStaticMethod_Ref(cls, method, &ref, VAL1, VAL2), ANI_OK);
    ASSERT_NE(ref, nullptr);

    auto string = reinterpret_cast<ani_string>(ref);
    ani_size result = 0U;
    ASSERT_EQ(env->String_GetUTF8Size(string, &result), ANI_OK);
    ani_size substrOffset = 0U;
    ani_size substrSize = result;
    const uint32_t bufferSize = 10U;
    char utfBuffer[bufferSize] = {};
    result = 0U;
    auto status =
        env->String_GetUTF8SubString(string, substrOffset, substrSize, utfBuffer, sizeof(utfBuffer), &result);
    ASSERT_EQ(status, ANI_OK);
    ASSERT_STREQ(utfBuffer, "INT5");
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodRef_03([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method = nullptr;
    GetMethodDataString(env, &cls, &method);

    ani_ref ref = nullptr;
    ani_value args[ARG_COUNT];
    args[0U].i = VAL1;
    args[1U].i = VAL2;
    ASSERT_EQ(env->Class_CallStaticMethod_Ref_A(cls, method, &ref, args), ANI_OK);
    ASSERT_NE(ref, nullptr);

    auto string = reinterpret_cast<ani_string>(ref);
    ani_size result = 0U;
    ASSERT_EQ(env->String_GetUTF8Size(string, &result), ANI_OK);
    ani_size substrOffset = 0U;
    ani_size substrSize = result;
    const uint32_t bufferSize = 10U;
    char utfBuffer[bufferSize] = {};
    result = 0U;
    auto status =
        env->String_GetUTF8SubString(string, substrOffset, substrSize, utfBuffer, sizeof(utfBuffer), &result);
    ASSERT_EQ(status, ANI_OK);
    ASSERT_STREQ(utfBuffer, "INT5");
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodRef_04([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method = nullptr;
    GetMethodDataButton(env, &cls, &method);

    ani_ref ref = nullptr;
    ASSERT_EQ(env->c_api->Class_CallStaticMethod_Ref(env, nullptr, method, &ref), ANI_INVALID_ARGS);
    ASSERT_EQ(ref, nullptr);
    return ANI_TRUE;
}


ani_boolean test_Class_FindStaticMethodRef_05([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method = nullptr;
    GetMethodDataButton(env, &cls, &method);

    ani_ref ref = nullptr;
    ASSERT_EQ(env->c_api->Class_CallStaticMethod_Ref(env, cls, nullptr, &ref), ANI_INVALID_ARGS);
    ASSERT_EQ(ref, nullptr);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodRef_06([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method = nullptr;
    GetMethodDataButton(env, &cls, &method);

    ani_ref ref = nullptr;
    ASSERT_EQ(env->c_api->Class_CallStaticMethod_Ref(env, cls, method, nullptr), ANI_INVALID_ARGS);
    ASSERT_EQ(ref, nullptr);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodRef_07([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls;
    ani_static_method method;
    GetMethodDataString(env, &cls, &method);

    ani_ref ref;
    ASSERT_EQ(env->Class_CallStaticMethod_Ref(nullptr, method, &ref, VAL1, VAL2), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodRef_08([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls;
    ani_static_method method;
    GetMethodDataString(env, &cls, &method);

    ani_ref ref;
    ASSERT_EQ(env->Class_CallStaticMethod_Ref(cls, nullptr, &ref, VAL1, VAL2), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodRef_09([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls;
    ani_static_method method;
    GetMethodDataString(env, &cls, &method);

    ASSERT_EQ(env->Class_CallStaticMethod_Ref(cls, method, nullptr, VAL1, VAL2), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodRef_10([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls;
    ani_static_method method;
    GetMethodDataString(env, &cls, &method);

    ani_value args[ARG_COUNT];
    args[0U].i = VAL1;
    args[1U].i = VAL2;
    ani_ref ref;
    ASSERT_EQ(env->Class_CallStaticMethod_Ref_A(nullptr, method, &ref, args), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodRef_11([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls;
    ani_static_method method;
    GetMethodDataString(env, &cls, &method);

    ani_value args[ARG_COUNT];
    args[0U].i = VAL1;
    args[1U].i = VAL2;
    ani_ref ref;
    ASSERT_EQ(env->Class_CallStaticMethod_Ref_A(cls, nullptr, &ref, args), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodRef_12([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls;
    ani_static_method method;
    GetMethodDataString(env, &cls, &method);

    ani_value args[ARG_COUNT];
    args[0U].i = VAL1;
    args[1U].i = VAL2;
    ASSERT_EQ(env->Class_CallStaticMethod_Ref_A(cls, method, nullptr, args), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodRef_13([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls;
    ani_static_method method;
    GetMethodDataString(env, &cls, &method);

    ani_ref ref;
    ASSERT_EQ(env->Class_CallStaticMethod_Ref_A(nullptr, method, &ref, nullptr), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodRef_14([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class clsA {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodRef.A", &clsA), ANI_OK);
    ani_static_method methodA;
    ASSERT_EQ(env->Class_FindStaticMethod(clsA, "funcA", "ii:C{std.core.String}", &methodA), ANI_OK);

    ani_class clsB {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodRef.B", &clsB), ANI_OK);
    ani_static_method methodB;
    ASSERT_EQ(env->Class_FindStaticMethod(clsB, "funcB", "ii:C{std.core.String}", &methodB), ANI_OK);

    ani_ref valueA = nullptr;
    ASSERT_EQ(env->Class_CallStaticMethod_Ref(clsA, methodA, &valueA, VAL1, VAL2), ANI_OK);
    CheckRefNum(env, valueA);

    ani_ref valueB = nullptr;
    ASSERT_EQ(env->Class_CallStaticMethod_Ref(clsB, methodB, &valueB, VAL1, VAL2), ANI_OK);
    CheckRefUp(env, valueB);

    ani_value args[ARG_COUNT];
    args[0U].i = VAL1;
    args[1U].i = VAL2;
    ani_ref valueAA = nullptr;
    ASSERT_EQ(env->Class_CallStaticMethod_Ref_A(clsA, methodA, &valueAA, args), ANI_OK);
    CheckRefNum(env, valueAA);

    ani_ref valueBA = nullptr;
    ASSERT_EQ(env->Class_CallStaticMethod_Ref_A(clsB, methodB, &valueBA, args), ANI_OK);
    CheckRefUp(env, valueBA);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodRef_15([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodRef.A", &cls), ANI_OK);
    ani_static_method methodA;
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "funcA", "ii:C{std.core.String}", &methodA), ANI_OK);
    ani_static_method methodB;
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "funcA", "dd:d", &methodB), ANI_OK);

    ani_ref value = nullptr;
    ASSERT_EQ(env->Class_CallStaticMethod_Ref(cls, methodA, &value, VAL1, VAL2), ANI_OK);
    CheckRefNum(env, value);

    ani_value args[ARG_COUNT];
    args[0U].i = VAL1;
    args[1U].i = VAL2;
    ani_ref valueA = nullptr;
    ASSERT_EQ(env->Class_CallStaticMethod_Ref_A(cls, methodA, &valueA, args), ANI_OK);
    CheckRefNum(env, valueA);

    ani_double value2;
    ASSERT_EQ(env->Class_CallStaticMethod_Double(cls, methodB, &value2, VALR3, VALR4), ANI_OK);
    ASSERT_EQ(value2, VALR3 + VALR4);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodRef_16([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodRef.A", &cls), ANI_OK);
    ani_static_method method;
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "funcB", "ii:C{std.core.String}", &method), ANI_OK);

    ani_ref value = nullptr;
    ASSERT_EQ(env->Class_CallStaticMethod_Ref(cls, method, &value, VAL1, VAL2), ANI_OK);
    CheckRefNum(env, value);

    ani_value args[ARG_COUNT];
    args[0U].i = VAL1;
    args[1U].i = VAL2;
    ani_ref valueA = nullptr;
    ASSERT_EQ(env->Class_CallStaticMethod_Ref_A(cls, method, &valueA, args), ANI_OK);
    CheckRefNum(env, valueA);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodRef_17([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method {};
    GetMethodDataString(env, &cls, &method);

    ani_ref value = nullptr;
    ASSERT_EQ(env->c_api->Class_CallStaticMethod_Ref(nullptr, cls, method, &value, VAL1, VAL2), ANI_INVALID_ARGS);
    ani_value args[2U];
    args[0U].i = VAL1;
    args[1U].i = VAL2;
    ASSERT_EQ(env->c_api->Class_CallStaticMethod_Ref_A(nullptr, cls, method, &value, args), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodRef_18([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodRef.D", &cls), ANI_OK);
    ani_static_method method {};
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "funcA", "ii:C{std.core.String}", &method), ANI_OK);
    ani_ref value = nullptr;
    ASSERT_EQ(env->Class_CallStaticMethod_Ref(cls, method, &value, VAL1, VAL2), ANI_OK);
    CheckRefUp(env, value);

    ani_value args[2U];
    args[0U].i = VAL1;
    args[1U].i = VAL2;
    ani_ref valueA = nullptr;
    ASSERT_EQ(env->Class_CallStaticMethod_Ref_A(cls, method, &valueA, args), ANI_OK);
    CheckRefUp(env, valueA);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodRef_19([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    TestCombineSceneRef(env, "entry.src.main.src.ets.ClassOperationsMethodRef.C", VAL1, VAL2);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodRef_20([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    TestCombineSceneRef(env, "entry.src.main.src.ets.ClassOperationsMethodRef.E", VAL1, VAL2);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodRef_21([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodRef.F", &cls), ANI_OK);
    ani_static_method method1 {};
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "increment", nullptr, &method1), ANI_OK);
    ani_static_method method2 {};
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "getCount", nullptr, &method2), ANI_OK);
    ASSERT_EQ(env->Class_CallStaticMethod_Void(cls, method1, VAL1, VAL2), ANI_OK);
    ani_ref value = nullptr;
    ASSERT_EQ(env->Class_CallStaticMethod_Ref(cls, method2, &value), ANI_OK);
    CheckRefNum(env, value);

    ani_value args[2U];
    args[0U].i = VAL1;
    args[1U].i = VAL2;
    ani_ref valueA = nullptr;
    ASSERT_EQ(env->Class_CallStaticMethod_Ref_A(cls, method2, &valueA, args), ANI_OK);
    CheckRefNum(env, valueA);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodRef_22([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodRef.G", &cls), ANI_OK);
    ani_static_method method1 {};
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "publicMethod", "ii:C{std.core.String}", &method1), ANI_OK);
    ani_static_method method2 {};
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "callPrivateMethod", "ii:C{std.core.String}", &method2), ANI_OK);
    ani_ref value = nullptr;
    ASSERT_EQ(env->Class_CallStaticMethod_Ref(cls, method1, &value, VAL1, VAL2), ANI_OK);
    CheckRefNum(env, value);
    ASSERT_EQ(env->Class_CallStaticMethod_Ref(cls, method2, &value, VAL1, VAL2), ANI_OK);
    CheckRefUp(env, value);

    ani_value args[2U];
    args[0U].i = VAL1;
    args[1U].i = VAL2;
    ani_ref valueA = nullptr;
    ASSERT_EQ(env->Class_CallStaticMethod_Ref_A(cls, method1, &valueA, args), ANI_OK);
    CheckRefNum(env, valueA);
    ASSERT_EQ(env->Class_CallStaticMethod_Ref_A(cls, method2, &valueA, args), ANI_OK);
    CheckRefUp(env, valueA);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodDouble([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method;
    GetMethodDataDouble(env, &cls, &method);

    ani_double sum = 0.0;
    ASSERT_EQ(env->c_api->Class_CallStaticMethod_Double(env, cls, method, &sum, VALD1, VALD2), ANI_OK);
    ASSERT_EQ(sum, VALD1 + VALD2);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodDouble_01([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method;
    GetMethodDataDouble(env, &cls, &method);

    ani_double sum = 0.0;
    ASSERT_EQ(env->Class_CallStaticMethod_Double(cls, method, &sum, VALD1, VALD2), ANI_OK);
    ASSERT_EQ(sum, VALD1 + VALD2);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodDouble_02([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method;
    GetMethodDataDouble(env, &cls, &method);

    ani_value args[ARG_COUNT];
    args[0U].d = VALD1;
    args[1U].d = VALD2;

    ani_double sum = 0.0;
    ASSERT_EQ(env->Class_CallStaticMethod_Double_A(cls, method, &sum, args), ANI_OK);
    ASSERT_EQ(sum, VALD1 + VALD2);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodDouble_03([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method;
    GetMethodDataDouble(env, &cls, &method);

    ani_double sum = 0.0;
    ASSERT_EQ(env->Class_CallStaticMethod_Double(nullptr, method, &sum, VALD1, VALD2), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodDouble_04([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method;
    GetMethodDataDouble(env, &cls, &method);

    ani_double sum = 0.0;
    ASSERT_EQ(env->Class_CallStaticMethod_Double(cls, nullptr, &sum, VALD1, VALD2), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodDouble_05([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method;
    GetMethodDataDouble(env, &cls, &method);

    ASSERT_EQ(env->Class_CallStaticMethod_Double(cls, method, nullptr, VALD1, VALD2), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodDouble_06([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method;
    GetMethodDataDouble(env, &cls, &method);

    ani_value args[ARG_COUNT];
    args[0U].d = VALD1;
    args[1U].d = VALD2;

    ani_double sum = 0.0;
    ASSERT_EQ(env->Class_CallStaticMethod_Double_A(nullptr, method, &sum, args), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodDouble_07([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method;
    GetMethodDataDouble(env, &cls, &method);

    ani_value args[ARG_COUNT];
    args[0U].d = VALD1;
    args[1U].d = VALD2;

    ani_double sum = 0.0;
    ASSERT_EQ(env->Class_CallStaticMethod_Double_A(cls, nullptr, &sum, args), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodDouble_08([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method;
    GetMethodDataDouble(env, &cls, &method);

    ani_value args[ARG_COUNT];
    args[0U].d = VALD1;
    args[1U].d = VALD2;

    ASSERT_EQ(env->Class_CallStaticMethod_Double_A(cls, method, nullptr, args), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodDouble_09([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method;
    GetMethodDataDouble(env, &cls, &method);

    ani_double sum = 0.0;
    ASSERT_EQ(env->Class_CallStaticMethod_Double_A(cls, method, &sum, nullptr), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodDouble_10([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class clsA {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodDouble.A", &clsA), ANI_OK);
    ani_static_method methodA;
    ASSERT_EQ(env->Class_FindStaticMethod(clsA, "funcA", "dd:d", &methodA), ANI_OK);

    ani_class clsB {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodDouble.B", &clsB), ANI_OK);
    ani_static_method methodB;
    ASSERT_EQ(env->Class_FindStaticMethod(clsB, "funcB", "dd:d", &methodB), ANI_OK);

    ani_double valueA = 0.0;
    ASSERT_EQ(env->Class_CallStaticMethod_Double(clsA, methodA, &valueA, VALD1, VALD2), ANI_OK);
    ASSERT_EQ(valueA, VALD1 + VALD2);

    ani_double valueB = 0.0;
    ASSERT_EQ(env->Class_CallStaticMethod_Double(clsB, methodB, &valueB, VALD1, VALD2), ANI_OK);
    ASSERT_EQ(valueB, VALD2 - VALD1);

    ani_value args[ARG_COUNT];
    args[0U].d = VALD1;
    args[1U].d = VALD2;
    ani_double valueAA = 0.0;
    ASSERT_EQ(env->Class_CallStaticMethod_Double_A(clsA, methodA, &valueAA, args), ANI_OK);
    ASSERT_EQ(valueAA, VALD1 + VALD2);

    ani_double valueBA = 0.0;
    ASSERT_EQ(env->Class_CallStaticMethod_Double_A(clsB, methodB, &valueBA, args), ANI_OK);
    ASSERT_EQ(valueBA, VALD2 - VALD1);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodDouble_11([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodDouble.A", &cls), ANI_OK);
    ani_static_method methodA;
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "funcA", "dd:d", &methodA), ANI_OK);
    ani_static_method methodB;
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "funcA", "ii:i", &methodB), ANI_OK);

    ani_double value = 0.0;
    ASSERT_EQ(env->Class_CallStaticMethod_Double(cls, methodA, &value, VALD1, VALD2), ANI_OK);
    ASSERT_EQ(value, VALD1 + VALD2);

    ani_value args[ARG_COUNT];
    args[0U].d = VALD1;
    args[1U].d = VALD2;
    ani_double valueA = 0.0;
    ASSERT_EQ(env->Class_CallStaticMethod_Double_A(cls, methodA, &valueA, args), ANI_OK);
    ASSERT_EQ(valueA, VALD1 + VALD2);

    ani_int value2 = 0.0;
    ASSERT_EQ(env->Class_CallStaticMethod_Int(cls, methodB, &value2, VALD3, VALD3), ANI_OK);
    ASSERT_EQ(value2, VALD3 + VALD3);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodDouble_12([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodDouble.A", &cls), ANI_OK);
    ani_static_method method;
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "funcB", "dd:d", &method), ANI_OK);

    ani_double value = 0.0;
    ASSERT_EQ(env->Class_CallStaticMethod_Double(cls, method, &value, VALD1, VALD2), ANI_OK);
    ASSERT_EQ(value, VALD1 + VALD2);

    ani_value args[ARG_COUNT];
    args[0U].d = VALD1;
    args[1U].d = VALD2;
    ani_double valueA = 0.0;
    ASSERT_EQ(env->Class_CallStaticMethod_Double_A(cls, method, &valueA, args), ANI_OK);
    ASSERT_EQ(valueA, VALD1 + VALD2);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodDouble_13([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method;
    GetMethodDataDouble(env, &cls, &method);

    ani_double value = 0.0;
    ASSERT_EQ(env->c_api->Class_CallStaticMethod_Double(nullptr, cls, method, &value, VALD1, VALD2), ANI_INVALID_ARGS);
    ani_value args[ARG_COUNT];
    args[0U].d = VALD1;
    args[1U].d = VALD2;
    ASSERT_EQ(env->c_api->Class_CallStaticMethod_Double_A(nullptr, cls, method, &value, args), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodDouble_14([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    TestCombineSceneDouble(env, "entry.src.main.src.ets.ClassOperationsMethodDouble.C", VALD1, VALD2, VALD1 + VALD2);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodDouble_15([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    TestCombineSceneDouble(env, "entry.src.main.src.ets.ClassOperationsMethodDouble.D", VALD1, VALD2, VALD2 - VALD1);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodDouble_16([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    TestCombineSceneDouble(env, "entry.src.main.src.ets.ClassOperationsMethodDouble.E", VALD1, VALD2, VALD1 + VALD2);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodDouble_17([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodDouble.F", &cls), ANI_OK);
    ani_static_method method1 {};
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "increment", nullptr, &method1), ANI_OK);
    ani_static_method method2 {};
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "getCount", nullptr, &method2), ANI_OK);
    ASSERT_EQ(env->Class_CallStaticMethod_Void(cls, method1, VALD1, VALD2), ANI_OK);
    ani_double value = 0.0;
    ASSERT_EQ(env->Class_CallStaticMethod_Double(cls, method2, &value), ANI_OK);
    ASSERT_EQ(value, VALD1 + VALD2);

    ani_value args[ARG_COUNT];
    args[0U].d = VALD1;
    args[1U].d = VALD2;
    ani_double valueA = 0.0;
    ASSERT_EQ(env->Class_CallStaticMethod_Double_A(cls, method2, &valueA, args), ANI_OK);
    ASSERT_EQ(valueA, VALD1 + VALD2);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodDouble_18([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodDouble.G", &cls), ANI_OK);
    ani_static_method method1 {};
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "publicMethod", "dd:d", &method1), ANI_OK);
    ani_static_method method2 {};
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "callPrivateMethod", "dd:d", &method2), ANI_OK);
    ani_double value = 0.0;
    ASSERT_EQ(env->Class_CallStaticMethod_Double(cls, method1, &value, VALD1, VALD2), ANI_OK);
    ASSERT_EQ(value, VALD1 + VALD2);
    ASSERT_EQ(env->Class_CallStaticMethod_Double(cls, method2, &value, VALD1, VALD2), ANI_OK);
    ASSERT_EQ(value, VALD2 - VALD1);

    ani_value args[ARG_COUNT];
    args[0U].d = VALD1;
    args[1U].d = VALD2;
    ani_double valueA = 0.0;
    ASSERT_EQ(env->Class_CallStaticMethod_Double_A(cls, method1, &valueA, args), ANI_OK);
    ASSERT_EQ(valueA, VALD1 + VALD2);
    ASSERT_EQ(env->Class_CallStaticMethod_Double_A(cls, method2, &valueA, args), ANI_OK);
    ASSERT_EQ(valueA, VALD2 - VALD1);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodFloat([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method;
    GetMethodDataFloat(env, &cls, &method);

    ani_float sum = 0;
    ASSERT_EQ(env->c_api->Class_CallStaticMethod_Float(env, cls, method, &sum, FLOAT_VAL1, FLOAT_VAL2), ANI_OK);
    ASSERT_EQ(sum, FLOAT_VAL1 + FLOAT_VAL2);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodFloat_01([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method;
    GetMethodDataFloat(env, &cls, &method);

    ani_float sum = 0;
    ASSERT_EQ(env->Class_CallStaticMethod_Float(cls, method, &sum, FLOAT_VAL1, FLOAT_VAL2), ANI_OK);
    ASSERT_EQ(sum, FLOAT_VAL1 + FLOAT_VAL2);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodFloat_02([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method;
    GetMethodDataFloat(env, &cls, &method);

    ani_value args[ARG_COUNT];
    args[0U].f = FLOAT_VAL1;
    args[1U].f = FLOAT_VAL2;

    ani_float sum = 0;
    ASSERT_EQ(env->Class_CallStaticMethod_Float_A(cls, method, &sum, args), ANI_OK);
    ASSERT_EQ(sum, FLOAT_VAL1 + FLOAT_VAL2);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodFloat_03([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method;
    GetMethodDataFloat(env, &cls, &method);

    ani_float sum = 0;
    ASSERT_EQ(env->Class_CallStaticMethod_Float(nullptr, method, &sum, FLOAT_VAL1, FLOAT_VAL2), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodFloat_04([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method;
    GetMethodDataFloat(env, &cls, &method);

    ani_float sum = 0;
    ASSERT_EQ(env->Class_CallStaticMethod_Float(cls, nullptr, &sum, FLOAT_VAL1, FLOAT_VAL2), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodFloat_05([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method;
    GetMethodDataFloat(env, &cls, &method);

    ASSERT_EQ(env->Class_CallStaticMethod_Float(cls, method, nullptr, FLOAT_VAL1, FLOAT_VAL2), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodFloat_06([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method;
    GetMethodDataFloat(env, &cls, &method);

    ani_value args[ARG_COUNT];
    args[0U].f = FLOAT_VAL1;
    args[1U].f = FLOAT_VAL2;

    ani_float sum = 0;
    ASSERT_EQ(env->Class_CallStaticMethod_Float_A(nullptr, method, &sum, args), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodFloat_07([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method;
    GetMethodDataFloat(env, &cls, &method);

    ani_value args[ARG_COUNT];
    args[0U].f = FLOAT_VAL1;
    args[1U].f = FLOAT_VAL2;

    ani_float sum = 0;
    ASSERT_EQ(env->Class_CallStaticMethod_Float_A(cls, nullptr, &sum, args), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodFloat_08([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method;
    GetMethodDataFloat(env, &cls, &method);

    ani_value args[ARG_COUNT];
    args[0U].f = FLOAT_VAL1;
    args[1U].f = FLOAT_VAL2;

    ASSERT_EQ(env->Class_CallStaticMethod_Float_A(cls, method, nullptr, args), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodFloat_09([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method;
    GetMethodDataFloat(env, &cls, &method);

    ani_float sum = 0;
    ASSERT_EQ(env->Class_CallStaticMethod_Float_A(cls, method, &sum, nullptr), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodFloat_10([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class clsA {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodFloat.A", &clsA), ANI_OK);
    ani_static_method methodA;
    ASSERT_EQ(env->Class_FindStaticMethod(clsA, "funcA", "ff:f", &methodA), ANI_OK);

    ani_class clsB {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodFloat.B", &clsB), ANI_OK);
    ani_static_method methodB;
    ASSERT_EQ(env->Class_FindStaticMethod(clsB, "funcB", "ff:f", &methodB), ANI_OK);

    ani_float valueA = 0;
    ASSERT_EQ(env->Class_CallStaticMethod_Float(clsA, methodA, &valueA, FLOAT_VAL1, FLOAT_VAL2), ANI_OK);
    ASSERT_EQ(valueA, FLOAT_VAL1 + FLOAT_VAL2);

    ani_float valueB = 0;
    ASSERT_EQ(env->Class_CallStaticMethod_Float(clsB, methodB, &valueB, FLOAT_VAL1, FLOAT_VAL2), ANI_OK);
    ASSERT_EQ(valueB, FLOAT_VAL2 - FLOAT_VAL1);

    ani_value args[ARG_COUNT];
    args[0U].f = FLOAT_VAL1;
    args[1U].f = FLOAT_VAL2;
    ani_float valueAA = 0;
    ASSERT_EQ(env->Class_CallStaticMethod_Float_A(clsA, methodA, &valueAA, args), ANI_OK);
    ASSERT_EQ(valueAA, FLOAT_VAL1 + FLOAT_VAL2);

    ani_float valueBA = 0;
    ASSERT_EQ(env->Class_CallStaticMethod_Float_A(clsB, methodB, &valueBA, args), ANI_OK);
    ASSERT_EQ(valueBA, FLOAT_VAL2 - FLOAT_VAL1);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodFloat_11([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodFloat.A", &cls), ANI_OK);
    ani_static_method methodA;
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "funcA", "ff:f", &methodA), ANI_OK);
    ani_static_method methodB;
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "funcA", "ii:i", &methodB), ANI_OK);

    ani_float value = 0;
    ASSERT_EQ(env->Class_CallStaticMethod_Float(cls, methodA, &value, FLOAT_VAL1, FLOAT_VAL2), ANI_OK);
    ASSERT_EQ(value, FLOAT_VAL1 + FLOAT_VAL2);

    ani_value args[ARG_COUNT];
    args[0U].f = FLOAT_VAL1;
    args[1U].f = FLOAT_VAL2;
    ani_float valueA = 0;
    ASSERT_EQ(env->Class_CallStaticMethod_Float_A(cls, methodA, &valueA, args), ANI_OK);
    ASSERT_EQ(valueA, FLOAT_VAL1 + FLOAT_VAL2);

    ani_int value2 = 0;
    ASSERT_EQ(env->Class_CallStaticMethod_Int(cls, methodB, &value2, VALF1, VALF1), ANI_OK);
    ASSERT_EQ(value2, VALF1 + VALF1);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodFloat_12([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodFloat.A", &cls), ANI_OK);
    ani_static_method method;
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "funcB", "ff:f", &method), ANI_OK);

    ani_float value = 0;
    ASSERT_EQ(env->Class_CallStaticMethod_Float(cls, method, &value, FLOAT_VAL1, FLOAT_VAL2), ANI_OK);
    ASSERT_EQ(value, FLOAT_VAL1 + FLOAT_VAL2);

    ani_value args[ARG_COUNT];
    args[0U].f = FLOAT_VAL1;
    args[1U].f = FLOAT_VAL2;
    ani_float valueA = 0;
    ASSERT_EQ(env->Class_CallStaticMethod_Float_A(cls, method, &valueA, args), ANI_OK);
    ASSERT_EQ(valueA, FLOAT_VAL1 + FLOAT_VAL2);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodFloat_13([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method {};
    GetMethodDataFloat(env, &cls, &method);

    ani_float value = 0.0;
    ASSERT_EQ(env->c_api->Class_CallStaticMethod_Float(nullptr, cls, method, &value, FLOAT_VAL1, FLOAT_VAL2),
              ANI_INVALID_ARGS);
    ani_value args[2U];
    args[0U].f = FLOAT_VAL1;
    args[1U].f = FLOAT_VAL2;
    ASSERT_EQ(env->c_api->Class_CallStaticMethod_Float_A(nullptr, cls, method, &value, args), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodFloat_14([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    TestCombineSceneFloat(env,
        "entry.src.main.src.ets.ClassOperationsMethodFloat.C", FLOAT_VAL1, FLOAT_VAL2, FLOAT_VAL1 + FLOAT_VAL2);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodFloat_15([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    TestCombineSceneFloat(env,
        "entry.src.main.src.ets.ClassOperationsMethodFloat.D", FLOAT_VAL1, FLOAT_VAL2, FLOAT_VAL2 - FLOAT_VAL1);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodFloat_16([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    TestCombineSceneFloat(env,
        "entry.src.main.src.ets.ClassOperationsMethodFloat.E", FLOAT_VAL1, FLOAT_VAL2, FLOAT_VAL1 + FLOAT_VAL2);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodFloat_17([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodFloat.F", &cls), ANI_OK);
    ani_static_method method1 {};
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "increment", nullptr, &method1), ANI_OK);
    ani_static_method method2 {};
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "getCount", nullptr, &method2), ANI_OK);
    ASSERT_EQ(env->Class_CallStaticMethod_Void(cls, method1, FLOAT_VAL1, FLOAT_VAL2), ANI_OK);
    ani_float value = 0.0;
    ASSERT_EQ(env->Class_CallStaticMethod_Float(cls, method2, &value), ANI_OK);
    ASSERT_EQ(value, FLOAT_VAL1 + FLOAT_VAL2);

    ani_value args[2U];
    args[0U].f = FLOAT_VAL1;
    args[1U].f = FLOAT_VAL2;
    ani_float valueA = 0.0;
    ASSERT_EQ(env->Class_CallStaticMethod_Float_A(cls, method2, &valueA, args), ANI_OK);
    ASSERT_EQ(valueA, FLOAT_VAL1 + FLOAT_VAL2);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodFloat_18([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodFloat.G", &cls), ANI_OK);
    ani_static_method method1 {};
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "publicMethod", "ff:f", &method1), ANI_OK);
    ani_static_method method2 {};
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "callPrivateMethod", "ff:f", &method2), ANI_OK);
    ani_float value = 0.0;
    ASSERT_EQ(env->Class_CallStaticMethod_Float(cls, method1, &value, FLOAT_VAL1, FLOAT_VAL2), ANI_OK);
    ASSERT_EQ(value, FLOAT_VAL1 + FLOAT_VAL2);
    ASSERT_EQ(env->Class_CallStaticMethod_Float(cls, method2, &value, FLOAT_VAL1, FLOAT_VAL2), ANI_OK);
    ASSERT_EQ(value, FLOAT_VAL2 - FLOAT_VAL1);

    ani_value args[2U];
    args[0U].f = FLOAT_VAL1;
    args[1U].f = FLOAT_VAL2;
    ani_float valueA = 0.0;
    ASSERT_EQ(env->Class_CallStaticMethod_Float_A(cls, method1, &valueA, args), ANI_OK);
    ASSERT_EQ(valueA, FLOAT_VAL1 + FLOAT_VAL2);
    ASSERT_EQ(env->Class_CallStaticMethod_Float_A(cls, method2, &valueA, args), ANI_OK);
    ASSERT_EQ(valueA, FLOAT_VAL2 - FLOAT_VAL1);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodChar([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method;
    GetMethodDataChar(env, &cls, &method);

    ani_char value = '\0';
    char c = 'C' - 'A';
    ASSERT_EQ(env->c_api->Class_CallStaticMethod_Char(env, cls, method, &value, 'A', 'C'), ANI_OK);
    ASSERT_EQ(value, c);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodChar_01([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method;
    GetMethodDataChar(env, &cls, &method);

    ani_char value = '\0';
    char c = 'C' - 'A';
    ASSERT_EQ(env->Class_CallStaticMethod_Char(cls, method, &value, 'A', 'C'), ANI_OK);
    ASSERT_EQ(value, c);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodChar_02([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method;
    GetMethodDataChar(env, &cls, &method);

    ani_value args[ARG_COUNT];
    args[0U].c = 'A';
    args[1U].c = 'C';

    ani_char value = '\0';
    ASSERT_EQ(env->Class_CallStaticMethod_Char_A(cls, method, &value, args), ANI_OK);
    ASSERT_EQ(value, args[1U].c - args[0U].c);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodChar_03([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method;
    GetMethodDataChar(env, &cls, &method);

    ani_char value = '\0';
    ASSERT_EQ(env->c_api->Class_CallStaticMethod_Char(env, nullptr, method, &value, 'A', 'C'), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodChar_04([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method;
    GetMethodDataChar(env, &cls, &method);

    ani_char value = '\0';
    ASSERT_EQ(env->c_api->Class_CallStaticMethod_Char(env, cls, nullptr, &value, 'A', 'C'), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodChar_05([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method;
    GetMethodDataChar(env, &cls, &method);

    ASSERT_EQ(env->c_api->Class_CallStaticMethod_Char(env, cls, method, nullptr, 'A', 'C'), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodChar_06([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method;
    GetMethodDataChar(env, &cls, &method);

    ani_char value = '\0';
    ASSERT_EQ(env->Class_CallStaticMethod_Char(nullptr, method, &value, 'A', 'C'), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodChar_07([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method;
    GetMethodDataChar(env, &cls, &method);

    ani_char value = '\0';
    ASSERT_EQ(env->Class_CallStaticMethod_Char(cls, nullptr, &value, 'A', 'C'), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodChar_08([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method;
    GetMethodDataChar(env, &cls, &method);

    ASSERT_EQ(env->Class_CallStaticMethod_Char(cls, method, nullptr, 'A', 'C'), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodChar_09([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method;
    GetMethodDataChar(env, &cls, &method);

    ani_value args[ARG_COUNT];
    args[0U].c = 'A';
    args[1U].c = 'C';

    ani_char value = '\0';
    ASSERT_EQ(env->Class_CallStaticMethod_Char_A(nullptr, method, &value, args), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodChar_10([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method;
    GetMethodDataChar(env, &cls, &method);

    ani_value args[ARG_COUNT];
    args[0U].c = 'A';
    args[1U].c = 'C';

    ani_char value = '\0';
    ASSERT_EQ(env->Class_CallStaticMethod_Char_A(cls, nullptr, &value, args), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodChar_11([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method;
    GetMethodDataChar(env, &cls, &method);

    ani_value args[ARG_COUNT];
    args[0U].c = 'A';
    args[1U].c = 'C';

    ASSERT_EQ(env->Class_CallStaticMethod_Char_A(cls, method, nullptr, args), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodChar_12([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method;
    GetMethodDataChar(env, &cls, &method);

    ani_char value = '\0';
    ASSERT_EQ(env->Class_CallStaticMethod_Char_A(cls, method, &value, nullptr), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodChar_13([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class clsA {};
    ASSERT_NE(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodChar.A", &clsA), ANI_OK);
    ani_static_method methodA;
    ASSERT_NE(env->Class_FindStaticMethod(clsA, "funcA", "cc:c", &methodA), ANI_OK);

    ani_class clsB {};
    ASSERT_NE(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodChar.B", &clsB), ANI_OK);
    ani_static_method methodB;
    ASSERT_EQ(env->Class_FindStaticMethod(clsB, "funcB", "cc:c", &methodB), ANI_OK);

    ani_char valueA = '\0';
    ASSERT_EQ(env->Class_CallStaticMethod_Char(clsA, methodA, &valueA, 'A', 'C'), ANI_OK);
    ASSERT_EQ(valueA, 'C' - 'A');

    ani_char valueB = '\0';
    ASSERT_EQ(env->Class_CallStaticMethod_Char(clsB, methodB, &valueB, 'A', 'C'), ANI_OK);

    ASSERT_EQ(valueB, 'A' + 'C');

    ani_value args[ARG_COUNT];
    args[0U].c = 'A';
    args[1U].c = 'C';
    ani_char valueAA = '\0';
    ASSERT_EQ(env->Class_CallStaticMethod_Char_A(clsA, methodA, &valueAA, args), ANI_OK);
    ASSERT_EQ(valueAA, 'C' - 'A');

    ani_char valueBA = '\0';
    ASSERT_EQ(env->Class_CallStaticMethod_Char_A(clsB, methodB, &valueBA, args), ANI_OK);
    ASSERT_EQ(valueBA, 'A' + 'C');
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodChar_14([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodChar.A", &cls), ANI_OK);
    ani_static_method methodA;
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "funcA", "cc:c", &methodA), ANI_OK);
    ani_static_method methodB;
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "funcA", "ii:i", &methodB), ANI_OK);

    ani_char value = '\0';
    ASSERT_EQ(env->Class_CallStaticMethod_Char(cls, methodA, &value, 'A', 'C'), ANI_OK);
    ASSERT_EQ(value, 'C' - 'A');

    ani_value args[ARG_COUNT];
    args[0U].c = 'A';
    args[1U].c = 'C';
    ani_char valueA = '\0';
    ASSERT_EQ(env->Class_CallStaticMethod_Char_A(cls, methodA, &valueA, args), ANI_OK);
    ASSERT_EQ(valueA, 'C' - 'A');

    ani_int value2 = 0;
    ASSERT_EQ(env->Class_CallStaticMethod_Int(cls, methodB, &value2, 6U, 6U), ANI_OK);
    ASSERT_EQ(value2, 6U + 6U);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodChar_15([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodChar.A", &cls), ANI_OK);
    ani_static_method method;
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "funcB", "cc:c", &method), ANI_OK);

    ani_char value = '\0';
    ASSERT_EQ(env->Class_CallStaticMethod_Char(cls, method, &value, 'A', 'C'), ANI_OK);
    ASSERT_EQ(value, 'C' - 'A');

    ani_value args[ARG_COUNT];
    args[0U].c = 'A';
    args[1U].c = 'C';
    ani_char valueA = '\0';
    ASSERT_EQ(env->Class_CallStaticMethod_Char_A(cls, method, &valueA, args), ANI_OK);
    ASSERT_EQ(valueA, 'C' - 'A');
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodChar_16([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method {};
    GetMethodDataChar(env, &cls, &method);

    ani_char value = '\0';
    ASSERT_EQ(env->c_api->Class_CallStaticMethod_Char(nullptr, cls, method, &value, 'A', 'C'), ANI_INVALID_ARGS);
    ani_value args[2U];
    args[0U].c = 'A';
    args[1U].c = 'C';
    ASSERT_EQ(env->c_api->Class_CallStaticMethod_Char_A(nullptr, cls, method, &value, args), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodChar_17([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    TestCombineSceneChar(env, "entry.src.main.src.ets.ClassOperationsMethodChar.C", 'A', 'C', 'C' - 'A');
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodChar_18([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    TestCombineSceneChar(env, "entry.src.main.src.ets.ClassOperationsMethodChar.D", 'A', 'C', 'A' + 'C');
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodChar_19([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    TestCombineSceneChar(env, "entry.src.main.src.ets.ClassOperationsMethodChar.E", 'A', 'C', 'C' - 'A');
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodChar_20([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodChar.F", &cls), ANI_OK);
    ani_static_method method1 {};
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "increment", nullptr, &method1), ANI_OK);
    ani_static_method method2 {};
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "getCount", nullptr, &method2), ANI_OK);
    ASSERT_EQ(env->Class_CallStaticMethod_Void(cls, method1, 'A', 'C'), ANI_OK);
    ani_char value = '\0';
    ASSERT_EQ(env->Class_CallStaticMethod_Char(cls, method2, &value), ANI_OK);
    ASSERT_EQ(value, 'A' + 'C');

    ani_value args[2U];
    args[0U].c = 'A';
    args[1U].c = 'C';
    ani_char valueA = '\0';
    ASSERT_EQ(env->Class_CallStaticMethod_Char_A(cls, method2, &valueA, args), ANI_OK);
    ASSERT_EQ(valueA, 'A' + 'C');
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodChar_21([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodChar.G", &cls), ANI_OK);
    ani_static_method method1 {};
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "publicMethod", "cc:c", &method1), ANI_OK);
    ani_static_method method2 {};
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "callPrivateMethod", "cc:c", &method2), ANI_OK);
    ani_char value = '\0';
    ASSERT_EQ(env->Class_CallStaticMethod_Char(cls, method1, &value, 'A', 'C'), ANI_OK);
    ASSERT_EQ(value, 'A' + 'C');
    ASSERT_EQ(env->Class_CallStaticMethod_Char(cls, method2, &value, 'A', 'C'), ANI_OK);
    ASSERT_EQ(value, 'C' - 'A');

    ani_value args[2U];
    args[0U].c = 'A';
    args[1U].c = 'C';
    ani_char valueA = '\0';
    ASSERT_EQ(env->Class_CallStaticMethod_Char_A(cls, method1, &valueA, args), ANI_OK);
    ASSERT_EQ(valueA, 'A' + 'C');
    ASSERT_EQ(env->Class_CallStaticMethod_Char_A(cls, method2, &valueA, args), ANI_OK);
    ASSERT_EQ(valueA, 'C' - 'A');
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodVoid([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method voidMethod;
    ani_static_method getMethod;
    GetMethodDataVoid(env, &cls, &voidMethod, &getMethod);
    ani_int a = VAL1;
    ani_int b = VAL2;

    ani_int sum;
    ASSERT_EQ(env->c_api->Class_CallStaticMethod_Void(env, cls, voidMethod, a, b), ANI_OK);
    ASSERT_EQ(env->Class_CallStaticMethod_Int(cls, getMethod, &sum), ANI_OK);
    ASSERT_EQ(sum, a + b);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodVoid_01([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method voidMethod;
    ani_static_method getMethod;
    GetMethodDataVoid(env, &cls, &voidMethod, &getMethod);
    ani_int a = VAL1;
    ani_int b = VAL2;

    ani_int sum;
    ASSERT_EQ(env->Class_CallStaticMethod_Void(cls, voidMethod, a, b), ANI_OK);
    ASSERT_EQ(env->Class_CallStaticMethod_Int(cls, getMethod, &sum), ANI_OK);
    ASSERT_NE(sum, a + b);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodVoid_02([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method voidMethod;
    ani_static_method getMethod;
    GetMethodDataVoid(env, &cls, &voidMethod, &getMethod);
    ani_value args[ARG_COUNT];
    args[0U].i = VAL1;
    args[1U].i = VAL2;

    ani_int sum;
    ASSERT_EQ(env->Class_CallStaticMethod_Void_A(cls, voidMethod, args), ANI_OK);
    ASSERT_EQ(env->Class_CallStaticMethod_Int(cls, getMethod, &sum), ANI_OK);
    ASSERT_NE(sum, args[0U].i + args[1U].i);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodVoid_03([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method voidMethod;
    ani_static_method getMethod;
    GetMethodDataVoid(env, &cls, &voidMethod, &getMethod);
    ani_int a = VAL1;
    ani_int b = VAL2;

    ASSERT_EQ(env->c_api->Class_CallStaticMethod_Void(env, nullptr, voidMethod, a, b), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodVoid_04([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method voidMethod;
    ani_static_method getMethod;
    GetMethodDataVoid(env, &cls, &voidMethod, &getMethod);
    ani_int a = VAL1;
    ani_int b = VAL2;

    ASSERT_EQ(env->c_api->Class_CallStaticMethod_Void(env, cls, nullptr, a, b), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodVoid_05([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method voidMethod;
    ani_static_method getMethod;
    GetMethodDataVoid(env, &cls, &voidMethod, &getMethod);
    ani_int a = VAL1;
    ani_int b = VAL2;

    ASSERT_EQ(env->Class_CallStaticMethod_Void(nullptr, voidMethod, a, b), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodVoid_06([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method voidMethod;
    ani_static_method getMethod;
    GetMethodDataVoid(env, &cls, &voidMethod, &getMethod);
    ani_int a = VAL1;
    ani_int b = VAL2;

    ASSERT_EQ(env->Class_CallStaticMethod_Void(cls, nullptr, a, b), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodVoid_07([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method voidMethod;
    ani_static_method getMethod;
    GetMethodDataVoid(env, &cls, &voidMethod, &getMethod);
    ani_value args[ARG_COUNT];
    args[0U].i = VAL1;
    args[1U].i = VAL2;

    ASSERT_EQ(env->Class_CallStaticMethod_Void_A(nullptr, voidMethod, args), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodVoid_08([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method voidMethod;
    ani_static_method getMethod;
    GetMethodDataVoid(env, &cls, &voidMethod, &getMethod);
    ani_value args[ARG_COUNT];
    args[0U].i = VAL1;
    args[1U].i = VAL2;

    ASSERT_EQ(env->Class_CallStaticMethod_Void_A(cls, nullptr, args), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodVoid_09([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method voidMethod;
    ani_static_method getMethod;
    GetMethodDataVoid(env, &cls, &voidMethod, &getMethod);

    ASSERT_EQ(env->Class_CallStaticMethod_Void_A(cls, voidMethod, nullptr), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodVoid_10([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class clsA {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodVoid.A", &clsA), ANI_OK);
    ani_static_method methodA;
    ASSERT_EQ(env->Class_FindStaticMethod(clsA, "funcA", "ii:", &methodA), ANI_OK);
    ani_static_method getMethodA;
    ASSERT_EQ(env->Class_FindStaticMethod(clsA, "getCount", nullptr, &getMethodA), ANI_OK);
    ASSERT_NE(getMethodA, nullptr);

    ani_class clsB {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodVoid.B", &clsB), ANI_OK);
    ani_static_method methodB;
    ASSERT_EQ(env->Class_FindStaticMethod(clsB, "funcB", "ii:", &methodB), ANI_OK);
    ani_static_method getMethodB;
    ASSERT_EQ(env->Class_FindStaticMethod(clsB, "getCount", nullptr, &getMethodB), ANI_OK);
    ASSERT_NE(getMethodB, nullptr);

    ani_int valueA;
    ASSERT_EQ(env->Class_CallStaticMethod_Void(clsA, methodA, VAL1, VAL2), ANI_OK);
    GetCount(env, clsA, getMethodA, &valueA);
    ASSERT_EQ(valueA, VAL1 + VAL2);

    ani_int valueB;
    ASSERT_EQ(env->Class_CallStaticMethod_Void(clsB, methodB, VAL1, VAL2), ANI_OK);
    GetCount(env, clsB, getMethodB, &valueB);
    ASSERT_EQ(valueB, VAL2 - VAL1);

    ani_value args[ARG_COUNT];
    args[0U].i = VAL1;
    args[1U].i = VAL2;
    ani_int valueAA;
    ASSERT_EQ(env->Class_CallStaticMethod_Void_A(clsA, methodA, args), ANI_OK);
    GetCount(env, clsA, getMethodA, &valueAA);
    ASSERT_EQ(valueAA, valueA + VAL1 + VAL2);

    ani_int valueBA;
    ASSERT_EQ(env->Class_CallStaticMethod_Void_A(clsB, methodB, args), ANI_OK);
    GetCount(env, clsB, getMethodB, &valueBA);
    ASSERT_EQ(valueBA, valueB + VAL2 - VAL1);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodVoid_11([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodVoid.A", &cls), ANI_OK);
    ani_static_method methodA;
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "funcA", "ii:", &methodA), ANI_OK);
    ani_static_method methodB;
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "funcA", "dd:d", &methodB), ANI_OK);
    ani_static_method getMethod;
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "getCount", nullptr, &getMethod), ANI_OK);
    ASSERT_NE(getMethod, nullptr);

    ani_int value;
    ASSERT_EQ(env->Class_CallStaticMethod_Void(cls, methodA, VAL1, VAL2), ANI_OK);
    GetCount(env, cls, getMethod, &value);
    ASSERT_NE(value, VAL1 + VAL2);

    ani_value args[ARG_COUNT];
    args[0U].i = VAL1;
    args[1U].i = VAL2;
    ani_int valueA;
    ASSERT_EQ(env->Class_CallStaticMethod_Void_A(cls, methodA, args), ANI_OK);
    GetCount(env, cls, getMethod, &valueA);
    ASSERT_EQ(valueA, value + VAL1 + VAL2);

    ani_double value2;
    ASSERT_EQ(env->Class_CallStaticMethod_Double(cls, methodB, &value2, VALR3, VALR4), ANI_OK);
    ASSERT_EQ(value2, VALR3 + VALR4);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodVoid_12([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodVoid.A", &cls), ANI_OK);
    ani_static_method method;
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "funcB", "ii:", &method), ANI_OK);
    ani_static_method getMethod;
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "getCount", nullptr, &getMethod), ANI_OK);
    ASSERT_NE(getMethod, nullptr);

    ani_int value;
    ASSERT_EQ(env->Class_CallStaticMethod_Void(cls, method, VAL1, VAL2), ANI_OK);
    GetCount(env, cls, getMethod, &value);
    ASSERT_NE(value, VAL1 + VAL2);

    ani_value args[ARG_COUNT];
    args[0U].i = VAL1;
    args[1U].i = VAL2;
    ani_int valueA;
    ASSERT_EQ(env->Class_CallStaticMethod_Void_A(cls, method, args), ANI_OK);
    GetCount(env, cls, getMethod, &valueA);
    ASSERT_EQ(valueA, value + VAL1 + VAL2);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodVoid_13([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method voidMethod {};
    ani_static_method getMethod {};
    GetMethodDataVoid(env, &cls, &voidMethod, &getMethod);
    
    ASSERT_EQ(env->c_api->Class_CallStaticMethod_Void(nullptr, cls, voidMethod, VAL1, VAL2), ANI_INVALID_ARGS);
    ani_value args[2U];
    args[0U].i = VAL1;
    args[1U].i = VAL2;
    ASSERT_EQ(env->c_api->Class_CallStaticMethod_Void_A(nullptr, cls, getMethod, args), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodVoid_14([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ParaValInt val;
    val.val1 = VAL1;
    val.val2 = VAL2;
    TestCombineSceneVoid(env, "entry.src.main.src.ets.ClassOperationsMethodVoid.C", &val, VAL1 + VAL2);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodVoid_15([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ParaValInt val;
    val.val1 = VAL1;
    val.val2 = VAL2;
    TestCombineSceneVoid(env, "entry.src.main.src.ets.ClassOperationsMethodVoid.D", &val, VAL2 - VAL1, false);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodVoid_16([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ParaValInt val;
    val.val1 = VAL1;
    val.val2 = VAL2;
    TestCombineSceneVoid(env, "entry.src.main.src.ets.ClassOperationsMethodVoid.E", &val, VAL1 + VAL2);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodVoid_17([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodVoid.F", &cls), ANI_OK);
    ani_static_method method {};
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "increment", nullptr, &method), ANI_OK);
    ani_static_method getMethod {};
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "getCount", nullptr, &getMethod), ANI_OK);
    ASSERT_EQ(env->Class_CallStaticMethod_Void(cls, method, VAL1, VAL2), ANI_OK);
    ani_int value = 0;
    GetCount(env, cls, getMethod, &value);
    ASSERT_EQ(value, VAL1 + VAL2);

    ani_value args[2U];
    args[0U].i = VAL1;
    args[1U].i = VAL2;
    ASSERT_EQ(env->Class_CallStaticMethod_Void_A(cls, method, args), ANI_OK);
    ani_int valueA = 0;
    GetCount(env, cls, getMethod, &valueA);
    ASSERT_EQ(valueA, VAL1 + VAL2);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodVoid_18([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodVoid.G", &cls), ANI_OK);
    ani_static_method method1 {};
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "publicMethod", "ii:", &method1), ANI_OK);
    ani_static_method method2 {};
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "callPrivateMethod", "ii:", &method2), ANI_OK);
    ani_static_method getMethod {};
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "getCount", nullptr, &getMethod), ANI_OK);
    ani_int value = 0;
    ASSERT_EQ(env->Class_CallStaticMethod_Void(cls, method1, VAL1, VAL2), ANI_OK);
    GetCount(env, cls, getMethod, &value);
    ASSERT_EQ(value, VAL1 + VAL2);
    ASSERT_EQ(env->Class_CallStaticMethod_Void(cls, method2, VAL1, VAL2), ANI_OK);
    GetCount(env, cls, getMethod, &value);
    ASSERT_EQ(value, VAL2 - VAL1);

    ani_value args[2U];
    args[0U].i = VAL1;
    args[1U].i = VAL2;
    ani_int valueA = 0;
    ASSERT_EQ(env->Class_CallStaticMethod_Void_A(cls, method1, args), ANI_OK);
    GetCount(env, cls, getMethod, &valueA);
    ASSERT_EQ(valueA, VAL1 + VAL2);
    ASSERT_EQ(env->Class_CallStaticMethod_Void_A(cls, method2, args), ANI_OK);
    GetCount(env, cls, getMethod, &valueA);
    ASSERT_EQ(valueA, VAL2 - VAL1);
    return ANI_TRUE;
}

ani_boolean test_Class_FindField_00([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls;
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsFindField.Point", &cls), ANI_OK);

    ani_field fieldX;
    ASSERT_EQ(env->Class_FindField(cls, "x", &fieldX), ANI_OK);
    ASSERT_NE(fieldX, nullptr);

    ani_field fieldY;
    ASSERT_EQ(env->Class_FindField(cls, "y", &fieldY), ANI_OK);
    ASSERT_NE(fieldY, nullptr);

    ani_field fieldGetRadius;
    ASSERT_EQ(env->Class_FindField(cls, "getRadius", &fieldGetRadius), ANI_OK);
    ASSERT_NE(fieldGetRadius, nullptr);
    return ANI_TRUE;
}

ani_boolean test_Class_FindField_01([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls;
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsFindField.Point", &cls), ANI_OK);

    ani_field fieldZ = nullptr;
    ASSERT_EQ(env->Class_FindField(cls, "z", &fieldZ), ANI_NOT_FOUND);
    ASSERT_EQ(fieldZ, nullptr);
    return ANI_TRUE;
}

ani_boolean test_Class_FindField_02([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls;
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsFindField.ExtendedPoint", &cls), ANI_OK);

    ani_field fieldX;
    ASSERT_EQ(env->Class_FindField(cls, "x", &fieldX), ANI_OK);
    ASSERT_NE(fieldX, nullptr);

    ani_field fieldY;
    ASSERT_EQ(env->Class_FindField(cls, "y", &fieldY), ANI_OK);
    ASSERT_NE(fieldY, nullptr);

    ani_field fieldGetRadius;
    ASSERT_EQ(env->Class_FindField(cls, "getRadius", &fieldGetRadius), ANI_OK);
    ASSERT_NE(fieldGetRadius, nullptr);

    ani_field fieldZ;
    ASSERT_EQ(env->Class_FindField(cls, "z", &fieldZ), ANI_OK);
    ASSERT_NE(fieldZ, nullptr);
    return ANI_TRUE;
}

ani_boolean test_Class_FindField_03([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls;
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsFindField.Vector", &cls), ANI_OK);

    ani_field fieldP1;
    ASSERT_EQ(env->Class_FindField(cls, "p1", &fieldP1), ANI_OK);
    ASSERT_NE(fieldP1, nullptr);

    ani_field fieldP2;
    ASSERT_EQ(env->Class_FindField(cls, "p2", &fieldP2), ANI_OK);
    ASSERT_NE(fieldP2, nullptr);

    ani_field fieldLength;
    ASSERT_EQ(env->Class_FindField(cls, "length", &fieldLength), ANI_OK);
    ASSERT_NE(fieldLength, nullptr);
    return ANI_TRUE;
}

ani_boolean test_Class_FindField_04([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls;
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsFindField.Circle", &cls), ANI_OK);

    ani_field fieldPoints;
    ASSERT_EQ(env->Class_FindField(cls, "points", &fieldPoints), ANI_OK);
    ASSERT_NE(fieldPoints, nullptr);

    ani_field fieldVectors;
    ASSERT_EQ(env->Class_FindField(cls, "vectors", &fieldVectors), ANI_OK);
    ASSERT_NE(fieldVectors, nullptr);

    ani_field fieldRadius;
    ASSERT_EQ(env->Class_FindField(cls, "radius", &fieldRadius), ANI_OK);
    ASSERT_NE(fieldRadius, nullptr);

    ani_field fieldCenter;
    ASSERT_EQ(env->Class_FindField(cls, "center", &fieldCenter), ANI_OK);
    ASSERT_NE(fieldCenter, nullptr);
    return ANI_TRUE;
}

ani_boolean test_Class_FindField_05([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls;
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsFindField.Sphere", &cls), ANI_OK);

    ani_field fieldPoints;
    ASSERT_EQ(env->Class_FindField(cls, "points", &fieldPoints), ANI_OK);
    ASSERT_NE(fieldPoints, nullptr);

    ani_field fieldVectors;
    ASSERT_EQ(env->Class_FindField(cls, "vectors", &fieldVectors), ANI_OK);
    ASSERT_NE(fieldVectors, nullptr);

    ani_field fieldRadius;
    ASSERT_EQ(env->Class_FindField(cls, "radius", &fieldRadius), ANI_OK);
    ASSERT_NE(fieldRadius, nullptr);

    ani_field fieldCenter;
    ASSERT_EQ(env->Class_FindField(cls, "center", &fieldCenter), ANI_OK);
    ASSERT_NE(fieldCenter, nullptr);
    return ANI_TRUE;
}

ani_boolean test_Class_FindField_06([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls;
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsFindField.Space", &cls), ANI_OK);

    ani_field fieldObjects;
    ASSERT_EQ(env->Class_FindField(cls, "objects", &fieldObjects), ANI_OK);
    ASSERT_NE(fieldObjects, nullptr);

    ani_field fieldDimension;
    ASSERT_EQ(env->Class_FindField(cls, "dimension", &fieldDimension), ANI_OK);
    ASSERT_NE(fieldDimension, nullptr);

    ani_field fieldName;
    ASSERT_EQ(env->Class_FindField(cls, "name", &fieldName), ANI_OK);
    ASSERT_NE(fieldName, nullptr);
    return ANI_TRUE;
}

ani_boolean test_Class_FindField_07([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls;
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsFindField.UniversalFigureHandler", &cls), ANI_OK);

    ani_field fieldFigure;
    ASSERT_EQ(env->Class_FindField(cls, "figure", &fieldFigure), ANI_OK);
    ASSERT_NE(fieldFigure, nullptr);
    return ANI_TRUE;
}

ani_boolean test_Class_FindField_08([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls;
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsFindField.NamedSpaceHandler", &cls), ANI_OK);

    ani_field fieldSpace;
    ASSERT_EQ(env->Class_FindField(cls, "space", &fieldSpace), ANI_OK);
    ASSERT_NE(fieldSpace, nullptr);
    return ANI_TRUE;
}

ani_boolean test_Class_FindField_09([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_field field;
    ASSERT_EQ(env->Class_FindField(nullptr, "x", &field), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_FindField_10([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls;
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsFindField.Point", &cls), ANI_OK);

    ani_field field;
    ASSERT_EQ(env->Class_FindField(cls, nullptr, &field), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_FindField_11([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls;
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsFindField.Point", &cls), ANI_OK);

    ASSERT_EQ(env->Class_FindField(cls, "x", nullptr), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticField([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls;
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsFindStaticField.Singleton", &cls), ANI_OK);

    ani_static_field field;
    ASSERT_EQ(env->Class_FindStaticField(cls, "instance", &field), ANI_OK);
    ASSERT_NE(field, nullptr);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticField_01([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_static_field field;
    ASSERT_EQ(env->Class_FindStaticField(nullptr, "instance", &field), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticField_02([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls;
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsFindStaticField.Singleton", &cls), ANI_OK);

    ani_static_field field;
    ASSERT_EQ(env->Class_FindStaticField(cls, nullptr, &field), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticField_03([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls;
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsFindStaticField.Singleton", &cls), ANI_OK);

    ASSERT_EQ(env->Class_FindStaticField(cls, "instance", nullptr), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean GetClassData(ani_env *env, ani_class *clsResult)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodByName.Operations", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);
    *clsResult = cls;
    return ANI_TRUE;
}

ani_boolean TestFuncV1(ani_env *env, ani_class cls, const char *name, ani_boolean *value, ...)
{
    va_list args {};
    va_start(args, value);
    ASSERT_EQ(env->Class_CallStaticMethodByName_Boolean_V(cls, name, "zz:z", value, args), ANI_OK);
    va_end(args);
    return ANI_TRUE;
}

ani_boolean TestCombineSceneBoolean(ani_env *env, const char *className, const char *methodName, ani_boolean initValue,
                                    ani_boolean expectedValue)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass(className, &cls), ANI_OK);

    ani_boolean value = initValue;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Boolean(cls, methodName, "zz:z", &value, ANI_TRUE, ANI_FALSE),
              ANI_OK);
    ASSERT_EQ(value, expectedValue);

    ani_value args[2U];
    args[0U].z = ANI_TRUE;
    args[1U].z = ANI_FALSE;
    ani_boolean valueA = initValue;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Boolean_A(cls, methodName, "zz:z", &valueA, args), ANI_OK);
    ASSERT_EQ(valueA, expectedValue);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Bool_01([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    GetClassData(env, &cls);

    ani_boolean value = ANI_FALSE;
    ASSERT_EQ(env->c_api->Class_CallStaticMethodByName_Boolean(env, cls, "or", nullptr, &value, ANI_TRUE, ANI_FALSE),
              ANI_OK);
    ASSERT_EQ(value, ANI_TRUE);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Bool_02([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    GetClassData(env, &cls);

    ani_boolean value = ANI_FALSE;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Boolean(cls, "or", nullptr, &value, ANI_TRUE, ANI_FALSE), ANI_OK);
    ASSERT_EQ(value, ANI_TRUE);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Bool_03([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    GetClassData(env, &cls);

    ani_value args[2U];
    args[0U].z = ANI_TRUE;
    args[1U].z = ANI_FALSE;
    ani_boolean value = ANI_FALSE;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Boolean_A(cls, "or", nullptr, &value, args), ANI_OK);
    ASSERT_EQ(value, ANI_TRUE);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Bool_04([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_boolean value = ANI_FALSE;
    ASSERT_EQ(
        env->c_api->Class_CallStaticMethodByName_Boolean(env, nullptr, "or", nullptr, &value, ANI_TRUE, ANI_FALSE),
        ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Bool_05([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    GetClassData(env, &cls);

    ani_boolean value = ANI_FALSE;
    ASSERT_EQ(
        env->c_api->Class_CallStaticMethodByName_Boolean(env, cls, nullptr, nullptr, &value, ANI_TRUE, ANI_FALSE),
        ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Bool_06([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    GetClassData(env, &cls);

    ani_boolean value = ANI_FALSE;
    ASSERT_EQ(env->c_api->Class_CallStaticMethodByName_Boolean(env, cls, "aa", nullptr, &value, ANI_TRUE, ANI_FALSE),
              ANI_NOT_FOUND);
    ASSERT_EQ(env->Class_CallStaticMethodByName_Boolean(cls, "", nullptr, &value, ANI_TRUE, ANI_FALSE), ANI_NOT_FOUND);
    ASSERT_EQ(env->Class_CallStaticMethodByName_Boolean(cls, "\n", nullptr, &value, ANI_TRUE, ANI_FALSE),
              ANI_NOT_FOUND);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Bool_07([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    GetClassData(env, &cls);

    ASSERT_EQ(env->c_api->Class_CallStaticMethodByName_Boolean(env, cls, "or", nullptr, nullptr, ANI_TRUE, ANI_FALSE),
              ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Bool_08([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_boolean value = ANI_FALSE;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Boolean(nullptr, "or", nullptr, &value, ANI_TRUE, ANI_FALSE),
              ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Bool_09([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    GetClassData(env, &cls);

    ani_boolean value = ANI_FALSE;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Boolean(cls, nullptr, nullptr, &value, ANI_TRUE, ANI_FALSE),
              ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Bool_10([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    GetClassData(env, &cls);

    ani_boolean value = ANI_FALSE;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Boolean(cls, "aa", nullptr, &value, ANI_TRUE, ANI_FALSE),
              ANI_NOT_FOUND);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Bool_11([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    GetClassData(env, &cls);

    ASSERT_EQ(env->Class_CallStaticMethodByName_Boolean(cls, "or", nullptr, nullptr, ANI_TRUE, ANI_FALSE),
              ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Bool_12([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_value args[2U];
    args[0U].z = ANI_TRUE;
    args[1U].z = ANI_FALSE;

    ani_boolean value = ANI_FALSE;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Boolean_A(nullptr, "or", nullptr, &value, args), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Bool_13([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    GetClassData(env, &cls);

    ani_value args[2U];
    args[0U].z = ANI_TRUE;
    args[1U].z = ANI_FALSE;

    ani_boolean value = ANI_FALSE;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Boolean_A(cls, nullptr, nullptr, &value, args), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Bool_14([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    GetClassData(env, &cls);

    ani_value args[2U];
    args[0U].z = ANI_TRUE;
    args[1U].z = ANI_FALSE;

    ani_boolean value = ANI_FALSE;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Boolean_A(cls, "aa", nullptr, &value, args), ANI_NOT_FOUND);
    ASSERT_EQ(env->Class_CallStaticMethodByName_Boolean_A(cls, "", nullptr, &value, args), ANI_NOT_FOUND);
    ASSERT_EQ(env->Class_CallStaticMethodByName_Boolean_A(cls, "\n", nullptr, &value, args), ANI_NOT_FOUND);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Bool_15([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    GetClassData(env, &cls);

    ani_value args[2U];
    args[0U].z = ANI_TRUE;
    args[1U].z = ANI_FALSE;

    ASSERT_EQ(env->Class_CallStaticMethodByName_Boolean_A(cls, "or", nullptr, nullptr, args), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Bool_16([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    GetClassData(env, &cls);
    ani_boolean value = ANI_FALSE;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Boolean_A(cls, "or", nullptr, &value, nullptr), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Bool_21([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    GetClassData(env, &cls);

    ani_boolean value = ANI_FALSE;
    ASSERT_EQ(
        env->c_api->Class_CallStaticMethodByName_Boolean(nullptr, cls, "or", nullptr, &value, ANI_TRUE, ANI_FALSE),
        ANI_INVALID_ARGS);
    ani_value args[2U];
    args[0U].z = ANI_TRUE;
    args[1U].z = ANI_FALSE;
    ASSERT_EQ(env->c_api->Class_CallStaticMethodByName_Boolean_A(nullptr, cls, "or", nullptr, &value, args),
              ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Bool_22([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class clsA {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodByName.A", &clsA), ANI_OK);
    ani_class clsB {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodByName.B", &clsB), ANI_OK);

    ani_boolean valueA = ANI_FALSE;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Boolean(clsA, "funcA", "zz:z", &valueA, ANI_TRUE, ANI_FALSE), ANI_OK);
    ASSERT_EQ(valueA, ANI_TRUE);
    ani_boolean valueB = ANI_TRUE;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Boolean(clsB, "funcB", "zz:z", &valueB, ANI_TRUE, ANI_FALSE), ANI_OK);
    ASSERT_EQ(valueB, ANI_FALSE);

    ani_value args[2U];
    args[0U].z = ANI_TRUE;
    args[1U].z = ANI_FALSE;
    ani_boolean valueAA = ANI_FALSE;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Boolean_A(clsA, "funcA", "zz:z", &valueAA, args), ANI_OK);
    ASSERT_EQ(valueAA, ANI_TRUE);
    ani_boolean valueBA = ANI_TRUE;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Boolean_A(clsB, "funcB", "zz:z", &valueBA, args), ANI_OK);
    ASSERT_EQ(valueBA, ANI_FALSE);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Bool_23([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodByName.A", &cls), ANI_OK);
    ani_boolean value = ANI_FALSE;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Boolean(cls, "funcA", "zz:z", &value, ANI_TRUE, ANI_FALSE), ANI_OK);
    ASSERT_EQ(value, ANI_TRUE);

    ani_value args[2U];
    args[0U].z = ANI_TRUE;
    args[1U].z = ANI_FALSE;
    ani_boolean valueA = ANI_FALSE;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Boolean_A(cls, "funcA", "zz:z", &valueA, args), ANI_OK);
    ASSERT_EQ(valueA, ANI_TRUE);

    ani_int value2 = 0;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Int(cls, "funcA", "ii:i", &value2, VAL1, VAL2), ANI_OK);
    ASSERT_EQ(value2, VAL1 + VAL2);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Bool_24([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    TestCombineSceneBoolean(env, "entry.src.main.src.ets.ClassOperationsMethodByName.A", "funcB", ANI_FALSE, ANI_TRUE);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Bool_25([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    TestCombineSceneBoolean(env, "entry.src.main.src.ets.ClassOperationsMethodByName.C", "funcA", ANI_FALSE, ANI_TRUE);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Bool_26([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    TestCombineSceneBoolean(env, "entry.src.main.src.ets.ClassOperationsMethodByName.D", "funcA", ANI_TRUE, ANI_FALSE);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Bool_27([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    TestCombineSceneBoolean(env, "entry.src.main.src.ets.ClassOperationsMethodByName.E", "funcA", ANI_FALSE, ANI_TRUE);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Bool_28([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodByName.F", &cls), ANI_OK);
    ASSERT_EQ(env->Class_CallStaticMethodByName_Void(cls, "increment", nullptr, ANI_TRUE, ANI_FALSE), ANI_OK);
    ani_boolean value = ANI_TRUE;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Boolean(cls, "getCount", nullptr, &value), ANI_OK);
    ASSERT_EQ(value, ANI_FALSE);

    ani_value args[2U];
    args[0U].z = ANI_TRUE;
    args[1U].z = ANI_FALSE;
    ani_boolean valueA = ANI_TRUE;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Boolean_A(cls, "getCount", nullptr, &valueA, args), ANI_OK);
    ASSERT_EQ(valueA, ANI_FALSE);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Bool_29([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodByName.G", &cls), ANI_OK);
    ani_boolean value = ANI_FALSE;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Boolean(cls, "publicMethod", "zz:z", &value, ANI_TRUE, ANI_FALSE),
              ANI_OK);
    ASSERT_EQ(value, ANI_TRUE);
    ASSERT_EQ(env->Class_CallStaticMethodByName_Boolean(cls, "callPrivateMethod", "zz:z", &value, ANI_TRUE, ANI_FALSE),
              ANI_OK);
    ASSERT_EQ(value, ANI_FALSE);

    ani_value args[2U];
    args[0U].z = ANI_TRUE;
    args[1U].z = ANI_FALSE;
    ani_boolean valueA = ANI_FALSE;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Boolean_A(cls, "publicMethod", "zz:z", &valueA, args), ANI_OK);
    ASSERT_EQ(valueA, ANI_TRUE);
    ASSERT_EQ(env->Class_CallStaticMethodByName_Boolean_A(cls, "callPrivateMethod", "zz:z", &valueA, args), ANI_OK);
    ASSERT_EQ(valueA, ANI_FALSE);
    return ANI_TRUE;
}

ani_boolean GetClassDataByte(ani_env *env, ani_class *clsResult)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodByName.Operations1", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);
    *clsResult = cls;
    return ANI_TRUE;
}
ani_boolean TestFuncV2(ani_env *env, ani_class cls, const char *name, ani_byte *value, ...)
{
    va_list args {};
    va_start(args, value);
    ASSERT_EQ(env->Class_CallStaticMethodByName_Byte_V(cls, name, "bb:b", value, args), ANI_OK);
    va_end(args);
    return ANI_TRUE;
}

ani_boolean TestCombineSceneTestByte(ani_env *env, const char *className, const char *methodName,
                                     const char *signature, ani_byte expectedValue)
{
    const ani_int val1 = 5;
    const ani_int val2 = 6;
    ani_class cls {};
    ASSERT_EQ(env->FindClass(className, &cls), ANI_OK);

    ani_byte value = 0;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Byte(cls, methodName, signature, &value, val1, val2), ANI_OK);
    ASSERT_EQ(value, expectedValue);

    ani_value args[2U];
    args[0U].b = val1;
    args[1U].b = val2;
    ani_byte valueA = 0;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Byte_A(cls, methodName, signature, &valueA, args), ANI_OK);
    ASSERT_EQ(valueA, expectedValue);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Byte_01([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_int val1 = 5;
    const ani_int val2 = 6;
    ani_class cls {};
    GetClassDataByte(env, &cls);

    ani_byte value = 0;
    ASSERT_EQ(env->c_api->Class_CallStaticMethodByName_Byte(env, cls, "sum", nullptr, &value, val1, val2), ANI_OK);
    ASSERT_EQ(value, val1 + val2);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Byte_02([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    GetClassDataByte(env, &cls);

    const ani_int val1 = 5;
    const ani_int val2 = 6;
    ani_byte value = 0;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Byte(cls, "sum", nullptr, &value, val1, val2), ANI_OK);
    ASSERT_EQ(value, val1 + val2);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Byte_03([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_int val1 = 5;
    const ani_int val2 = 6;
    ani_class cls {};
    GetClassDataByte(env, &cls);

    ani_value args[2U];
    args[0U].b = val1;
    args[1U].b = val2;

    ani_byte value = 0;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Byte_A(cls, "sum", nullptr, &value, args), ANI_OK);
    ASSERT_EQ(value, val1 + val2);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Byte_04([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_int val1 = 5;
    const ani_int val2 = 6;
    ani_byte value = 0;
    ASSERT_EQ(env->c_api->Class_CallStaticMethodByName_Byte(env, nullptr, "sum", nullptr, &value, val1, val2),
              ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Byte_05([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_int val1 = 5;
    const ani_int val2 = 6;
    ani_class cls {};
    GetClassDataByte(env, &cls);

    ani_byte value = 0;
    ASSERT_EQ(env->c_api->Class_CallStaticMethodByName_Byte(env, cls, nullptr, nullptr, &value, val1, val2),
              ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Byte_06([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    GetClassDataByte(env, &cls);
    const ani_int val1 = 5;
    const ani_int val2 = 6;
    ani_byte value = 0;
    ASSERT_EQ(env->c_api->Class_CallStaticMethodByName_Byte(env, cls, "aa", nullptr, &value, val1, val2),
              ANI_NOT_FOUND);
    ASSERT_EQ(env->Class_CallStaticMethodByName_Byte(cls, "", nullptr, &value, val1, val2), ANI_NOT_FOUND);
    ASSERT_EQ(env->Class_CallStaticMethodByName_Byte(cls, "\n", nullptr, &value, val1, val2), ANI_NOT_FOUND);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Byte_07([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    GetClassDataByte(env, &cls);
    const ani_int val1 = 5;
    const ani_int val2 = 6;
    ASSERT_EQ(env->c_api->Class_CallStaticMethodByName_Byte(env, cls, "sum", nullptr, nullptr, val1, val2),
              ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Byte_08([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_int val1 = 5;
    const ani_int val2 = 6;
    ani_byte value = 0;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Byte(nullptr, "sum", nullptr, &value, val1, val2), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Byte_09([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    GetClassDataByte(env, &cls);
    const ani_int val1 = 5;
    const ani_int val2 = 6;
    ani_byte value = 0;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Byte(cls, nullptr, nullptr, &value, val1, val2), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Byte_10([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    GetClassDataByte(env, &cls);
    const ani_int val1 = 5;
    const ani_int val2 = 6;
    ani_byte value = 0;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Byte(cls, "aa", nullptr, &value, val1, val2), ANI_NOT_FOUND);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Byte_11([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    GetClassDataByte(env, &cls);
    const ani_int val1 = 5;
    const ani_int val2 = 6;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Byte(cls, "sum", nullptr, nullptr, val1, val2), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Byte_12([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_int val1 = 5;
    const ani_int val2 = 6;
    ani_value args[2U];
    args[0U].b = val1;
    args[1U].b = val2;
    ani_byte value = 0;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Byte_A(nullptr, "sum", nullptr, &value, args), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Byte_13([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    GetClassDataByte(env, &cls);
    const ani_int val1 = 5;
    const ani_int val2 = 6;
    ani_value args[2U];
    args[0U].b = val1;
    args[1U].b = val2;
    ani_byte value = 0;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Byte_A(cls, nullptr, nullptr, &value, args), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Byte_14([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    GetClassDataByte(env, &cls);
    const ani_int val1 = 5;
    const ani_int val2 = 6;
    ani_value args[2U];
    args[0U].b = val1;
    args[1U].b = val2;
    ani_byte value = 0;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Byte_A(cls, "aa", nullptr, &value, args), ANI_NOT_FOUND);
    ASSERT_EQ(env->Class_CallStaticMethodByName_Byte_A(cls, "", nullptr, &value, args), ANI_NOT_FOUND);
    ASSERT_EQ(env->Class_CallStaticMethodByName_Byte_A(cls, "\n", nullptr, &value, args), ANI_NOT_FOUND);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Byte_15([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    GetClassDataByte(env, &cls);
    const ani_int val1 = 5;
    const ani_int val2 = 6;
    ani_value args[2U];
    args[0U].b = val1;
    args[1U].b = val2;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Byte_A(cls, "sum", nullptr, nullptr, args), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Byte_16([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    GetClassDataByte(env, &cls);

    ani_byte value = 0;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Byte_A(cls, "sum", nullptr, &value, nullptr), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Byte_21([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    GetClassDataByte(env, &cls);
    const ani_int val1 = 5;
    const ani_int val2 = 6;
    ani_byte value = 0;
    ASSERT_EQ(env->c_api->Class_CallStaticMethodByName_Byte(nullptr, cls, "or", nullptr, &value, val1, val2),
              ANI_INVALID_ARGS);
    ani_value args[2U];
    args[0U].b = val1;
    args[1U].b = val2;
    ASSERT_EQ(env->c_api->Class_CallStaticMethodByName_Byte_A(nullptr, cls, "or", nullptr, &value, args),
              ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Byte_22([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class clsA {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodByName.A1", &clsA), ANI_OK);
    ani_class clsB {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodByName.B1", &clsB), ANI_OK);
    const ani_int val1 = 5;
    const ani_int val2 = 6;
    ani_byte valueA = 0;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Byte(clsA, "funcA", "bb:b", &valueA, val1, val2), ANI_OK);
    ASSERT_EQ(valueA, val1 + val2);
    ani_byte valueB = 0;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Byte(clsB, "funcB", "bb:b", &valueB, val1, val2), ANI_OK);
    ASSERT_EQ(valueB, val2 - val1);

    ani_value args[2U];
    args[0U].b = val1;
    args[1U].b = val2;
    ani_byte valueAA = 0;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Byte_A(clsA, "funcA", "bb:b", &valueAA, args), ANI_OK);
    ASSERT_EQ(valueAA, val1 + val2);
    ani_byte valueBA = 0;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Byte_A(clsB, "funcB", "bb:b", &valueBA, args), ANI_OK);
    ASSERT_EQ(valueBA, val2 - val1);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Byte_23([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_int val1 = 5;
    const ani_int val2 = 6;
    TestCombineSceneTestByte(env, "entry.src.main.src.ets.ClassOperationsMethodByName.A1", "funcA", "bb:b",
                             val1 + val2);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Byte_24([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_int val1 = 5;
    const ani_int val2 = 6;
    TestCombineSceneTestByte(env, "entry.src.main.src.ets.ClassOperationsMethodByName.A1", "funcB", "bb:b",
                             val1 + val2);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Byte_25([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_int val1 = 5;
    const ani_int val2 = 6;
    TestCombineSceneTestByte(env, "entry.src.main.src.ets.ClassOperationsMethodByName.C1", "funcA", "bb:b",
                             val1 + val2);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Byte_26([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_int val1 = 5;
    const ani_int val2 = 6;
    TestCombineSceneTestByte(env, "entry.src.main.src.ets.ClassOperationsMethodByName.D1", "funcA", "bb:b",
                             val1 - val2);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Byte_27([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_int val1 = 5;
    const ani_int val2 = 6;
    TestCombineSceneTestByte(env, "entry.src.main.src.ets.ClassOperationsMethodByName.E1", "funcA", "bb:b",
                             val1 + val2);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Byte_28([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_int val1 = 5;
    const ani_int val2 = 6;
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodByName.F1", &cls), ANI_OK);
    ASSERT_EQ(env->Class_CallStaticMethodByName_Void(cls, "increment", nullptr, val1, val2), ANI_OK);
    ani_byte value = 0;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Byte(cls, "getCount", nullptr, &value), ANI_OK);
    ASSERT_EQ(value, val1 + val2);

    ani_value args[2U];
    args[0U].b = val1;
    args[1U].b = val2;
    ani_byte valueA = 0;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Byte_A(cls, "getCount", nullptr, &valueA, args), ANI_OK);
    ASSERT_EQ(valueA, val1 + val2);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Byte_29([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_int val1 = 5;
    const ani_int val2 = 6;
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodByName.G1", &cls), ANI_OK);
    ani_byte value = 0;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Byte(cls, "publicMethod", "bb:b", &value, val1, val2), ANI_OK);
    ASSERT_EQ(value, val1 + val2);
    ASSERT_EQ(env->Class_CallStaticMethodByName_Byte(cls, "callPrivateMethod", "bb:b", &value, val1, val2), ANI_OK);
    ASSERT_EQ(value, val2 - val1);

    ani_value args[2U];
    args[0U].b = val1;
    args[1U].b = val2;
    ani_byte valueA = 0;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Byte_A(cls, "publicMethod", "bb:b", &valueA, args), ANI_OK);
    ASSERT_EQ(valueA, val1 + val2);
    ASSERT_EQ(env->Class_CallStaticMethodByName_Byte_A(cls, "callPrivateMethod", "bb:b", &valueA, args), ANI_OK);
    ASSERT_EQ(valueA, val2 - val1);
    return ANI_TRUE;
}

ani_boolean GetClassDataChar(ani_env *env, ani_class *clsResult)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodByName.Operations3", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);
    *clsResult = cls;
    return ANI_TRUE;
}
ani_boolean TestFuncV3(ani_env *env, ani_class cls, const char *name, ani_char *value, ...)
{
    va_list args {};
    va_start(args, value);
    ASSERT_EQ(env->Class_CallStaticMethodByName_Char_V(cls, name, "cc:c", value, args), ANI_OK);
    va_end(args);
    return ANI_TRUE;
}

typedef struct ParaVal {
    ani_char val1;
    ani_char val2;
} ParaVal;

ani_boolean TestCombineSceneOfChar(ani_env *env, const char *className, const char *methodName,
                                   ParaVal *val, ani_char expectedValue)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass(className, &cls), ANI_OK);

    ani_char value = '\0';
    ASSERT_EQ(env->Class_CallStaticMethodByName_Char(cls, methodName, "cc:c", &value, val->val1, val->val2), ANI_OK);
    ASSERT_EQ(value, expectedValue);

    ani_value args[2U];
    args[0U].c = val->val1;
    args[1U].c = val->val2;
    ani_char valueA = '\0';
    ASSERT_EQ(env->Class_CallStaticMethodByName_Char_A(cls, methodName, "cc:c", &valueA, args), ANI_OK);
    ASSERT_EQ(valueA, expectedValue);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Char_01([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    GetClassDataChar(env, &cls);

    ani_char value = '\0';
    char c = 'C' - 'A';
    ASSERT_EQ(env->c_api->Class_CallStaticMethodByName_Char(env, cls, "sub", "cc:c", &value, 'A', 'C'), ANI_OK);
    ASSERT_EQ(value, c);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Char_02([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    GetClassDataChar(env, &cls);

    ani_char value = '\0';
    char c = 'C' - 'A';
    ASSERT_EQ(env->Class_CallStaticMethodByName_Char(cls, "sub", "cc:c", &value, 'A', 'C'), ANI_OK);
    ASSERT_EQ(value, c);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Char_03([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    GetClassDataChar(env, &cls);

    ani_value args[2U];
    args[0U].c = 'A';
    args[1U].c = 'C';

    ani_char value = '\0';
    ASSERT_EQ(env->Class_CallStaticMethodByName_Char_A(cls, "sub", "cc:c", &value, args), ANI_OK);
    ASSERT_EQ(value, args[1U].c - args[0U].c);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Char_04([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    GetClassDataChar(env, &cls);

    ani_char value = '\0';
    ASSERT_EQ(env->c_api->Class_CallStaticMethodByName_Char(env, cls, "sub", "cc:i", &value, 'A', 'C'),
              ANI_NOT_FOUND);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Char_05([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_char value = '\0';
    ASSERT_EQ(env->c_api->Class_CallStaticMethodByName_Char(env, nullptr, "sub", nullptr, &value, 'A', 'C'),
              ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Char_06([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    GetClassDataChar(env, &cls);

    ani_char value = '\0';
    ASSERT_EQ(env->c_api->Class_CallStaticMethodByName_Char(env, cls, nullptr, nullptr, &value, 'A', 'C'),
              ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Char_07([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    GetClassDataChar(env, &cls);

    ani_char value = '\0';
    ASSERT_EQ(env->c_api->Class_CallStaticMethodByName_Char(env, cls, "aa", nullptr, &value, 'A', 'C'),
              ANI_NOT_FOUND);
    ASSERT_EQ(env->Class_CallStaticMethodByName_Char(cls, "", nullptr, &value, 'A', 'C'), ANI_NOT_FOUND);
    ASSERT_EQ(env->Class_CallStaticMethodByName_Char(cls, "\n", nullptr, &value, 'A', 'C'), ANI_NOT_FOUND);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Char_08([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    GetClassDataChar(env, &cls);

    ASSERT_EQ(env->c_api->Class_CallStaticMethodByName_Char(env, cls, "sub", nullptr, nullptr, 'A', 'C'),
              ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Char_09([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    GetClassDataChar(env, &cls);

    ani_char value = '\0';
    ASSERT_EQ(env->Class_CallStaticMethodByName_Char(cls, "sub", "cc:i", &value, 'A', 'C'), ANI_NOT_FOUND);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Char_10([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_char value = '\0';
    ASSERT_EQ(env->Class_CallStaticMethodByName_Char(nullptr, "sub", nullptr, &value, 'A', 'C'), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Char_11([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    GetClassDataChar(env, &cls);

    ani_char value = '\0';
    ASSERT_EQ(env->Class_CallStaticMethodByName_Char(cls, nullptr, nullptr, &value, 'A', 'C'), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Char_12([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    GetClassDataChar(env, &cls);

    ani_char value = '\0';
    ASSERT_EQ(env->Class_CallStaticMethodByName_Char(cls, "aa", nullptr, &value, 'A', 'C'), ANI_NOT_FOUND);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Char_13([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    GetClassDataChar(env, &cls);

    ASSERT_EQ(env->Class_CallStaticMethodByName_Char(cls, "sub", nullptr, nullptr, 'A', 'C'), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Char_14([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    GetClassDataChar(env, &cls);

    ani_value args[2U];
    args[0U].c = 'A';
    args[1U].c = 'C';

    ani_char value = '\0';
    ASSERT_EQ(env->Class_CallStaticMethodByName_Char_A(cls, "sub", "cc:i", &value, args), ANI_NOT_FOUND);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Char_15([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_value args[2U];
    args[0U].c = 'A';
    args[1U].c = 'C';
    ani_char value = '\0';
    ASSERT_EQ(env->Class_CallStaticMethodByName_Char_A(nullptr, "sub", nullptr, &value, args), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Char_16([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    GetClassDataChar(env, &cls);

    ani_value args[2U];
    args[0U].c = 'A';
    args[1U].c = 'C';
    ani_char value = '\0';
    ASSERT_EQ(env->Class_CallStaticMethodByName_Char_A(cls, nullptr, nullptr, &value, args), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Char_17([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    GetClassDataChar(env, &cls);

    ani_value args[2U];
    args[0U].c = 'A';
    args[1U].c = 'C';
    ani_char value = '\0';
    ASSERT_EQ(env->Class_CallStaticMethodByName_Char_A(cls, "aa", nullptr, &value, args), ANI_NOT_FOUND);
    ASSERT_EQ(env->Class_CallStaticMethodByName_Char_A(cls, "", nullptr, &value, args), ANI_NOT_FOUND);
    ASSERT_EQ(env->Class_CallStaticMethodByName_Char_A(cls, "\n", nullptr, &value, args), ANI_NOT_FOUND);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Char_18([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    GetClassDataChar(env, &cls);

    ani_value args[2U];
    args[0U].c = 'A';
    args[1U].c = 'C';
    ASSERT_EQ(env->Class_CallStaticMethodByName_Char_A(cls, "sub", nullptr, nullptr, args), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Char_19([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    GetClassDataChar(env, &cls);

    ani_char value = '\0';
    ASSERT_EQ(env->Class_CallStaticMethodByName_Char_A(cls, "sub", nullptr, &value, nullptr), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Char_24([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    GetClassDataChar(env, &cls);

    ani_char value = '\0';
    ASSERT_EQ(env->c_api->Class_CallStaticMethodByName_Char(nullptr, cls, "or", nullptr, &value, 'A', 'C'),
              ANI_INVALID_ARGS);
    ani_value args[2U];
    args[0U].c = 'A';
    args[1U].c = 'C';
    ASSERT_EQ(env->c_api->Class_CallStaticMethodByName_Char_A(nullptr, cls, "or", nullptr, &value, args),
              ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Char_25([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class clsA {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodByName.A3", &clsA), ANI_OK);
    ani_class clsB {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodByName.B3", &clsB), ANI_OK);

    ani_char valueA = '\0';
    ASSERT_EQ(env->Class_CallStaticMethodByName_Char(clsA, "funcA", "cc:c", &valueA, 'A', 'C'), ANI_OK);
    ASSERT_EQ(valueA, 'C' - 'A');
    ani_char valueB = '\0';
    ASSERT_EQ(env->Class_CallStaticMethodByName_Char(clsB, "funcB", "cc:c", &valueB, 'A', 'C'), ANI_OK);
    ASSERT_EQ(valueB, 'A' + 'C');

    ani_value args[2U];
    args[0U].c = 'A';
    args[1U].c = 'C';
    ani_char valueAA = '\0';
    ASSERT_EQ(env->Class_CallStaticMethodByName_Char_A(clsA, "funcA", "cc:c", &valueAA, args), ANI_OK);
    ASSERT_EQ(valueAA, 'C' - 'A');
    ani_char valueBA = '\0';
    ASSERT_EQ(env->Class_CallStaticMethodByName_Char_A(clsB, "funcB", "cc:c", &valueBA, args), ANI_OK);
    ASSERT_EQ(valueBA, 'A' + 'C');
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Char_26([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodByName.A3", &cls), ANI_OK);
    ani_char value = '\0';
    ASSERT_EQ(env->Class_CallStaticMethodByName_Char(cls, "funcA", "cc:c", &value, 'A', 'C'), ANI_OK);
    ASSERT_EQ(value, 'C' - 'A');

    ani_value args[2U];
    args[0U].c = 'A';
    args[1U].c = 'C';
    ani_char valueA = '\0';
    ASSERT_EQ(env->Class_CallStaticMethodByName_Char_A(cls, "funcA", "cc:c", &valueA, args), ANI_OK);
    ASSERT_EQ(valueA, 'C' - 'A');

    ani_int value2 = 0;
    const ani_int value3 = 4;
    const ani_int value4 = 7;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Int(cls, "funcA", "ii:i", &value2, value3, value4), ANI_OK);
    ASSERT_EQ(value2, value3 + value4);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Char_27([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ParaVal val;
    val.val1 = 'A';
    val.val2 = 'C';
    TestCombineSceneOfChar(env, "entry.src.main.src.ets.ClassOperationsMethodByName.A3", "funcB", &val, 'C' - 'A');
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Char_28([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ParaVal val;
    val.val1 = 'A';
    val.val2 = 'C';
    TestCombineSceneOfChar(env, "entry.src.main.src.ets.ClassOperationsMethodByName.C3", "funcA", &val, 'C' - 'A');
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Char_29([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ParaVal val;
    val.val1 = 'A';
    val.val2 = 'C';
    TestCombineSceneOfChar(env, "entry.src.main.src.ets.ClassOperationsMethodByName.D3", "funcA", &val, 'A' + 'C');
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Char_30([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ParaVal val;
    val.val1 = 'A';
    val.val2 = 'C';
    TestCombineSceneOfChar(env, "entry.src.main.src.ets.ClassOperationsMethodByName.E3", "funcA", &val, 'C' - 'A');
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Char_31([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodByName.F3", &cls), ANI_OK);
    ASSERT_EQ(env->Class_CallStaticMethodByName_Void(cls, "increment", nullptr, 'A', 'C'), ANI_OK);
    ani_char value = '\0';
    ASSERT_EQ(env->Class_CallStaticMethodByName_Char(cls, "getCount", nullptr, &value), ANI_OK);
    ASSERT_EQ(value, 'A' + 'C');

    ani_value args[2U];
    args[0U].c = 'A';
    args[1U].c = 'C';
    ani_char valueA = '\0';
    ASSERT_EQ(env->Class_CallStaticMethodByName_Char_A(cls, "getCount", nullptr, &valueA, args), ANI_OK);
    ASSERT_EQ(valueA, 'A' + 'C');
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Char_32([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodByName.G3", &cls), ANI_OK);
    ani_char value = '\0';
    ASSERT_EQ(env->Class_CallStaticMethodByName_Char(cls, "publicMethod", "cc:c", &value, 'A', 'C'), ANI_OK);
    ASSERT_EQ(value, 'A' + 'C');
    ASSERT_EQ(env->Class_CallStaticMethodByName_Char(cls, "callPrivateMethod", "cc:c", &value, 'A', 'C'), ANI_OK);
    ASSERT_EQ(value, 'C' - 'A');

    ani_value args[2U];
    args[0U].c = 'A';
    args[1U].c = 'C';
    ani_char valueA = '\0';
    ASSERT_EQ(env->Class_CallStaticMethodByName_Char_A(cls, "publicMethod", "cc:c", &valueA, args), ANI_OK);
    ASSERT_EQ(valueA, 'A' + 'C');
    ASSERT_EQ(env->Class_CallStaticMethodByName_Char_A(cls, "callPrivateMethod", "cc:c", &valueA, args), ANI_OK);
    ASSERT_EQ(valueA, 'C' - 'A');
    return ANI_TRUE;
}

ani_boolean GetMethodDataOfDouble(ani_env *env, ani_class *clsResult)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodByName.Operations4", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);
    *clsResult = cls;
    return ANI_TRUE;
}

ani_boolean TestFuncV4(ani_env *env, ani_class cls, const char *name, ani_double *value, ...)
{
    va_list args {};
    va_start(args, value);
    ASSERT_EQ(env->Class_CallStaticMethodByName_Double_V(cls, name, "dd:d", value, args), ANI_OK);
    va_end(args);
    return ANI_TRUE;
}

ani_boolean TestCombineSceneOfDouble(ani_env *env, const char *className,
                                     const char *methodName, ani_double expectedValue)
{
    const ani_double val1 = 1.5;
    const ani_double val2 = 2.5;
    ani_class cls {};
    ASSERT_EQ(env->FindClass(className, &cls), ANI_OK);

    ani_double value = 0.0;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Double(cls, methodName, "dd:d", &value, val1, val2), ANI_OK);
    ASSERT_EQ(value, expectedValue);

    ani_value args[2U];
    args[0U].d = val1;
    args[1U].d = val2;
    ani_double valueA = 0.0;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Double_A(cls, methodName, "dd:d", &valueA, args), ANI_OK);
    ASSERT_EQ(valueA, expectedValue);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Double_01([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_double val1 = 1.5;
    const ani_double val2 = 2.5;
    ani_class cls {};
    GetMethodDataOfDouble(env, &cls);

    ani_double sum = 0.0;
    ASSERT_EQ(env->c_api->Class_CallStaticMethodByName_Double(env, cls, "sum", nullptr, &sum, val1, val2), ANI_OK);
    ASSERT_EQ(sum, val1 + val2);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Double_02([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_double val1 = 1.5;
    const ani_double val2 = 2.5;
    ani_class cls {};
    GetMethodDataOfDouble(env, &cls);

    ani_double sum = 0.0;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Double(cls, "sum", nullptr, &sum, val1, val2), ANI_OK);
    ASSERT_EQ(sum, val1 + val2);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Double_03([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_double val1 = 1.5;
    const ani_double val2 = 2.5;
    ani_class cls {};
    GetMethodDataOfDouble(env, &cls);

    ani_value args[ARG_COUNT];
    args[0U].d = val1;
    args[1U].d = val2;

    ani_double sum = 0.0;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Double_A(cls, "sum", nullptr, &sum, args), ANI_OK);
    ASSERT_EQ(sum, val1 + val2);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Double_04([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_double val1 = 1.5;
    const ani_double val2 = 2.5;
    ani_double sum = 0.0;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Double(nullptr, "sum", nullptr, &sum, val1, val2), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Double_05([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_double val1 = 1.5;
    const ani_double val2 = 2.5;
    ani_class cls {};
    GetMethodDataOfDouble(env, &cls);

    ani_double sum = 0.0;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Double(cls, nullptr, nullptr, &sum, val1, val2), ANI_INVALID_ARGS);
    ASSERT_EQ(env->Class_CallStaticMethodByName_Double(cls, "sum_not_exist", nullptr, &sum, val1, val2),
              ANI_NOT_FOUND);
    ASSERT_EQ(env->Class_CallStaticMethodByName_Double(cls, "", nullptr, &sum, val1, val2), ANI_NOT_FOUND);
    ASSERT_EQ(env->Class_CallStaticMethodByName_Double(cls, "\n", nullptr, &sum, val1, val2), ANI_NOT_FOUND);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Double_06([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_double val1 = 1.5;
    const ani_double val2 = 2.5;
    ani_class cls {};
    GetMethodDataOfDouble(env, &cls);

    ASSERT_EQ(env->Class_CallStaticMethodByName_Double(cls, "sum", nullptr, nullptr, val1, val2), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Double_07([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_double val1 = 1.5;
    const ani_double val2 = 2.5;
    ani_value args[ARG_COUNT];
    args[0U].d = val1;
    args[1U].d = val2;

    ani_double sum = 0.0;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Double_A(nullptr, "sum", nullptr, &sum, args), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Double_08([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_double val1 = 1.5;
    const ani_double val2 = 2.5;
    ani_class cls {};
    GetMethodDataOfDouble(env, &cls);

    ani_value args[ARG_COUNT];
    args[0U].d = val1;
    args[1U].d = val2;

    ani_double sum = 0.0;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Double_A(cls, nullptr, nullptr, &sum, args), ANI_INVALID_ARGS);
    ASSERT_EQ(env->Class_CallStaticMethodByName_Double_A(cls, "sum_not_exist", nullptr, &sum, args), ANI_NOT_FOUND);
    ASSERT_EQ(env->Class_CallStaticMethodByName_Double_A(cls, "", nullptr, &sum, args), ANI_NOT_FOUND);
    ASSERT_EQ(env->Class_CallStaticMethodByName_Double_A(cls, "\n", nullptr, &sum, args), ANI_NOT_FOUND);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Double_09([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_double val1 = 1.5;
    const ani_double val2 = 2.5;
    ani_class cls {};
    GetMethodDataOfDouble(env, &cls);

    ani_value args[ARG_COUNT];
    args[0U].d = val1;
    args[1U].d = val2;

    ASSERT_EQ(env->Class_CallStaticMethodByName_Double_A(cls, "sum", nullptr, nullptr, args), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Double_10([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    GetMethodDataOfDouble(env, &cls);

    ani_double sum = 0.0;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Double_A(cls, "sum", nullptr, &sum, nullptr), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Double_15([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_double val1 = 1.5;
    const ani_double val2 = 2.5;
    ani_class cls {};
    GetMethodDataOfDouble(env, &cls);

    ani_double value = 0.0;
    ASSERT_EQ(env->c_api->Class_CallStaticMethodByName_Double(nullptr, cls, "or", nullptr, &value, val1, val2),
              ANI_INVALID_ARGS);
    ani_value args[2U];
    args[0U].d = val1;
    args[1U].d = val2;
    ASSERT_EQ(env->c_api->Class_CallStaticMethodByName_Double_A(nullptr, cls, "or", nullptr, &value, args),
              ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Double_16([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_double val1 = 1.5;
    const ani_double val2 = 2.5;
    ani_class clsA {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodByName.A4", &clsA), ANI_OK);
    ani_class clsB {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodByName.B4", &clsB), ANI_OK);

    ani_double valueA = 0.0;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Double(clsA, "funcA", "dd:d", &valueA, val1, val2), ANI_OK);
    ASSERT_EQ(valueA, val1 + val2);
    ani_double valueB = 0.0;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Double(clsB, "funcB", "dd:d", &valueB, val1, val2), ANI_OK);
    ASSERT_EQ(valueB, val2 - val1);

    ani_value args[2U];
    args[0U].d = val1;
    args[1U].d = val2;
    ani_double valueAA = 0.0;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Double_A(clsA, "funcA", "dd:d", &valueAA, args), ANI_OK);
    ASSERT_EQ(valueAA, val1 + val2);
    ani_double valueBA = 0.0;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Double_A(clsB, "funcB", "dd:d", &valueBA, args), ANI_OK);
    ASSERT_EQ(valueBA, val2 - val1);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Double_17([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_double val1 = 1.5;
    const ani_double val2 = 2.5;
    const ani_int val3 = 5;
    const ani_int val4 = 6;
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodByName.A4", &cls), ANI_OK);
    ani_double value = 0.0;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Double(cls, "funcA", "dd:d", &value, val1, val2), ANI_OK);
    ASSERT_EQ(value, val1 + val2);

    ani_value args[2U];
    args[0U].d = val1;
    args[1U].d = val2;
    ani_double valueA = 0.0;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Double_A(cls, "funcA", "dd:d", &valueA, args), ANI_OK);
    ASSERT_EQ(valueA, val1 + val2);

    ani_int value2 = 0;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Int(cls, "funcA", "ii:i", &value2, val3, val4), ANI_OK);
    ASSERT_EQ(value2, val3 + val4);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Double_18([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_double val1 = 1.5;
    const ani_double val2 = 2.5;
    TestCombineSceneOfDouble(env, "entry.src.main.src.ets.ClassOperationsMethodByName.A4", "funcB", val1 + val2);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Double_19([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_double val1 = 1.5;
    const ani_double val2 = 2.5;
    TestCombineSceneOfDouble(env, "entry.src.main.src.ets.ClassOperationsMethodByName.C4", "funcA", val1 + val2);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Double_20([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_double val1 = 1.5;
    const ani_double val2 = 2.5;
    TestCombineSceneOfDouble(env, "entry.src.main.src.ets.ClassOperationsMethodByName.D4", "funcA", val2 - val1);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Double_21([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_double val1 = 1.5;
    const ani_double val2 = 2.5;
    TestCombineSceneOfDouble(env, "entry.src.main.src.ets.ClassOperationsMethodByName.E4", "funcA", val1 + val2);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Double_22([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_double val1 = 1.5;
    const ani_double val2 = 2.5;
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodByName.F4", &cls), ANI_OK);
    ASSERT_EQ(env->Class_CallStaticMethodByName_Void(cls, "increment", nullptr, val1, val2), ANI_OK);
    ani_double value = 0.0;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Double(cls, "getCount", nullptr, &value), ANI_OK);
    ASSERT_EQ(value, val1 + val2);

    ani_value args[2U];
    args[0U].d = val1;
    args[1U].d = val2;
    ani_double valueA = 0.0;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Double_A(cls, "getCount", nullptr, &valueA, args), ANI_OK);
    ASSERT_EQ(valueA, val1 + val2);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Double_23([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_double val1 = 1.5;
    const ani_double val2 = 2.5;
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodByName.G4", &cls), ANI_OK);
    ani_double value = 0.0;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Double(cls, "publicMethod", "dd:d", &value, val1, val2), ANI_OK);
    ASSERT_EQ(value, val1 + val2);
    ASSERT_EQ(env->Class_CallStaticMethodByName_Double(cls, "callPrivateMethod", "dd:d", &value, val1, val2), ANI_OK);
    ASSERT_EQ(value, val2 - val1);

    ani_value args[2U];
    args[0U].d = val1;
    args[1U].d = val2;
    ani_double valueA = 0.0;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Double_A(cls, "publicMethod", "dd:d", &valueA, args), ANI_OK);
    ASSERT_EQ(valueA, val1 + val2);
    ASSERT_EQ(env->Class_CallStaticMethodByName_Double_A(cls, "callPrivateMethod", "dd:d", &valueA, args), ANI_OK);
    ASSERT_EQ(valueA, val2 - val1);
    return ANI_TRUE;
}

ani_boolean GetMethodDataOfFloat(ani_env *env, ani_class *clsResult)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodByName.Operations5", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);
    *clsResult = cls;
    return ANI_TRUE;
}

ani_boolean TestFuncV5(ani_env *env, ani_class cls, const char *name, ani_float *value, ...)
{
    va_list args {};
    va_start(args, value);
    ASSERT_EQ(env->Class_CallStaticMethodByName_Float_V(cls, name, "ff:f", value, args), ANI_OK);
    va_end(args);
    return ANI_TRUE;
}

ani_boolean TestCombineSceneOfFloat(ani_env *env, const char *className,
                                    const char *methodName, ani_float expectedValue)
{
    const ani_float FLOAT_VAL1 = 1.5F;
    const ani_float FLOAT_VAL2 = 2.5F;
    ani_class cls {};
    ASSERT_EQ(env->FindClass(className, &cls), ANI_OK);

    ani_float value = 0.0;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Float(cls, methodName, "ff:f", &value, FLOAT_VAL1, FLOAT_VAL2),
              ANI_OK);
    ASSERT_EQ(value, expectedValue);

    ani_value args[2U];
    args[0U].f = FLOAT_VAL1;
    args[1U].f = FLOAT_VAL2;
    ani_float valueA = 0.0;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Float_A(cls, methodName, "ff:f", &valueA, args), ANI_OK);
    ASSERT_EQ(valueA, expectedValue);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Float_01([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_float FLOAT_VAL1 = 1.5F;
    const ani_float FLOAT_VAL2 = 2.5F;
    ani_class cls {};
    GetMethodDataOfFloat(env, &cls);

    ani_float sum {};
    ASSERT_EQ(env->c_api->Class_CallStaticMethodByName_Float(env, cls, "sum", nullptr, &sum, FLOAT_VAL1, FLOAT_VAL2),
              ANI_OK);
    ASSERT_EQ(sum, FLOAT_VAL1 + FLOAT_VAL2);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Float_02([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_float FLOAT_VAL1 = 1.5F;
    const ani_float FLOAT_VAL2 = 2.5F;
    ani_class cls {};
    GetMethodDataOfFloat(env, &cls);

    ani_float sum {};
    ASSERT_EQ(env->Class_CallStaticMethodByName_Float(cls, "sum", nullptr, &sum, FLOAT_VAL1, FLOAT_VAL2), ANI_OK);
    ASSERT_EQ(sum, FLOAT_VAL1 + FLOAT_VAL2);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Float_03([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_float FLOAT_VAL1 = 1.5F;
    const ani_float FLOAT_VAL2 = 2.5F;
    ani_class cls {};
    GetMethodDataOfFloat(env, &cls);

    ani_value args[ARG_COUNT];
    args[0U].f = FLOAT_VAL1;
    args[1U].f = FLOAT_VAL2;

    ani_float sum {};
    ASSERT_EQ(env->Class_CallStaticMethodByName_Float_A(cls, "sum", nullptr, &sum, args), ANI_OK);
    ASSERT_EQ(sum, FLOAT_VAL1 + FLOAT_VAL2);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Float_04([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_float FLOAT_VAL1 = 1.5F;
    const ani_float FLOAT_VAL2 = 2.5F;
    ani_float sum {};
    ASSERT_EQ(env->Class_CallStaticMethodByName_Float(nullptr, "sum", nullptr, &sum, FLOAT_VAL1, FLOAT_VAL2),
              ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Float_05([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_float FLOAT_VAL1 = 1.5F;
    const ani_float FLOAT_VAL2 = 2.5F;
    ani_class cls {};
    GetMethodDataOfFloat(env, &cls);

    ani_float sum {};
    ASSERT_EQ(env->Class_CallStaticMethodByName_Float(cls, nullptr, nullptr, &sum, FLOAT_VAL1, FLOAT_VAL2),
              ANI_INVALID_ARGS);
    ASSERT_EQ(env->Class_CallStaticMethodByName_Float(cls, "sum_not_exist", nullptr, &sum, FLOAT_VAL1, FLOAT_VAL2),
              ANI_NOT_FOUND);
    ASSERT_EQ(env->Class_CallStaticMethodByName_Float(cls, "", nullptr, &sum, FLOAT_VAL1, FLOAT_VAL2), ANI_NOT_FOUND);
    ASSERT_EQ(env->Class_CallStaticMethodByName_Float(cls, "\n", nullptr, &sum, FLOAT_VAL1, FLOAT_VAL2),
              ANI_NOT_FOUND);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Float_06([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_float FLOAT_VAL1 = 1.5F;
    const ani_float FLOAT_VAL2 = 2.5F;
    ani_class cls {};
    GetMethodDataOfFloat(env, &cls);

    ASSERT_EQ(env->Class_CallStaticMethodByName_Float(cls, "sum", nullptr, nullptr, FLOAT_VAL1, FLOAT_VAL2),
              ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Float_07([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_float FLOAT_VAL1 = 1.5F;
    const ani_float FLOAT_VAL2 = 2.5F;
    ani_value args[ARG_COUNT];
    args[0U].f = FLOAT_VAL1;
    args[1U].f = FLOAT_VAL2;

    ani_float sum {};
    ASSERT_EQ(env->Class_CallStaticMethodByName_Float_A(nullptr, "sum", nullptr, &sum, args), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Float_08([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_float FLOAT_VAL1 = 1.5F;
    const ani_float FLOAT_VAL2 = 2.5F;
    ani_class cls {};
    GetMethodDataOfFloat(env, &cls);

    ani_value args[ARG_COUNT];
    args[0U].f = FLOAT_VAL1;
    args[1U].f = FLOAT_VAL2;

    ani_float sum {};
    ASSERT_EQ(env->Class_CallStaticMethodByName_Float_A(cls, nullptr, nullptr, &sum, args), ANI_INVALID_ARGS);
    ASSERT_EQ(env->Class_CallStaticMethodByName_Float_A(cls, "sum_not_exist", nullptr, &sum, args), ANI_NOT_FOUND);
    ASSERT_EQ(env->Class_CallStaticMethodByName_Float_A(cls, "", nullptr, &sum, args), ANI_NOT_FOUND);
    ASSERT_EQ(env->Class_CallStaticMethodByName_Float_A(cls, "\n", nullptr, &sum, args), ANI_NOT_FOUND);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Float_09([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_float FLOAT_VAL1 = 1.5F;
    const ani_float FLOAT_VAL2 = 2.5F;
    ani_class cls {};
    GetMethodDataOfFloat(env, &cls);

    ani_value args[ARG_COUNT];
    args[0U].f = FLOAT_VAL1;
    args[1U].f = FLOAT_VAL2;

    ASSERT_EQ(env->Class_CallStaticMethodByName_Float_A(cls, "sum", nullptr, nullptr, args), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Float_10([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    GetMethodDataOfFloat(env, &cls);

    ani_float sum {};
    ASSERT_EQ(env->Class_CallStaticMethodByName_Float_A(cls, "sum", nullptr, &sum, nullptr), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Float_15([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_float FLOAT_VAL1 = 1.5F;
    const ani_float FLOAT_VAL2 = 2.5F;
    ani_class cls {};
    GetMethodDataOfFloat(env, &cls);

    ani_float value = 0.0;
    ASSERT_EQ(
        env->c_api->Class_CallStaticMethodByName_Float(nullptr, cls, "or", nullptr, &value, FLOAT_VAL1, FLOAT_VAL2),
        ANI_INVALID_ARGS);
    ani_value args[2U];
    args[0U].f = FLOAT_VAL1;
    args[1U].f = FLOAT_VAL2;
    ASSERT_EQ(env->c_api->Class_CallStaticMethodByName_Float_A(nullptr, cls, "or", nullptr, &value, args),
              ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Float_16([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_float FLOAT_VAL1 = 1.5F;
    const ani_float FLOAT_VAL2 = 2.5F;
    ani_class clsA {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodByName.A5", &clsA), ANI_OK);
    ani_class clsB {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodByName.B5", &clsB), ANI_OK);

    ani_float valueA = 0.0;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Float(clsA, "funcA", "ff:f", &valueA, FLOAT_VAL1, FLOAT_VAL2), ANI_OK);
    ASSERT_EQ(valueA, FLOAT_VAL1 + FLOAT_VAL2);

    ani_float valueB = 0.0;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Float(clsB, "funcB", "ff:f", &valueB, FLOAT_VAL1, FLOAT_VAL2), ANI_OK);
    ASSERT_EQ(valueB, FLOAT_VAL2 - FLOAT_VAL1);

    ani_value args[2U];
    args[0U].f = FLOAT_VAL1;
    args[1U].f = FLOAT_VAL2;
    ani_float valueAA = 0.0;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Float_A(clsA, "funcA", "ff:f", &valueAA, args), ANI_OK);
    ASSERT_EQ(valueAA, FLOAT_VAL1 + FLOAT_VAL2);
    ani_float valueBA = 0.0;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Float_A(clsB, "funcB", "ff:f", &valueBA, args), ANI_OK);
    ASSERT_EQ(valueBA, FLOAT_VAL2 - FLOAT_VAL1);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Float_17([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_float FLOAT_VAL1 = 1.5F;
    const ani_float FLOAT_VAL2 = 2.5F;
    const ani_int val3 = 5;
    const ani_int val4 = 6;
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodByName.A5", &cls), ANI_OK);
    ani_float value = 0.0;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Float(cls, "funcA", "ff:f", &value, FLOAT_VAL1, FLOAT_VAL2), ANI_OK);
    ASSERT_EQ(value, FLOAT_VAL1 + FLOAT_VAL2);

    ani_value args[2U];
    args[0U].f = FLOAT_VAL1;
    args[1U].f = FLOAT_VAL2;
    ani_float valueA = 0.0;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Float_A(cls, "funcA", "ff:f", &valueA, args), ANI_OK);
    ASSERT_EQ(valueA, FLOAT_VAL1 + FLOAT_VAL2);

    ani_int value2 = 0;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Int(cls, "funcA", "ii:i", &value2, val3, val4), ANI_OK);
    ASSERT_EQ(value2, val3 + val4);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Float_18([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_float FLOAT_VAL1 = 1.5F;
    const ani_float FLOAT_VAL2 = 2.5F;
    TestCombineSceneOfFloat(env, "entry.src.main.src.ets.ClassOperationsMethodByName.A5", "funcB",
                            FLOAT_VAL1 + FLOAT_VAL2);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Float_19([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_float FLOAT_VAL1 = 1.5F;
    const ani_float FLOAT_VAL2 = 2.5F;
    TestCombineSceneOfFloat(env, "entry.src.main.src.ets.ClassOperationsMethodByName.C5", "funcA",
                            FLOAT_VAL1 + FLOAT_VAL2);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Float_20([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_float FLOAT_VAL1 = 1.5F;
    const ani_float FLOAT_VAL2 = 2.5F;
    TestCombineSceneOfFloat(env, "entry.src.main.src.ets.ClassOperationsMethodByName.D5", "funcA",
                            FLOAT_VAL2 - FLOAT_VAL1);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Float_21([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_float FLOAT_VAL1 = 1.5F;
    const ani_float FLOAT_VAL2 = 2.5F;
    TestCombineSceneOfFloat(env, "entry.src.main.src.ets.ClassOperationsMethodByName.E5", "funcA",
                            FLOAT_VAL1 + FLOAT_VAL2);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Float_22([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_float FLOAT_VAL1 = 1.5F;
    const ani_float FLOAT_VAL2 = 2.5F;
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodByName.F5", &cls), ANI_OK);
    ASSERT_EQ(env->Class_CallStaticMethodByName_Void(cls, "increment", nullptr, FLOAT_VAL1, FLOAT_VAL2), ANI_OK);
    ani_float value = 0.0;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Float(cls, "getCount", nullptr, &value), ANI_OK);
    ASSERT_EQ(value, FLOAT_VAL1 + FLOAT_VAL2);

    ani_value args[2U];
    args[0U].f = FLOAT_VAL1;
    args[1U].f = FLOAT_VAL2;
    ani_float valueA = 0.0;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Float_A(cls, "getCount", nullptr, &valueA, args), ANI_OK);
    ASSERT_EQ(valueA, FLOAT_VAL1 + FLOAT_VAL2);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Float_23([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_float FLOAT_VAL1 = 1.5F;
    const ani_float FLOAT_VAL2 = 2.5F;
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodByName.G5", &cls), ANI_OK);
    ani_float value = 0.0;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Float(cls, "publicMethod", "ff:f", &value, FLOAT_VAL1, FLOAT_VAL2),
              ANI_OK);
    ASSERT_EQ(value, FLOAT_VAL1 + FLOAT_VAL2);
    ASSERT_EQ(
        env->Class_CallStaticMethodByName_Float(cls, "callPrivateMethod", "ff:f", &value, FLOAT_VAL1, FLOAT_VAL2),
        ANI_OK);
    ASSERT_EQ(value, FLOAT_VAL2 - FLOAT_VAL1);

    ani_value args[2U];
    args[0U].f = FLOAT_VAL1;
    args[1U].f = FLOAT_VAL2;
    ani_float valueA = 0.0;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Float_A(cls, "publicMethod", "ff:f", &valueA, args), ANI_OK);
    ASSERT_EQ(valueA, FLOAT_VAL1 + FLOAT_VAL2);
    ASSERT_EQ(env->Class_CallStaticMethodByName_Float_A(cls, "callPrivateMethod", "ff:f", &valueA, args), ANI_OK);
    ASSERT_EQ(valueA, FLOAT_VAL2 - FLOAT_VAL1);
    return ANI_TRUE;
}

ani_boolean GetMethodDataOfInt(ani_env *env, ani_class *clsResult)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodByName.Operations6", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);
    *clsResult = cls;
    return ANI_TRUE;
}

ani_boolean TestFuncVOfInt(ani_env *env, ani_class cls, const char *name, ani_int *value, ...)
{
    va_list args {};
    va_start(args, value);
    ASSERT_EQ(env->Class_CallStaticMethodByName_Int_V(cls, name, "ii:i", value, args), ANI_OK);
    va_end(args);
    return ANI_TRUE;
}

ani_boolean TestCombineSceneOfInt(ani_env *env, const char *className, const char *methodName, ani_int expectedValue)
{
    const ani_int VAL3 = 5;
    const ani_int VAL4 = 6;
    ani_class cls {};
    ASSERT_EQ(env->FindClass(className, &cls), ANI_OK);

    ani_int value = 0;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Int(cls, methodName, "ii:i", &value, VAL3, VAL4), ANI_OK);
    ASSERT_EQ(value, expectedValue);

    ani_value args[2U];
    args[0U].i = VAL3;
    args[1U].i = VAL4;
    ani_int valueA = 0;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Int_A(cls, methodName, "ii:i", &valueA, args), ANI_OK);
    ASSERT_EQ(valueA, expectedValue);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Int_01([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_int VAL3 = 5;
    const ani_int VAL4 = 6;
    ani_class cls {};
    GetMethodDataOfInt(env, &cls);

    ani_int sum = 0;
    ASSERT_EQ(env->c_api->Class_CallStaticMethodByName_Int(env, cls, "sum", nullptr, &sum, VAL3, VAL4), ANI_OK);
    ASSERT_EQ(sum, VAL3 + VAL4);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Int_02([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_int VAL3 = 5;
    const ani_int VAL4 = 6;
    ani_class cls {};
    GetMethodDataOfInt(env, &cls);

    ani_int sum = 0;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Int(cls, "sum", nullptr, &sum, VAL3, VAL4), ANI_OK);
    ASSERT_EQ(sum, VAL3 + VAL4);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Int_03([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_int VAL3 = 5;
    const ani_int VAL4 = 6;
    ani_class cls {};
    GetMethodDataOfInt(env, &cls);

    ani_value args[2U];
    args[0U].i = VAL3;
    args[1U].i = VAL4;

    ani_int sum = 0;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Int_A(cls, "sum", nullptr, &sum, args), ANI_OK);
    ASSERT_EQ(sum, VAL3 + VAL4);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Int_04([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_int VAL3 = 5;
    const ani_int VAL4 = 6;
    ani_int sum = 0;
    ASSERT_EQ(env->c_api->Class_CallStaticMethodByName_Int(env, nullptr, "sum", nullptr, &sum, VAL3, VAL4),
              ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Int_05([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_int VAL3 = 5;
    const ani_int VAL4 = 6;
    ani_class cls {};
    GetMethodDataOfInt(env, &cls);

    ani_int sum = 0;
    ASSERT_EQ(env->c_api->Class_CallStaticMethodByName_Int(env, cls, nullptr, nullptr, &sum, VAL3, VAL4),
              ANI_INVALID_ARGS);
    ASSERT_EQ(env->Class_CallStaticMethodByName_Int(cls, "", nullptr, &sum, VAL3, VAL4), ANI_NOT_FOUND);
    ASSERT_EQ(env->Class_CallStaticMethodByName_Int(cls, "\n", nullptr, &sum, VAL3, VAL4), ANI_NOT_FOUND);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Int_06([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_int VAL3 = 5;
    const ani_int VAL4 = 6;
    ani_class cls {};
    GetMethodDataOfInt(env, &cls);

    ASSERT_EQ(env->c_api->Class_CallStaticMethodByName_Int(env, cls, "sum", nullptr, nullptr, VAL3, VAL4),
              ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Int_07([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_int VAL3 = 5;
    const ani_int VAL4 = 6;
    ani_int sum = 0;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Int(nullptr, "sum", nullptr, &sum, VAL3, VAL4), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Int_08([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_int VAL3 = 5;
    const ani_int VAL4 = 6;
    ani_class cls {};
    GetMethodDataOfInt(env, &cls);

    ani_int sum = 0;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Int(cls, nullptr, nullptr, &sum, VAL3, VAL4), ANI_INVALID_ARGS);
    ASSERT_EQ(env->Class_CallStaticMethodByName_Int(cls, "sum_not_exist", nullptr, &sum, VAL3, VAL4), ANI_NOT_FOUND);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Int_09([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_int VAL3 = 5;
    const ani_int VAL4 = 6;
    ani_class cls {};
    GetMethodDataOfInt(env, &cls);

    ASSERT_EQ(env->Class_CallStaticMethodByName_Int(cls, "sum", nullptr, nullptr, VAL3, VAL4), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Int_10([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_int VAL3 = 5;
    const ani_int VAL4 = 6;
    ani_value args[2U];
    args[0U].i = VAL3;
    args[1U].i = VAL4;
    ani_int sum = 0;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Int_A(nullptr, "sum", nullptr, &sum, args), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Int_11([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_int VAL3 = 5;
    const ani_int VAL4 = 6;
    ani_class cls {};
    GetMethodDataOfInt(env, &cls);

    ani_value args[2U];
    args[0U].i = VAL3;
    args[1U].i = VAL4;
    ani_int sum = 0;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Int_A(cls, nullptr, nullptr, &sum, args), ANI_INVALID_ARGS);
    ASSERT_EQ(env->Class_CallStaticMethodByName_Int_A(cls, "sum_not_exist", nullptr, &sum, args), ANI_NOT_FOUND);
    ASSERT_EQ(env->Class_CallStaticMethodByName_Int_A(cls, "", nullptr, &sum, args), ANI_NOT_FOUND);
    ASSERT_EQ(env->Class_CallStaticMethodByName_Int_A(cls, "\n", nullptr, &sum, args), ANI_NOT_FOUND);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Int_12([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_int VAL3 = 5;
    const ani_int VAL4 = 6;
    ani_class cls {};
    GetMethodDataOfInt(env, &cls);

    ani_value args[2U];
    args[0U].i = VAL3;
    args[1U].i = VAL4;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Int_A(cls, "sum", nullptr, nullptr, args), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Int_13([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    GetMethodDataOfInt(env, &cls);

    ani_int sum = 0;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Int_A(cls, "sum", nullptr, &sum, nullptr), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Int_18([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_int VAL3 = 5;
    const ani_int VAL4 = 6;
    ani_class cls {};
    GetMethodDataOfInt(env, &cls);

    ani_int value = 0;
    ASSERT_EQ(env->c_api->Class_CallStaticMethodByName_Int(nullptr, cls, "or", nullptr, &value, VAL3, VAL4),
              ANI_INVALID_ARGS);
    ani_value args[2U];
    args[0U].i = VAL3;
    args[1U].i = VAL4;
    ASSERT_EQ(env->c_api->Class_CallStaticMethodByName_Int_A(nullptr, cls, "or", nullptr, &value, args),
              ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Int_19([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_int VAL3 = 5;
    const ani_int VAL4 = 6;
    ani_class clsA {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodByName.A6", &clsA), ANI_OK);
    ani_class clsB {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodByName.B6", &clsB), ANI_OK);

    ani_int valueA = 0;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Int(clsA, "funcA", "ii:i", &valueA, VAL3, VAL4), ANI_OK);
    ASSERT_EQ(valueA, VAL3 + VAL4);
    ani_int valueB = 0;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Int(clsB, "funcB", "ii:i", &valueB, VAL3, VAL4), ANI_OK);
    ASSERT_EQ(valueB, VAL4 - VAL3);

    ani_value args[2U];
    args[0U].i = VAL3;
    args[1U].i = VAL4;
    ani_int valueAA = 0;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Int_A(clsA, "funcA", "ii:i", &valueAA, args), ANI_OK);
    ASSERT_EQ(valueAA, VAL3 + VAL4);
    ani_int valueBA = 0;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Int_A(clsB, "funcB", "ii:i", &valueBA, args), ANI_OK);
    ASSERT_EQ(valueBA, VAL4 - VAL3);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Int_20([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_double VAL1 = 1.5;
    const ani_double VAL2 = 2.5;
    const ani_int VAL3 = 5;
    const ani_int VAL4 = 6;
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodByName.A6", &cls), ANI_OK);
    ani_int value = 0;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Int(cls, "funcA", "ii:i", &value, VAL3, VAL4), ANI_OK);
    ASSERT_EQ(value, VAL3 + VAL4);

    ani_value args[2U];
    args[0U].i = VAL3;
    args[1U].i = VAL4;
    ani_int valueA = 0;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Int_A(cls, "funcA", "ii:i", &valueA, args), ANI_OK);
    ASSERT_EQ(valueA, VAL3 + VAL4);

    ani_double value2 = 0.0;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Double(cls, "funcA", "dd:d", &value2, VAL1, VAL2), ANI_OK);
    ASSERT_EQ(value2, VAL1 + VAL2);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Int_21([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_int VAL3 = 5;
    const ani_int VAL4 = 6;
    TestCombineSceneOfInt(env, "entry.src.main.src.ets.ClassOperationsMethodByName.A6", "funcB", VAL3 + VAL4);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Int_22([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_int VAL3 = 5;
    const ani_int VAL4 = 6;
    TestCombineSceneOfInt(env, "entry.src.main.src.ets.ClassOperationsMethodByName.C6", "funcA", VAL3 + VAL4);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Int_23([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_int VAL3 = 5;
    const ani_int VAL4 = 6;
    TestCombineSceneOfInt(env, "entry.src.main.src.ets.ClassOperationsMethodByName.D6", "funcA", VAL4 - VAL3);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Int_24([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_int VAL3 = 5;
    const ani_int VAL4 = 6;
    TestCombineSceneOfInt(env, "entry.src.main.src.ets.ClassOperationsMethodByName.E6", "funcA", VAL3 + VAL4);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Int_25([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_int VAL3 = 5;
    const ani_int VAL4 = 6;
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodByName.F6", &cls), ANI_OK);
    ASSERT_EQ(env->Class_CallStaticMethodByName_Void(cls, "increment", nullptr, VAL3, VAL4), ANI_OK);
    ani_int value = 0;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Int(cls, "getCount", nullptr, &value), ANI_OK);
    ASSERT_EQ(value, VAL3 + VAL4);

    ani_value args[2U];
    args[0U].i = VAL3;
    args[1U].i = VAL4;
    ani_int valueA = 0;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Int_A(cls, "getCount", nullptr, &valueA, args), ANI_OK);
    ASSERT_EQ(valueA, VAL3 + VAL4);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Int_26([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_int VAL3 = 5;
    const ani_int VAL4 = 6;
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodByName.G6", &cls), ANI_OK);
    ani_int value = 0;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Int(cls, "publicMethod", "ii:i", &value, VAL3, VAL4), ANI_OK);
    ASSERT_EQ(value, VAL3 + VAL4);
    ASSERT_EQ(env->Class_CallStaticMethodByName_Int(cls, "callPrivateMethod", "ii:i", &value, VAL3, VAL4), ANI_OK);
    ASSERT_EQ(value, VAL4 - VAL3);

    ani_value args[2U];
    args[0U].i = VAL3;
    args[1U].i = VAL4;
    ani_int valueA = 0;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Int_A(cls, "publicMethod", "ii:i", &valueA, args), ANI_OK);
    ASSERT_EQ(valueA, VAL3 + VAL4);
    ASSERT_EQ(env->Class_CallStaticMethodByName_Int_A(cls, "callPrivateMethod", "ii:i", &valueA, args), ANI_OK);
    ASSERT_EQ(valueA, VAL4 - VAL3);
    return ANI_TRUE;
}

ani_boolean GetMethodDataOfLong(ani_env *env, ani_class *clsResult)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodByName.Operations7", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);
    *clsResult = cls;
    return ANI_TRUE;
}

ani_boolean TestFuncVOfLong(ani_env *env, ani_class cls, const char *name, ani_long *value, ...)
{
    va_list args {};
    va_start(args, value);
    ASSERT_EQ(env->Class_CallStaticMethodByName_Long_V(cls, name, "ll:l", value, args), ANI_OK);
    va_end(args);
    return ANI_TRUE;
}

ani_boolean TestCombineSceneOfLong(ani_env *env, const char *className, const char *methodName, ani_long expectedValue)
{
    const ani_long VAL1 = 123;
    const ani_long VAL2 = 456;
    ani_class cls {};
    ASSERT_EQ(env->FindClass(className, &cls), ANI_OK);

    ani_long value = 0L;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Long(cls, methodName, "ll:l", &value, VAL1, VAL2), ANI_OK);
    ASSERT_EQ(value, expectedValue);

    ani_value args[2U];
    args[0U].l = VAL1;
    args[1U].l = VAL2;
    ani_long valueA = 0L;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Long_A(cls, methodName, "ll:l", &valueA, args), ANI_OK);
    ASSERT_EQ(valueA, expectedValue);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Long_01([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_long VAL1 = 123;
    const ani_long VAL2 = 456;
    ani_class cls {};
    GetMethodDataOfLong(env, &cls);

    ani_long sum = 0L;
    const ani_long v1 = VAL1;
    const ani_long v2 = VAL2;
    ASSERT_EQ(env->c_api->Class_CallStaticMethodByName_Long(env, cls, "sum", nullptr, &sum, v1, v2), ANI_OK);
    ASSERT_EQ(sum, v1 + v2);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Long_02([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    GetMethodDataOfLong(env, &cls);

    ani_long sum = 0L;
    const ani_long v1 = 123;
    const ani_long v2 = 456;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Long(cls, "sum", nullptr, &sum, v1, v2), ANI_OK);
    ASSERT_EQ(sum, v1 + v2);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Long_03([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_long VAL1 = 123;
    const ani_long VAL2 = 456;
    ani_class cls {};
    GetMethodDataOfLong(env, &cls);

    ani_value args[2U];
    args[0U].l = VAL1;
    args[1U].l = VAL2;

    ani_long sum = 0L;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Long_A(cls, "sum", nullptr, &sum, args), ANI_OK);
    ASSERT_EQ(sum, VAL1 + VAL2);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Long_04([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_long VAL1 = 123;
    const ani_long VAL2 = 456;
    ani_long sum = 0L;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Long(nullptr, "sum", nullptr, &sum, VAL1, VAL2), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Long_05([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_long VAL1 = 123;
    const ani_long VAL2 = 456;
    ani_class cls {};
    GetMethodDataOfLong(env, &cls);

    ani_long sum = 0L;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Long(cls, nullptr, nullptr, &sum, VAL1, VAL2), ANI_INVALID_ARGS);
    ASSERT_EQ(env->Class_CallStaticMethodByName_Long(cls, "sum_not_exist", nullptr, &sum, VAL1, VAL2), ANI_NOT_FOUND);
    ASSERT_EQ(env->Class_CallStaticMethodByName_Long(cls, "", nullptr, &sum, VAL1, VAL2), ANI_NOT_FOUND);
    ASSERT_EQ(env->Class_CallStaticMethodByName_Long(cls, "\n", nullptr, &sum, VAL1, VAL2), ANI_NOT_FOUND);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Long_06([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_long VAL1 = 123;
    const ani_long VAL2 = 456;
    ani_class cls {};
    GetMethodDataOfLong(env, &cls);

    ASSERT_EQ(env->Class_CallStaticMethodByName_Long(cls, "sum", nullptr, nullptr, VAL1, VAL2), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Long_07([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_long VAL1 = 123;
    const ani_long VAL2 = 456;
    ani_value args[2U];
    args[0U].l = VAL1;
    args[1U].l = VAL2;

    ani_long sum = 0L;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Long_A(nullptr, "sum", nullptr, &sum, args), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Long_08([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_long VAL1 = 123;
    const ani_long VAL2 = 456;
    ani_class cls {};
    GetMethodDataOfLong(env, &cls);

    ani_value args[2U];
    args[0U].l = VAL1;
    args[1U].l = VAL2;

    ani_long sum = 0L;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Long_A(cls, nullptr, nullptr, &sum, args), ANI_INVALID_ARGS);
    ASSERT_EQ(env->Class_CallStaticMethodByName_Long_A(cls, "sum_not_exist", nullptr, &sum, args), ANI_NOT_FOUND);
    ASSERT_EQ(env->Class_CallStaticMethodByName_Long_A(cls, "", nullptr, &sum, args), ANI_NOT_FOUND);
    ASSERT_EQ(env->Class_CallStaticMethodByName_Long_A(cls, "\n", nullptr, &sum, args), ANI_NOT_FOUND);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Long_09([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_long VAL1 = 123;
    const ani_long VAL2 = 456;
    ani_class cls {};
    GetMethodDataOfLong(env, &cls);

    ani_value args[2U];
    args[0U].l = VAL1;
    args[1U].l = VAL2;

    ASSERT_EQ(env->Class_CallStaticMethodByName_Long_A(cls, "sum", nullptr, nullptr, args), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Long_10([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    GetMethodDataOfLong(env, &cls);

    ani_long sum = 0L;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Long_A(cls, "sum", nullptr, &sum, nullptr), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Long_15([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_long VAL1 = 123;
    const ani_long VAL2 = 456;
    ani_class cls {};
    GetMethodDataOfLong(env, &cls);

    ani_long value = 0L;
    ASSERT_EQ(env->c_api->Class_CallStaticMethodByName_Long(nullptr, cls, "or", nullptr, &value, VAL1, VAL2),
              ANI_INVALID_ARGS);
    ani_value args[2U];
    args[0U].l = VAL1;
    args[1U].l = VAL2;
    ASSERT_EQ(env->c_api->Class_CallStaticMethodByName_Long_A(nullptr, cls, "or", nullptr, &value, args),
              ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Long_16([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_long VAL1 = 123;
    const ani_long VAL2 = 456;
    ani_class clsA {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodByName.A7", &clsA), ANI_OK);
    ani_class clsB {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodByName.B7", &clsB), ANI_OK);

    ani_long valueA = 0L;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Long(clsA, "funcA", "ll:l", &valueA, VAL1, VAL2), ANI_OK);
    ASSERT_EQ(valueA, VAL1 + VAL2);
    ani_long valueB = 0L;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Long(clsB, "funcB", "ll:l", &valueB, VAL1, VAL2), ANI_OK);
    ASSERT_EQ(valueB, VAL2 - VAL1);

    ani_value args[2U];
    args[0U].l = VAL1;
    args[1U].l = VAL2;
    ani_long valueAA = 0L;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Long_A(clsA, "funcA", "ll:l", &valueAA, args), ANI_OK);
    ASSERT_EQ(valueAA, VAL1 + VAL2);
    ani_long valueBA = 0L;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Long_A(clsB, "funcB", "ll:l", &valueBA, args), ANI_OK);
    ASSERT_EQ(valueBA, VAL2 - VAL1);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Long_17([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_long VAL1 = 123;
    const ani_long VAL2 = 456;
    const ani_int VAL3 = 5;
    const ani_int VAL4 = 6;
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodByName.A7", &cls), ANI_OK);
    ani_long value = 0L;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Long(cls, "funcA", "ll:l", &value, VAL1, VAL2), ANI_OK);
    ASSERT_EQ(value, VAL1 + VAL2);

    ani_value args[2U];
    args[0U].l = VAL1;
    args[1U].l = VAL2;
    ani_long valueA = 0L;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Long_A(cls, "funcA", "ll:l", &valueA, args), ANI_OK);
    ASSERT_EQ(valueA, VAL1 + VAL2);

    ani_int value2 = 0;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Int(cls, "funcA", "ii:i", &value2, VAL3, VAL4), ANI_OK);
    ASSERT_EQ(value2, VAL3 + VAL4);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Long_18([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_long VAL1 = 123;
    const ani_long VAL2 = 456;
    TestCombineSceneOfLong(env, "entry.src.main.src.ets.ClassOperationsMethodByName.A7", "funcB", VAL1 + VAL2);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Long_19([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_long VAL1 = 123;
    const ani_long VAL2 = 456;
    TestCombineSceneOfLong(env, "entry.src.main.src.ets.ClassOperationsMethodByName.C7", "funcA", VAL1 + VAL2);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Long_20([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_long VAL1 = 123;
    const ani_long VAL2 = 456;
    TestCombineSceneOfLong(env, "entry.src.main.src.ets.ClassOperationsMethodByName.D7", "funcA", VAL2 - VAL1);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Long_21([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_long VAL1 = 123;
    const ani_long VAL2 = 456;
    TestCombineSceneOfLong(env, "entry.src.main.src.ets.ClassOperationsMethodByName.E7", "funcA", VAL1 + VAL2);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Long_22([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_long VAL1 = 123;
    const ani_long VAL2 = 456;
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodByName.F7", &cls), ANI_OK);
    ASSERT_EQ(env->Class_CallStaticMethodByName_Void(cls, "increment", nullptr, VAL1, VAL2), ANI_OK);
    ani_long value = 0L;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Long(cls, "getCount", nullptr, &value), ANI_OK);
    ASSERT_EQ(value, VAL1 + VAL2);

    ani_value args[2U];
    args[0U].l = VAL1;
    args[1U].l = VAL2;
    ani_long valueA = 0L;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Long_A(cls, "getCount", nullptr, &valueA, args), ANI_OK);
    ASSERT_EQ(valueA, VAL1 + VAL2);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Long_23([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_long VAL1 = 123;
    const ani_long VAL2 = 456;
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodByName.G7", &cls), ANI_OK);
    ani_long value = 0L;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Long(cls, "publicMethod", "ll:l", &value, VAL1, VAL2), ANI_OK);
    ASSERT_EQ(value, VAL1 + VAL2);
    ASSERT_EQ(env->Class_CallStaticMethodByName_Long(cls, "callPrivateMethod", "ll:l", &value, VAL1, VAL2), ANI_OK);
    ASSERT_EQ(value, VAL2 - VAL1);

    ani_value args[2U];
    args[0U].l = VAL1;
    args[1U].l = VAL2;
    ani_long valueA = 0L;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Long_A(cls, "publicMethod", "ll:l", &valueA, args), ANI_OK);
    ASSERT_EQ(valueA, VAL1 + VAL2);
    ASSERT_EQ(env->Class_CallStaticMethodByName_Long_A(cls, "callPrivateMethod", "ll:l", &valueA, args), ANI_OK);
    ASSERT_EQ(valueA, VAL2 - VAL1);
    return ANI_TRUE;
}

ani_boolean GetMethodDataOfRef(ani_env *env, ani_class *clsResult)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodByName.Phone", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);
    *clsResult = cls;
    return ANI_TRUE;
}

ani_boolean TestFuncVOfRef(ani_env *env, ani_class cls, const char *name, ani_ref *value, ...)
{
    va_list args {};
    va_start(args, value);
    ASSERT_EQ(env->Class_CallStaticMethodByName_Ref_V(cls, name, "ii:C{std.core.String}", value, args), ANI_OK);
    va_end(args);
    return ANI_TRUE;
}

ani_boolean CheckRefUp2(ani_env *env, ani_ref ref)
{
    const ani_int VAL3 = 5;
    auto string = reinterpret_cast<ani_string>(ref);
    ani_size result = 0U;
    ASSERT_EQ(env->String_GetUTF8Size(string, &result), ANI_OK);
    ASSERT_EQ(result, 2U);

    ani_size substrOffset = 0U;
    ani_size substrSize = result;
    const uint32_t bufferSize = VAL3;
    char utfBuffer[bufferSize] = {};
    result = 0U;
    auto status =
        env->String_GetUTF8SubString(string, substrOffset, substrSize, utfBuffer, sizeof(utfBuffer), &result);
    ASSERT_EQ(status, ANI_OK);
    ASSERT_STREQ(utfBuffer, "UP");
    return ANI_TRUE;
}

ani_boolean CheckRefNum2(ani_env *env, ani_ref ref)
{
    auto string = reinterpret_cast<ani_string>(ref);
    ani_size result = 0U;
    ASSERT_EQ(env->String_GetUTF8Size(string, &result), ANI_OK);
    ani_size substrOffset = 0U;
    ani_size substrSize = result;
    const uint32_t bufferSize = 10U;
    char utfBuffer[bufferSize] = {};
    result = 0U;
    auto status =
        env->String_GetUTF8SubString(string, substrOffset, substrSize, utfBuffer, sizeof(utfBuffer), &result);
    ASSERT_EQ(status, ANI_OK);
    ASSERT_STREQ(utfBuffer, "INT5");
    return ANI_TRUE;
}

ani_boolean TestCombineSceneOfRef(ani_env *env, const char *className, const char *methodName)
{
    const ani_int VAL3 = 5;
    const ani_int VAL4 = 6;
    ani_class cls {};
    ASSERT_EQ(env->FindClass(className, &cls), ANI_OK);

    ani_ref value = nullptr;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Ref(cls, methodName, "ii:C{std.core.String}", &value, VAL3, VAL4),
              ANI_OK);
    CheckRefNum2(env, value);

    ani_value args[2U];
    args[0U].i = VAL3;
    args[1U].i = VAL4;
    ani_ref valueA = nullptr;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Ref_A(cls, methodName, "ii:C{std.core.String}", &valueA, args),
              ANI_OK);
    CheckRefNum2(env, valueA);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Ref_01([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    GetMethodDataOfRef(env, &cls);

    ani_ref ref = nullptr;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Ref(cls, "get_button_names", nullptr, &ref), ANI_OK);
    ASSERT_NE(ref, nullptr);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Ref_02([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_int VAL3 = 5;
    ani_class cls {};
    GetMethodDataOfRef(env, &cls);

    ani_ref ref = nullptr;
    ASSERT_EQ(env->c_api->Class_CallStaticMethodByName_Ref(env, cls, "get_button_names", nullptr, &ref), ANI_OK);
    ASSERT_NE(ref, nullptr);

    auto string = reinterpret_cast<ani_string>(ref);
    ani_size result = 0U;
    ASSERT_EQ(env->String_GetUTF8Size(string, &result), ANI_OK);
    ASSERT_EQ(result, 2U);

    ani_size substrOffset = 0U;
    ani_size substrSize = result;
    const uint32_t bufferSize = VAL3;
    char utfBuffer[bufferSize] = {};
    result = 0U;
    auto status =
        env->String_GetUTF8SubString(string, substrOffset, substrSize, utfBuffer, sizeof(utfBuffer), &result);
    ASSERT_EQ(status, ANI_OK);
    ASSERT_STREQ(utfBuffer, "UP");
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Ref_03([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_int VAL3 = 5;
    const ani_int VAL4 = 6;
    ani_class cls {};
    GetMethodDataOfRef(env, &cls);

    ani_ref ref = nullptr;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Ref(cls, "get_num_string", nullptr, &ref, VAL3, VAL4), ANI_OK);
    ASSERT_NE(ref, nullptr);

    auto string = reinterpret_cast<ani_string>(ref);
    ani_size result = 0U;
    ASSERT_EQ(env->String_GetUTF8Size(string, &result), ANI_OK);
    ani_size substrOffset = 0U;
    ani_size substrSize = result;
    const uint32_t bufferSize = 10U;
    char utfBuffer[bufferSize] = {};
    result = 0U;
    auto status =
        env->String_GetUTF8SubString(string, substrOffset, substrSize, utfBuffer, sizeof(utfBuffer), &result);
    ASSERT_EQ(status, ANI_OK);
    ASSERT_STREQ(utfBuffer, "INT5");
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Ref_04([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_int VAL3 = 5;
    const ani_int VAL4 = 6;
    ani_class cls {};
    GetMethodDataOfRef(env, &cls);

    ani_ref ref = nullptr;
    ani_value args[2U];
    args[0U].i = VAL3;
    args[1U].i = VAL4;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Ref_A(cls, "get_num_string", nullptr, &ref, args), ANI_OK);
    ASSERT_NE(ref, nullptr);

    auto string = reinterpret_cast<ani_string>(ref);
    ani_size result = 0U;
    ASSERT_EQ(env->String_GetUTF8Size(string, &result), ANI_OK);
    ani_size substrOffset = 0U;
    ani_size substrSize = result;
    const uint32_t bufferSize = 10U;
    char utfBuffer[bufferSize] = {};
    result = 0U;
    auto status =
        env->String_GetUTF8SubString(string, substrOffset, substrSize, utfBuffer, sizeof(utfBuffer), &result);
    ASSERT_EQ(status, ANI_OK);
    ASSERT_STREQ(utfBuffer, "INT5");
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Ref_05([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_ref ref = nullptr;
    ASSERT_EQ(env->c_api->Class_CallStaticMethodByName_Ref(env, nullptr, "get_button_names", nullptr, &ref),
              ANI_INVALID_ARGS);
    ASSERT_EQ(ref, nullptr);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Ref_06([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    GetMethodDataOfRef(env, &cls);

    ani_ref ref = nullptr;
    ASSERT_EQ(env->c_api->Class_CallStaticMethodByName_Ref(env, cls, nullptr, nullptr, &ref), ANI_INVALID_ARGS);
    ASSERT_EQ(env->c_api->Class_CallStaticMethodByName_Ref(env, cls, "sum_not_exist", nullptr, &ref), ANI_NOT_FOUND);
    ASSERT_EQ(env->Class_CallStaticMethodByName_Ref(cls, "", nullptr, &ref), ANI_NOT_FOUND);
    ASSERT_EQ(env->Class_CallStaticMethodByName_Ref(cls, "\n", nullptr, &ref), ANI_NOT_FOUND);
    ASSERT_EQ(ref, nullptr);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Ref_07([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    GetMethodDataOfRef(env, &cls);

    ani_ref ref = nullptr;
    ASSERT_EQ(env->c_api->Class_CallStaticMethodByName_Ref(env, cls, "get_button_names", nullptr, nullptr),
              ANI_INVALID_ARGS);
    ASSERT_EQ(ref, nullptr);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Ref_08([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_double VAL1 = 4.5;
    const ani_double VAL2 = 7.5;
    const ani_int VAL3 = 5;
    const ani_int VAL4 = 6;
    ani_ref ref = nullptr;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Ref(nullptr, "get_num_string", nullptr, &ref, VAL3, VAL4),
              ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Ref_09([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_int VAL3 = 5;
    const ani_int VAL4 = 6;
    ani_class cls {};
    GetMethodDataOfRef(env, &cls);

    ani_ref ref = nullptr;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Ref(cls, nullptr, nullptr, &ref, VAL3, VAL4), ANI_INVALID_ARGS);
    ASSERT_EQ(env->Class_CallStaticMethodByName_Ref(cls, "sum_not_exist", nullptr, &ref, VAL3, VAL4), ANI_NOT_FOUND);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Ref_10([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_int VAL3 = 5;
    const ani_int VAL4 = 6;
    ani_class cls {};
    GetMethodDataOfRef(env, &cls);

    ASSERT_EQ(env->Class_CallStaticMethodByName_Ref(cls, "get_num_string", nullptr, nullptr, VAL3, VAL4),
              ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Ref_11([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_int VAL3 = 5;
    const ani_int VAL4 = 6;
    ani_value args[2U];
    args[0U].i = VAL3;
    args[1U].i = VAL4;
    ani_ref ref = nullptr;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Ref_A(nullptr, "get_num_string", nullptr, &ref, args),
              ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Ref_12([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_int VAL3 = 5;
    const ani_int VAL4 = 6;
    ani_class cls {};
    GetMethodDataOfRef(env, &cls);

    ani_value args[2U];
    args[0U].i = VAL3;
    args[1U].i = VAL4;
    ani_ref ref = nullptr;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Ref_A(cls, nullptr, nullptr, &ref, args), ANI_INVALID_ARGS);
    ASSERT_EQ(env->Class_CallStaticMethodByName_Ref_A(cls, "", nullptr, &ref, args), ANI_NOT_FOUND);
    ASSERT_EQ(env->Class_CallStaticMethodByName_Ref_A(cls, "\n", nullptr, &ref, args), ANI_NOT_FOUND);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Ref_13([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_int VAL3 = 5;
    const ani_int VAL4 = 6;
    ani_class cls {};
    GetMethodDataOfRef(env, &cls);

    ani_value args[2U];
    args[0U].i = VAL3;
    args[1U].i = VAL4;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Ref_A(cls, "get_num_string", nullptr, nullptr, args),
              ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Ref_14([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    GetMethodDataOfRef(env, &cls);

    ani_ref ref = nullptr;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Ref_A(cls, "get_num_string", nullptr, &ref, nullptr),
              ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Ref_19([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_int VAL3 = 5;
    const ani_int VAL4 = 6;
    ani_class cls {};
    GetMethodDataOfRef(env, &cls);

    ani_ref value = nullptr;
    ASSERT_EQ(env->c_api->Class_CallStaticMethodByName_Ref(nullptr, cls, "or", nullptr, &value, VAL3, VAL4),
              ANI_INVALID_ARGS);
    ani_value args[2U];
    args[0U].i = VAL3;
    args[1U].i = VAL4;
    ASSERT_EQ(env->c_api->Class_CallStaticMethodByName_Ref_A(nullptr, cls, "or", nullptr, &value, args),
              ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Ref_20([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_int VAL3 = 5;
    const ani_int VAL4 = 6;
    ani_class clsA {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodByName.A8", &clsA), ANI_OK);
    ani_class clsB {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodByName.B8", &clsB), ANI_OK);

    ani_ref valueA = nullptr;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Ref(clsA, "funcA", "ii:C{std.core.String}", &valueA, VAL3, VAL4),
              ANI_OK);
    CheckRefNum2(env, valueA);
    ani_ref valueB = nullptr;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Ref(clsB, "funcB", "ii:C{std.core.String}", &valueB, VAL3, VAL4),
              ANI_OK);
    CheckRefUp2(env, valueB);

    ani_value args[2U];
    args[0U].i = VAL3;
    args[1U].i = VAL4;
    ani_ref valueAA = nullptr;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Ref_A(clsA, "funcA", "ii:C{std.core.String}", &valueAA, args), ANI_OK);
    CheckRefNum2(env, valueAA);
    ani_ref valueBA = nullptr;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Ref_A(clsB, "funcB", "ii:C{std.core.String}", &valueBA, args), ANI_OK);
    CheckRefUp2(env, valueBA);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Ref_21([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_double VAL1 = 4.5;
    const ani_double VAL2 = 7.5;
    const ani_int VAL3 = 5;
    const ani_int VAL4 = 6;
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodByName.A8", &cls), ANI_OK);
    ani_ref value = nullptr;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Ref(cls, "funcA", "ii:C{std.core.String}", &value, VAL3, VAL4),
              ANI_OK);
    CheckRefNum2(env, value);

    ani_value args[2U];
    args[0U].i = VAL3;
    args[1U].i = VAL4;
    ani_ref valueA = nullptr;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Ref_A(cls, "funcA", "ii:C{std.core.String}", &valueA, args), ANI_OK);
    CheckRefNum2(env, valueA);

    ani_double value2 = 0.0;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Double(cls, "funcA", "dd:d", &value2, VAL1, VAL2), ANI_OK);
    ASSERT_EQ(value2, VAL2 - VAL1);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Ref_22([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    TestCombineSceneOfRef(env, "entry.src.main.src.ets.ClassOperationsMethodByName.A8", "funcB");
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Ref_23([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    TestCombineSceneOfRef(env, "entry.src.main.src.ets.ClassOperationsMethodByName.C8", "funcA");
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Ref_24([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    TestCombineSceneOfRef(env, "entry.src.main.src.ets.ClassOperationsMethodByName.E8", "funcA");
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Ref_25([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_int VAL3 = 5;
    const ani_int VAL4 = 6;
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodByName.DT", &cls), ANI_OK);

    ani_ref value = nullptr;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Ref(cls, "funcA", "ii:C{std.core.String}", &value, VAL3, VAL4),
              ANI_OK);
    CheckRefUp2(env, value);

    ani_value args[2U];
    args[0U].i = VAL3;
    args[1U].i = VAL4;
    ani_ref valueA = nullptr;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Ref_A(cls, "funcA", "ii:C{std.core.String}", &valueA, args), ANI_OK);
    CheckRefUp2(env, valueA);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Ref_26([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_int VAL3 = 5;
    const ani_int VAL4 = 6;
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodByName.F8", &cls), ANI_OK);
    ASSERT_EQ(env->Class_CallStaticMethodByName_Void(cls, "increment", nullptr, VAL3, VAL4), ANI_OK);
    ani_ref value = nullptr;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Ref(cls, "getCount", nullptr, &value), ANI_OK);
    CheckRefNum2(env, value);

    ani_value args[2U];
    args[0U].i = VAL3;
    args[1U].i = VAL4;
    ani_ref valueA = nullptr;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Ref_A(cls, "getCount", nullptr, &valueA, args), ANI_OK);
    CheckRefNum2(env, valueA);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Ref_27([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_int VAL3 = 5;
    const ani_int VAL4 = 6;
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodByName.G8", &cls), ANI_OK);
    ani_ref value = nullptr;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Ref(cls, "publicMethod", "ii:C{std.core.String}", &value, VAL3, VAL4),
              ANI_OK);
    CheckRefNum2(env, value);
    ASSERT_EQ(
        env->Class_CallStaticMethodByName_Ref(cls, "callPrivateMethod", "ii:C{std.core.String}", &value, VAL3, VAL4),
        ANI_OK);
    CheckRefUp2(env, value);

    ani_value args[2U];
    args[0U].i = VAL3;
    args[1U].i = VAL4;
    ani_ref valueA = nullptr;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Ref_A(cls, "publicMethod", "ii:C{std.core.String}", &valueA, args),
              ANI_OK);
    CheckRefNum2(env, valueA);
    ASSERT_EQ(
        env->Class_CallStaticMethodByName_Ref_A(cls, "callPrivateMethod", "ii:C{std.core.String}", &valueA, args),
        ANI_OK);
    CheckRefUp2(env, valueA);
    return ANI_TRUE;
}

ani_boolean GetClassDataOfShort(ani_env *env, ani_class *clsResult)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodByName.Operations9", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);
    *clsResult = cls;
    return ANI_TRUE;
}

ani_boolean TestFuncVOfShort(ani_env *env, ani_class cls, const char *name, ani_short *value, ...)
{
    va_list args {};
    va_start(args, value);
    ASSERT_EQ(env->Class_CallStaticMethodByName_Short_V(cls, name, "ss:s", value, args), ANI_OK);
    va_end(args);
    return ANI_TRUE;
}

ani_boolean TestCombineSceneOfShort(ani_env *env, const char *className,
                                    const char *methodName, ani_short expectedValue)
{
    const ani_short VAL1 = 5;
    const ani_short VAL2 = 6;
    ani_class cls {};
    ASSERT_EQ(env->FindClass(className, &cls), ANI_OK);

    ani_short value = 0;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Short(cls, methodName, "ss:s", &value, VAL1, VAL2), ANI_OK);
    ASSERT_EQ(value, expectedValue);

    ani_value args[2U];
    args[0U].s = VAL1;
    args[1U].s = VAL2;
    ani_short valueA = 0;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Short_A(cls, methodName, "ss:s", &valueA, args), ANI_OK);
    ASSERT_EQ(valueA, expectedValue);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Short_01([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_short VAL1 = 5;
    const ani_short VAL2 = 6;
    ani_class cls {};
    GetClassDataOfShort(env, &cls);

    ani_short value = 0;
    ASSERT_EQ(env->c_api->Class_CallStaticMethodByName_Short(env, cls, "sum", nullptr, &value, VAL1, VAL2), ANI_OK);
    ASSERT_EQ(value, VAL1 + VAL2);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Short_02([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_short VAL1 = 5;
    const ani_short VAL2 = 6;
    ani_class cls {};
    GetClassDataOfShort(env, &cls);

    ani_short value = 0;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Short(cls, "sum", nullptr, &value, VAL1, VAL2), ANI_OK);
    ASSERT_EQ(value, VAL1 + VAL2);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Short_03([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_short VAL1 = 5;
    const ani_short VAL2 = 6;
    ani_class cls {};
    GetClassDataOfShort(env, &cls);

    ani_value args[2U];
    args[0U].s = VAL1;
    args[1U].s = VAL2;

    ani_short value = 0;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Short_A(cls, "sum", nullptr, &value, args), ANI_OK);
    ASSERT_EQ(value, VAL1 + VAL2);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Short_04([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_short VAL1 = 5;
    const ani_short VAL2 = 6;
    ani_short value = 0;
    ASSERT_EQ(env->c_api->Class_CallStaticMethodByName_Short(env, nullptr, "sum", nullptr, &value, VAL1, VAL2),
              ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Short_05([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_short VAL1 = 5;
    const ani_short VAL2 = 6;
    ani_class cls {};
    GetClassDataOfShort(env, &cls);

    ani_short value = 0;
    ASSERT_EQ(env->c_api->Class_CallStaticMethodByName_Short(env, cls, nullptr, nullptr, &value, VAL1, VAL2),
              ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Short_06([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_short VAL1 = 5;
    const ani_short VAL2 = 6;
    ani_class cls {};
    GetClassDataOfShort(env, &cls);

    ani_short value = 0;
    ASSERT_EQ(env->c_api->Class_CallStaticMethodByName_Short(env, cls, "aa", nullptr, &value, VAL1, VAL2),
              ANI_NOT_FOUND);
    ASSERT_EQ(env->Class_CallStaticMethodByName_Short(cls, "", nullptr, &value, VAL1, VAL2), ANI_NOT_FOUND);
    ASSERT_EQ(env->Class_CallStaticMethodByName_Short(cls, "\n", nullptr, &value, VAL1, VAL2), ANI_NOT_FOUND);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Short_07([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_short VAL1 = 5;
    const ani_short VAL2 = 6;
    ani_class cls {};
    GetClassDataOfShort(env, &cls);

    ASSERT_EQ(env->c_api->Class_CallStaticMethodByName_Short(env, cls, "sum", nullptr, nullptr, VAL1, VAL2),
              ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Short_08([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_short VAL1 = 5;
    const ani_short VAL2 = 6;
    ani_short value = 0;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Short(nullptr, "sum", nullptr, &value, VAL1, VAL2), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Short_09([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_short VAL1 = 5;
    const ani_short VAL2 = 6;
    ani_class cls {};
    GetClassDataOfShort(env, &cls);

    ani_short value = 0;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Short(cls, nullptr, nullptr, &value, VAL1, VAL2), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Short_10([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_short VAL1 = 5;
    const ani_short VAL2 = 6;
    ani_class cls {};
    GetClassDataOfShort(env, &cls);

    ani_short value = 0;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Short(cls, "aa", nullptr, &value, VAL1, VAL2), ANI_NOT_FOUND);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Short_11([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_short VAL1 = 5;
    const ani_short VAL2 = 6;
    ani_class cls {};
    GetClassDataOfShort(env, &cls);

    ASSERT_EQ(env->Class_CallStaticMethodByName_Short(cls, "sum", nullptr, nullptr, VAL1, VAL2), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Short_12([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_short VAL1 = 5;
    const ani_short VAL2 = 6;
    ani_value args[2U];
    args[0U].s = VAL1;
    args[1U].s = VAL2;
    ani_short value = 0;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Short_A(nullptr, "sum", nullptr, &value, args), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Short_13([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_short VAL1 = 5;
    const ani_short VAL2 = 6;
    ani_class cls {};
    GetClassDataOfShort(env, &cls);

    ani_value args[2U];
    args[0U].s = VAL1;
    args[1U].s = VAL2;
    ani_short value = 0;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Short_A(cls, nullptr, nullptr, &value, args), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Short_14([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_short VAL1 = 5;
    const ani_short VAL2 = 6;
    ani_class cls {};
    GetClassDataOfShort(env, &cls);

    ani_value args[2U];
    args[0U].s = VAL1;
    args[1U].s = VAL2;
    ani_short value = 0;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Short_A(cls, "aa", nullptr, &value, args), ANI_NOT_FOUND);
    ASSERT_EQ(env->Class_CallStaticMethodByName_Short_A(cls, "", nullptr, &value, args), ANI_NOT_FOUND);
    ASSERT_EQ(env->Class_CallStaticMethodByName_Short_A(cls, "\n", nullptr, &value, args), ANI_NOT_FOUND);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Short_15([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_short VAL1 = 5;
    const ani_short VAL2 = 6;
    ani_class cls {};
    GetClassDataOfShort(env, &cls);

    ani_value args[2U];
    args[0U].s = VAL1;
    args[1U].s = VAL2;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Short_A(cls, "sum", nullptr, nullptr, args), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Short_16([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    GetClassDataOfShort(env, &cls);

    ani_short value = 0;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Short_A(cls, "sum", nullptr, &value, nullptr), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Short_21([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_short VAL1 = 5;
    const ani_short VAL2 = 6;
    ani_class cls {};
    GetClassDataOfShort(env, &cls);

    ani_short value = 0;
    ASSERT_EQ(env->c_api->Class_CallStaticMethodByName_Short(nullptr, cls, "or", nullptr, &value, VAL1, VAL2),
              ANI_INVALID_ARGS);
    ani_value args[2U];
    args[0U].s = VAL1;
    args[1U].s = VAL2;
    ASSERT_EQ(env->c_api->Class_CallStaticMethodByName_Short_A(nullptr, cls, "or", nullptr, &value, args),
              ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Short_22([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_short VAL1 = 5;
    const ani_short VAL2 = 6;
    ani_class clsA {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodByName.A9", &clsA), ANI_OK);
    ani_class clsB {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodByName.B9", &clsB), ANI_OK);

    ani_short valueA = 0;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Short(clsA, "funcA", "ss:s", &valueA, VAL1, VAL2), ANI_OK);
    ASSERT_EQ(valueA, VAL1 + VAL2);
    ani_short valueB = 0;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Short(clsB, "funcB", "ss:s", &valueB, VAL1, VAL2), ANI_OK);
    ASSERT_EQ(valueB, VAL2 - VAL1);

    ani_value args[2U];
    args[0U].s = VAL1;
    args[1U].s = VAL2;
    ani_short valueAA = 0;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Short_A(clsA, "funcA", "ss:s", &valueAA, args), ANI_OK);
    ASSERT_EQ(valueAA, VAL1 + VAL2);
    ani_short valueBA = 0;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Short_A(clsB, "funcB", "ss:s", &valueBA, args), ANI_OK);
    ASSERT_EQ(valueBA, VAL2 - VAL1);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Short_23([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_short VAL1 = 5;
    const ani_short VAL2 = 6;
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodByName.A9", &cls), ANI_OK);
    ani_short value = 0;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Short(cls, "funcA", "ss:s", &value, VAL1, VAL2), ANI_OK);
    ASSERT_EQ(value, VAL1 + VAL2);

    ani_value args[2U];
    args[0U].s = VAL1;
    args[1U].s = VAL2;
    ani_short valueA = 0;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Short_A(cls, "funcA", "ss:s", &valueA, args), ANI_OK);
    ASSERT_EQ(valueA, VAL1 + VAL2);

    ani_int value2 = 0;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Int(cls, "funcA", "ii:i", &value2, VAL1, VAL2), ANI_OK);
    ASSERT_EQ(value2, VAL2 - VAL1);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Short_24([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_short VAL1 = 5;
    const ani_short VAL2 = 6;
    TestCombineSceneOfShort(env, "entry.src.main.src.ets.ClassOperationsMethodByName.A9", "funcB", VAL1 + VAL2);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Short_25([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_short VAL1 = 5;
    const ani_short VAL2 = 6;
    TestCombineSceneOfShort(env, "entry.src.main.src.ets.ClassOperationsMethodByName.C9", "funcA", VAL1 + VAL2);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Short_26([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_short VAL1 = 5;
    const ani_short VAL2 = 6;
    TestCombineSceneOfShort(env, "entry.src.main.src.ets.ClassOperationsMethodByName.D9", "funcA", VAL2 - VAL1);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Short_27([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_short VAL1 = 5;
    const ani_short VAL2 = 6;
    TestCombineSceneOfShort(env, "entry.src.main.src.ets.ClassOperationsMethodByName.E9", "funcA", VAL1 + VAL2);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Short_28([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_short VAL1 = 5;
    const ani_short VAL2 = 6;
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodByName.F9", &cls), ANI_OK);
    ASSERT_EQ(env->Class_CallStaticMethodByName_Void(cls, "increment", nullptr, VAL1, VAL2), ANI_OK);
    ani_short value = 0;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Short(cls, "getCount", nullptr, &value), ANI_OK);
    ASSERT_EQ(value, VAL1 + VAL2);

    ani_value args[2U];
    args[0U].s = VAL1;
    args[1U].s = VAL2;
    ani_short valueA = 0;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Short_A(cls, "getCount", nullptr, &valueA, args), ANI_OK);
    ASSERT_EQ(valueA, VAL1 + VAL2);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Short_29([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_short VAL1 = 5;
    const ani_short VAL2 = 6;
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodByName.G9", &cls), ANI_OK);
    ani_short value = 0;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Short(cls, "publicMethod", "ss:s", &value, VAL1, VAL2), ANI_OK);
    ASSERT_EQ(value, VAL1 + VAL2);
    ASSERT_EQ(env->Class_CallStaticMethodByName_Short(cls, "callPrivateMethod", "ss:s", &value, VAL1, VAL2), ANI_OK);
    ASSERT_EQ(value, VAL2 - VAL1);

    ani_value args[2U];
    args[0U].s = VAL1;
    args[1U].s = VAL2;
    ani_short valueA = 0;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Short_A(cls, "publicMethod", "ss:s", &valueA, args), ANI_OK);
    ASSERT_EQ(valueA, VAL1 + VAL2);
    ASSERT_EQ(env->Class_CallStaticMethodByName_Short_A(cls, "callPrivateMethod", "ss:s", &valueA, args), ANI_OK);
    ASSERT_EQ(valueA, VAL2 - VAL1);
    return ANI_TRUE;
}

ani_boolean GetMethodDataOfVoid(ani_env *env, ani_class *clsResult)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodByName.OperationsV", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);
    *clsResult = cls;
    return ANI_TRUE;
}

ani_boolean TestFuncVOfVoid(ani_env *env, ani_class cls, const char *name, ...)
{
    va_list args {};
    va_start(args, name);
    ASSERT_EQ(env->Class_CallStaticMethodByName_Void_V(cls, name, "ii:", args), ANI_OK);
    va_end(args);
    return ANI_TRUE;
}

ani_boolean GetCountOfVoid(ani_env *env, ani_class cls, ani_int *value)
{
    ASSERT_EQ(env->Class_CallStaticMethodByName_Int(cls, "getCount", ":i", value), ANI_OK);
    return ANI_TRUE;
}

ani_boolean TestCombineSceneOfVoid(ani_env *env, const char *className, const char *methodName, ani_int expectedValue)
{
    const ani_int VAL1 = 5;
    const ani_int VAL2 = 6;
    ani_class cls {};
    ASSERT_EQ(env->FindClass(className, &cls), ANI_OK);

    ani_int value = 0;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Void(cls, methodName, "ii:", VAL1, VAL2), ANI_OK);
    GetCountOfVoid(env, cls, &value);
    ASSERT_EQ(value, expectedValue);

    ani_value args[2U];
    args[0U].i = VAL1;
    args[1U].i = VAL2;
    ani_int valueA = 0;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Void_A(cls, methodName, "ii:", args), ANI_OK);
    GetCountOfVoid(env, cls, &valueA);
    ASSERT_EQ(valueA, expectedValue);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Void_01([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_int VAL1 = 5;
    const ani_int VAL2 = 6;
    ani_class cls {};
    GetMethodDataOfVoid(env, &cls);

    ani_value args[2];
    args[0].i = VAL1;
    args[1].i = VAL2;

    ani_int sum = 0;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Void_A(cls, "voidMethod", nullptr, args), ANI_OK);
    ASSERT_EQ(env->Class_CallStaticMethodByName_Int(cls, "getCount", nullptr, &sum), ANI_OK);
    ASSERT_EQ(sum, args[0].i + args[1].i);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Void_02([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_int VAL1 = 5;
    const ani_int VAL2 = 6;
    const ani_int res = 22;
    ani_class cls {};
    GetMethodDataOfVoid(env, &cls);
    ani_int sum = 0;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Void(cls, "voidMethod", nullptr, VAL1, VAL2), ANI_OK);
    ASSERT_EQ(env->Class_CallStaticMethodByName_Int(cls, "getCount", nullptr, &sum), ANI_OK);
    ASSERT_EQ(sum, res);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Void_03([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_int VAL1 = 5;
    const ani_int VAL2 = 6;
    const ani_int res = 33;
    ani_class cls {};
    GetMethodDataOfVoid(env, &cls);
    ani_int sum = 0;
    ASSERT_EQ(env->c_api->Class_CallStaticMethodByName_Void(env, cls, "voidMethod", nullptr, VAL1, VAL2), ANI_OK);
    ASSERT_EQ(env->Class_CallStaticMethodByName_Int(cls, "getCount", nullptr, &sum), ANI_OK);
    ASSERT_EQ(sum, res);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Void_04([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_int VAL1 = 5;
    const ani_int VAL2 = 6;
    ani_class cls {};
    GetMethodDataOfVoid(env, &cls);

    ASSERT_EQ(env->Class_CallStaticMethodByName_Void(cls, nullptr, nullptr, VAL1, VAL2), ANI_INVALID_ARGS);
    ASSERT_EQ(env->Class_CallStaticMethodByName_Void(cls, "sum_not_exist", nullptr, VAL1, VAL2), ANI_NOT_FOUND);
    ASSERT_EQ(env->Class_CallStaticMethodByName_Void(cls, "", nullptr, VAL1, VAL2), ANI_NOT_FOUND);
    ASSERT_EQ(env->Class_CallStaticMethodByName_Void(cls, "\n", nullptr, VAL1, VAL2), ANI_NOT_FOUND);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Void_05([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_int VAL1 = 5;
    const ani_int VAL2 = 6;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Void(nullptr, "voidMethod", nullptr, VAL1, VAL2), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Void_06([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_int VAL1 = 5;
    const ani_int VAL2 = 6;
    ani_class cls {};
    GetMethodDataOfVoid(env, &cls);
    ani_value args[2];
    args[0].i = VAL1;
    args[1].i = VAL2;

    ASSERT_EQ(env->Class_CallStaticMethodByName_Void_A(cls, nullptr, nullptr, args), ANI_INVALID_ARGS);
    ASSERT_EQ(env->Class_CallStaticMethodByName_Void_A(cls, "sum_not_exist", nullptr, args), ANI_NOT_FOUND);
    ASSERT_EQ(env->Class_CallStaticMethodByName_Void_A(cls, "", nullptr, args), ANI_NOT_FOUND);
    ASSERT_EQ(env->Class_CallStaticMethodByName_Void_A(cls, "\n", nullptr, args), ANI_NOT_FOUND);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Void_07([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_int VAL1 = 5;
    const ani_int VAL2 = 6;
    ani_value args[2];
    args[0].i = VAL1;
    args[1].i = VAL2;

    ASSERT_EQ(env->Class_CallStaticMethodByName_Void_A(nullptr, "voidMethod", nullptr, args), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Void_08([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    GetMethodDataOfVoid(env, &cls);

    ASSERT_EQ(env->Class_CallStaticMethodByName_Void_A(cls, "voidMethod", nullptr, nullptr), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Void_13([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_int VAL1 = 5;
    const ani_int VAL2 = 6;
    ani_class cls {};
    GetMethodDataOfVoid(env, &cls);

    ASSERT_EQ(env->c_api->Class_CallStaticMethodByName_Void(nullptr, cls, "or", nullptr, VAL1, VAL2),
              ANI_INVALID_ARGS);
    ani_value args[2U];
    args[0U].i = VAL1;
    args[1U].i = VAL2;
    ASSERT_EQ(env->c_api->Class_CallStaticMethodByName_Void_A(nullptr, cls, "or", nullptr, args), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Void_14([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_int VAL1 = 5;
    const ani_int VAL2 = 6;
    ani_class clsA {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodByName.AV", &clsA), ANI_OK);
    ani_class clsB {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodByName.BV", &clsB), ANI_OK);

    ani_int valueA = 0;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Void(clsA, "funcA", "ii:", VAL1, VAL2), ANI_OK);
    GetCountOfVoid(env, clsA, &valueA);
    ASSERT_EQ(valueA, VAL1 + VAL2);
    ani_int valueB = 0;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Void(clsB, "funcB", "ii:", VAL1, VAL2), ANI_OK);
    GetCountOfVoid(env, clsB, &valueB);
    ASSERT_EQ(valueB, VAL2 - VAL1);

    ani_value args[2U];
    args[0U].i = VAL1;
    args[1U].i = VAL2;
    ani_int valueAA = 0;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Void_A(clsA, "funcA", "ii:", args), ANI_OK);
    GetCountOfVoid(env, clsA, &valueAA);
    ASSERT_EQ(valueAA, VAL1 + VAL2);
    ani_int valueBA = 0;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Void_A(clsB, "funcB", "ii:", args), ANI_OK);
    GetCountOfVoid(env, clsB, &valueBA);
    ASSERT_EQ(valueBA, VAL2 - VAL1);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Void_15([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_int VAL1 = 5;
    const ani_int VAL2 = 6;
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodByName.AV", &cls), ANI_OK);
    ani_int value = 0;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Void(cls, "funcA", "ii:", VAL1, VAL2), ANI_OK);
    GetCountOfVoid(env, cls, &value);
    ASSERT_EQ(value, VAL1 + VAL2);

    ani_value args[2U];
    args[0U].i = VAL1;
    args[1U].i = VAL2;
    ani_int valueA = 0;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Void_A(cls, "funcA", "ii:", args), ANI_OK);
    GetCountOfVoid(env, cls, &valueA);
    ASSERT_EQ(valueA, VAL1 + VAL2);

    ani_short value2 = 0;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Short(cls, "funcA", "ss:s", &value2, VAL1, VAL2), ANI_OK);
    ASSERT_EQ(value2, VAL2 - VAL1);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Void_16([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_int VAL1 = 5;
    const ani_int VAL2 = 6;
    TestCombineSceneOfVoid(env, "entry.src.main.src.ets.ClassOperationsMethodByName.AV", "funcB", VAL1 + VAL2);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Void_17([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_int VAL1 = 5;
    const ani_int VAL2 = 6;
    TestCombineSceneOfVoid(env, "entry.src.main.src.ets.ClassOperationsMethodByName.CV", "funcA", VAL1 + VAL2);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Void_18([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_int VAL1 = 5;
    const ani_int VAL2 = 6;
    TestCombineSceneOfVoid(env, "entry.src.main.src.ets.ClassOperationsMethodByName.DV", "funcA", VAL2 - VAL1);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Void_19([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_int VAL1 = 5;
    const ani_int VAL2 = 6;
    TestCombineSceneOfVoid(env, "entry.src.main.src.ets.ClassOperationsMethodByName.EV", "funcA", VAL1 + VAL2);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Void_20([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_int VAL1 = 5;
    const ani_int VAL2 = 6;
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodByName.FV", &cls), ANI_OK);
    ASSERT_EQ(env->Class_CallStaticMethodByName_Void(cls, "increment", nullptr, VAL1, VAL2), ANI_OK);
    ani_int value = 0;
    GetCountOfVoid(env, cls, &value);
    ASSERT_EQ(value, VAL1 + VAL2);

    ani_value args[2U];
    args[0U].i = VAL1;
    args[1U].i = VAL2;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Void_A(cls, "increment", nullptr, args), ANI_OK);
    ani_int valueA = 0;
    GetCountOfVoid(env, cls, &valueA);
    ASSERT_EQ(valueA, VAL1 + VAL2);
    return ANI_TRUE;
}

ani_boolean test_Class_Call_Static_Method_Void_21([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_int VAL1 = 5;
    const ani_int VAL2 = 6;
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodByName.GV", &cls), ANI_OK);
    ani_int value = 0;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Void(cls, "publicMethod", "ii:", VAL1, VAL2), ANI_OK);
    GetCountOfVoid(env, cls, &value);
    ASSERT_EQ(value, VAL1 + VAL2);
    ASSERT_EQ(env->Class_CallStaticMethodByName_Void(cls, "callPrivateMethod", "ii:", VAL1, VAL2), ANI_OK);
    GetCountOfVoid(env, cls, &value);
    ASSERT_EQ(value, VAL2 - VAL1);

    ani_value args[2U];
    args[0U].i = VAL1;
    args[1U].i = VAL2;
    ani_int valueA = 0;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Void_A(cls, "publicMethod", "ii:", args), ANI_OK);
    GetCountOfVoid(env, cls, &valueA);
    ASSERT_EQ(valueA, VAL1 + VAL2);
    ASSERT_EQ(env->Class_CallStaticMethodByName_Void_A(cls, "callPrivateMethod", "ii:", args), ANI_OK);
    GetCountOfVoid(env, cls, &valueA);
    ASSERT_EQ(valueA, VAL2 - VAL1);
    return ANI_TRUE;
}

ani_boolean CheckFieldValueGetBool(ani_env *env, const char *className, const char *fieldName)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass(className, &cls), ANI_OK);

    ASSERT_EQ(env->Class_SetStaticFieldByName_Boolean(cls, fieldName, ANI_TRUE), ANI_OK);
    ani_boolean resultValue = ANI_FALSE;
    ASSERT_EQ(env->Class_GetStaticFieldByName_Boolean(cls, fieldName, &resultValue), ANI_OK);
    ASSERT_EQ(resultValue, ANI_TRUE);
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Field_By_Name_Bool_01([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodByName.GetBoolStatic", &cls), ANI_OK);
    ani_boolean single = ANI_TRUE;
    ASSERT_EQ(env->c_api->Class_GetStaticFieldByName_Boolean(env, cls, "single", &single), ANI_OK);
    ASSERT_EQ(single, ANI_FALSE);
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Field_By_Name_Bool_02([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodByName.GetBoolStatic", &cls), ANI_OK);
    ani_boolean single = ANI_TRUE;
    ASSERT_EQ(env->Class_GetStaticFieldByName_Boolean(cls, "single", &single), ANI_OK);
    ASSERT_EQ(single, ANI_FALSE);
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Field_By_Name_Bool_03([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodByName.GetBoolStatic", &cls), ANI_OK);

    ani_boolean single = ANI_TRUE;
    ASSERT_EQ(env->Class_GetStaticFieldByName_Boolean(cls, "name", &single), ANI_INVALID_TYPE);
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Field_By_Name_Bool_04([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodByName.GetBoolStatic", &cls), ANI_OK);
    ani_boolean single = ANI_TRUE;
    ASSERT_EQ(env->Class_GetStaticFieldByName_Boolean(nullptr, "name", &single), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Field_By_Name_Bool_05([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodByName.GetBoolStatic", &cls), ANI_OK);
    ani_boolean single = ANI_TRUE;
    ASSERT_EQ(env->Class_GetStaticFieldByName_Boolean(cls, nullptr, &single), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Field_By_Name_Bool_06([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodByName.GetBoolStatic", &cls), ANI_OK);
    ASSERT_EQ(env->Class_GetStaticFieldByName_Boolean(cls, "name", nullptr), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Field_By_Name_Bool_07([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodByName.GetBoolStatic", &cls), ANI_OK);
    ani_boolean single = ANI_TRUE;
    ASSERT_EQ(env->Class_GetStaticFieldByName_Boolean(cls, "", &single), ANI_NOT_FOUND);
    ASSERT_EQ(env->Class_GetStaticFieldByName_Boolean(cls, "\n", &single), ANI_NOT_FOUND);
    ASSERT_EQ(env->c_api->Class_GetStaticFieldByName_Boolean(nullptr, cls, "single", &single), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Field_By_Name_Bool_08([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodByName.GetBoolStatic", &cls), ANI_OK);
    ani_boolean single = ANI_TRUE;
    ASSERT_EQ(env->Class_GetStaticFieldByName_Boolean(cls, "specia1", &single), ANI_INVALID_TYPE);
    ASSERT_EQ(env->Class_GetStaticFieldByName_Boolean(cls, "specia3", &single), ANI_INVALID_TYPE);
    ASSERT_EQ(env->Class_GetStaticFieldByName_Boolean(cls, "specia4", &single), ANI_INVALID_TYPE);
    ASSERT_EQ(env->Class_GetStaticFieldByName_Boolean(cls, "specia5", &single), ANI_INVALID_TYPE);

    ASSERT_EQ(env->Class_GetStaticFieldByName_Boolean(cls, "specia6", &single), ANI_OK);
    ASSERT_EQ(single, ANI_FALSE);
    ASSERT_EQ(env->Class_GetStaticFieldByName_Boolean(cls, "specia7", &single), ANI_OK);
    ASSERT_EQ(single, ANI_TRUE);
    ASSERT_EQ(env->Class_GetStaticFieldByName_Boolean(cls, "specia8", &single), ANI_OK);
    ASSERT_EQ(single, ANI_TRUE);
    ASSERT_EQ(env->Class_GetStaticFieldByName_Boolean(cls, "specia9", &single), ANI_OK);
    ASSERT_EQ(single, ANI_FALSE);
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Field_By_Name_Bool_09([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodByName.GetBoolStatic", &cls), ANI_OK);
    const int32_t loopCount = 3;
    for (int32_t i = 0; i < loopCount; i++) {
        ASSERT_EQ(env->Class_SetStaticFieldByName_Boolean(cls, "single", ANI_TRUE), ANI_OK);
        ani_boolean single = ANI_FALSE;
        ASSERT_EQ(env->Class_GetStaticFieldByName_Boolean(cls, "single", &single), ANI_OK);
        ASSERT_EQ(single, ANI_TRUE);
    }
    ASSERT_EQ(env->Class_SetStaticFieldByName_Boolean(cls, "single", ANI_FALSE), ANI_OK);
    ani_boolean single = ANI_TRUE;
    ASSERT_EQ(env->Class_GetStaticFieldByName_Boolean(cls, "single", &single), ANI_OK);
    ASSERT_EQ(single, ANI_FALSE);
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Field_By_Name_Bool_10([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    CheckFieldValueGetBool(env, "entry.src.main.src.ets.ClassOperationsMethodByName.GetBoolStatic", "single");
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Field_By_Name_Bool_11([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    CheckFieldValueGetBool(env, "entry.src.main.src.ets.ClassOperationsMethodByName.BoolStaticA", "bool_value");
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Field_By_Name_Bool_12([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    CheckFieldValueGetBool(env, "entry.src.main.src.ets.ClassOperationsMethodByName.BoolStaticFinal", "bool_value");
    return ANI_TRUE;
}

ani_boolean CheckFieldValueGetByte(ani_env *env, const char *className, const char *fieldName)
{
    ani_class cls {};
    const ani_byte setTarget = 2U;
    ASSERT_EQ(env->FindClass(className, &cls), ANI_OK);
    ASSERT_EQ(env->Class_SetStaticFieldByName_Byte(cls, fieldName, setTarget), ANI_OK);
    ani_byte resultValue = 1U;
    ASSERT_EQ(env->Class_GetStaticFieldByName_Byte(cls, fieldName, &resultValue), ANI_OK);
    ASSERT_EQ(resultValue, setTarget);
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Field_By_Name_Byte_01([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodByName.GetbyteStatic", &cls), ANI_OK);
    ani_byte age;
    ASSERT_EQ(env->c_api->Class_GetStaticFieldByName_Byte(env, cls, "age", &age), ANI_OK);
    ASSERT_EQ(age, static_cast<ani_byte>(0));
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Field_By_Name_Byte_02([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodByName.GetbyteStatic", &cls), ANI_OK);
    ani_byte age;
    ASSERT_EQ(env->Class_GetStaticFieldByName_Byte(cls, "age", &age), ANI_OK);
    ASSERT_EQ(age, static_cast<ani_byte>(0));
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Field_By_Name_Byte_03([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodByName.GetbyteStatic", &cls), ANI_OK);

    ani_byte age;
    ASSERT_EQ(env->Class_GetStaticFieldByName_Byte(cls, "name", &age), ANI_INVALID_TYPE);
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Field_By_Name_Byte_04([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodByName.GetbyteStatic", &cls), ANI_OK);
    ani_byte age;
    ASSERT_EQ(env->Class_GetStaticFieldByName_Byte(nullptr, "name", &age), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Field_By_Name_Byte_05([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodByName.GetbyteStatic", &cls), ANI_OK);
    ani_byte age;
    ASSERT_EQ(env->Class_GetStaticFieldByName_Byte(cls, nullptr, &age), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Field_By_Name_Byte_06([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodByName.GetbyteStatic", &cls), ANI_OK);
    ASSERT_EQ(env->Class_GetStaticFieldByName_Byte(cls, "name", nullptr), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Field_By_Name_Byte_07([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodByName.GetbyteStatic", &cls), ANI_OK);
    ani_byte age;
    ASSERT_EQ(env->Class_GetStaticFieldByName_Byte(cls, "", &age), ANI_NOT_FOUND);
    ASSERT_EQ(env->Class_GetStaticFieldByName_Byte(cls, "\n", &age), ANI_NOT_FOUND);
    ASSERT_EQ(env->c_api->Class_GetStaticFieldByName_Byte(nullptr, cls, "age", &age), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Field_By_Name_Byte_08([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodByName.GetbyteStatic", &cls), ANI_OK);
    ani_byte single = 1U;
    ASSERT_EQ(env->Class_GetStaticFieldByName_Byte(cls, "specia2", &single), ANI_INVALID_TYPE);
    ASSERT_EQ(env->Class_GetStaticFieldByName_Byte(cls, "specia3", &single), ANI_INVALID_TYPE);
    ASSERT_EQ(env->Class_GetStaticFieldByName_Byte(cls, "specia4", &single), ANI_INVALID_TYPE);
    ASSERT_EQ(env->Class_GetStaticFieldByName_Byte(cls, "specia5", &single), ANI_INVALID_TYPE);
    ASSERT_EQ(env->Class_GetStaticFieldByName_Byte(cls, "specia6", &single), ANI_INVALID_TYPE);
    ASSERT_EQ(env->Class_GetStaticFieldByName_Byte(cls, "specia7", &single), ANI_INVALID_TYPE);
    ASSERT_EQ(env->Class_GetStaticFieldByName_Byte(cls, "specia8", &single), ANI_INVALID_TYPE);
    ASSERT_EQ(env->Class_GetStaticFieldByName_Byte(cls, "specia9", &single), ANI_INVALID_TYPE);
    ASSERT_EQ(env->Class_GetStaticFieldByName_Byte(cls, "specia10", &single), ANI_INVALID_TYPE);
    ASSERT_EQ(env->Class_GetStaticFieldByName_Byte(cls, "specia11", &single), ANI_INVALID_TYPE);
    ASSERT_EQ(env->Class_GetStaticFieldByName_Byte(cls, "specia12", &single), ANI_INVALID_TYPE);

    const ani_byte maxValue = 127;
    const ani_byte minValue = -128;
    ASSERT_EQ(env->Class_GetStaticFieldByName_Byte(cls, "byteMin", &single), ANI_OK);
    ASSERT_EQ(single, static_cast<ani_byte>(minValue));
    ASSERT_EQ(env->Class_GetStaticFieldByName_Byte(cls, "byteMax", &single), ANI_OK);
    ASSERT_EQ(single, static_cast<ani_byte>(maxValue));
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Field_By_Name_Byte_09([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    const ani_byte setTarget = 2U;
    const ani_byte setTarget2 = 3U;
    ani_byte single = 1U;
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodByName.GetbyteStatic", &cls), ANI_OK);
    const int32_t loopCount = 3;
    for (int32_t i = 0; i < loopCount; i++) {
        ASSERT_EQ(env->Class_SetStaticFieldByName_Byte(cls, "age", setTarget2), ANI_OK);
        ASSERT_EQ(env->Class_GetStaticFieldByName_Byte(cls, "age", &single), ANI_OK);
        ASSERT_EQ(single, setTarget2);
    }
    ASSERT_EQ(env->Class_SetStaticFieldByName_Byte(cls, "age", setTarget), ANI_OK);
    ASSERT_EQ(env->Class_GetStaticFieldByName_Byte(cls, "age", &single), ANI_OK);
    ASSERT_EQ(single, setTarget);
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Field_By_Name_Byte_10([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    CheckFieldValueGetByte(env, "entry.src.main.src.ets.ClassOperationsMethodByName.GetbyteStatic", "age");
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Field_By_Name_Byte_11([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    CheckFieldValueGetByte(env, "entry.src.main.src.ets.ClassOperationsMethodByName.ByteStaticA", "byte_value");
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Field_By_Name_Byte_12([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    CheckFieldValueGetByte(env, "entry.src.main.src.ets.ClassOperationsMethodByName.ByteStaticFinal", "byte_value");
    return ANI_TRUE;
}

ani_boolean CheckFieldValueGetChar(ani_env *env, const char *className, const char *fieldName)
{
    ani_class cls {};
    const ani_char setTarget = 2U;
    ASSERT_EQ(env->FindClass(className, &cls), ANI_OK);

    ASSERT_EQ(env->Class_SetStaticFieldByName_Char(cls, fieldName, setTarget), ANI_OK);
    ani_char resultValue = ' ';
    ASSERT_EQ(env->Class_GetStaticFieldByName_Char(cls, fieldName, &resultValue), ANI_OK);
    ASSERT_EQ(resultValue, setTarget);
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Field_By_Name_Char_01([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodByName.GetCharStatic", &cls), ANI_OK);
    ani_char name = 'c';
    ASSERT_EQ(env->c_api->Class_GetStaticFieldByName_Char(env, cls, "name", &name), ANI_OK);
    ASSERT_EQ(name, static_cast<ani_char>('b'));
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Field_By_Name_Char_02([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodByName.GetCharStatic", &cls), ANI_OK);
    ani_char name = 'c';
    ASSERT_EQ(env->Class_GetStaticFieldByName_Char(cls, "name", &name), ANI_OK);
    ASSERT_EQ(name, static_cast<ani_char>('b'));
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Field_By_Name_Char_03([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodByName.GetCharStatic", &cls), ANI_OK);
    ani_char name = 'c';
    ASSERT_EQ(env->Class_GetStaticFieldByName_Char(cls, "nameChar", &name), ANI_NOT_FOUND);
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Field_By_Name_Char_04([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodByName.GetCharStatic", &cls), ANI_OK);

    ani_char name = 'c';
    ASSERT_EQ(env->Class_GetStaticFieldByName_Char(cls, "age", &name), ANI_INVALID_TYPE);
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Field_By_Name_Char_05([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodByName.GetCharStatic", &cls), ANI_OK);
    ani_char name = 'c';
    ASSERT_EQ(env->Class_GetStaticFieldByName_Char(nullptr, "name", &name), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Field_By_Name_Char_06([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodByName.GetCharStatic", &cls), ANI_OK);
    ani_char name = 'c';
    ASSERT_EQ(env->Class_GetStaticFieldByName_Char(cls, nullptr, &name), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Field_By_Name_Char_07([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodByName.GetCharStatic", &cls), ANI_OK);
    ASSERT_EQ(env->Class_GetStaticFieldByName_Char(cls, "name", nullptr), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Field_By_Name_Char_08([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodByName.GetCharStatic", &cls), ANI_OK);
    ani_char name = 'c';
    ASSERT_EQ(env->Class_GetStaticFieldByName_Char(cls, "", &name), ANI_NOT_FOUND);
    ASSERT_EQ(env->Class_GetStaticFieldByName_Char(cls, "\n", &name), ANI_NOT_FOUND);
    ASSERT_EQ(env->c_api->Class_GetStaticFieldByName_Char(nullptr, cls, "name", &name), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Field_By_Name_Char_09([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodByName.GetCharStatic", &cls), ANI_OK);
    ani_char single = 'c';
    ASSERT_EQ(env->Class_GetStaticFieldByName_Char(cls, "specia2", &single), ANI_INVALID_TYPE);
    ASSERT_EQ(env->Class_GetStaticFieldByName_Char(cls, "specia3", &single), ANI_INVALID_TYPE);
    ASSERT_EQ(env->Class_GetStaticFieldByName_Char(cls, "specia4", &single), ANI_INVALID_TYPE);
    ASSERT_EQ(env->Class_GetStaticFieldByName_Char(cls, "specia5", &single), ANI_OK);
    ASSERT_EQ(single, static_cast<ani_char>('\n'));
    ASSERT_EQ(env->Class_GetStaticFieldByName_Char(cls, "specia6", &single), ANI_OK);
    ASSERT_EQ(single, static_cast<ani_char>('\r'));
    ASSERT_EQ(env->Class_GetStaticFieldByName_Char(cls, "specia7", &single), ANI_OK);
    ASSERT_EQ(single, static_cast<ani_char>('\t'));
    ASSERT_EQ(env->Class_GetStaticFieldByName_Char(cls, "specia8", &single), ANI_OK);
    ASSERT_EQ(single, static_cast<ani_char>('\b'));
    ASSERT_EQ(env->Class_GetStaticFieldByName_Char(cls, "specia12", &single), ANI_OK);
    ASSERT_EQ(single, static_cast<ani_char>('\0'));

    ani_char maxValue = std::numeric_limits<ani_char>::max();
    ani_char minValue = std::numeric_limits<ani_char>::min();
    ASSERT_EQ(env->Class_GetStaticFieldByName_Char(cls, "charMin", &single), ANI_OK);
    ASSERT_EQ(single, static_cast<ani_char>(minValue));
    ASSERT_EQ(env->Class_GetStaticFieldByName_Char(cls, "charMax", &single), ANI_OK);
    ASSERT_EQ(single, static_cast<ani_char>(maxValue));
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Field_By_Name_Char_10([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    const ani_char setTarget = 2U;
    const ani_char setTarget2 = 3U;
    ani_char single = 'c';
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodByName.GetCharStatic", &cls), ANI_OK);
    const int32_t loopCount = 3;
    for (int32_t i = 0; i < loopCount; i++) {
        ASSERT_EQ(env->Class_SetStaticFieldByName_Char(cls, "name", setTarget2), ANI_OK);
        ASSERT_EQ(env->Class_GetStaticFieldByName_Char(cls, "name", &single), ANI_OK);
        ASSERT_EQ(single, setTarget2);
    }
    ASSERT_EQ(env->Class_SetStaticFieldByName_Char(cls, "name", setTarget), ANI_OK);
    ASSERT_EQ(env->Class_GetStaticFieldByName_Char(cls, "name", &single), ANI_OK);
    ASSERT_EQ(single, setTarget);
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Field_By_Name_Char_11([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    CheckFieldValueGetChar(env, "entry.src.main.src.ets.ClassOperationsMethodByName.GetCharStatic", "name");
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Field_By_Name_Char_12([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    CheckFieldValueGetChar(env, "entry.src.main.src.ets.ClassOperationsMethodByName.CharStaticA", "char_value");
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Field_By_Name_Char_13([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    CheckFieldValueGetChar(env, "entry.src.main.src.ets.ClassOperationsMethodByName.CharStaticFinal", "char_value");
    return ANI_TRUE;
}

ani_boolean CheckFieldValueGetDouble(ani_env *env, const char *className, const char *fieldName)
{
    ani_class cls {};
    const ani_double setTarget = 2U;
    ASSERT_EQ(env->FindClass(className, &cls), ANI_OK);

    ASSERT_EQ(env->Class_SetStaticFieldByName_Double(cls, fieldName, setTarget), ANI_OK);
    ani_double resultValue = 0.0;
    ASSERT_EQ(env->Class_GetStaticFieldByName_Double(cls, fieldName, &resultValue), ANI_OK);
    ASSERT_EQ(resultValue, setTarget);
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Field_By_Name_Double_01([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodByName.Woman", &cls), ANI_OK);
    ani_double age = 0.0;
    const ani_double expectedAge = 20.0;
    ASSERT_EQ(env->c_api->Class_GetStaticFieldByName_Double(env, cls, "age", &age), ANI_OK);
    ASSERT_EQ(age, static_cast<ani_double>(expectedAge));
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Field_By_Name_Double_02([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodByName.Woman", &cls), ANI_OK);
    ani_double age = 0.0;
    const ani_double expectedAge = 20.0;
    ASSERT_EQ(env->Class_GetStaticFieldByName_Double(cls, "age", &age), ANI_OK);
    ASSERT_EQ(age, static_cast<ani_double>(expectedAge));
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Field_By_Name_Double_03([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodByName.Woman", &cls), ANI_OK);

    ani_double age = 0.0;
    ASSERT_EQ(env->Class_GetStaticFieldByName_Double(cls, "name", &age), ANI_INVALID_TYPE);
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Field_By_Name_Double_04([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodByName.Woman", &cls), ANI_OK);
    ani_double age = 0.0;
    ASSERT_EQ(env->Class_GetStaticFieldByName_Double(nullptr, "name", &age), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Field_By_Name_Double_05([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodByName.Woman", &cls), ANI_OK);
    ani_double age = 0.0;
    ASSERT_EQ(env->Class_GetStaticFieldByName_Double(cls, nullptr, &age), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Field_By_Name_Double_06([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodByName.Woman", &cls), ANI_OK);
    ASSERT_EQ(env->Class_GetStaticFieldByName_Double(cls, "name", nullptr), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Field_By_Name_Double_07([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodByName.Woman", &cls), ANI_OK);
    ani_double age = 0.0;
    ASSERT_EQ(env->Class_GetStaticFieldByName_Double(cls, "", &age), ANI_NOT_FOUND);
    ASSERT_EQ(env->Class_GetStaticFieldByName_Double(cls, "\n", &age), ANI_NOT_FOUND);
    ASSERT_EQ(env->c_api->Class_GetStaticFieldByName_Double(nullptr, cls, "age", &age), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Field_By_Name_Double_08([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodByName.Woman", &cls), ANI_OK);
    ani_double single = 0.0;
    ASSERT_EQ(env->Class_GetStaticFieldByName_Double(cls, "specia1", &single), ANI_INVALID_TYPE);
    ASSERT_EQ(env->Class_GetStaticFieldByName_Double(cls, "specia3", &single), ANI_INVALID_TYPE);
    ASSERT_EQ(env->Class_GetStaticFieldByName_Double(cls, "specia4", &single), ANI_INVALID_TYPE);
    ASSERT_EQ(env->Class_GetStaticFieldByName_Double(cls, "specia5", &single), ANI_INVALID_TYPE);
    ani_double max = std::numeric_limits<ani_double>::max();
    ani_double minpositive = std::numeric_limits<ani_double>::min();
    ani_double min = -std::numeric_limits<ani_double>::max();
    ASSERT_EQ(env->Class_GetStaticFieldByName_Double(cls, "doubleMin", &single), ANI_OK);
    ASSERT_EQ(single, static_cast<ani_double>(min));
    ASSERT_EQ(env->Class_GetStaticFieldByName_Double(cls, "minpositive", &single), ANI_OK);
    ASSERT_EQ(single, static_cast<ani_double>(minpositive));
    ASSERT_EQ(env->Class_GetStaticFieldByName_Double(cls, "doubleMax", &single), ANI_OK);
    ASSERT_EQ(single, static_cast<ani_double>(max));
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Field_By_Name_Double_09([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    const ani_double setTarget = 2U;
    const ani_double setTarget2 = 3U;
    ani_double single = 0.0;
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodByName.Woman", &cls), ANI_OK);
    const int32_t loopCount = 3;
    for (int32_t i = 0; i < loopCount; i++) {
        ASSERT_EQ(env->Class_SetStaticFieldByName_Double(cls, "age", setTarget2), ANI_OK);
        ASSERT_EQ(env->Class_GetStaticFieldByName_Double(cls, "age", &single), ANI_OK);
        ASSERT_EQ(single, setTarget2);
    }
    ASSERT_EQ(env->Class_SetStaticFieldByName_Double(cls, "age", setTarget), ANI_OK);
    ASSERT_EQ(env->Class_GetStaticFieldByName_Double(cls, "age", &single), ANI_OK);
    ASSERT_EQ(single, setTarget);
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Field_By_Name_Double_10([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    CheckFieldValueGetDouble(env, "entry.src.main.src.ets.ClassOperationsMethodByName.Woman", "age");
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Field_By_Name_Double_11([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    CheckFieldValueGetDouble(env, "entry.src.main.src.ets.ClassOperationsMethodByName.DoubleStaticA", "double_value");
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Field_By_Name_Double_12([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    CheckFieldValueGetDouble(env,
                             "entry.src.main.src.ets.ClassOperationsMethodByName.DoubleStaticFinal", "double_value");
    return ANI_TRUE;
}

ani_boolean CheckFieldValueGetFloat(ani_env *env, const char *className, const char *fieldName)
{
    ani_class cls {};
    const ani_float setTarget = 2U;
    ASSERT_EQ(env->FindClass(className, &cls), ANI_OK);

    ASSERT_EQ(env->Class_SetStaticFieldByName_Float(cls, fieldName, setTarget), ANI_OK);
    ani_float resultValue = 0.0;
    ASSERT_EQ(env->Class_GetStaticFieldByName_Float(cls, fieldName, &resultValue), ANI_OK);
    ASSERT_EQ(resultValue, setTarget);
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Field_By_Name_Float_01([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodByName.GetFloatStatic", &cls), ANI_OK);
    ani_float age = 0.0F;
    ASSERT_EQ(env->c_api->Class_GetStaticFieldByName_Float(env, cls, "age", &age), ANI_OK);
    ASSERT_EQ(age, static_cast<ani_float>(20.0F));
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Field_By_Name_Float_02([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodByName.GetFloatStatic", &cls), ANI_OK);
    ani_float age = 0.0F;
    ASSERT_EQ(env->Class_GetStaticFieldByName_Float(cls, "age", &age), ANI_OK);
    ASSERT_EQ(age, static_cast<ani_float>(20.0F));
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Field_By_Name_Float_03([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodByName.GetFloatStatic", &cls), ANI_OK);

    ani_float age = 0.0F;
    ASSERT_EQ(env->Class_GetStaticFieldByName_Float(cls, "name", &age), ANI_INVALID_TYPE);
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Field_By_Name_Float_04([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodByName.GetFloatStatic", &cls), ANI_OK);
    ani_float age = 0.0F;
    ASSERT_EQ(env->Class_GetStaticFieldByName_Float(nullptr, "name", &age), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Field_By_Name_Float_05([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodByName.GetFloatStatic", &cls), ANI_OK);
    ani_float age = 0.0F;
    ASSERT_EQ(env->Class_GetStaticFieldByName_Float(cls, nullptr, &age), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Field_By_Name_Float_06([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodByName.GetFloatStatic", &cls), ANI_OK);
    ASSERT_EQ(env->Class_GetStaticFieldByName_Float(cls, "name", nullptr), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Field_By_Name_Float_07([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodByName.GetFloatStatic", &cls), ANI_OK);
    ani_float age = 0.0F;
    ASSERT_EQ(env->Class_GetStaticFieldByName_Float(cls, "", &age), ANI_NOT_FOUND);
    ASSERT_EQ(env->Class_GetStaticFieldByName_Float(cls, "\n", &age), ANI_NOT_FOUND);
    ASSERT_EQ(env->c_api->Class_GetStaticFieldByName_Float(nullptr, cls, "age", &age), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Field_By_Name_Float_08([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodByName.GetFloatStatic", &cls), ANI_OK);
    ani_float single = 0.0F;
    ASSERT_EQ(env->Class_GetStaticFieldByName_Float(cls, "specia1", &single), ANI_INVALID_TYPE);
    ASSERT_EQ(env->Class_GetStaticFieldByName_Float(cls, "specia3", &single), ANI_INVALID_TYPE);
    ASSERT_EQ(env->Class_GetStaticFieldByName_Float(cls, "specia4", &single), ANI_INVALID_TYPE);
    ASSERT_EQ(env->Class_GetStaticFieldByName_Float(cls, "specia5", &single), ANI_INVALID_TYPE);
    ani_float max = std::numeric_limits<ani_float>::max();
    ani_float minpositive = std::numeric_limits<ani_float>::min();
    ani_float min = -std::numeric_limits<ani_float>::max();
    ASSERT_EQ(env->Class_GetStaticFieldByName_Float(cls, "floatMin", &single), ANI_OK);
    ASSERT_EQ(single, static_cast<ani_float>(min));
    ASSERT_EQ(env->Class_GetStaticFieldByName_Float(cls, "minpositive", &single), ANI_OK);
    ASSERT_EQ(single, static_cast<ani_float>(minpositive));
    ASSERT_EQ(env->Class_GetStaticFieldByName_Float(cls, "floatMax", &single), ANI_OK);
    ASSERT_EQ(single, static_cast<ani_float>(max));
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Field_By_Name_Float_09([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    const ani_float expectedAge = 2.0F;
    const ani_float expectedAge2 = 3.0F;
    ani_float single = 0.0F;
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodByName.GetFloatStatic", &cls), ANI_OK);
    const int32_t loopCount = 3;
    for (int32_t i = 0; i < loopCount; i++) {
        ASSERT_EQ(env->Class_SetStaticFieldByName_Float(cls, "age", expectedAge2), ANI_OK);
        ASSERT_EQ(env->Class_GetStaticFieldByName_Float(cls, "age", &single), ANI_OK);
        ASSERT_EQ(single, expectedAge2);
    }
    ASSERT_EQ(env->Class_SetStaticFieldByName_Float(cls, "age", expectedAge), ANI_OK);
    ASSERT_EQ(env->Class_GetStaticFieldByName_Float(cls, "age", &single), ANI_OK);
    ASSERT_EQ(single, expectedAge);
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Field_By_Name_Float_10([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    CheckFieldValueGetFloat(env, "entry.src.main.src.ets.ClassOperationsMethodByName.GetFloatStatic", "age");
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Field_By_Name_Float_11([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    CheckFieldValueGetFloat(env, "entry.src.main.src.ets.ClassOperationsMethodByName.FloatStaticA", "float_value");
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Field_By_Name_Float_12([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    CheckFieldValueGetFloat(env, "entry.src.main.src.ets.ClassOperationsMethodByName.FloatStaticFinal", "float_value");
    return ANI_TRUE;
}

ani_boolean CheckFieldValueGetInt(ani_env *env, const char *className, const char *fieldName)
{
    ani_class cls {};
    const ani_int setTarget = 2U;
    ASSERT_EQ(env->FindClass(className, &cls), ANI_OK);

    ASSERT_EQ(env->Class_SetStaticFieldByName_Int(cls, fieldName, setTarget), ANI_OK);
    ani_int resultValue = 0;
    ASSERT_EQ(env->Class_GetStaticFieldByName_Int(cls, fieldName, &resultValue), ANI_OK);
    ASSERT_EQ(resultValue, setTarget);
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Field_By_Name_Int_01([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodByName.GetIntStatic", &cls), ANI_OK);
    ani_int age = 0;
    ASSERT_EQ(env->c_api->Class_GetStaticFieldByName_Int(env, cls, "age", &age), ANI_OK);
    ASSERT_EQ(age, static_cast<ani_int>(20U));
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Field_By_Name_Int_02([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodByName.GetIntStatic", &cls), ANI_OK);
    ani_int age = 0;
    ASSERT_EQ(env->Class_GetStaticFieldByName_Int(cls, "age", &age), ANI_OK);
    ASSERT_EQ(age, static_cast<ani_int>(20U));
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Field_By_Name_Int_03([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodByName.GetIntStatic", &cls), ANI_OK);

    ani_int age = 0;
    ASSERT_EQ(env->Class_GetStaticFieldByName_Int(cls, "name", &age), ANI_INVALID_TYPE);
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Field_By_Name_Int_04([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodByName.GetIntStatic", &cls), ANI_OK);
    ani_int age = 0;
    ASSERT_EQ(env->Class_GetStaticFieldByName_Int(nullptr, "name", &age), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Field_By_Name_Int_05([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodByName.GetIntStatic", &cls), ANI_OK);
    ani_int age = 0;
    ASSERT_EQ(env->Class_GetStaticFieldByName_Int(cls, nullptr, &age), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Field_By_Name_Int_06([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodByName.GetIntStatic", &cls), ANI_OK);
    ASSERT_EQ(env->Class_GetStaticFieldByName_Int(cls, "name", nullptr), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Field_By_Name_Int_07([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodByName.GetIntStatic", &cls), ANI_OK);
    ani_int age = 0;
    ASSERT_EQ(env->Class_GetStaticFieldByName_Int(cls, "", &age), ANI_NOT_FOUND);
    ASSERT_EQ(env->Class_GetStaticFieldByName_Int(cls, "\n", &age), ANI_NOT_FOUND);
    ASSERT_EQ(env->c_api->Class_GetStaticFieldByName_Int(nullptr, cls, "age", &age), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Field_By_Name_Int_08([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodByName.GetIntStatic", &cls), ANI_OK);
    ani_int single = 0;
    ASSERT_EQ(env->Class_GetStaticFieldByName_Int(cls, "specia1", &single), ANI_OK);
    ASSERT_EQ(single, static_cast<ani_int>(0));
    ASSERT_EQ(env->Class_GetStaticFieldByName_Int(cls, "specia3", &single), ANI_INVALID_TYPE);
    ASSERT_EQ(env->Class_GetStaticFieldByName_Int(cls, "specia4", &single), ANI_INVALID_TYPE);
    ASSERT_EQ(env->Class_GetStaticFieldByName_Int(cls, "specia5", &single), ANI_INVALID_TYPE);
    ani_int max = std::numeric_limits<ani_int>::max();
    ani_int min = std::numeric_limits<ani_int>::min();
    ASSERT_EQ(env->Class_GetStaticFieldByName_Int(cls, "min", &single), ANI_OK);
    ASSERT_EQ(single, static_cast<ani_int>(min));
    ASSERT_EQ(env->Class_GetStaticFieldByName_Int(cls, "max", &single), ANI_OK);
    ASSERT_EQ(single, static_cast<ani_int>(max));
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Field_By_Name_Int_09([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    const ani_int setTarget = 2U;
    const ani_int setTarget2 = 3U;
    ani_int single = 0;
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodByName.GetIntStatic", &cls), ANI_OK);
    const int32_t loopCount = 3;
    for (int32_t i = 0; i < loopCount; i++) {
        ASSERT_EQ(env->Class_SetStaticFieldByName_Int(cls, "age", setTarget2), ANI_OK);
        ASSERT_EQ(env->Class_GetStaticFieldByName_Int(cls, "age", &single), ANI_OK);
        ASSERT_EQ(single, setTarget2);
    }
    ASSERT_EQ(env->Class_SetStaticFieldByName_Int(cls, "age", setTarget), ANI_OK);
    ASSERT_EQ(env->Class_GetStaticFieldByName_Int(cls, "age", &single), ANI_OK);
    ASSERT_EQ(single, setTarget);
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Field_By_Name_Int_10([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    CheckFieldValueGetInt(env, "entry.src.main.src.ets.ClassOperationsMethodByName.GetIntStatic", "age");
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Field_By_Name_Int_11([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    CheckFieldValueGetInt(env, "entry.src.main.src.ets.ClassOperationsMethodByName.PackstaticA", "int_value");
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Field_By_Name_Int_12([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    CheckFieldValueGetInt(env, "entry.src.main.src.ets.ClassOperationsMethodByName.PackstaticFinal", "int_value");
    return ANI_TRUE;
}

ani_boolean CheckFieldValueGetLong(ani_env *env, const char *className, const char *fieldName)
{
    ani_class cls {};
    const ani_long setTarget = 2U;
    ASSERT_EQ(env->FindClass(className, &cls), ANI_OK);

    ASSERT_EQ(env->Class_SetStaticFieldByName_Long(cls, fieldName, setTarget), ANI_OK);
    ani_long resultValue = 0L;
    ASSERT_EQ(env->Class_GetStaticFieldByName_Long(cls, fieldName, &resultValue), ANI_OK);
    ASSERT_EQ(resultValue, setTarget);
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Field_By_Name_Long_01([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodByName.GetLongStatic", &cls), ANI_OK);
    ani_long age = 0L;
    ASSERT_EQ(env->c_api->Class_GetStaticFieldByName_Long(env, cls, "age", &age), ANI_OK);
    ASSERT_EQ(age, static_cast<ani_long>(20L));
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Field_By_Name_Long_02([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodByName.GetLongStatic", &cls), ANI_OK);
    ani_long age = 0L;
    ASSERT_EQ(env->Class_GetStaticFieldByName_Long(cls, "age", &age), ANI_OK);
    ASSERT_EQ(age, static_cast<ani_long>(20L));
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Field_By_Name_Long_03([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodByName.GetLongStatic", &cls), ANI_OK);

    ani_long age = 0L;
    ASSERT_EQ(env->Class_GetStaticFieldByName_Long(cls, "name", &age), ANI_INVALID_TYPE);
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Field_By_Name_Long_04([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodByName.GetLongStatic", &cls), ANI_OK);
    ani_long age = 0L;
    ASSERT_EQ(env->Class_GetStaticFieldByName_Long(nullptr, "name", &age), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Field_By_Name_Long_05([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodByName.GetLongStatic", &cls), ANI_OK);
    ani_long age = 0L;
    ASSERT_EQ(env->Class_GetStaticFieldByName_Long(cls, nullptr, &age), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Field_By_Name_Long_06([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodByName.GetLongStatic", &cls), ANI_OK);
    ASSERT_EQ(env->Class_GetStaticFieldByName_Long(cls, "name", nullptr), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Field_By_Name_Long_07([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodByName.GetLongStatic", &cls), ANI_OK);
    ani_long age = 0L;
    ASSERT_EQ(env->Class_GetStaticFieldByName_Long(cls, "", &age), ANI_NOT_FOUND);
    ASSERT_EQ(env->Class_GetStaticFieldByName_Long(cls, "\n", &age), ANI_NOT_FOUND);
    ASSERT_EQ(env->c_api->Class_GetStaticFieldByName_Long(nullptr, cls, "age", &age), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Field_By_Name_Long_08([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodByName.GetLongStatic", &cls), ANI_OK);
    ani_long single = 0L;
    ASSERT_EQ(env->Class_GetStaticFieldByName_Long(cls, "specia1", &single), ANI_INVALID_TYPE);
    ASSERT_EQ(env->Class_GetStaticFieldByName_Long(cls, "specia3", &single), ANI_INVALID_TYPE);
    ASSERT_EQ(env->Class_GetStaticFieldByName_Long(cls, "specia4", &single), ANI_INVALID_TYPE);
    ASSERT_EQ(env->Class_GetStaticFieldByName_Long(cls, "specia5", &single), ANI_INVALID_TYPE);
    ani_long max = std::numeric_limits<ani_long>::max();
    ani_long min = std::numeric_limits<ani_long>::min();
    ASSERT_EQ(env->Class_GetStaticFieldByName_Long(cls, "min", &single), ANI_OK);
    ASSERT_EQ(single, static_cast<ani_long>(min));
    ASSERT_EQ(env->Class_GetStaticFieldByName_Long(cls, "max", &single), ANI_OK);
    ASSERT_EQ(single, static_cast<ani_long>(max));
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Field_By_Name_Long_09([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    const ani_long setTarget = 2L;
    const ani_long setTarget2 = 3L;
    ani_long single = 0L;
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodByName.GetLongStatic", &cls), ANI_OK);
    const int32_t loopCount = 3;
    for (int32_t i = 0; i < loopCount; i++) {
        ASSERT_EQ(env->Class_SetStaticFieldByName_Long(cls, "age", setTarget2), ANI_OK);
        ASSERT_EQ(env->Class_GetStaticFieldByName_Long(cls, "age", &single), ANI_OK);
        ASSERT_EQ(single, setTarget2);
    }
    ASSERT_EQ(env->Class_SetStaticFieldByName_Long(cls, "age", setTarget), ANI_OK);
    ASSERT_EQ(env->Class_GetStaticFieldByName_Long(cls, "age", &single), ANI_OK);
    ASSERT_EQ(single, setTarget);
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Field_By_Name_Long_10([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    CheckFieldValueGetLong(env, "entry.src.main.src.ets.ClassOperationsMethodByName.GetLongStatic", "age");
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Field_By_Name_Long_11([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    CheckFieldValueGetLong(env, "entry.src.main.src.ets.ClassOperationsMethodByName.PackageStaticA", "long_value");
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Field_By_Name_Long_12([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    CheckFieldValueGetLong(env, "entry.src.main.src.ets.ClassOperationsMethodByName.PackageStaticFinal", "long_value");
    return ANI_TRUE;
}

ani_boolean CheckFieldValueGetShort(ani_env *env, const char *className, const char *fieldName)
{
    ani_class cls {};
    const ani_short setTarget = 2U;
    ASSERT_EQ(env->FindClass(className, &cls), ANI_OK);

    ASSERT_EQ(env->Class_SetStaticFieldByName_Short(cls, fieldName, setTarget), ANI_OK);
    ani_short resultValue = 1U;
    ASSERT_EQ(env->Class_GetStaticFieldByName_Short(cls, fieldName, &resultValue), ANI_OK);
    ASSERT_EQ(resultValue, setTarget);
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Field_By_Name_Short_01([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodByName.GetShortStatic", &cls), ANI_OK);
    ani_short age = 1U;
    ASSERT_EQ(env->c_api->Class_GetStaticFieldByName_Short(env, cls, "age", &age), ANI_OK);
    ASSERT_EQ(age, static_cast<ani_short>(20U));
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Field_By_Name_Short_02([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodByName.GetShortStatic", &cls), ANI_OK);
    ani_short age = 1U;
    ASSERT_EQ(env->Class_GetStaticFieldByName_Short(cls, "age", &age), ANI_OK);
    ASSERT_EQ(age, static_cast<ani_short>(20U));
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Field_By_Name_Short_03([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodByName.GetShortStatic", &cls), ANI_OK);

    ani_short age = 1U;
    ASSERT_EQ(env->Class_GetStaticFieldByName_Short(cls, "name", &age), ANI_INVALID_TYPE);
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Field_By_Name_Short_04([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodByName.GetShortStatic", &cls), ANI_OK);
    ani_short age = 1U;
    ASSERT_EQ(env->Class_GetStaticFieldByName_Short(nullptr, "name", &age), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Field_By_Name_Short_05([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodByName.GetShortStatic", &cls), ANI_OK);
    ani_short age = 1U;
    ASSERT_EQ(env->Class_GetStaticFieldByName_Short(cls, nullptr, &age), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Field_By_Name_Short_06([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodByName.GetShortStatic", &cls), ANI_OK);
    ASSERT_EQ(env->Class_GetStaticFieldByName_Short(cls, "name", nullptr), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Field_By_Name_Short_07([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodByName.GetShortStatic", &cls), ANI_OK);
    ani_short age = 1U;
    ASSERT_EQ(env->Class_GetStaticFieldByName_Short(cls, "", &age), ANI_NOT_FOUND);
    ASSERT_EQ(env->Class_GetStaticFieldByName_Short(cls, "\n", &age), ANI_NOT_FOUND);
    ASSERT_EQ(env->c_api->Class_GetStaticFieldByName_Short(nullptr, cls, "age", &age), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Field_By_Name_Short_08([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodByName.GetShortStatic", &cls), ANI_OK);
    ani_short single = 1U;
    ASSERT_EQ(env->Class_GetStaticFieldByName_Short(cls, "specia1", &single), ANI_INVALID_TYPE);
    ASSERT_EQ(env->Class_GetStaticFieldByName_Short(cls, "specia3", &single), ANI_INVALID_TYPE);
    ASSERT_EQ(env->Class_GetStaticFieldByName_Short(cls, "specia4", &single), ANI_INVALID_TYPE);
    ASSERT_EQ(env->Class_GetStaticFieldByName_Short(cls, "specia5", &single), ANI_INVALID_TYPE);
    ani_short max = std::numeric_limits<ani_short>::max();
    ani_short min = std::numeric_limits<ani_short>::min();
    ASSERT_EQ(env->Class_GetStaticFieldByName_Short(cls, "min", &single), ANI_OK);
    ASSERT_EQ(single, static_cast<ani_short>(min));
    ASSERT_EQ(env->Class_GetStaticFieldByName_Short(cls, "max", &single), ANI_OK);
    ASSERT_EQ(single, static_cast<ani_short>(max));
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Field_By_Name_Short_09([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    const ani_short setTarget = 2U;
    const ani_short setTarget2 = 3U;
    ani_short single = 1U;
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodByName.GetShortStatic", &cls), ANI_OK);
    const int32_t loopCount = 3;
    for (int32_t i = 0; i < loopCount; i++) {
        ASSERT_EQ(env->Class_SetStaticFieldByName_Short(cls, "age", setTarget2), ANI_OK);
        ASSERT_EQ(env->Class_GetStaticFieldByName_Short(cls, "age", &single), ANI_OK);
        ASSERT_EQ(single, setTarget2);
    }
    ASSERT_EQ(env->Class_SetStaticFieldByName_Short(cls, "age", setTarget), ANI_OK);
    ASSERT_EQ(env->Class_GetStaticFieldByName_Short(cls, "age", &single), ANI_OK);
    ASSERT_EQ(single, setTarget);
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Field_By_Name_Short_10([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    CheckFieldValueGetShort(env, "entry.src.main.src.ets.ClassOperationsMethodByName.GetShortStatic", "age");
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Field_By_Name_Short_11([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    CheckFieldValueGetShort(env, "entry.src.main.src.ets.ClassOperationsMethodByName.ShortStaticA", "short_value");
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Field_By_Name_Short_12([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    CheckFieldValueGetShort(env, "entry.src.main.src.ets.ClassOperationsMethodByName.ShortStaticFinal", "short_value");
    return ANI_TRUE;
}

ani_boolean CheckFieldValueGetRef(ani_env *env, const char *className, const char *fieldName)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass(className, &cls), ANI_OK);

    ani_string string {};
    ASSERT_EQ(env->String_NewUTF8("abcdef", 6U, &string), ANI_OK);

    ASSERT_EQ(env->Class_SetStaticFieldByName_Ref(cls, fieldName, string), ANI_OK);
    ani_ref resultValue = nullptr;
    ASSERT_EQ(env->Class_GetStaticFieldByName_Ref(cls, fieldName, &resultValue), ANI_OK);

    auto name = static_cast<ani_string>(resultValue);
    std::array<char, 7U> buffer {};
    ani_size resSize = 0U;
    ASSERT_EQ(env->String_GetUTF8SubString(name, 0U, 6U, buffer.data(), buffer.size(), &resSize), ANI_OK);
    ASSERT_EQ(resSize, 6U);
    ASSERT_STREQ(buffer.data(), "abcdef");
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Field_By_Name_Ref_01([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodByName.Man", &cls), ANI_OK);

    ani_ref nameRef = nullptr;
    ASSERT_EQ(env->c_api->Class_GetStaticFieldByName_Ref(env, cls, "name", &nameRef), ANI_OK);

    auto name = static_cast<ani_string>(nameRef);
    std::array<char, 6U> buffer {};
    ani_size nameSize = 0U;
    ASSERT_EQ(env->String_GetUTF8SubString(name, 0U, 3U, buffer.data(), buffer.size(), &nameSize), ANI_OK);
    ASSERT_EQ(nameSize, 3U);
    ASSERT_STREQ(buffer.data(), "Bob");
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Field_By_Name_Ref_02([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodByName.Man", &cls), ANI_OK);

    ani_ref nameRef = nullptr;
    ASSERT_EQ(env->Class_GetStaticFieldByName_Ref(cls, "name", &nameRef), ANI_OK);

    auto name = static_cast<ani_string>(nameRef);
    std::array<char, 6U> buffer {};
    ani_size nameSize = 0U;
    ASSERT_EQ(env->String_GetUTF8SubString(name, 0U, 3U, buffer.data(), buffer.size(), &nameSize), ANI_OK);
    ASSERT_EQ(nameSize, 3U);
    ASSERT_STREQ(buffer.data(), "Bob");
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Field_By_Name_Ref_03([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodByName.Man", &cls), ANI_OK);
    ani_ref nameRef = nullptr;
    ASSERT_EQ(env->Class_GetStaticFieldByName_Ref(cls, "age", &nameRef), ANI_INVALID_TYPE);
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Field_By_Name_Ref_04([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodByName.Man", &cls), ANI_OK);
    ani_ref nameRef = nullptr;
    ASSERT_EQ(env->Class_GetStaticFieldByName_Ref(nullptr, "name", &nameRef), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Field_By_Name_Ref_05([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodByName.Man", &cls), ANI_OK);
    ani_ref nameRef = nullptr;
    ASSERT_EQ(env->Class_GetStaticFieldByName_Ref(cls, nullptr, &nameRef), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Field_By_Name_Ref_06([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodByName.Man", &cls), ANI_OK);
    ASSERT_EQ(env->Class_GetStaticFieldByName_Ref(cls, "name", nullptr), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Field_By_Name_Ref_07([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls;
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodByName.Man", &cls), ANI_OK);
    ani_ref nameRef = nullptr;
    ASSERT_EQ(env->Class_GetStaticFieldByName_Ref(cls, "", &nameRef), ANI_NOT_FOUND);
    ASSERT_EQ(env->Class_GetStaticFieldByName_Ref(cls, "\n", &nameRef), ANI_NOT_FOUND);
    ASSERT_EQ(env->c_api->Class_GetStaticFieldByName_Ref(nullptr, cls, "name", &nameRef), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Field_By_Name_Ref_08([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodByName.Man", &cls), ANI_OK);
    ani_ref resultValue = nullptr;
    ani_string string {};
    ani_string string2 {};
    ani_size resSize = 0U;
    ASSERT_EQ(env->String_NewUTF8("abcdef", 6U, &string), ANI_OK);
    ASSERT_EQ(env->String_NewUTF8("fedcba", 6U, &string2), ANI_OK);
    const int32_t loopCount = 3;
    for (int32_t i = 0; i < loopCount - 1; i++) {
        ASSERT_EQ(env->Class_SetStaticFieldByName_Ref(cls, "name", string), ANI_OK);
        ASSERT_EQ(env->Class_GetStaticFieldByName_Ref(cls, "name", &resultValue), ANI_OK);
        auto name = static_cast<ani_string>(resultValue);
        std::array<char, 30U> buffer {};
        ASSERT_EQ(env->String_GetUTF8SubString(name, 0U, 6U, buffer.data(), buffer.size(), &resSize), ANI_OK);
        ASSERT_EQ(resSize, 6U);
        ASSERT_STREQ(buffer.data(), "abcdef");
    }
    ASSERT_EQ(env->Class_SetStaticFieldByName_Ref(cls, "name", string2), ANI_OK);
    ASSERT_EQ(env->Class_GetStaticFieldByName_Ref(cls, "name", &resultValue), ANI_OK);
    auto name = static_cast<ani_string>(resultValue);
    std::array<char, 30U> buffer {};
    ASSERT_EQ(env->String_GetUTF8SubString(name, 0U, 6U, buffer.data(), buffer.size(), &resSize), ANI_OK);
    ASSERT_EQ(resSize, 6U);
    ASSERT_STREQ(buffer.data(), "fedcba");
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Field_By_Name_Ref_09([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    CheckFieldValueGetRef(env, "entry.src.main.src.ets.ClassOperationsMethodByName.Man", "name");
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Field_By_Name_Ref_10([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    CheckFieldValueGetRef(env, "entry.src.main.src.ets.ClassOperationsMethodByName.BoxStaticA", "string_value");
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Field_By_Name_Ref_11([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    CheckFieldValueGetRef(env, "entry.src.main.src.ets.ClassOperationsMethodByName.BoxStaticFinal", "string_value");
    return ANI_TRUE;
}

ani_boolean CheckFieldValueByte(ani_env *env, const char *className, const char *fieldName)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass(className, &cls), ANI_OK);
    ani_static_field field {};
    ASSERT_EQ(env->Class_FindStaticField(cls, fieldName, &field), ANI_OK);
    ASSERT_NE(field, nullptr);
    ani_byte result = 0U;
    const ani_byte target = 126;
    ASSERT_EQ(env->Class_GetStaticField_Byte(cls, field, &result), ANI_OK);
    ASSERT_EQ(result, target);
    const ani_byte setTar = 127;
    ASSERT_EQ(env->Class_SetStaticField_Byte(cls, field, setTar), ANI_OK);
    ASSERT_EQ(env->Class_GetStaticField_Byte(cls, field, &result), ANI_OK);
    ASSERT_EQ(result, setTar);
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Static_Field_Byte_01([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperations.TestByte", &cls), ANI_OK);
    ani_static_field field {};
    ASSERT_EQ(env->Class_FindStaticField(cls, "byte_value", &field), ANI_OK);
    ASSERT_NE(field, nullptr);
    ani_byte result = 0;
    const ani_byte target = 126;
    ASSERT_EQ(env->Class_GetStaticField_Byte(cls, field, &result), ANI_OK);
    ASSERT_EQ(result, target);
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Static_Field_Byte_02([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperations.TestByte", &cls), ANI_OK);
    ani_static_field field {};
    ASSERT_EQ(env->Class_FindStaticField(cls, "byte_value", &field), ANI_OK);
    ASSERT_NE(field, nullptr);
    ani_byte result = 0;
    const ani_byte target = 126;
    ASSERT_EQ(env->c_api->Class_GetStaticField_Byte(env, cls, field, &result), ANI_OK);
    ASSERT_EQ(result, target);
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Static_Field_Byte_03([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperations.TestByte", &cls), ANI_OK);
    ani_static_field field {};
    ASSERT_EQ(env->Class_FindStaticField(cls, "string_value", &field), ANI_OK);
    ASSERT_NE(field, nullptr);
    ani_byte result = 0;
    ASSERT_EQ(env->Class_GetStaticField_Byte(cls, field, &result), ANI_INVALID_TYPE);
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Static_Field_Byte_04([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperations.TestByte", &cls), ANI_OK);
    ani_static_field field {};
    ASSERT_EQ(env->Class_FindStaticField(cls, "byte_value", &field), ANI_OK);
    ASSERT_NE(field, nullptr);
    ani_byte result = 0;
    ASSERT_EQ(env->Class_GetStaticField_Byte(nullptr, field, &result), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Static_Field_Byte_05([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperations.TestByte", &cls), ANI_OK);
    ani_byte result = 0;
    ASSERT_EQ(env->Class_GetStaticField_Byte(cls, nullptr, &result), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Static_Field_Byte_06([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperations.TestByte", &cls), ANI_OK);
    ani_static_field field {};
    ASSERT_EQ(env->Class_FindStaticField(cls, "byte_value", &field), ANI_OK);
    ASSERT_NE(field, nullptr);
    ASSERT_EQ(env->Class_GetStaticField_Byte(cls, field, nullptr), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Static_Field_Byte_07([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls;
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperations.TestByte", &cls), ANI_OK);
    ani_static_field field;
    ASSERT_EQ(env->Class_FindStaticField(cls, "byte_value", &field), ANI_OK);
    ASSERT_NE(field, nullptr);
    ani_byte result = 0;
    ASSERT_EQ(env->c_api->Class_GetStaticField_Byte(nullptr, cls, field, &result), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Static_Field_Byte_08([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperations.TestByte", &cls), ANI_OK);

    ani_static_field field {};
    ani_byte single = 0;
    const int32_t fieldNum = 11;
    for (int32_t i = 1; i <= fieldNum; ++i) {
        std::string fieldName = "special" + std::to_string(i);
        ASSERT_EQ(env->Class_FindStaticField(cls, fieldName.c_str(), &field), ANI_OK);
        ASSERT_EQ(env->Class_GetStaticField_Byte(cls, field, &single), ANI_INVALID_TYPE);
    }

    const ani_byte maxTarget = 127;
    const ani_byte minTarget = -128;
    ASSERT_EQ(env->Class_FindStaticField(cls, "byteMax", &field), ANI_OK);
    ASSERT_EQ(env->Class_GetStaticField_Byte(cls, field, &single), ANI_OK);
    ASSERT_EQ(single, maxTarget);

    ASSERT_EQ(env->Class_FindStaticField(cls, "byteMin", &field), ANI_OK);
    ASSERT_EQ(env->Class_GetStaticField_Byte(cls, field, &single), ANI_OK);
    ASSERT_EQ(single, minTarget);
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Static_Field_Byte_09([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_field field {};
    const ani_byte setTarget = 127;
    ani_byte single = 0U;
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperations.TestByte", &cls), ANI_OK);
    ASSERT_EQ(env->Class_FindStaticField(cls, "byte_value", &field), ANI_OK);
    ASSERT_NE(field, nullptr);
    ASSERT_EQ(env->Class_SetStaticField_Byte(cls, field, setTarget), ANI_OK);

    ASSERT_EQ(env->Class_GetStaticField_Byte(cls, field, &single), ANI_OK);
    ASSERT_EQ(single, setTarget);
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Static_Field_Byte_10([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_field field {};
    const ani_byte setTarget = 127;
    const ani_byte setTarget2 = 125;
    ani_byte single = 0U;
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperations.TestByte", &cls), ANI_OK);
    ASSERT_EQ(env->Class_FindStaticField(cls, "byte_value", &field), ANI_OK);
    ASSERT_NE(field, nullptr);
    const int32_t loopNum = 3;
    for (int32_t i = 0; i < loopNum - 1; i++) {
        ASSERT_EQ(env->Class_SetStaticField_Byte(cls, field, setTarget), ANI_OK);
        ASSERT_EQ(env->Class_GetStaticField_Byte(cls, field, &single), ANI_OK);
        ASSERT_EQ(single, setTarget);
    }
    ASSERT_EQ(env->Class_SetStaticField_Byte(cls, field, setTarget2), ANI_OK);
    ASSERT_EQ(env->Class_GetStaticField_Byte(cls, field, &single), ANI_OK);
    ASSERT_EQ(single, setTarget2);
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Static_Field_Byte_11([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    CheckFieldValueByte(env, "entry.src.main.src.ets.ClassOperations.TestByteA", "byte_value");
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Static_Field_Byte_12([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    CheckFieldValueByte(env, "entry.src.main.src.ets.ClassOperations.TestByteFinal", "byte_value");
    return ANI_TRUE;
}

ani_boolean CheckFieldValueChar(ani_env *env, const char *className, const char *fieldName)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass(className, &cls), ANI_OK);
    ani_static_field field {};
    ASSERT_EQ(env->Class_FindStaticField(cls, fieldName, &field), ANI_OK);
    ASSERT_NE(field, nullptr);
    ani_char result = 0U;
    const ani_char target = 'c';
    ASSERT_EQ(env->Class_GetStaticField_Char(cls, field, &result), ANI_OK);
    ASSERT_EQ(result, target);
    const ani_char setTar = 'a';
    ASSERT_EQ(env->Class_SetStaticField_Char(cls, field, setTar), ANI_OK);
    ASSERT_EQ(env->Class_GetStaticField_Char(cls, field, &result), ANI_OK);
    ASSERT_EQ(result, setTar);
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Static_Field_Char_01([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperations.TestChar", &cls), ANI_OK);
    ani_static_field field {};
    ASSERT_EQ(env->Class_FindStaticField(cls, "char_value", &field), ANI_OK);
    ASSERT_NE(field, nullptr);
    ani_char result = '\0';
    const ani_char target = 'c';
    ASSERT_EQ(env->Class_GetStaticField_Char(cls, field, &result), ANI_OK);
    ASSERT_EQ(result, target);
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Static_Field_Char_02([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperations.TestChar", &cls), ANI_OK);
    ani_static_field field {};
    ASSERT_EQ(env->Class_FindStaticField(cls, "char_value", &field), ANI_OK);
    ASSERT_NE(field, nullptr);
    ani_char result = '\0';
    const ani_char target = 'c';
    ASSERT_EQ(env->c_api->Class_GetStaticField_Char(env, cls, field, &result), ANI_OK);
    ASSERT_EQ(result, target);
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Static_Field_Char_03([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperations.TestChar", &cls), ANI_OK);
    ani_static_field field {};
    ASSERT_EQ(env->Class_FindStaticField(cls, "string_value", &field), ANI_OK);
    ASSERT_NE(field, nullptr);
    ani_char result = '\0';
    ASSERT_EQ(env->Class_GetStaticField_Char(cls, field, &result), ANI_INVALID_TYPE);
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Static_Field_Char_04([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperations.TestChar", &cls), ANI_OK);
    ani_static_field field {};
    ASSERT_EQ(env->Class_FindStaticField(cls, "char_value", &field), ANI_OK);
    ASSERT_NE(field, nullptr);
    ani_char result = '\0';
    ASSERT_EQ(env->Class_GetStaticField_Char(nullptr, field, &result), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Static_Field_Char_05([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperations.TestChar", &cls), ANI_OK);
    ani_char result = '\0';
    ASSERT_EQ(env->Class_GetStaticField_Char(cls, nullptr, &result), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Static_Field_Char_06([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperations.TestChar", &cls), ANI_OK);
    ani_static_field field {};
    ASSERT_EQ(env->Class_FindStaticField(cls, "char_value", &field), ANI_OK);
    ASSERT_NE(field, nullptr);
    ASSERT_EQ(env->Class_GetStaticField_Char(cls, field, nullptr), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Static_Field_Char_07([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls;
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperations.TestChar", &cls), ANI_OK);
    ani_static_field field;
    ASSERT_EQ(env->Class_FindStaticField(cls, "char_value", &field), ANI_OK);
    ASSERT_NE(field, nullptr);
    ani_char result = '\0';
    ASSERT_EQ(env->c_api->Class_GetStaticField_Char(nullptr, cls, field, &result), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Static_Field_Char_08([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperations.TestChar", &cls), ANI_OK);
    ani_char single = '\0';
    ani_static_field field {};
    ASSERT_EQ(env->Class_FindStaticField(cls, "special1", &field), ANI_OK);
    ASSERT_EQ(env->Class_GetStaticField_Char(cls, field, &single), ANI_INVALID_TYPE);

    ASSERT_EQ(env->Class_FindStaticField(cls, "special2", &field), ANI_OK);
    ASSERT_EQ(env->Class_GetStaticField_Char(cls, field, &single), ANI_INVALID_TYPE);

    ASSERT_EQ(env->Class_FindStaticField(cls, "special3", &field), ANI_OK);
    ASSERT_EQ(env->Class_GetStaticField_Char(cls, field, &single), ANI_INVALID_TYPE);

    std::array<char, 5U> expectedValues = {'\n', '\r', '\t', '\b', '\0'};
    for (size_t i = 0; i < expectedValues.size(); ++i) {
        std::string fieldName = "special" + std::to_string(i + 4);
        ASSERT_EQ(env->Class_FindStaticField(cls, fieldName.c_str(), &field), ANI_OK);
        ASSERT_EQ(env->Class_GetStaticField_Char(cls, field, &single), ANI_OK);
        ASSERT_EQ(single, expectedValues[i]);
    }

    const ani_char maxTarget = std::numeric_limits<ani_char>::max();
    const ani_char minTarget = std::numeric_limits<ani_char>::min();
    ASSERT_EQ(env->Class_FindStaticField(cls, "charMax", &field), ANI_OK);
    ASSERT_EQ(env->Class_GetStaticField_Char(cls, field, &single), ANI_OK);
    ASSERT_EQ(single, maxTarget);

    ASSERT_EQ(env->Class_FindStaticField(cls, "charMin", &field), ANI_OK);
    ASSERT_EQ(env->Class_GetStaticField_Char(cls, field, &single), ANI_OK);
    ASSERT_EQ(single, minTarget);
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Static_Field_Char_09([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_field field {};
    const ani_char setTarget = 'a';
    const ani_char setTarget2 = 'b';
    ani_char single;
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperations.TestChar", &cls), ANI_OK);
    ASSERT_EQ(env->Class_FindStaticField(cls, "char_value", &field), ANI_OK);
    ASSERT_NE(field, nullptr);
    const int32_t loopNum = 3;
    for (int32_t i = 0; i < loopNum - 1; i++) {
        ASSERT_EQ(env->Class_SetStaticField_Char(cls, field, setTarget), ANI_OK);
        ASSERT_EQ(env->Class_GetStaticField_Char(cls, field, &single), ANI_OK);
        ASSERT_EQ(single, setTarget);
    }
    ASSERT_EQ(env->Class_SetStaticField_Char(cls, field, setTarget2), ANI_OK);
    ASSERT_EQ(env->Class_GetStaticField_Char(cls, field, &single), ANI_OK);
    ASSERT_EQ(single, setTarget2);
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Static_Field_Char_10([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    CheckFieldValueChar(env, "entry.src.main.src.ets.ClassOperations.TestCharA", "char_value");
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Static_Field_Char_11([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    CheckFieldValueChar(env, "entry.src.main.src.ets.ClassOperations.TestCharFinal", "char_value");
    return ANI_TRUE;
}

ani_boolean CheckFieldValueDouble(ani_env *env, const char *className, const char *fieldName)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass(className, &cls), ANI_OK);
    ani_static_field field {};
    ASSERT_EQ(env->Class_FindStaticField(cls, fieldName, &field), ANI_OK);
    ASSERT_NE(field, nullptr);
    ani_double result = 0U;
    const ani_double target = 18.0;
    ASSERT_EQ(env->Class_GetStaticField_Double(cls, field, &result), ANI_OK);
    ASSERT_EQ(result, target);
    const ani_double setTar = 20.0;
    ASSERT_EQ(env->Class_SetStaticField_Double(cls, field, setTar), ANI_OK);
    ASSERT_EQ(env->Class_GetStaticField_Double(cls, field, &result), ANI_OK);
    ASSERT_EQ(result, setTar);
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Static_Field_Double_01([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperations.TestDouble", &cls), ANI_OK);
    ani_static_field field {};
    ASSERT_EQ(env->Class_FindStaticField(cls, "double_value", &field), ANI_OK);
    ASSERT_NE(field, nullptr);
    ani_double result = 0.0;
    const ani_double target = 18.0;
    ASSERT_EQ(env->Class_GetStaticField_Double(cls, field, &result), ANI_OK);
    ASSERT_EQ(result, target);
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Static_Field_Double_02([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperations.TestDouble", &cls), ANI_OK);
    ani_static_field field {};
    ASSERT_EQ(env->Class_FindStaticField(cls, "double_value", &field), ANI_OK);
    ASSERT_NE(field, nullptr);
    ani_double result = 0.0;
    const ani_double target = 18.0;
    ASSERT_EQ(env->c_api->Class_GetStaticField_Double(env, cls, field, &result), ANI_OK);
    ASSERT_EQ(result, target);
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Static_Field_Double_03([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperations.TestDouble", &cls), ANI_OK);
    ani_static_field field {};
    ASSERT_EQ(env->Class_FindStaticField(cls, "string_value", &field), ANI_OK);
    ASSERT_NE(field, nullptr);
    ani_double result = 0.0;
    ASSERT_EQ(env->Class_GetStaticField_Double(cls, field, &result), ANI_INVALID_TYPE);
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Static_Field_Double_04([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperations.TestDouble", &cls), ANI_OK);
    ani_static_field field {};
    ASSERT_EQ(env->Class_FindStaticField(cls, "double_value", &field), ANI_OK);
    ASSERT_NE(field, nullptr);
    ani_double result = 0.0;
    ASSERT_EQ(env->Class_GetStaticField_Double(nullptr, field, &result), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Static_Field_Double_05([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperations.TestDouble", &cls), ANI_OK);
    ani_double result = 0.0;
    ASSERT_EQ(env->Class_GetStaticField_Double(cls, nullptr, &result), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Static_Field_Double_06([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperations.TestDouble", &cls), ANI_OK);
    ani_static_field field {};
    ASSERT_EQ(env->Class_FindStaticField(cls, "double_value", &field), ANI_OK);
    ASSERT_NE(field, nullptr);
    ASSERT_EQ(env->Class_GetStaticField_Double(cls, field, nullptr), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Static_Field_Double_07([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperations.TestDouble", &cls), ANI_OK);
    ani_static_field field = nullptr;
    ASSERT_EQ(env->Class_FindStaticField(cls, "double_value", &field), ANI_OK);
    ASSERT_NE(field, nullptr);
    ani_double result = 0.0;
    ASSERT_EQ(env->c_api->Class_GetStaticField_Double(nullptr, cls, field, &result), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Static_Field_Double_08([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperations.TestDouble", &cls), ANI_OK);
    ani_static_field field {};
    ani_double single = 0.0;
    const int32_t fieldNum = 4;
    for (int32_t i = 1; i <= fieldNum; ++i) {
        std::string fieldName = "special" + std::to_string(i);
        ASSERT_EQ(env->Class_FindStaticField(cls, fieldName.c_str(), &field), ANI_OK);
        ASSERT_EQ(env->Class_GetStaticField_Double(cls, field, &single), ANI_INVALID_TYPE);
    }

    ani_double max = std::numeric_limits<ani_double>::max();
    ani_double minpositive = std::numeric_limits<ani_double>::min();
    ani_double min = -std::numeric_limits<ani_double>::max();
    ASSERT_EQ(env->Class_FindStaticField(cls, "doubleMin", &field), ANI_OK);
    ASSERT_EQ(env->Class_GetStaticField_Double(cls, field, &single), ANI_OK);
    ASSERT_EQ(single, static_cast<ani_double>(min));
    ASSERT_EQ(env->Class_FindStaticField(cls, "doubleMax", &field), ANI_OK);
    ASSERT_EQ(env->Class_GetStaticField_Double(cls, field, &single), ANI_OK);
    ASSERT_EQ(single, static_cast<ani_double>(max));
    ASSERT_EQ(env->Class_FindStaticField(cls, "minpositive", &field), ANI_OK);
    ASSERT_EQ(env->Class_GetStaticField_Double(cls, field, &single), ANI_OK);
    ASSERT_EQ(single, static_cast<ani_double>(minpositive));
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Static_Field_Double_09([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperations.TestDouble", &cls), ANI_OK);
    ani_static_field field {};
    const ani_double setTar = 28.0;
    const ani_double setTar2 = 18.0;
    ASSERT_EQ(env->Class_FindStaticField(cls, "double_value", &field), ANI_OK);
    ASSERT_NE(field, nullptr);
    ani_double result = 0.0;
    const int32_t loopCount = 3;
    for (int32_t i = 0; i < loopCount; i++) {
        ASSERT_EQ(env->Class_SetStaticField_Double(cls, field, setTar2), ANI_OK);
        ASSERT_EQ(env->Class_GetStaticField_Double(cls, field, &result), ANI_OK);
        ASSERT_EQ(result, setTar2);
    }
    ASSERT_EQ(env->Class_SetStaticField_Double(cls, field, setTar), ANI_OK);
    ASSERT_EQ(env->Class_GetStaticField_Double(cls, field, &result), ANI_OK);
    ASSERT_EQ(result, setTar);
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Static_Field_Double_10([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    CheckFieldValueDouble(env, "entry.src.main.src.ets.ClassOperations.TestDoubleA", "double_value");
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Static_Field_Double_11([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    CheckFieldValueDouble(env, "entry.src.main.src.ets.ClassOperations.TestDoubleA", "double_value");
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Static_Field_Double_12([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    CheckFieldValueDouble(env, "entry.src.main.src.ets.ClassOperations.TestDoubleFinal", "double_value");
    return ANI_TRUE;
}

ani_boolean CheckFieldValueFloat(ani_env *env, const char *className, const char *fieldName)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass(className, &cls), ANI_OK);
    ani_static_field field {};
    ASSERT_EQ(env->Class_FindStaticField(cls, fieldName, &field), ANI_OK);
    ASSERT_NE(field, nullptr);
    ani_float result = 0U;
    const ani_float target = 18.0F;
    ASSERT_EQ(env->Class_GetStaticField_Float(cls, field, &result), ANI_OK);
    ASSERT_EQ(result, target);
    const ani_float setTar = 20.0F;
    ASSERT_EQ(env->Class_SetStaticField_Float(cls, field, setTar), ANI_OK);
    ASSERT_EQ(env->Class_GetStaticField_Float(cls, field, &result), ANI_OK);
    ASSERT_EQ(result, setTar);
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Static_Field_Float_01([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperations.TestFloat", &cls), ANI_OK);
    ani_static_field field {};
    ASSERT_EQ(env->Class_FindStaticField(cls, "float_value", &field), ANI_OK);
    ASSERT_NE(field, nullptr);
    ani_float result = 0.0F;
    const ani_float target = 18.0F;
    ASSERT_EQ(env->Class_GetStaticField_Float(cls, field, &result), ANI_OK);
    ASSERT_EQ(result, target);
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Static_Field_Float_02([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperations.TestFloat", &cls), ANI_OK);
    ani_static_field field {};
    ASSERT_EQ(env->Class_FindStaticField(cls, "float_value", &field), ANI_OK);
    ASSERT_NE(field, nullptr);
    ani_float result = 0.0F;
    const ani_float target = 18.0F;
    ASSERT_EQ(env->c_api->Class_GetStaticField_Float(env, cls, field, &result), ANI_OK);
    ASSERT_EQ(result, target);
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Static_Field_Float_03([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperations.TestFloat", &cls), ANI_OK);
    ani_static_field field {};
    ASSERT_EQ(env->Class_FindStaticField(cls, "string_value", &field), ANI_OK);
    ASSERT_NE(field, nullptr);
    ani_float result = 0.0F;
    ASSERT_EQ(env->Class_GetStaticField_Float(cls, field, &result), ANI_INVALID_TYPE);
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Static_Field_Float_04([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperations.TestFloat", &cls), ANI_OK);
    ani_static_field field {};
    ASSERT_EQ(env->Class_FindStaticField(cls, "float_value", &field), ANI_OK);
    ASSERT_NE(field, nullptr);
    ani_float result = 0.0F;
    ASSERT_EQ(env->Class_GetStaticField_Float(nullptr, field, &result), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Static_Field_Float_05([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperations.TestFloat", &cls), ANI_OK);
    ani_float result = 0.0F;
    ASSERT_EQ(env->Class_GetStaticField_Float(cls, nullptr, &result), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Static_Field_Float_06([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperations.TestFloat", &cls), ANI_OK);
    ani_static_field field {};
    ASSERT_EQ(env->Class_FindStaticField(cls, "float_value", &field), ANI_OK);
    ASSERT_NE(field, nullptr);
    ASSERT_EQ(env->Class_GetStaticField_Float(cls, field, nullptr), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Static_Field_Float_07([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperations.TestFloat", &cls), ANI_OK);
    ani_static_field field = nullptr;
    ASSERT_EQ(env->Class_FindStaticField(cls, "float_value", &field), ANI_OK);
    ASSERT_NE(field, nullptr);
    ani_float result = 0.0F;
    ASSERT_EQ(env->c_api->Class_GetStaticField_Float(nullptr, cls, field, &result), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Static_Field_Float_08([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperations.TestFloat", &cls), ANI_OK);
    ani_static_field field {};
    ani_float single = 0.0F;
    ASSERT_EQ(env->Class_FindStaticField(cls, "specia1", &field), ANI_OK);
    ASSERT_EQ(env->Class_GetStaticField_Float(cls, field, &single), ANI_INVALID_TYPE);
    ASSERT_EQ(env->Class_FindStaticField(cls, "specia3", &field), ANI_OK);
    ASSERT_EQ(env->Class_GetStaticField_Float(cls, field, &single), ANI_INVALID_TYPE);
    ASSERT_EQ(env->Class_FindStaticField(cls, "specia4", &field), ANI_OK);
    ASSERT_EQ(env->Class_GetStaticField_Float(cls, field, &single), ANI_INVALID_TYPE);
    ASSERT_EQ(env->Class_FindStaticField(cls, "specia5", &field), ANI_OK);
    ASSERT_EQ(env->Class_GetStaticField_Float(cls, field, &single), ANI_INVALID_TYPE);
    ani_float max = std::numeric_limits<ani_float>::max();
    ani_float minpositive = std::numeric_limits<ani_float>::min();
    ani_float min = -std::numeric_limits<ani_float>::max();
    ASSERT_EQ(env->Class_FindStaticField(cls, "floatMin", &field), ANI_OK);
    ASSERT_EQ(env->Class_GetStaticField_Float(cls, field, &single), ANI_OK);
    ASSERT_EQ(single, min);
    ASSERT_EQ(env->Class_FindStaticField(cls, "floatMax", &field), ANI_OK);
    ASSERT_EQ(env->Class_GetStaticField_Float(cls, field, &single), ANI_OK);
    ASSERT_EQ(single, max);
    ASSERT_EQ(env->Class_FindStaticField(cls, "minpositive", &field), ANI_OK);
    ASSERT_EQ(env->Class_GetStaticField_Float(cls, field, &single), ANI_OK);
    ASSERT_EQ(single, minpositive);
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Static_Field_Float_09([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperations.TestFloat", &cls), ANI_OK);
    ani_static_field field {};
    const ani_float setTar = 28.0F;
    const ani_float setTar2 = 18.0F;
    ASSERT_EQ(env->Class_FindStaticField(cls, "float_value", &field), ANI_OK);
    ASSERT_NE(field, nullptr);
    ani_float result = 0.0;
    const int32_t loopCount = 3;
    for (int32_t i = 0; i < loopCount; i++) {
        ASSERT_EQ(env->Class_SetStaticField_Float(cls, field, setTar2), ANI_OK);
        ASSERT_EQ(env->Class_GetStaticField_Float(cls, field, &result), ANI_OK);
        ASSERT_EQ(result, setTar2);
    }
    ASSERT_EQ(env->Class_SetStaticField_Float(cls, field, setTar), ANI_OK);
    ASSERT_EQ(env->Class_GetStaticField_Float(cls, field, &result), ANI_OK);
    ASSERT_EQ(result, setTar);
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Static_Field_Float_10([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    CheckFieldValueFloat(env, "entry.src.main.src.ets.ClassOperations.TestFloat", "float_value");
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Static_Field_Float_11([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    CheckFieldValueFloat(env, "entry.src.main.src.ets.ClassOperations.TestFloatA", "float_value");
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Static_Field_Float_12([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    CheckFieldValueFloat(env, "entry.src.main.src.ets.ClassOperations.TestFloatFinal", "float_value");
    return ANI_TRUE;
}

ani_boolean CheckFieldValueInt(ani_env *env, const char *className, const char *fieldName)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass(className, &cls), ANI_OK);
    ani_static_field field {};
    ASSERT_EQ(env->Class_FindStaticField(cls, fieldName, &field), ANI_OK);
    ASSERT_NE(field, nullptr);
    ani_int result = 0U;
    const ani_int target = 3U;
    ASSERT_EQ(env->Class_GetStaticField_Int(cls, field, &result), ANI_OK);
    ASSERT_EQ(result, target);
    const ani_int setTar = 2U;
    ASSERT_EQ(env->Class_SetStaticField_Int(cls, field, setTar), ANI_OK);
    ASSERT_EQ(env->Class_GetStaticField_Int(cls, field, &result), ANI_OK);
    ASSERT_EQ(result, setTar);
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Static_Field_Int_01([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperations.TestInt", &cls), ANI_OK);
    ani_static_field field {};
    ASSERT_EQ(env->Class_FindStaticField(cls, "int_value", &field), ANI_OK);
    ASSERT_NE(field, nullptr);
    ani_int result = 0;
    ASSERT_EQ(env->Class_GetStaticField_Int(cls, field, &result), ANI_OK);
    ASSERT_EQ(result, 3U);
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Static_Field_Int_02([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperations.TestInt", &cls), ANI_OK);
    ani_static_field field {};
    ASSERT_EQ(env->Class_FindStaticField(cls, "int_value", &field), ANI_OK);
    ASSERT_NE(field, nullptr);
    ani_int result = 0;
    ASSERT_EQ(env->c_api->Class_GetStaticField_Int(env, cls, field, &result), ANI_OK);
    ASSERT_EQ(result, 3U);
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Static_Field_Int_03([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperations.TestInt", &cls), ANI_OK);
    ani_static_field field {};
    ASSERT_EQ(env->Class_FindStaticField(cls, "string_value", &field), ANI_OK);
    ASSERT_NE(field, nullptr);
    ani_int result = 0;
    ASSERT_EQ(env->Class_GetStaticField_Int(cls, field, &result), ANI_INVALID_TYPE);
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Static_Field_Int_04([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperations.TestInt", &cls), ANI_OK);
    ani_static_field field {};
    ASSERT_EQ(env->Class_FindStaticField(cls, "int_value", &field), ANI_OK);
    ASSERT_NE(field, nullptr);
    ani_int result = 0;
    ASSERT_EQ(env->Class_GetStaticField_Int(nullptr, field, &result), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Static_Field_Int_05([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperations.TestInt", &cls), ANI_OK);
    ani_int result = 0;
    ASSERT_EQ(env->Class_GetStaticField_Int(cls, nullptr, &result), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Static_Field_Int_06([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperations.TestInt", &cls), ANI_OK);
    ani_static_field field {};
    ASSERT_EQ(env->Class_FindStaticField(cls, "int_value", &field), ANI_OK);
    ASSERT_NE(field, nullptr);
    ASSERT_EQ(env->Class_GetStaticField_Int(cls, field, nullptr), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Static_Field_Int_07([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperations.TestInt", &cls), ANI_OK);
    ani_static_field field = nullptr;
    ASSERT_EQ(env->Class_FindStaticField(cls, "int_value", &field), ANI_OK);
    ASSERT_NE(field, nullptr);
    ani_int result = 0;
    ASSERT_EQ(env->c_api->Class_GetStaticField_Int(nullptr, cls, field, &result), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Static_Field_Int_08([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperations.TestInt", &cls), ANI_OK);
    ani_static_field field {};
    ani_int single = 0;
    ASSERT_EQ(env->Class_FindStaticField(cls, "specia1", &field), ANI_OK);
    ASSERT_EQ(env->Class_GetStaticField_Int(cls, field, &single), ANI_OK);
    ASSERT_EQ(single, static_cast<ani_int>(0));
    ASSERT_EQ(env->Class_FindStaticField(cls, "specia3", &field), ANI_OK);
    ASSERT_EQ(env->Class_GetStaticField_Int(cls, field, &single), ANI_INVALID_TYPE);
    ASSERT_EQ(env->Class_FindStaticField(cls, "specia4", &field), ANI_OK);
    ASSERT_EQ(env->Class_GetStaticField_Int(cls, field, &single), ANI_INVALID_TYPE);
    ASSERT_EQ(env->Class_FindStaticField(cls, "specia5", &field), ANI_OK);
    ASSERT_EQ(env->Class_GetStaticField_Int(cls, field, &single), ANI_INVALID_TYPE);
    ani_int max = std::numeric_limits<ani_int>::max();
    ani_int min = std::numeric_limits<ani_int>::min();
    ASSERT_EQ(env->Class_FindStaticField(cls, "min", &field), ANI_OK);
    ASSERT_EQ(env->Class_GetStaticField_Int(cls, field, &single), ANI_OK);
    ASSERT_EQ(single, min);
    ASSERT_EQ(env->Class_FindStaticField(cls, "max", &field), ANI_OK);
    ASSERT_EQ(env->Class_GetStaticField_Int(cls, field, &single), ANI_OK);
    ASSERT_EQ(single, max);
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Static_Field_Int_09([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperations.TestInt", &cls), ANI_OK);
    ani_static_field field {};
    const ani_int setTar = 1024;
    const ani_int setTar2 = 10;
    ASSERT_EQ(env->Class_FindStaticField(cls, "int_value", &field), ANI_OK);
    ASSERT_NE(field, nullptr);
    ani_int result = 0;
    const int32_t loopNum = 3;
    for (int32_t i = 0; i < loopNum; i++) {
        ASSERT_EQ(env->Class_SetStaticField_Int(cls, field, setTar2), ANI_OK);
        ASSERT_EQ(env->Class_GetStaticField_Int(cls, field, &result), ANI_OK);
        ASSERT_EQ(result, setTar2);
    }
    ASSERT_EQ(env->Class_SetStaticField_Int(cls, field, setTar), ANI_OK);
    ASSERT_EQ(env->Class_GetStaticField_Int(cls, field, &result), ANI_OK);
    ASSERT_EQ(result, setTar);
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Static_Field_Int_10([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    CheckFieldValueInt(env, "entry.src.main.src.ets.ClassOperations.TestInt", "int_value");
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Static_Field_Int_11([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    CheckFieldValueInt(env, "entry.src.main.src.ets.ClassOperations.TestIntA", "int_value");
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Static_Field_Int_12([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    CheckFieldValueInt(env, "entry.src.main.src.ets.ClassOperations.TestIntFinal", "int_value");
    return ANI_TRUE;
}

ani_boolean test_Class_FindMethod([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls = {};
    auto status = env->FindClass("entry.src.main.src.ets.ClassOperations.Person", &cls);
    ASSERT_EQ(status, ANI_TRUE);
    const char *name = "func";
    const char *signature = "ii:i";
    ani_method result;
    status = env->Class_FindMethod(cls, name, signature, &result);
    ASSERT_EQ(status, ANI_OK);
    ASSERT_NE(result, nullptr);
    return ANI_TRUE;
}

ani_int NativeMethodsFooNative(ani_env *, ani_class)
{
    const ani_int answer = 42U;
    return answer;
}

ani_boolean test_Class_BindNativeMethods([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls = {};
    auto status = env->FindClass("entry.src.main.src.ets.ClassOperations.Person", &cls);
    ASSERT_EQ(status, ANI_OK);
    std::array methods = {
        ani_native_function{"foo", ":i", reinterpret_cast<void *>(NativeMethodsFooNative)},
    };
    status = env->Class_BindNativeMethods(cls, methods.data(), methods.size());
    ASSERT_EQ(status, ANI_OK);
    return ANI_TRUE;
}

ani_boolean test_Type_GetSuperClass([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls = nullptr;
    auto status = env->FindClass("entry.src.main.src.ets.ClassOperations.Son", &cls);
    ASSERT_EQ(status, ANI_OK);
    ani_class result = nullptr;
    status = env->Type_GetSuperClass(cls, &result);
    ASSERT_EQ(status, ANI_OK);
    ASSERT_NE(result, nullptr);
    return true;
}

ani_boolean test_Type_IsAssignableFrom([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class fromCls;
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperations.A", &fromCls), ANI_OK);
    ASSERT_NE(fromCls, nullptr);
    ani_class toCls;
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperations.I", &toCls), ANI_OK);
    ASSERT_NE(toCls, nullptr);
    ani_boolean result;
    ASSERT_EQ(env->Type_IsAssignableFrom(fromCls, toCls, &result), ANI_OK);
    return ANI_TRUE;
}

ani_boolean test_FindModule([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_module module{};
    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.ClassOperations", &module), ANI_OK);
    ASSERT_NE(module, nullptr);
    return ANI_TRUE;
}

ani_boolean test_FindNamespace([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_namespace ns{};
    ASSERT_EQ(env->FindNamespace("entry.src.main.src.ets.ClassOperations.test001", &ns), ANI_OK);
    ASSERT_NE(ns, nullptr);
    return ANI_TRUE;
}

ani_boolean test_FindEnum([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_enum aniEnum{};
    ASSERT_EQ(env->FindEnum("entry.src.main.src.ets.ClassOperations.Color", &aniEnum), ANI_OK);
    ASSERT_NE(aniEnum, nullptr);
    return ANI_TRUE;
}

#endif // ARKTS_ANI_TEST_CLASSOPERATIONS_H