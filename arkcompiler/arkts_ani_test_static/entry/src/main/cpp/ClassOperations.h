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

ani_int GetMethodData([[maybe_unused]] ani_env *env_, ani_class *clsResult, ani_static_method *methodResult)
{
    ani_class cls {};
    ASSERT_EQ(env_->FindClass("call_static_method_bool_test.Operations", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);
    
    ani_static_method method;
    ASSERT_EQ(env_->Class_FindStaticMethod(cls, "or", "zz:z", &method), ANI_OK);
    ASSERT_NE(method, nullptr);
    
    *clsResult = cls;
    *methodResult = method;
    return ANI_TRUE;
}

ani_int TestCombineScene([[maybe_unused]] ani_env *env_, const char *className, ani_boolean expectedValue)
{
    ani_class cls {};
    ASSERT_EQ(env_->FindClass(className, &cls), ANI_OK);
    ani_static_method method {};
    ASSERT_EQ(env_->Class_FindStaticMethod(cls, "funcA", "zz:z", &method), ANI_OK);

    ani_boolean value = expectedValue == ANI_TRUE ? ANI_FALSE : ANI_TRUE;
    ASSERT_EQ(env_->Class_CallStaticMethod_Boolean(cls, method, &value, ANI_TRUE, ANI_FALSE), ANI_OK);
    ASSERT_EQ(value, expectedValue);

    ani_value args[2U];
    args[0U].z = ANI_TRUE;
    args[1U].z = ANI_FALSE;
    ani_boolean valueA = expectedValue == ANI_TRUE ? ANI_FALSE : ANI_TRUE;
    ASSERT_EQ(env_->Class_CallStaticMethod_Boolean_A(cls, method, &valueA, args), ANI_OK);
    ASSERT_EQ(valueA, expectedValue);
    return ANI_TRUE;
}

ani_int TestCombineSceneInt([[maybe_unused]] ani_env *env_, const char *className, ani_int val1, ani_int val2,
    ani_int expectedValue)
{
    ani_class cls {};
    ASSERT_EQ(env_->FindClass(className, &cls), ANI_OK);
    ani_static_method method {};
    ASSERT_EQ(env_->Class_FindStaticMethod(cls, "funcA", "ii:i", &method), ANI_OK);

    ani_int value = 0;
    ASSERT_EQ(env_->Class_CallStaticMethod_Int(cls, method, &value, val1, val2), ANI_OK);
    ASSERT_EQ(value, expectedValue);

    ani_value args[2U];
    args[0U].i = val1;
    args[1U].i = val2;
    ani_int valueA = 0;
    ASSERT_EQ(env_->Class_CallStaticMethod_Int_A(cls, method, &valueA, args), ANI_OK);
    ASSERT_EQ(valueA, expectedValue);
    return ANI_TRUE;
}

ani_int TestCombineSceneByte([[maybe_unused]] ani_env *env_, const char *className, ani_byte val1, ani_byte val2,
    ani_byte expectedValue)
{
    ani_class cls {};
    ASSERT_EQ(env_->FindClass(className, &cls), ANI_OK);
    ani_static_method method {};
    ASSERT_EQ(env_->Class_FindStaticMethod(cls, "funcA", "bb:b", &method), ANI_OK);

    ani_byte value = 0;
    ASSERT_EQ(env_->Class_CallStaticMethod_Byte(cls, method, &value, val1, val2), ANI_OK);
    ASSERT_EQ(value, expectedValue);

    ani_value args[2U];
    args[0U].b = val1;
    args[1U].b = val2;
    ani_byte valueA = 0;
    ASSERT_EQ(env_->Class_CallStaticMethod_Byte_A(cls, method, &valueA, args), ANI_OK);
    ASSERT_EQ(valueA, expectedValue);
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

ani_boolean test_Class_FindStaticMethodBoolean_01([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method;
    GetMethodData(env_, &cls, &method);

    ani_boolean result = ANI_FALSE;
    ASSERT_EQ(env_->c_api->Class_CallStaticMethod_Boolean(env_, cls, method, &result, ANI_TRUE, ANI_FALSE), ANI_OK);
    ASSERT_EQ(result, ANI_TRUE);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodBoolean_02([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method;
    GetMethodData(env_, &cls, &method);

    ani_boolean result = ANI_FALSE;
    ASSERT_EQ(env_->Class_CallStaticMethod_Boolean(cls, method, &result, ANI_TRUE, ANI_FALSE), ANI_OK);
    ASSERT_EQ(result, ANI_TRUE);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodBoolean_03([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method;
    GetMethodData(env_, &cls, &method);

    ani_value args[ARG_COUNT];
    args[0U].z = ANI_TRUE;
    args[1U].z = ANI_FALSE;

    ani_boolean result = ANI_FALSE;
    ASSERT_EQ(env_->Class_CallStaticMethod_Boolean_A(cls, method, &result, args), ANI_OK);
    ASSERT_EQ(result, ANI_TRUE);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodBoolean_04([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method;
    GetMethodData(env_, &cls, &method);

    ani_boolean result = ANI_FALSE;
    ASSERT_EQ(env_->Class_CallStaticMethod_Boolean(nullptr, method, &result, ANI_TRUE, ANI_FALSE), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodBoolean_05([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method;
    GetMethodData(env_, &cls, &method);

    ani_boolean result = ANI_FALSE;
    ASSERT_EQ(env_->Class_CallStaticMethod_Boolean(cls, nullptr, &result, ANI_TRUE, ANI_FALSE), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodBoolean_06([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method;
    GetMethodData(env_, &cls, &method);

    ASSERT_EQ(env_->Class_CallStaticMethod_Boolean(cls, method, nullptr, ANI_TRUE, ANI_FALSE), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodBoolean_07([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method;
    GetMethodData(env_, &cls, &method);

    ani_value args[ARG_COUNT];
    args[0U].z = ANI_TRUE;
    args[1U].z = ANI_FALSE;

    ani_boolean result = ANI_FALSE;
    ASSERT_EQ(env_->Class_CallStaticMethod_Boolean_A(nullptr, method, &result, args), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodBoolean_08([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method;
    GetMethodData(env_, &cls, &method);

    ani_value args[ARG_COUNT];
    args[0U].z = ANI_TRUE;
    args[1U].z = ANI_FALSE;

    ani_boolean result = ANI_FALSE;
    ASSERT_EQ(env_->Class_CallStaticMethod_Boolean_A(cls, nullptr, &result, args), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodBoolean_09([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method;
    GetMethodData(env_, &cls, &method);

    ani_value args[ARG_COUNT];
    args[0U].z = ANI_TRUE;
    args[1U].z = ANI_FALSE;

    ASSERT_EQ(env_->Class_CallStaticMethod_Boolean_A(cls, method, nullptr, args), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodBoolean_10([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method;
    GetMethodData(env_, &cls, &method);

    ani_boolean result = ANI_FALSE;
    ASSERT_EQ(env_->Class_CallStaticMethod_Boolean_A(cls, method, &result, nullptr), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodBoolean_11([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method;
    GetMethodData(env_, &cls, &method);

    ani_boolean result = ANI_FALSE;
    ASSERT_EQ(env_->Class_CallStaticMethod_Boolean(cls, method, &result, 10U, 20U), ANI_OK);
    ASSERT_EQ(result, ANI_FALSE);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodBoolean_12([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_class clsA {};
    ASSERT_EQ(env_->FindClass("call_static_method_bool_test.A", &clsA), ANI_OK);
    ani_static_method methodA;
    ASSERT_EQ(env_->Class_FindStaticMethod(clsA, "funcA", "zz:z", &methodA), ANI_OK);

    ani_class clsB {};
    ASSERT_EQ(env_->FindClass("call_static_method_bool_test.B", &clsB), ANI_OK);
    ani_static_method methodB;
    ASSERT_EQ(env_->Class_FindStaticMethod(clsB, "funcB", "zz:z", &methodB), ANI_OK);

    ani_boolean valueA = ANI_FALSE;
    ASSERT_EQ(env_->Class_CallStaticMethod_Boolean(clsA, methodA, &valueA, ANI_TRUE, ANI_FALSE), ANI_OK);
    ASSERT_EQ(valueA, ANI_TRUE);

    ani_boolean valueB = ANI_TRUE;
    ASSERT_EQ(env_->Class_CallStaticMethod_Boolean(clsB, methodB, &valueB, ANI_TRUE, ANI_FALSE), ANI_OK);
    ASSERT_EQ(valueB, ANI_FALSE);

    ani_value args[ARG_COUNT];
    args[0U].z = ANI_TRUE;
    args[1U].z = ANI_FALSE;
    ani_boolean valueAA = ANI_FALSE;
    ASSERT_EQ(env_->Class_CallStaticMethod_Boolean_A(clsA, methodA, &valueAA, args), ANI_OK);
    ASSERT_EQ(valueAA, ANI_TRUE);

    ani_boolean valueBA = ANI_TRUE;
    ASSERT_EQ(env_->Class_CallStaticMethod_Boolean_A(clsB, methodB, &valueBA, args), ANI_OK);
    ASSERT_EQ(valueBA, ANI_FALSE);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodBoolean_13([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env_->FindClass("call_static_method_bool_test.A", &cls), ANI_OK);
    ani_static_method methodA;
    ASSERT_EQ(env_->Class_FindStaticMethod(cls, "funcA", "zz:z", &methodA), ANI_OK);
    ani_static_method methodB;
    ASSERT_EQ(env_->Class_FindStaticMethod(cls, "funcA", "ii:i", &methodB), ANI_OK);

    ani_boolean value = ANI_FALSE;
    ASSERT_EQ(env_->Class_CallStaticMethod_Boolean(cls, methodA, &value, ANI_TRUE, ANI_FALSE), ANI_OK);
    ASSERT_EQ(value, ANI_TRUE);

    ani_value args[ARG_COUNT];
    args[0U].z = ANI_TRUE;
    args[1U].z = ANI_FALSE;
    ani_boolean valueA = ANI_FALSE;
    ASSERT_EQ(env_->Class_CallStaticMethod_Boolean_A(cls, methodA, &valueA, args), ANI_OK);
    ASSERT_EQ(valueA, ANI_TRUE);

    ani_int value2 = 0;
    ASSERT_EQ(env_->Class_CallStaticMethod_Int(cls, methodB, &value2, 5U, 6U), ANI_OK);
    ASSERT_EQ(value2, 5U + 6U);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodBoolean_14([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env_->FindClass("call_static_method_bool_test.A", &cls), ANI_OK);
    ani_static_method method;
    ASSERT_EQ(env_->Class_FindStaticMethod(cls, "funcB", "zz:z", &method), ANI_OK);

    ani_boolean value = ANI_FALSE;
    ASSERT_EQ(env_->Class_CallStaticMethod_Boolean(cls, method, &value, ANI_TRUE, ANI_FALSE), ANI_OK);
    ASSERT_EQ(value, ANI_TRUE);

    ani_value args[ARG_COUNT];
    args[0U].z = ANI_TRUE;
    args[1U].z = ANI_FALSE;
    ani_boolean valueA = ANI_FALSE;
    ASSERT_EQ(env_->Class_CallStaticMethod_Boolean_A(cls, method, &valueA, args), ANI_OK);
    ASSERT_EQ(valueA, ANI_TRUE);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodBoolean_15([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method {};
    GetMethodData(env_, &cls, &method);

    ani_boolean value = ANI_FALSE;
    ASSERT_EQ(env_->c_api->Class_CallStaticMethod_Boolean(nullptr, cls, method, &value, ANI_TRUE, ANI_FALSE),
              ANI_INVALID_ARGS);
    ani_value args[2U];
    args[0U].z = ANI_TRUE;
    args[1U].z = ANI_FALSE;
    ASSERT_EQ(env_->c_api->Class_CallStaticMethod_Boolean_A(nullptr, cls, method, &value, args), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodBoolean_16([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    TestCombineScene(env_, "call_static_method_bool_test.C", ANI_TRUE);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodBoolean_17([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    TestCombineScene(env_, "call_static_method_bool_test.D", ANI_FALSE);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodBoolean_18([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    TestCombineScene(env_, "call_static_method_bool_test.E", ANI_TRUE);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodBoolean_19([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env_->FindClass("call_static_method_bool_test.F", &cls), ANI_OK);
    ani_static_method method1 {};
    ASSERT_EQ(env_->Class_FindStaticMethod(cls, "increment", nullptr, &method1), ANI_OK);
    ani_static_method method2 {};
    ASSERT_EQ(env_->Class_FindStaticMethod(cls, "getCount", nullptr, &method2), ANI_OK);
    ASSERT_EQ(env_->Class_CallStaticMethod_Void(cls, method1, ANI_TRUE, ANI_FALSE), ANI_OK);
    ani_boolean value = ANI_TRUE;
    ASSERT_EQ(env_->Class_CallStaticMethod_Boolean(cls, method2, &value), ANI_OK);
    ASSERT_EQ(value, ANI_FALSE);

    ani_value args[2U];
    args[0U].z = ANI_TRUE;
    args[1U].z = ANI_FALSE;
    ani_boolean valueA = ANI_TRUE;
    ASSERT_EQ(env_->Class_CallStaticMethod_Boolean_A(cls, method2, &valueA, args), ANI_OK);
    ASSERT_EQ(valueA, ANI_FALSE);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodBoolean_20([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env_->FindClass("call_static_method_bool_test.G", &cls), ANI_OK);
    ani_static_method method1 {};
    ASSERT_EQ(env_->Class_FindStaticMethod(cls, "publicMethod", "zz:z", &method1), ANI_OK);
    ani_static_method method2 {};
    ASSERT_EQ(env_->Class_FindStaticMethod(cls, "callPrivateMethod", "zz:z", &method2), ANI_OK);
    ani_boolean value = ANI_FALSE;
    ASSERT_EQ(env_->Class_CallStaticMethod_Boolean(cls, method1, &value, ANI_TRUE, ANI_FALSE), ANI_OK);
    ASSERT_EQ(value, ANI_TRUE);
    ASSERT_EQ(env_->Class_CallStaticMethod_Boolean(cls, method2, &value, ANI_TRUE, ANI_FALSE), ANI_OK);
    ASSERT_EQ(value, ANI_FALSE);

    ani_value args[2U];
    args[0U].z = ANI_TRUE;
    args[1U].z = ANI_FALSE;
    ani_boolean valueA = ANI_FALSE;
    ASSERT_EQ(env_->Class_CallStaticMethod_Boolean_A(cls, method1, &valueA, args), ANI_OK);
    ASSERT_EQ(valueA, ANI_TRUE);
    ASSERT_EQ(env_->Class_CallStaticMethod_Boolean_A(cls, method2, &valueA, args), ANI_OK);
    ASSERT_EQ(valueA, ANI_FALSE);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodBoolean_21([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method {};
    GetMethodData(env_, &cls, &method);

    ani_boolean value {};
    ASSERT_EQ(env_->Class_CallStaticMethod_Boolean(cls, method, &value, ANI_TRUE, ANI_FALSE), ANI_OK);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodBoolean_22([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method {};
    GetMethodData(env_, &cls, &method);

    ani_boolean value {};
    ani_value args[2U];
    args[0U].z = ANI_TRUE;
    args[1U].z = ANI_FALSE;
    ASSERT_EQ(env_->Class_CallStaticMethod_Boolean_A(cls, method, &value, args), ANI_OK);
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

ani_boolean test_Class_FindStaticMethodInt_01([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method;
    GetMethodData(env_, &cls, &method);

    ani_int sum;
    ASSERT_EQ(env_->c_api->Class_CallStaticMethod_Int(env_, cls, method, &sum, VAL1, VAL2), ANI_OK);
    ASSERT_EQ(sum, VAL1 + VAL2);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodInt_02([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method;
    GetMethodData(env, &cls, &method);

    ani_int sum;
    ASSERT_EQ(env->Class_CallStaticMethod_Int(cls, method, &sum, VAL1, VAL2), ANI_OK);
    ASSERT_EQ(sum, VAL1 + VAL2);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodInt_03([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method;
    GetMethodData(env, &cls, &method);

    ani_value args[ARG_COUNT];
    args[0U].i = VAL1;
    args[1U].i = VAL2;

    ani_int sum;
    ASSERT_EQ(env->Class_CallStaticMethod_Int_A(cls, method, &sum, args), ANI_OK);
    ASSERT_EQ(sum, VAL1 + VAL2);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodInt_04([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method;
    GetMethodData(env_, &cls, &method);

    ani_int sum;
    ASSERT_EQ(env_->c_api->Class_CallStaticMethod_Int(env_, nullptr, method, &sum, VAL1, VAL2), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodInt_05([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method;
    GetMethodData(env_, &cls, &method);

    ani_int sum;
    ASSERT_EQ(env_->c_api->Class_CallStaticMethod_Int(env_, cls, nullptr, &sum, VAL1, VAL2), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodInt_06([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method;
    GetMethodData(env_, &cls, &method);

    ASSERT_EQ(env_->c_api->Class_CallStaticMethod_Int(env_, cls, method, nullptr, VAL1, VAL2), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodInt_07([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method;
    GetMethodData(env_, &cls, &method);

    ani_int sum;
    ASSERT_EQ(env_->Class_CallStaticMethod_Int(nullptr, method, &sum, VAL1, VAL2), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodInt_08([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method;
    GetMethodData(env_, &cls, &method);

    ani_int sum;
    ASSERT_EQ(env_->Class_CallStaticMethod_Int(cls, nullptr, &sum, VAL1, VAL2), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodInt_09([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method;
    GetMethodData(env_, &cls, &method);

    ASSERT_EQ(env_->Class_CallStaticMethod_Int(cls, method, nullptr, VAL1, VAL2), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodInt_10([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method;
    GetMethodData(env_, &cls, &method);

    ani_value args[ARG_COUNT];
    args[0U].i = VAL1;
    args[1U].i = VAL2;
    ani_int sum;
    ASSERT_EQ(env_->Class_CallStaticMethod_Int_A(nullptr, method, &sum, args), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodInt_11([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method;
    GetMethodData(env_, &cls, &method);

    ani_value args[ARG_COUNT];
    args[0U].i = VAL1;
    args[1U].i = VAL2;
    ani_int sum;
    ASSERT_EQ(env_->Class_CallStaticMethod_Int_A(nullptr, method, &sum, args), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodInt_12([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method;
    GetMethodData(env_, &cls, &method);

    ani_value args[ARG_COUNT];
    args[0U].i = VAL1;
    args[1U].i = VAL2;
    ASSERT_EQ(env_->Class_CallStaticMethod_Int_A(cls, method, nullptr, args), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodInt_13([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method;
    GetMethodData(env_, &cls, &method);

    ani_int sum;
    ASSERT_EQ(env_->Class_CallStaticMethod_Int_A(nullptr, method, &sum, nullptr), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodInt_14([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_class clsA {};
    ASSERT_EQ(env_->FindClass("call_static_method_int_test.A", &clsA), ANI_OK);
    ani_static_method methodA;
    ASSERT_EQ(env_->Class_FindStaticMethod(clsA, "funcA", "ii:i", &methodA), ANI_OK);

    ani_class clsB {};
    ASSERT_EQ(env_->FindClass("call_static_method_int_test.B", &clsB), ANI_OK);
    ani_static_method methodB;
    ASSERT_EQ(env_->Class_FindStaticMethod(clsB, "funcB", "ii:i", &methodB), ANI_OK);

    ani_int valueA;
    ASSERT_EQ(env_->Class_CallStaticMethod_Int(clsA, methodA, &valueA, VAL1, VAL2), ANI_OK);
    ASSERT_EQ(valueA, VAL1 + VAL2);

    ani_int valueB;
    ASSERT_EQ(env_->Class_CallStaticMethod_Int(clsB, methodB, &valueB, VAL1, VAL2), ANI_OK);
    ASSERT_EQ(valueB, VAL2 - VAL1);

    ani_value args[ARG_COUNT];
    args[0U].i = VAL1;
    args[1U].i = VAL2;
    ani_int valueAA;
    ASSERT_EQ(env_->Class_CallStaticMethod_Int_A(clsA, methodA, &valueAA, args), ANI_OK);
    ASSERT_EQ(valueAA, VAL1 + VAL2);

    ani_int valueBA;
    ASSERT_EQ(env_->Class_CallStaticMethod_Int_A(clsB, methodB, &valueBA, args), ANI_OK);
    ASSERT_EQ(valueBA, VAL2 - VAL1);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodInt_15([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env_->FindClass("call_static_method_int_test.A", &cls), ANI_OK);
    ani_static_method methodA;
    ASSERT_EQ(env_->Class_FindStaticMethod(cls, "funcA", "ii:i", &methodA), ANI_OK);
    ani_static_method methodB;
    ASSERT_EQ(env_->Class_FindStaticMethod(cls, "funcA", "dd:d", &methodB), ANI_OK);

    ani_int value;
    ASSERT_EQ(env_->Class_CallStaticMethod_Int(cls, methodA, &value, VAL1, VAL2), ANI_OK);
    ASSERT_EQ(value, VAL1 + VAL2);

    ani_value args[ARG_COUNT];
    args[0U].i = VAL1;
    args[1U].i = VAL2;
    ani_int valueA;
    ASSERT_EQ(env_->Class_CallStaticMethod_Int_A(cls, methodA, &valueA, args), ANI_OK);
    ASSERT_EQ(valueA, VAL1 + VAL2);

    ani_double value2;
    ASSERT_EQ(env_->Class_CallStaticMethod_Double(cls, methodB, &value2, VAL3, VAL4), ANI_OK);
    ASSERT_EQ(value2, VAL3 + VAL4);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodInt_16([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env_->FindClass("call_static_method_int_test.A", &cls), ANI_OK);
    ani_static_method method;
    ASSERT_EQ(env_->Class_FindStaticMethod(cls, "funcB", "ii:i", &method), ANI_OK);

    ani_int value;
    ASSERT_EQ(env_->Class_CallStaticMethod_Int(cls, method, &value, VAL1, VAL2), ANI_OK);
    ASSERT_EQ(value, VAL1 + VAL2);

    ani_value args[ARG_COUNT];
    args[0U].i = VAL1;
    args[1U].i = VAL2;
    ani_int valueA;
    ASSERT_EQ(env_->Class_CallStaticMethod_Int_A(cls, method, &valueA, args), ANI_OK);
    ASSERT_EQ(valueA, VAL1 + VAL2);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodInt_17([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method {};
    GetMethodData(env_, &cls, &method);

    ani_int value = 0;
    ASSERT_EQ(env_->c_api->Class_CallStaticMethod_Int(nullptr, cls, method, &value, VAL3, VAL4), ANI_INVALID_ARGS);
    ani_value args[ARG_COUNT];
    args[0U].i = VAL1;
    args[1U].i = VAL2;
    ASSERT_EQ(env_->c_api->Class_CallStaticMethod_Int_A(nullptr, cls, method, &value, args), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodInt_18([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    TestCombineSceneInt(env_, "call_static_method_int_test.C", VAL1, VAL2, VAL1 + VAL2);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodInt_19([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    TestCombineSceneInt(env_, "call_static_method_int_test.D", VAL1, VAL2, VAL2 - VAL1);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodInt_20([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    TestCombineSceneInt(env_, "call_static_method_int_test.E", VAL1, VAL2, VAL1 + VAL2);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodInt_21([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env_->FindClass("call_static_method_int_test.F", &cls), ANI_OK);
    ani_static_method method1 {};
    ASSERT_EQ(env_->Class_FindStaticMethod(cls, "increment", nullptr, &method1), ANI_OK);
    ani_static_method method2 {};
    ASSERT_EQ(env_->Class_FindStaticMethod(cls, "getCount", nullptr, &method2), ANI_OK);
    ASSERT_EQ(env_->Class_CallStaticMethod_Void(cls, method1, VAL1, VAL2), ANI_OK);
    ani_int value = 0;
    ASSERT_EQ(env_->Class_CallStaticMethod_Int(cls, method2, &value), ANI_OK);
    ASSERT_EQ(value, VAL1 + VAL2);

    ani_value args[ARG_COUNT];
    args[0U].i = VAL1;
    args[1U].i = VAL2;
    ani_int valueA = 0;
    ASSERT_EQ(env_->Class_CallStaticMethod_Int_A(cls, method2, &valueA, args), ANI_OK);
    ASSERT_EQ(valueA, VAL1 + VAL2);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodInt_22([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env_->FindClass("call_static_method_int_test.G", &cls), ANI_OK);
    ani_static_method method1 {};
    ASSERT_EQ(env_->Class_FindStaticMethod(cls, "publicMethod", "ii:i", &method1), ANI_OK);
    ani_static_method method2 {};
    ASSERT_EQ(env_->Class_FindStaticMethod(cls, "callPrivateMethod", "ii:i", &method2), ANI_OK);
    ani_int value = 0;
    ASSERT_EQ(env_->Class_CallStaticMethod_Int(cls, method1, &value, VAL1, VAL2), ANI_OK);
    ASSERT_EQ(value, VAL1 + VAL2);
    ASSERT_EQ(env_->Class_CallStaticMethod_Int(cls, method2, &value, VAL1, VAL2), ANI_OK);
    ASSERT_EQ(value, VAL2 - VAL1);

    ani_value args[ARG_COUNT];
    args[0U].i = VAL1;
    args[1U].i = VAL2;
    ani_int valueA = 0;
    ASSERT_EQ(env_->Class_CallStaticMethod_Int_A(cls, method1, &valueA, args), ANI_OK);
    ASSERT_EQ(valueA, VAL1 + VAL2);
    ASSERT_EQ(env_->Class_CallStaticMethod_Int_A(cls, method2, &valueA, args), ANI_OK);
    ASSERT_EQ(valueA, VAL2 - VAL1);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodInt_23([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method {};
    GetMethodData(env_, &cls, &method);

    ani_int value {};
    ASSERT_EQ(env_->Class_CallStaticMethod_Int(cls, method, &value, VAL1, VAL2), ANI_OK);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodInt_24([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method {};
    GetMethodData(env_, &cls, &method);

    ani_int value {};
    ani_value args[2U];
    args[0U].i = VAL1;
    args[1U].i = VAL2;
    ASSERT_EQ(env_->Class_CallStaticMethod_Int_A(cls, method, &value, args), ANI_OK);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodShort([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method;
    GetMethodData(env_, &cls, &method);

    ani_short sum = 0;
    ASSERT_EQ(env_->c_api->Class_CallStaticMethod_Short(env_, cls, method, &sum, VAL1, VAL2), ANI_OK);
    ASSERT_EQ(sum, VAL1 + VAL2);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodShort_01([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method;
    GetMethodData(env_, &cls, &method);

    ani_short sum = 0;
    ASSERT_EQ(env_->Class_CallStaticMethod_Short(cls, method, &sum, VAL1, VAL2), ANI_OK);
    ASSERT_EQ(sum, VAL1 + VAL2);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodShort_02([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method;
    GetMethodData(env_, &cls, &method);

    ani_value args[ARG_COUNT];
    args[0U].s = VAL1;
    args[1U].s = VAL2;

    ani_short sum = 0;
    ASSERT_EQ(env_->Class_CallStaticMethod_Short_A(cls, method, &sum, args), ANI_OK);
    ASSERT_EQ(sum, VAL1 + VAL2);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodShort_03([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method;
    GetMethodData(env_, &cls, &method);

    ani_short sum = 0;
    ASSERT_EQ(env_->Class_CallStaticMethod_Short(nullptr, method, &sum, VAL1, VAL2), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodShort_04([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method;
    GetMethodData(env_, &cls, &method);

    ani_short sum = 0;
    ASSERT_EQ(env_->Class_CallStaticMethod_Short(cls, nullptr, &sum, VAL1, VAL2), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodShort_05([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method;
    GetMethodData(env_, &cls, &method);

    ASSERT_EQ(env_->Class_CallStaticMethod_Short(cls, method, nullptr, VAL1, VAL2), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodShort_06([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method;
    GetMethodData(env_, &cls, &method);

    ani_value args[ARG_COUNT];
    args[0U].s = VAL1;
    args[1U].s = VAL2;

    ani_short sum = 0;
    ASSERT_EQ(env_->Class_CallStaticMethod_Short_A(nullptr, method, &sum, args), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodShort_07([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method;
    GetMethodData(env_, &cls, &method);

    ani_value args[ARG_COUNT];
    args[0U].s = VAL1;
    args[1U].s = VAL2;

    ani_short sum = 0;
    ASSERT_EQ(env_->Class_CallStaticMethod_Short_A(cls, nullptr, &sum, args), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodShort_08([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method;
    GetMethodData(env_, &cls, &method);

    ani_value args[ARG_COUNT];
    args[0U].s = VAL1;
    args[1U].s = VAL2;

    ASSERT_EQ(env_->Class_CallStaticMethod_Short_A(cls, method, nullptr, args), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodShort_09([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method;
    GetMethodData(env_, &cls, &method);

    ani_short sum = 0;
    ASSERT_EQ(env_->Class_CallStaticMethod_Short_A(cls, method, &sum, nullptr), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodShort_10([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_class clsA {};
    ASSERT_EQ(env_->FindClass("call_static_method_short_test.A", &clsA), ANI_OK);
    ani_static_method methodA;
    ASSERT_EQ(env_->Class_FindStaticMethod(clsA, "funcA", "ss:s", &methodA), ANI_OK);

    ani_class clsB {};
    ASSERT_EQ(env_->FindClass("call_static_method_short_test.B", &clsB), ANI_OK);
    ani_static_method methodB;
    ASSERT_EQ(env_->Class_FindStaticMethod(clsB, "funcB", "ss:s", &methodB), ANI_OK);

    ani_short valueA = 0;
    ASSERT_EQ(env_->Class_CallStaticMethod_Short(clsA, methodA, &valueA, VAL1, VAL2), ANI_OK);
    ASSERT_EQ(valueA, VAL1 + VAL2);

    ani_short valueB = 0;
    ASSERT_EQ(env_->Class_CallStaticMethod_Short(clsB, methodB, &valueB, VAL1, VAL2), ANI_OK);
    ASSERT_EQ(valueB, 6U - 5U);

    ani_value args[ARG_COUNT];
    args[0U].s = VAL1;
    args[1U].s = VAL2;
    ani_short valueAA = 0;
    ASSERT_EQ(env_->Class_CallStaticMethod_Short_A(clsA, methodA, &valueAA, args), ANI_OK);
    ASSERT_EQ(valueAA, VAL1 + VAL2);

    ani_short valueBA = 0;
    ASSERT_EQ(env_->Class_CallStaticMethod_Short_A(clsB, methodB, &valueBA, args), ANI_OK);
    ASSERT_EQ(valueBA, 6U - 5U);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodShort_11([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env_->FindClass("call_static_method_short_test.A", &cls), ANI_OK);
    ani_static_method methodA;
    ASSERT_EQ(env_->Class_FindStaticMethod(cls, "funcA", "ss:s", &methodA), ANI_OK);
    ani_static_method methodB;
    ASSERT_EQ(env_->Class_FindStaticMethod(cls, "funcA", "ii:i", &methodB), ANI_OK);

    ani_short value = 0;
    ASSERT_EQ(env_->Class_CallStaticMethod_Short(cls, methodA, &value, VAL1, VAL2), ANI_OK);
    ASSERT_EQ(value, VAL1 + VAL2);

    ani_value args[ARG_COUNT];
    args[0U].s = VAL1;
    args[1U].s = VAL2;
    ani_short valueA = 0;
    ASSERT_EQ(env_->Class_CallStaticMethod_Short_A(cls, methodA, &valueA, args), ANI_OK);
    ASSERT_EQ(valueA, VAL1 + VAL2);

    ani_int value2;
    ASSERT_EQ(env_->Class_CallStaticMethod_Int(cls, methodB, &value2, VAL2, VAL2), ANI_OK);
    ASSERT_EQ(value2, VAL2 + VAL2);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodShort_12([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env_->FindClass("call_static_method_short_test.A", &cls), ANI_OK);
    ani_static_method method;
    ASSERT_EQ(env_->Class_FindStaticMethod(cls, "funcB", "ss:s", &method), ANI_OK);

    ani_short value = 0;
    ASSERT_EQ(env_->Class_CallStaticMethod_Short(cls, method, &value, VAL1, VAL2), ANI_OK);
    ASSERT_EQ(value, VAL1 + VAL2);

    ani_value args[ARG_COUNT];
    args[0U].s = VAL1;
    args[1U].s = VAL2;
    ani_short valueA = 0;
    ASSERT_EQ(env_->Class_CallStaticMethod_Short_A(cls, method, &valueA, args), ANI_OK);
    ASSERT_EQ(valueA, VAL1 + VAL2);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodShort_13([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method {};
    GetMethodData(env_, &cls, &method);

    ani_short value = 0;
    ASSERT_EQ(env_->c_api->Class_CallStaticMethod_Short(nullptr, cls, method, &value, VAL1, VAL2), ANI_INVALID_ARGS);
    ani_value args[2U];
    args[0U].s = VAL1;
    args[1U].s = VAL2;
    ASSERT_EQ(env_->c_api->Class_CallStaticMethod_Short_A(nullptr, cls, method, &value, args), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodShort_14([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    TestCombineSceneInt(env, "call_static_method_short_test.C", VAL1, VAL2, VAL1 + VAL2);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodShort_15([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    TestCombineSceneInt(env, "call_static_method_short_test.D", VAL1, VAL2, VAL2 - VAL1);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodShort_16([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    TestCombineSceneInt(env, "call_static_method_short_test.E", VAL1, VAL2, VAL1 + VAL2);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodShort_17([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env_->FindClass("call_static_method_short_test.F", &cls), ANI_OK);
    ani_static_method method1 {};
    ASSERT_EQ(env_->Class_FindStaticMethod(cls, "increment", nullptr, &method1), ANI_OK);
    ani_static_method method2 {};
    ASSERT_EQ(env_->Class_FindStaticMethod(cls, "getCount", nullptr, &method2), ANI_OK);
    ASSERT_EQ(env_->Class_CallStaticMethod_Void(cls, method1, VAL1, VAL2), ANI_OK);
    ani_short value = 0;
    ASSERT_EQ(env_->Class_CallStaticMethod_Short(cls, method2, &value), ANI_OK);
    ASSERT_EQ(value, VAL1 + VAL2);

    ani_value args[2U];
    args[0U].s = VAL1;
    args[1U].s = VAL2;
    ani_short valueA = 0;
    ASSERT_EQ(env_->Class_CallStaticMethod_Short_A(cls, method2, &valueA, args), ANI_OK);
    ASSERT_EQ(valueA, VAL1 + VAL2);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodShort_18([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env_->FindClass("call_static_method_short_test.G", &cls), ANI_OK);
    ani_static_method method1 {};
    ASSERT_EQ(env_->Class_FindStaticMethod(cls, "publicMethod", "ss:s", &method1), ANI_OK);
    ani_static_method method2 {};
    ASSERT_EQ(env_->Class_FindStaticMethod(cls, "callPrivateMethod", "ss:s", &method2), ANI_OK);
    ani_short value = 0;
    ASSERT_EQ(env_->Class_CallStaticMethod_Short(cls, method1, &value, VAL1, VAL2), ANI_OK);
    ASSERT_EQ(value, VAL1 + VAL2);
    ASSERT_EQ(env_->Class_CallStaticMethod_Short(cls, method2, &value, VAL1, VAL2), ANI_OK);
    ASSERT_EQ(value, VAL2 - VAL1);

    ani_value args[2U];
    args[0U].s = VAL1;
    args[1U].s = VAL2;
    ani_short valueA = 0;
    ASSERT_EQ(env_->Class_CallStaticMethod_Short_A(cls, method1, &valueA, args), ANI_OK);
    ASSERT_EQ(valueA, VAL1 + VAL2);
    ASSERT_EQ(env_->Class_CallStaticMethod_Short_A(cls, method2, &valueA, args), ANI_OK);
    ASSERT_EQ(valueA, VAL2 - VAL1);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodShort_19([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method {};
    GetMethodData(env_, &cls, &method);

    ani_short value {};
    ASSERT_EQ(env_->Class_CallStaticMethod_Short(cls, method, &value, VAL1, VAL2), ANI_OK);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodShort_20([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method {};
    GetMethodData(env_, &cls, &method);

    ani_short value {};
    ani_value args[2U];
    args[0U].s = VAL1;
    args[1U].s = VAL2;
    ASSERT_EQ(env_->Class_CallStaticMethod_Short_A(cls, method, &value, args), ANI_OK);
    return ANI_TRUE;
}


ani_boolean test_Class_FindStaticMethodByte([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method;
    GetMethodData(env_, &cls, &method);

    ani_byte sum = 0;
    const ani_byte VALUE1 = 5U;
    const ani_byte VALUE2 = 6U;
    ASSERT_NE(env_->c_api->Class_CallStaticMethod_Byte(env_, cls, method, &sum, VALUE1, VALUE2), ANI_OK);
    ASSERT_NE(sum, VALUE1 + VALUE2);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodByte_01([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method;
    GetMethodData(env_, &cls, &method);

    ani_byte sum = 0;
    const ani_byte VALUE1 = 5U;
    const ani_byte VALUE2 = 6U;
    
    ASSERT_NE(env_->Class_CallStaticMethod_Byte(cls, method, &sum, VALUE1, VALUE2), ANI_OK);
    ASSERT_NE(sum, VALUE1 + VALUE2);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodByte_02([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method;
    GetMethodData(env_, &cls, &method);

    ani_value args[ARG_COUNT];
    args[0U].b = VAL1;
    args[1U].b = VAL2;

    ani_byte sum = 0;
    ASSERT_EQ(env_->Class_CallStaticMethod_Byte_A(cls, method, &sum, args), ANI_OK);
    ASSERT_EQ(sum, VAL1 + VAL2);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodByte_03([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method;
    GetMethodData(env_, &cls, &method);

    ani_byte sum = 0;
    ASSERT_EQ(env_->Class_CallStaticMethod_Byte(nullptr, method, &sum, VAL1, VAL2), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodByte_04([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method;
    GetMethodData(env_, &cls, &method);

    ani_byte sum = 0;
    ASSERT_EQ(env_->Class_CallStaticMethod_Byte(cls, nullptr, &sum, VAL1, VAL2), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodByte_05([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method;
    GetMethodData(env_, &cls, &method);

    ASSERT_EQ(env_->Class_CallStaticMethod_Byte(cls, method, nullptr, VAL1, VAL2), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodByte_06([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method;
    GetMethodData(env_, &cls, &method);

    ani_value args[ARG_COUNT];
    args[0U].b = VAL1;
    args[1U].b = VAL2;

    ani_byte sum = 0;
    ASSERT_EQ(env_->Class_CallStaticMethod_Byte_A(nullptr, method, &sum, args), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodByte_07([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method;
    GetMethodData(env_, &cls, &method);

    ani_value args[ARG_COUNT];
    args[0U].b = VAL1;
    args[1U].b = VAL2;

    ani_byte sum = 0;
    ASSERT_EQ(env_->Class_CallStaticMethod_Byte_A(cls, nullptr, &sum, args), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodByte_08([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method;
    GetMethodData(env_, &cls, &method);

    ani_value args[ARG_COUNT];
    args[0U].b = VAL1;
    args[1U].b = VAL2;

    ASSERT_EQ(env_->Class_CallStaticMethod_Byte_A(cls, method, nullptr, args), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodByte_09([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method;
    GetMethodData(env_, &cls, &method);

    ani_byte sum = 0;
    ASSERT_EQ(env_->Class_CallStaticMethod_Byte_A(cls, method, &sum, nullptr), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodByte_10([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_class clsA {};
    ASSERT_EQ(env_->FindClass("call_static_method_byte_test.A", &clsA), ANI_OK);
    ani_static_method methodA;
    ASSERT_EQ(env_->Class_FindStaticMethod(clsA, "funcA", "bb:b", &methodA), ANI_OK);

    ani_class clsB {};
    ASSERT_EQ(env_->FindClass("call_static_method_byte_test.B", &clsB), ANI_OK);
    ani_static_method methodB;
    ASSERT_EQ(env_->Class_FindStaticMethod(clsB, "funcB", "bb:b", &methodB), ANI_OK);

    ani_byte valueA = 0;
    ASSERT_EQ(env_->Class_CallStaticMethod_Byte(clsA, methodA, &valueA, VAL1, VAL2), ANI_OK);
    ASSERT_EQ(valueA, VAL1 + VAL2);

    ani_byte valueB = 0;
    ASSERT_EQ(env_->Class_CallStaticMethod_Byte(clsB, methodB, &valueB, VAL1, VAL2), ANI_OK);
    ASSERT_EQ(valueB, VAL2 - VAL1);

    ani_value args[ARG_COUNT];
    args[0U].b = VAL1;
    args[1U].b = VAL2;
    ani_byte valueAA = 0;
    ASSERT_EQ(env_->Class_CallStaticMethod_Byte_A(clsA, methodA, &valueAA, args), ANI_OK);
    ASSERT_EQ(valueAA, VAL1 + VAL2);

    ani_byte valueBA = 0;
    ASSERT_EQ(env_->Class_CallStaticMethod_Byte_A(clsB, methodB, &valueBA, args), ANI_OK);
    ASSERT_EQ(valueBA, VAL2 - VAL1);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodByte_11([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env_->FindClass("call_static_method_byte_test.A", &cls), ANI_OK);
    ani_static_method methodA;
    ASSERT_EQ(env_->Class_FindStaticMethod(cls, "funcA", "bb:b", &methodA), ANI_OK);
    ani_static_method methodB;
    ASSERT_EQ(env_->Class_FindStaticMethod(cls, "funcA", "ii:i", &methodB), ANI_OK);

    ani_byte value = 0;
    ASSERT_EQ(env_->Class_CallStaticMethod_Byte(cls, methodA, &value, VAL1, VAL2), ANI_OK);
    ASSERT_EQ(value, VAL1 + VAL2);

    ani_value args[ARG_COUNT];
    args[0U].b = VAL1;
    args[1U].b = VAL2;
    ani_byte valueA = 0;
    ASSERT_EQ(env_->Class_CallStaticMethod_Byte_A(cls, methodA, &valueA, args), ANI_OK);
    ASSERT_EQ(valueA, VAL1 + VAL2);

    ani_int value2 = 0;
    ASSERT_EQ(env_->Class_CallStaticMethod_Int(cls, methodB, &value2, VAL2, VAL2), ANI_OK);
    ASSERT_EQ(value2, VAL2 + VAL2);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodByte_12([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env_->FindClass("call_static_method_byte_test.A", &cls), ANI_OK);
    ani_static_method method;
    ASSERT_EQ(env_->Class_FindStaticMethod(cls, "funcB", "bb:b", &method), ANI_OK);

    ani_byte value = 0;
    ASSERT_EQ(env_->Class_CallStaticMethod_Byte(cls, method, &value, VAL1, VAL2), ANI_OK);
    ASSERT_EQ(value, VAL1 + VAL2);

    ani_value args[ARG_COUNT];
    args[0U].b = VAL1;
    args[1U].b = VAL2;
    ani_byte valueA = 0;
    ASSERT_EQ(env_->Class_CallStaticMethod_Byte_A(cls, method, &valueA, args), ANI_OK);
    ASSERT_EQ(valueA, VAL1 + VAL2);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodByte_13([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method {};
    GetMethodData(env_, &cls, &method);

    ani_byte value = 0;
    ASSERT_EQ(env_->c_api->Class_CallStaticMethod_Byte(nullptr, cls, method, &value, VAL1, VAL2), ANI_INVALID_ARGS);
    ani_value args[ARG_COUNT];
    args[0U].b = VAL1;
    args[1U].b = VAL2;
    ASSERT_EQ(env_->c_api->Class_CallStaticMethod_Byte_A(nullptr, cls, method, &value, args), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodByte_14([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    TestCombineSceneByte(env_, "call_static_method_byte_test.C", VAL1, VAL2, VAL1 + VAL2);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodByte_15([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    TestCombineSceneByte(env_, "call_static_method_byte_test.D", VAL1, VAL2, VAL2 - VAL1);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodByte_16([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    TestCombineSceneByte(env_, "call_static_method_byte_test.E", VAL1, VAL2, VAL1 + VAL2);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodByte_17([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env_->FindClass("call_static_method_byte_test.F", &cls), ANI_OK);
    ani_static_method method1 {};
    ASSERT_EQ(env_->Class_FindStaticMethod(cls, "increment", nullptr, &method1), ANI_OK);
    ani_static_method method2 {};
    ASSERT_EQ(env_->Class_FindStaticMethod(cls, "getCount", nullptr, &method2), ANI_OK);
    ASSERT_EQ(env_->Class_CallStaticMethod_Void(cls, method1, VAL1, VAL2), ANI_OK);
    ani_byte value = 0;
    ASSERT_EQ(env_->Class_CallStaticMethod_Byte(cls, method2, &value), ANI_OK);
    ASSERT_EQ(value, VAL1 + VAL2);

    ani_value args[ARG_COUNT];
    args[0U].b = VAL1;
    args[1U].b = VAL2;
    ani_byte valueA = 0;
    ASSERT_EQ(env_->Class_CallStaticMethod_Byte_A(cls, method2, &valueA, args), ANI_OK);
    ASSERT_EQ(valueA, VAL1 + VAL2);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodByte_18([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env_->FindClass("call_static_method_byte_test.G", &cls), ANI_OK);
    ani_static_method method1 {};
    ASSERT_EQ(env_->Class_FindStaticMethod(cls, "publicMethod", "bb:b", &method1), ANI_OK);
    ani_static_method method2 {};
    ASSERT_EQ(env_->Class_FindStaticMethod(cls, "callPrivateMethod", "bb:b", &method2), ANI_OK);
    ani_byte value = 0;
    ASSERT_EQ(env_->Class_CallStaticMethod_Byte(cls, method1, &value, VAL1, VAL2), ANI_OK);
    ASSERT_EQ(value, VAL1 + VAL2);
    ASSERT_EQ(env_->Class_CallStaticMethod_Byte(cls, method2, &value, VAL1, VAL2), ANI_OK);
    ASSERT_EQ(value, VAL2 - VAL1);

    ani_value args[ARG_COUNT];
    args[0U].b = VAL1;
    args[1U].b = VAL2;
    ani_byte valueA = 0;
    ASSERT_EQ(env_->Class_CallStaticMethod_Byte_A(cls, method1, &valueA, args), ANI_OK);
    ASSERT_EQ(valueA, VAL1 + VAL2);
    ASSERT_EQ(env_->Class_CallStaticMethod_Byte_A(cls, method2, &valueA, args), ANI_OK);
    ASSERT_EQ(valueA, VAL2 - VAL1);
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
