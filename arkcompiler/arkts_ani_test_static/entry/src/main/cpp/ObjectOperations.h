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

#ifndef ARKTS_ANI_TEST_OBJECTOPERATIONS_H
#define ARKTS_ANI_TEST_OBJECTOPERATIONS_H
#include "Common.h"

typedef struct ParamObj {
    const char *className;
    const char *methodName;
    const char *signature;
} ParamObj;

ani_int GetMethodAndObject(ani_env *env, ParamObj* param, ani_object *object, ani_method *method)
{
    // NOLINTBEGIN(cppcoreguidelines-pro-type-vararg)
    ani_class cls {};
    ASSERT_EQ(env->FindClass(param->className, &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_method ctor {};
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", ":", &ctor), ANI_OK);

    ASSERT_EQ(env->Object_New(cls, ctor, object), ANI_OK);
    ASSERT_NE(object, nullptr);

    ASSERT_EQ(env->Class_FindMethod(cls, param->methodName, param->signature, method), ANI_OK);
    ASSERT_NE(method, nullptr);
    // NOLINTEND(cppcoreguidelines-pro-type-vararg)
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Boolean_A([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperations.A";
    paramObjOperation.methodName = "booleanMethod";
    paramObjOperation.signature = "ii:z";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_value args[2];  // NOLINT(modernize-avoid-c-arrays)
    ani_int arg1 = VAL1;
    ani_int arg2 = VAL2;
    args[0].i = arg1;
    args[1].i = arg2;
    ani_boolean res = ANI_FALSE;
    // Call the method and verify the return value.
    ASSERT_EQ(env->Object_CallMethod_Boolean_A(object, method, &res, args), ANI_OK);
    ASSERT_EQ(res, ANI_TRUE);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Boolean_01([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperations.A";
    paramObjOperation.methodName = "booleanMethod";
    paramObjOperation.signature = "ii:z";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_boolean res = ANI_FALSE;
    ani_int arg1 = VAL1;
    ani_int arg2 = VAL2;
    // Call the method using variadic arguments and verify the return value.
    // NOLINTNEXTLINE(cppcoreguidelines-pro-type-vararg)
    ASSERT_EQ(env->Object_CallMethod_Boolean(object, method, &res, arg1, arg2), ANI_OK);
    ASSERT_EQ(res, ANI_TRUE);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Boolean_02([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperations.A";
    paramObjOperation.methodName = "booleanMethod";
    paramObjOperation.signature = "ii:z";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_boolean res = ANI_FALSE;
    ani_int arg1 = VAL1;
    ani_int arg2 = VAL2;
    // Call the method and verify the return value.
    // NOLINTNEXTLINE(cppcoreguidelines-pro-type-vararg)
    ASSERT_EQ(env->c_api->Object_CallMethod_Boolean(env, object, method, &res, arg1, arg2), ANI_OK);
    ASSERT_EQ(res, ANI_TRUE);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Boolean_03([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperations.A";
    paramObjOperation.methodName = "booleanMethod";
    paramObjOperation.signature = "ii:z";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_boolean res = ANI_FALSE;
    ani_int arg1 = VAL1;
    ani_int arg2 = VAL2;
    // Call the method using variadic arguments and verify the return value.
    // NOLINTNEXTLINE(cppcoreguidelines-pro-type-vararg)
    ASSERT_EQ(env->Object_CallMethod_Boolean(object, method, &res, arg1, arg2), ANI_OK);
    ASSERT_EQ(res, ANI_TRUE);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Boolean_04([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperations.A";
    paramObjOperation.methodName = "booleanMethod";
    paramObjOperation.signature = "ii:z";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_boolean res = ANI_FALSE;
    ani_int arg1 = VAL1;
    ani_int arg2 = VAL2;
    // Attempt to call the method with a nullptr method pointer.
    // NOLINTNEXTLINE(cppcoreguidelines-pro-type-vararg)
    ASSERT_EQ(env->Object_CallMethod_Boolean(object, nullptr, &res, arg1, arg2), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Boolean_05([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperations.A";
    paramObjOperation.methodName = "booleanMethod";
    paramObjOperation.signature = "ii:z";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_int arg1 = VAL1;
    ani_int arg2 = VAL2;
    // Attempt to call the method with a nullptr result pointer.
    // NOLINTNEXTLINE(cppcoreguidelines-pro-type-vararg)
    ASSERT_EQ(env->Object_CallMethod_Boolean(object, method, nullptr, arg1, arg2), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Boolean_06([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperations.A";
    paramObjOperation.methodName = "booleanMethod";
    paramObjOperation.signature = "ii:z";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_boolean res;
    ani_int arg1 = VAL1;
    ani_int arg2 = VAL2;
    // Attempt to call the method with a nullptr object pointer.
    // NOLINTNEXTLINE(cppcoreguidelines-pro-type-vararg)
    ASSERT_EQ(env->Object_CallMethod_Boolean(nullptr, method, &res, arg1, arg2), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Boolean_07([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperations.A";
    paramObjOperation.methodName = "booleanMethod";
    paramObjOperation.signature = "ii:z";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_boolean res;
    // Attempt to call the method with a nullptr argument array.
    ASSERT_EQ(env->Object_CallMethod_Boolean_A(object, method, &res, nullptr), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Boolean_08([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodBoolean.A";
    paramObjOperation.methodName = "booleanMethodVoidParam";
    paramObjOperation.signature = ":z";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);


    ani_boolean result = 0U;
    ASSERT_EQ(env->Object_CallMethod_Boolean(object, method, &result), ANI_OK);
    ASSERT_EQ(result, ANI_TRUE);

    ani_value args[2U];
    ASSERT_EQ(env->Object_CallMethod_Boolean_A(object, method, &result, args), ANI_OK);
    ASSERT_EQ(result, ANI_TRUE);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Boolean_09([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_method method {};
    ParamObj  paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodBoolean.A";
    paramObjOperation.methodName = "booleanMethodMultipleParam";
    paramObjOperation.signature = "bffb:z";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_value args[4U] = {};
    ani_byte arg1 = VAL3;
    ani_float arg2 = 2.0F;
    ani_float arg3 = 3.0F;
    ani_byte arg4 = 4U;
    args[0U].b = arg1;
    args[1U].f = arg2;
    args[2U].f = arg3;
    args[3U].b = arg4;

    ani_boolean result;
    ASSERT_EQ(env->Object_CallMethod_Boolean(object, method, &result, arg1, arg2, arg3, arg4), ANI_OK);
    ASSERT_EQ(result, ANI_FALSE);

    ASSERT_EQ(env->Object_CallMethod_Boolean_A(object, method, &result, args), ANI_OK);
    ASSERT_EQ(result, ANI_FALSE);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Boolean_10([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodBoolean.B";
    paramObjOperation.methodName = "booleanMethodVoidParam";
    paramObjOperation.signature = ":z";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_boolean result = 0U;
    ASSERT_EQ(env->Object_CallMethod_Boolean(object, method, &result), ANI_OK);
    ASSERT_EQ(result, ANI_TRUE);

    ani_value args[2U];
    ASSERT_EQ(env->Object_CallMethod_Boolean_A(object, method, &result, args), ANI_OK);
    ASSERT_EQ(result, ANI_TRUE);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Boolean_11([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class clsC {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ObjectOperationsMethodBoolean.C", &clsC), ANI_OK);
    ASSERT_NE(clsC, nullptr);

    ani_method method {};
    ASSERT_EQ(env->Class_FindMethod(clsC, "func", "ii:z", &method), ANI_OK);
    ASSERT_NE(method, nullptr);

    ani_class clsD {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ObjectOperationsMethodBoolean.D", &clsD), ANI_OK);
    ASSERT_NE(clsD, nullptr);
    ani_method ctor {};
    ASSERT_EQ(env->Class_FindMethod(clsD, "<ctor>", ":", &ctor), ANI_OK);

    ASSERT_EQ(env->Object_New(clsD, ctor, &object), ANI_OK);
    ASSERT_NE(object, nullptr);

    ani_boolean result = ANI_TRUE;
    ani_value args[2U] = {};
    ani_int arg1 = VAL3;
    ani_int arg2 = VAL4;
    args[0U].i = arg1;
    args[1U].i = arg2;
    ASSERT_EQ(env->Object_CallMethod_Boolean(object, method, &result, arg1, arg2), ANI_OK);
    ASSERT_EQ(result, ANI_FALSE);

    ASSERT_EQ(env->Object_CallMethod_Boolean_A(object, method, &result, args), ANI_OK);
    ASSERT_EQ(result, ANI_FALSE);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Boolean_12([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodBoolean.E";
    paramObjOperation.methodName = "func";
    paramObjOperation.signature = "ii:z";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_boolean result = ANI_FALSE;
    ani_value args[2U] = {};
    ani_int arg1 = VAL1;
    ani_int arg2 = VAL2;
    args[0U].i = arg1;
    args[1U].i = arg2;
    ASSERT_EQ(env->Object_CallMethod_Boolean(object, method, &result, arg1, arg2), ANI_OK);
    ASSERT_EQ(result, ANI_TRUE);

    ASSERT_EQ(env->Object_CallMethod_Boolean_A(object, method, &result, args), ANI_OK);
    ASSERT_EQ(result, ANI_TRUE);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Boolean_13([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodBoolean.A";
    paramObjOperation.methodName = "booleanMethod";
    paramObjOperation.signature = "ii:z";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_boolean result = ANI_FALSE;
    ani_value args[2U] = {};
    ani_byte arg1 = 6U;
    ani_byte arg2 = 7U;
    args[0U].b = arg1;
    args[1U].b = arg2;

    for (ani_int i = 0; i < VAL4; i++) {
        ASSERT_EQ(env->Object_CallMethod_Boolean(object, method, &result, arg1, arg2), ANI_OK);
        ASSERT_EQ(result, ANI_TRUE);
        ASSERT_EQ(env->Object_CallMethod_Boolean_A(object, method, &result, args), ANI_OK);
        ASSERT_EQ(result, ANI_TRUE);
    }
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Boolean_14([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodBoolean.A";
    paramObjOperation.methodName = "nestedMethod";
    paramObjOperation.signature = nullptr;
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_boolean result = ANI_TRUE;
    ani_value args[2U] = {};
    ani_byte arg1 = VAL4;
    ani_byte arg2 = VAL4;
    args[0U].b = arg1;
    args[1U].b = arg2;

    ASSERT_EQ(env->Object_CallMethod_Boolean(object, method, &result, arg1, arg2), ANI_OK);
    ASSERT_EQ(result, ANI_FALSE);

    ASSERT_EQ(env->Object_CallMethod_Boolean_A(object, method, &result, args), ANI_OK);
    ASSERT_EQ(result, ANI_FALSE);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Boolean_15([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodBoolean.A";
    paramObjOperation.methodName = "recursionMethod";
    paramObjOperation.signature = "i:z";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_boolean result = ANI_FALSE;
    ani_value args[1U] = {};
    ani_byte arg1 = VAL4;
    args[0U].i = arg1;
    ASSERT_EQ(env->Object_CallMethod_Boolean(object, method, &result, arg1), ANI_OK);
    ASSERT_EQ(result, ANI_TRUE);

    ASSERT_EQ(env->Object_CallMethod_Boolean_A(object, method, &result, args), ANI_OK);
    ASSERT_EQ(result, ANI_TRUE);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Byte_01([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_int VAL1 = 2U;
    constexpr ani_int VAL2 = 3U;
    constexpr ani_int VAL4 = 5U;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodByte.A";
    paramObjOperation.methodName = "byteMethod";
    paramObjOperation.signature = "bb:b";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_value args[VAL1];
    ani_byte arg1 = VAL4;
    ani_byte arg2 = VAL2;
    args[0U].b = arg1;
    args[1U].b = arg2;

    ani_byte sum = 0U;
    ASSERT_EQ(env->Object_CallMethod_Byte_A(object, method, &sum, args), ANI_OK);
    ASSERT_EQ(env->c_api->Object_CallMethod_Byte_A(env, object, method, &sum, args), ANI_OK);
    ASSERT_EQ(sum, arg1);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Byte_02([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_int VAL1 = 2U;
    constexpr ani_int VAL2 = 3U;

    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodByte.A";
    paramObjOperation.methodName = "byteMethod";
    paramObjOperation.signature = "bb:b";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_byte sum = 0U;
    ani_byte arg1 = VAL1;
    ani_byte arg2 = VAL2;
    ASSERT_EQ(env->Object_CallMethod_Byte(object, method, &sum, arg1, arg2), ANI_OK);
    ASSERT_EQ(sum, arg2);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Byte_03([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_int VAL2 = 3U;
    constexpr ani_int VAL3 = 4U;

    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodByte.A";
    paramObjOperation.methodName = "byteMethod";
    paramObjOperation.signature = "bb:b";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_byte sum = 0U;
    ani_byte arg1 = VAL3;
    ani_byte arg2 = VAL2;
    ASSERT_EQ(env->c_api->Object_CallMethod_Byte(env, object, method, &sum, arg1, arg2), ANI_OK);
    ASSERT_EQ(sum, arg1);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Byte_04([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_int VAL4 = 5U;
    constexpr ani_int VAL5 = 6U;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodByte.A";
    paramObjOperation.methodName = "byteMethod";
    paramObjOperation.signature = "bb:b";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_byte sum = 0U;
    ani_byte arg1 = VAL4;
    ani_byte arg2 = VAL5;
    ASSERT_EQ(env->c_api->Object_CallMethod_Byte(nullptr, object, method, &sum, arg1, arg2), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Byte_05([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_int VAL4 = 5U;
    constexpr ani_int VAL5 = 6U;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodByte.A";
    paramObjOperation.methodName = "byteMethod";
    paramObjOperation.signature = "bb:b";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_byte sum = 0U;
    ani_byte arg1 = VAL4;
    ani_byte arg2 = VAL5;
    ASSERT_EQ(env->Object_CallMethod_Byte(object, nullptr, &sum, arg1, arg2), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Byte_06([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_int VAL4 = 5U;
    constexpr ani_int VAL5 = 6U;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodByte.A";
    paramObjOperation.methodName = "byteMethod";
    paramObjOperation.signature = "bb:b";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_byte arg1 = VAL4;
    ani_byte arg2 = VAL5;
    ASSERT_EQ(env->Object_CallMethod_Byte(object, method, nullptr, arg1, arg2), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Byte_07([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_int VAL4 = 5U;
    constexpr ani_int VAL5 = 6U;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodByte.A";
    paramObjOperation.methodName = "byteMethod";
    paramObjOperation.signature = "bb:b";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_byte sum = 0U;
    ani_byte arg1 = VAL4;
    ani_byte arg2 = VAL5;
    ASSERT_EQ(env->Object_CallMethod_Byte(nullptr, method, &sum, arg1, arg2), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Byte_08([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodByte.A";
    paramObjOperation.methodName = "byteMethod";
    paramObjOperation.signature = "bb:b";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_byte sum = 0U;
    ASSERT_EQ(env->Object_CallMethod_Byte_A(object, method, &sum, nullptr), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Byte_09([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_int VAL1 = 2U;
    constexpr ani_int VAL4 = 5U;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodByte.A";
    paramObjOperation.methodName = "byteMethodVoidParam";
    paramObjOperation.signature = ":b";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_byte result = 0U;
    ASSERT_EQ(env->Object_CallMethod_Byte(object, method, &result), ANI_OK);
    ASSERT_EQ(result, VAL4);

    ani_value args[VAL1];
    ASSERT_EQ(env->Object_CallMethod_Byte_A(object, method, &result, args), ANI_OK);
    ASSERT_EQ(result, VAL4);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Byte_10([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_int VAL1 = 2U;
    constexpr ani_int VAL4 = 5U;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodByte.A";
    paramObjOperation.methodName = "byteMethodMultipleParam";
    paramObjOperation.signature = "bzffb:b";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_value args[5U] = {};
    ani_byte arg1 = VAL1;
    ani_boolean arg2 = ANI_TRUE;
    ani_float arg3 = 3.0F;
    ani_float arg4 = 4.0F;
    ani_byte arg5 = VAL4;
    args[0U].b = arg1;
    args[1U].z = arg2;
    args[2U].f = arg3;
    args[3U].f = arg4;
    args[4U].b = arg5;

    ani_byte result = 0U;
    ASSERT_EQ(env->Object_CallMethod_Byte(object, method, &result, arg1, arg2, arg3, arg4, arg5), ANI_OK);
    ASSERT_EQ(result, arg5);

    ASSERT_EQ(env->Object_CallMethod_Byte_A(object, method, &result, args), ANI_OK);
    ASSERT_EQ(result, arg5);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Byte_11([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_int VAL1 = 2U;
    constexpr ani_int VAL4 = 5U;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodByte.B";
    paramObjOperation.methodName = "byteMethodVoidParam";
    paramObjOperation.signature = ":b";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_byte result = 0U;
    ASSERT_EQ(env->Object_CallMethod_Byte(object, method, &result), ANI_OK);
    ASSERT_EQ(result, VAL4);

    ani_value args[VAL1];
    ASSERT_EQ(env->Object_CallMethod_Byte_A(object, method, &result, args), ANI_OK);
    ASSERT_EQ(result, VAL4);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Byte_12([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_int VAL1 = 2U;
    constexpr ani_int VAL3 = 4U;
    constexpr ani_int VAL5 = 6U;
    ani_class clsC {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ObjectOperationsMethodByte.C", &clsC), ANI_OK);
    ASSERT_NE(clsC, nullptr);

    ani_method method {};
    ASSERT_EQ(env->Class_FindMethod(clsC, "func", nullptr, &method), ANI_OK);
    ASSERT_NE(method, nullptr);

    ani_class clsD {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ObjectOperationsMethodByte.D", &clsD), ANI_OK);
    ASSERT_NE(clsD, nullptr);
    ani_method ctor {};
    ASSERT_EQ(env->Class_FindMethod(clsD, "<ctor>", ":", &ctor), ANI_OK);

    ASSERT_EQ(env->Object_New(clsD, ctor, &object), ANI_OK);
    ASSERT_NE(object, nullptr);

    ani_byte result = 0U;
    ani_value args[2U] = {};
    ani_byte arg1 = VAL3;
    ani_byte arg2 = VAL1;
    args[0U].b = arg1;
    args[1U].b = arg2;
    ASSERT_EQ(env->Object_CallMethod_Byte(object, method, &result, arg1, arg2), ANI_OK);
    ASSERT_EQ(result, VAL5);

    ASSERT_EQ(env->Object_CallMethod_Byte_A(object, method, &result, args), ANI_OK);
    ASSERT_EQ(result, VAL5);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Byte_13([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_int VAL1 = 2U;
    constexpr ani_int VAL3 = 4U;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodByte.E";
    paramObjOperation.methodName = "func";
    paramObjOperation.signature = nullptr;
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_byte result = 0U;
    ani_value args[2U] = {};
    ani_byte arg1 = VAL3;
    ani_byte arg2 = VAL1;
    args[0U].b = arg1;
    args[1U].b = arg2;
    ASSERT_EQ(env->Object_CallMethod_Byte(object, method, &result, arg1, arg2), ANI_OK);
    ASSERT_EQ(result, VAL1);

    ASSERT_EQ(env->Object_CallMethod_Byte_A(object, method, &result, args), ANI_OK);
    ASSERT_EQ(result, VAL1);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Byte_14([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_int VAL2 = 3U;
    constexpr ani_int VAL3 = 4U;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodByte.A";
    paramObjOperation.methodName = "byteMethod";
    paramObjOperation.signature = "bb:b";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_byte result = 0U;
    ani_value args[2U] = {};
    ani_byte arg1 = VAL3;
    ani_byte arg2 = VAL2;
    args[0U].b = arg1;
    args[1U].b = arg2;

    for (ani_int i = 0; i < VAL2; i++) {
        ASSERT_EQ(env->Object_CallMethod_Byte(object, method, &result, arg1, arg2), ANI_OK);
        ASSERT_EQ(result, VAL3);
        ASSERT_EQ(env->Object_CallMethod_Byte_A(object, method, &result, args), ANI_OK);
        ASSERT_EQ(result, VAL3);
    }
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Byte_15([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_int VAL2 = 3U;
    constexpr ani_int VAL5 = 6U;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodByte.A";
    paramObjOperation.methodName = "nestedMethod";
    paramObjOperation.signature = "bb:b";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_byte result = 0U;
    ani_value args[2U] = {};
    ani_byte arg1 = VAL2;
    ani_byte arg2 = VAL2;
    args[0U].b = arg1;
    args[1U].b = arg2;

    ASSERT_EQ(env->Object_CallMethod_Byte(object, method, &result, arg1, arg2), ANI_OK);
    ASSERT_EQ(result, VAL5);

    ASSERT_EQ(env->Object_CallMethod_Byte_A(object, method, &result, args), ANI_OK);
    ASSERT_EQ(result, VAL5);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Byte_16([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_int VAL2 = 3U;
    constexpr ani_int VAL6 = 103U;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodByte.A";
    paramObjOperation.methodName = "recursionMethod";
    paramObjOperation.signature = "b:b";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_byte result = 0U;
    ani_value args[1U] = {};
    ani_byte arg1 = VAL2;
    args[0U].i = arg1;
    ASSERT_EQ(env->Object_CallMethod_Byte(object, method, &result, arg1), ANI_OK);
    ASSERT_EQ(result, VAL6);

    ASSERT_EQ(env->Object_CallMethod_Byte_A(object, method, &result, args), ANI_OK);
    ASSERT_EQ(result, VAL6);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Char_01([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_char VAL1 = 'a';
    constexpr ani_char VAL2 = 'b';
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodChar.A";
    paramObjOperation.methodName = "charMethod";
    paramObjOperation.signature = "cc:c";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_value args[2U];
    ani_char arg1 = VAL1;
    ani_char arg2 = VAL2;
    args[0U].c = arg1;
    args[1U].c = arg2;

    ani_char result = '0';
    ASSERT_EQ(env->Object_CallMethod_Char_A(object, method, &result, args), ANI_OK);
    ASSERT_EQ(result, arg2);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Char_02([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodChar.A";
    paramObjOperation.methodName = "charMethod";
    paramObjOperation.signature = "cc:c";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_char result = '0';
    ASSERT_EQ(env->Object_CallMethod_Char_A(object, method, &result, nullptr), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Char_03([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_char VAL1 = 'a';
    constexpr ani_char VAL2 = 'b';
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodChar.A";
    paramObjOperation.methodName = "charMethod";
    paramObjOperation.signature = "cc:c";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_char result = '0';
    ani_char arg1 = VAL1;
    ani_char arg2 = VAL2;
    ASSERT_EQ(env->Object_CallMethod_Char(object, method, &result, arg1, arg2), ANI_OK);
    ASSERT_EQ(result, arg2);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Char_04([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_char VAL1 = 'a';
    constexpr ani_char VAL2 = 'b';
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodChar.A";
    paramObjOperation.methodName = "charMethod";
    paramObjOperation.signature = "cc:c";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_char result = '0';
    ani_char arg1 = VAL1;
    ani_char arg2 = VAL2;
    ASSERT_EQ(env->c_api->Object_CallMethod_Char(env, object, method, &result, arg1, arg2), ANI_OK);
    ASSERT_EQ(result, arg2);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Char_05([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_char VAL1 = 'a';
    constexpr ani_char VAL2 = 'b';
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodChar.A";
    paramObjOperation.methodName = "charMethod";
    paramObjOperation.signature = "cc:c";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_char result = '0';
    ani_char arg1 = VAL1;
    ani_char arg2 = VAL2;
    ASSERT_EQ(env->c_api->Object_CallMethod_Char(nullptr, object, method, &result, arg1, arg2), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Char_06([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_char VAL1 = 'a';
    constexpr ani_char VAL2 = 'b';
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodChar.A";
    paramObjOperation.methodName = "charMethod";
    paramObjOperation.signature = "cc:c";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_char result = '0';
    ani_char arg1 = VAL1;
    ani_char arg2 = VAL2;
    ASSERT_EQ(env->Object_CallMethod_Char(nullptr, method, &result, arg1, arg2), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Char_07([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_char VAL1 = 'a';
    constexpr ani_char VAL2 = 'b';
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodChar.A";
    paramObjOperation.methodName = "charMethod";
    paramObjOperation.signature = "cc:c";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_char result = '0';
    ani_char arg1 = VAL1;
    ani_char arg2 = VAL2;
    ASSERT_EQ(env->Object_CallMethod_Char(object, nullptr, &result, arg1, arg2), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Char_08([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_char VAL1 = 'a';
    constexpr ani_char VAL2 = 'b';
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodChar.A";
    paramObjOperation.methodName = "charMethod";
    paramObjOperation.signature = "cc:c";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_char arg1 = VAL1;
    ani_char arg2 = VAL2;
    ASSERT_EQ(env->Object_CallMethod_Char(object, method, nullptr, arg1, arg2), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Char_09([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_char VAL3 = 'A';
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodChar.A";
    paramObjOperation.methodName = "charMethodVoidParam";
    paramObjOperation.signature = ":c";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_char result = 0U;
    ASSERT_EQ(env->Object_CallMethod_Char(object, method, &result), ANI_OK);
    ASSERT_EQ(result, VAL3);

    ani_value args[2U];
    ASSERT_EQ(env->Object_CallMethod_Char_A(object, method, &result, args), ANI_OK);
    ASSERT_EQ(result, VAL3);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Char_10([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_char VAL3 = 'A';
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodChar.A";
    paramObjOperation.methodName = "charMethodMultipleParam";
    paramObjOperation.signature = "bzffb:c";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_value args[5U] = {};
    ani_byte arg1 = 2U;
    ani_boolean arg2 = ANI_TRUE;
    ani_float arg3 = 3.0F;
    ani_float arg4 = 4.0F;
    ani_byte arg5 = 5U;
    args[0U].b = arg1;
    args[1U].z = arg2;
    args[2U].f = arg3;
    args[3U].f = arg4;
    args[4U].b = arg5;

    ani_char result = '0';
    ASSERT_EQ(env->Object_CallMethod_Char(object, method, &result, arg1, arg2, arg3, arg4, arg5), ANI_OK);
    ASSERT_EQ(result, VAL3);

    ASSERT_EQ(env->Object_CallMethod_Char_A(object, method, &result, args), ANI_OK);
    ASSERT_EQ(result, VAL3);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Char_11([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_char VAL3 = 'A';
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodChar.B";
    paramObjOperation.methodName = "charMethodVoidParam";
    paramObjOperation.signature = ":c";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_char result = '0';
    ASSERT_EQ(env->Object_CallMethod_Char(object, method, &result), ANI_OK);
    ASSERT_EQ(result, VAL3);

    ani_value args[2U];
    ASSERT_EQ(env->Object_CallMethod_Char_A(object, method, &result, args), ANI_OK);
    ASSERT_EQ(result, VAL3);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Char_12([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_char VAL4 = 'D';
    constexpr ani_char VAL5 = 'F';
    ani_class clsC {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ObjectOperationsMethodChar.C", &clsC), ANI_OK);
    ASSERT_NE(clsC, nullptr);

    ani_method method {};
    ASSERT_EQ(env->Class_FindMethod(clsC, "func", nullptr, &method), ANI_OK);
    ASSERT_NE(method, nullptr);

    ani_class clsD {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ObjectOperationsMethodChar.D", &clsD), ANI_OK);
    ASSERT_NE(clsD, nullptr);
    ani_method ctor {};
    ASSERT_EQ(env->Class_FindMethod(clsD, "<ctor>", ":", &ctor), ANI_OK);

    ASSERT_EQ(env->Object_New(clsD, ctor, &object), ANI_OK);
    ASSERT_NE(object, nullptr);

    ani_char result = '0';
    ani_value args[2U] = {};
    ani_char arg1 = VAL4;
    ani_byte arg2 = 2U;
    args[0U].c = arg1;
    args[1U].b = arg2;
    ASSERT_EQ(env->Object_CallMethod_Char(object, method, &result, arg1, arg2), ANI_OK);
    ASSERT_EQ(result, VAL5);

    ASSERT_EQ(env->Object_CallMethod_Char_A(object, method, &result, args), ANI_OK);
    ASSERT_EQ(result, VAL5);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Char_13([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_char VAL4 = 'D';
    constexpr ani_char VAL6 = 'B';
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodChar.E";
    paramObjOperation.methodName = "func";
    paramObjOperation.signature = "cb:c";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_char result = '0';
    ani_value args[2U] = {};
    ani_char arg1 = VAL4;
    ani_byte arg2 = 2U;
    args[0U].c = arg1;
    args[1U].b = arg2;
    ASSERT_EQ(env->Object_CallMethod_Char(object, method, &result, arg1, arg2), ANI_OK);
    ASSERT_EQ(result, VAL6);

    ASSERT_EQ(env->Object_CallMethod_Char_A(object, method, &result, args), ANI_OK);
    ASSERT_EQ(result, VAL6);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Char_14([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    static constexpr ani_int LOOP_COUNT = 3U;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodChar.A";
    paramObjOperation.methodName = "charMethod";
    paramObjOperation.signature = "cc:c";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_char result = '0';
    ani_value args[2U] = {};
    ani_char arg1 = 'X';
    ani_char arg2 = 'Y';
    args[0U].c = arg1;
    args[1U].c = arg2;

    for (ani_int i = 0; i < LOOP_COUNT; i++) {
        ASSERT_EQ(env->Object_CallMethod_Char(object, method, &result, arg1, arg2), ANI_OK);
        ASSERT_EQ(result, 'Y');
        ASSERT_EQ(env->Object_CallMethod_Char_A(object, method, &result, args), ANI_OK);
        ASSERT_EQ(result, 'Y');
    }
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Char_15([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_char VAL3 = 'A';
    constexpr ani_char VAL4 = 'D';
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodChar.A";
    paramObjOperation.methodName = "nestedMethod";
    paramObjOperation.signature = "ci:c";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_char result = '0';
    ani_value args[2U] = {};
    ani_char arg1 = VAL3;
    ani_int arg2 = 3U;
    args[0U].c = arg1;
    args[1U].i = arg2;

    ASSERT_EQ(env->Object_CallMethod_Char(object, method, &result, arg1, arg2), ANI_OK);
    ASSERT_EQ(result, VAL4);

    ASSERT_EQ(env->Object_CallMethod_Char_A(object, method, &result, args), ANI_OK);
    ASSERT_EQ(result, VAL4);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Char_16([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_char VAL3 = 'A';
    constexpr ani_char VAL7 = 'i';
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodChar.A";
    paramObjOperation.methodName = "recursionMethod";
    paramObjOperation.signature = "c:c";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_char result = '0';
    ani_value args[1U] = {};
    ani_char arg1 = VAL3;
    args[0U].c = arg1;
    ASSERT_EQ(env->Object_CallMethod_Char(object, method, &result, arg1), ANI_OK);
    ASSERT_EQ(result, VAL7);

    ASSERT_EQ(env->Object_CallMethod_Char_A(object, method, &result, args), ANI_OK);
    ASSERT_EQ(result, VAL7);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Double_01([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_double INIT_VALUE = 0.0F;
    constexpr ani_double VAL = 2.0F;
    constexpr ani_double VAL1 = 3.0F;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodDouble.A";
    paramObjOperation.methodName = "doubleMethod";
    paramObjOperation.signature = "dd:d";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_value args[2U];
    ani_double arg1 = VAL;
    ani_double arg2 = VAL1;
    args[0U].d = arg1;
    args[1U].d = arg2;

    ani_double sum = INIT_VALUE;
    ASSERT_EQ(env->Object_CallMethod_Double_A(object, method, &sum, args), ANI_OK);
    ASSERT_EQ(sum, arg1 + arg2);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Double_02([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_double INIT_VALUE = 0.0F;
    constexpr ani_double VAL = 2.0F;
    constexpr ani_double VAL1 = 3.0F;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodDouble.A";
    paramObjOperation.methodName = "doubleMethod";
    paramObjOperation.signature = "dd:d";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_double sum = INIT_VALUE;
    ani_double arg1 = VAL;
    ani_double arg2 = VAL1;
    ASSERT_EQ(env->Object_CallMethod_Double(object, method, &sum, arg1, arg2), ANI_OK);
    ASSERT_EQ(sum, arg1 + arg2);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Double_03([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_double INIT_VALUE = 0.0F;
    constexpr ani_double VAL = 2.0F;
    constexpr ani_double VAL1 = 3.0F;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodDouble.A";
    paramObjOperation.methodName = "doubleMethod";
    paramObjOperation.signature = "dd:d";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_double sum = INIT_VALUE;
    ani_double arg1 = VAL;
    ani_double arg2 = VAL1;
    ASSERT_EQ(env->c_api->Object_CallMethod_Double(env, object, method, &sum, arg1, arg2), ANI_OK);
    ASSERT_EQ(sum, arg1 + arg2);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Double_04([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_double INIT_VALUE = 0.0F;
    constexpr ani_double VAL = 2.0F;
    constexpr ani_double VAL1 = 3.0F;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodDouble.A";
    paramObjOperation.methodName = "doubleMethod";
    paramObjOperation.signature = "dd:d";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_double sum = INIT_VALUE;
    ani_double arg1 = VAL;
    ani_double arg2 = VAL1;
    ASSERT_EQ(env->c_api->Object_CallMethod_Double(nullptr, object, method, &sum, arg1, arg2), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Double_05([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_double INIT_VALUE = 0.0F;
    constexpr ani_double VAL = 2.0F;
    constexpr ani_double VAL1 = 3.0F;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodDouble.A";
    paramObjOperation.methodName = "doubleMethod";
    paramObjOperation.signature = "dd:d";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_double sum = INIT_VALUE;
    ani_double arg1 = VAL;
    ani_double arg2 = VAL1;
    ASSERT_EQ(env->Object_CallMethod_Double(object, nullptr, &sum, arg1, arg2), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Double_06([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_double VAL = 2.0F;
    constexpr ani_double VAL1 = 3.0F;

    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodDouble.A";
    paramObjOperation.methodName = "doubleMethod";
    paramObjOperation.signature = "dd:d";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_double arg1 = VAL;
    ani_double arg2 = VAL1;
    ASSERT_EQ(env->Object_CallMethod_Double(object, method, nullptr, arg1, arg2), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Double_07([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_double INIT_VALUE = 0.0F;
    constexpr ani_double VAL = 2.0F;
    constexpr ani_double VAL1 = 3.0F;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodDouble.A";
    paramObjOperation.methodName = "doubleMethod";
    paramObjOperation.signature = "dd:d";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_double sum = INIT_VALUE;
    ani_double arg1 = VAL;
    ani_double arg2 = VAL1;
    ASSERT_EQ(env->Object_CallMethod_Double(nullptr, method, &sum, arg1, arg2), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Double_08([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_double INIT_VALUE = 0.0F;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodDouble.A";
    paramObjOperation.methodName = "doubleMethod";
    paramObjOperation.signature = "dd:d";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_double sum = INIT_VALUE;
    ASSERT_EQ(env->Object_CallMethod_Double_A(object, method, &sum, nullptr), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Double_09([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_double INIT_VALUE = 0.0F;
    constexpr ani_double VAL3 = 5.0F;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodDouble.A";
    paramObjOperation.methodName = "doubleMethodVoidParam";
    paramObjOperation.signature = ":d";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_double result = INIT_VALUE;
    ASSERT_EQ(env->Object_CallMethod_Double(object, method, &result), ANI_OK);
    ASSERT_EQ(result, VAL3);

    ani_value args[2U];
    ASSERT_EQ(env->Object_CallMethod_Double_A(object, method, &result, args), ANI_OK);
    ASSERT_EQ(result, VAL3);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Double_10([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_double INIT_VALUE = 0.0F;
    constexpr ani_double VAL1 = 3.0F;
    constexpr ani_double VAL3 = 5.0F;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodDouble.A";
    paramObjOperation.methodName = "doubleMethodMultipleParam";
    paramObjOperation.signature = "szdsd:d";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_value args[5U] = {};
    ani_short arg1 = 2U;
    ani_boolean arg2 = ANI_TRUE;
    ani_double arg3 = VAL1;
    ani_short arg4 = 4U;
    ani_double arg5 = VAL3;
    args[0U].s = arg1;
    args[1U].z = arg2;
    args[2U].d = arg3;
    args[3U].s = arg4;
    args[4U].d = arg5;

    ani_double result = INIT_VALUE;
    ASSERT_EQ(env->Object_CallMethod_Double(object, method, &result, arg1, arg2, arg3, arg4, arg5), ANI_OK);
    ASSERT_EQ(result, arg3 + arg5);

    ASSERT_EQ(env->Object_CallMethod_Double_A(object, method, &result, args), ANI_OK);
    ASSERT_EQ(result, arg3 + arg5);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Double_11([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_double INIT_VALUE = 0.0F;
    constexpr ani_double VAL3 = 5.0F;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodDouble.B";
    paramObjOperation.methodName = "doubleMethodVoidParam";
    paramObjOperation.signature = ":d";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_double result = INIT_VALUE;
    ASSERT_EQ(env->Object_CallMethod_Double(object, method, &result), ANI_OK);
    ASSERT_EQ(result, VAL3);

    ani_value args[2U];
    ASSERT_EQ(env->Object_CallMethod_Double_A(object, method, &result, args), ANI_OK);
    ASSERT_EQ(result, VAL3);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Double_12([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object1)
{
    constexpr ani_double VAL = 2.0F;
    constexpr ani_double VAL1 = 3.0F;
    constexpr ani_double VAL3 = 5.0F;
    ani_class clsC {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ObjectOperationsMethodDouble.C", &clsC), ANI_OK);
    ASSERT_NE(clsC, nullptr);

    ani_method method {};
    ASSERT_EQ(env->Class_FindMethod(clsC, "func", nullptr, &method), ANI_OK);
    ASSERT_NE(method, nullptr);

    ani_class clsD {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ObjectOperationsMethodDouble.D", &clsD), ANI_OK);
    ASSERT_NE(clsD, nullptr);
    ani_method ctor {};
    ASSERT_EQ(env->Class_FindMethod(clsD, "<ctor>", ":", &ctor), ANI_OK);

    ani_object object {};
    ASSERT_EQ(env->Object_New(clsD, ctor, &object), ANI_OK);
    ASSERT_NE(object, nullptr);

    ani_double result = 0U;
    ani_value args[2U] = {};
    ani_double arg1 = VAL1;
    ani_double arg2 = VAL;
    args[0U].d = arg1;
    args[1U].d = arg2;
    ASSERT_EQ(env->Object_CallMethod_Double(object, method, &result, arg1, arg2), ANI_OK);
    ASSERT_EQ(result, VAL3);

    ASSERT_EQ(env->Object_CallMethod_Double_A(object, method, &result, args), ANI_OK);
    ASSERT_EQ(result, VAL3);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Double_13([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_double VAL = 2.0F;
    constexpr ani_double VAL1 = 3.0F;
    constexpr ani_double VAL3 = 5.0F;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodDouble.E";
    paramObjOperation.methodName = "func";
    paramObjOperation.signature = nullptr;
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_double result = 0U;
    ani_value args[2U] = {};
    ani_double arg1 = VAL3;
    ani_double arg2 = VAL1;
    args[0U].d = arg1;
    args[1U].d = arg2;
    ASSERT_EQ(env->Object_CallMethod_Double(object, method, &result, arg1, arg2), ANI_OK);
    ASSERT_EQ(result, VAL);

    ASSERT_EQ(env->Object_CallMethod_Double_A(object, method, &result, args), ANI_OK);
    ASSERT_EQ(result, VAL);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Double_14([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_double INIT_VALUE = 0.0F;
    constexpr ani_double VAL1 = 3.0F;
    constexpr ani_double VAL2 = 4.0F;
    constexpr ani_double VAL4 = 7.0F;
    constexpr ani_int LOOP_COUNT = 3U;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodDouble.A";
    paramObjOperation.methodName = "doubleMethod";
    paramObjOperation.signature = "dd:d";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_double result = INIT_VALUE;
    ani_value args[2U] = {};
    ani_double arg1 = VAL1;
    ani_double arg2 = VAL2;
    args[0U].d = arg1;
    args[1U].d = arg2;

    for (ani_int i = 0; i < LOOP_COUNT; i++) {
        ASSERT_EQ(env->Object_CallMethod_Double(object, method, &result, arg1, arg2), ANI_OK);
        ASSERT_EQ(result, VAL4);
        ASSERT_EQ(env->Object_CallMethod_Double_A(object, method, &result, args), ANI_OK);
        ASSERT_EQ(result, VAL4);
    }
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Double_15([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_double INIT_VALUE = 0.0F;
    constexpr ani_double VAL1 = 3.0F;
    constexpr ani_double VAL2 = 4.0F;
    constexpr ani_double VAL4 = 7.0F;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodDouble.A";
    paramObjOperation.methodName = "nestedMethod";
    paramObjOperation.signature = "dd:d";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_double result = INIT_VALUE;
    ani_value args[2U] = {};
    ani_double arg1 = VAL1;
    ani_double arg2 = VAL2;
    args[0U].d = arg1;
    args[1U].d = arg2;

    ASSERT_EQ(env->Object_CallMethod_Double(object, method, &result, arg1, arg2), ANI_OK);
    ASSERT_EQ(result, VAL4);

    ASSERT_EQ(env->Object_CallMethod_Double_A(object, method, &result, args), ANI_OK);
    ASSERT_EQ(result, VAL4);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Double_16([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_double INIT_VALUE = 0.0F;
    constexpr ani_double VAL1 = 3.0F;
    constexpr ani_double VAL5 = 103.0F;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodDouble.A";
    paramObjOperation.methodName = "recursionMethod";
    paramObjOperation.signature = "d:d";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_double result = INIT_VALUE;
    ani_value args[1U] = {};
    ani_double arg1 = VAL1;
    args[0U].d = arg1;
    ASSERT_EQ(env->Object_CallMethod_Double(object, method, &result, arg1), ANI_OK);
    ASSERT_EQ(result, VAL5);

    ASSERT_EQ(env->Object_CallMethod_Double_A(object, method, &result, args), ANI_OK);
    ASSERT_EQ(result, VAL5);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Float_01([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_float INIT_VALUE = 0.0F;
    constexpr ani_float VAL = 2.0F;
    constexpr ani_float VAL1 = 3.0F;

    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodFloat.A";
    paramObjOperation.methodName = "floatMethod";
    paramObjOperation.signature = "ff:f";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_value args[2U];
    ani_float arg1 = VAL;
    ani_float arg2 = VAL1;
    args[0U].f = arg1;
    args[1U].f = arg2;

    ani_float sum = INIT_VALUE;
    ASSERT_EQ(env->Object_CallMethod_Float_A(object, method, &sum, args), ANI_OK);
    ASSERT_EQ(sum, arg1 + arg2);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Float_02([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_float INIT_VALUE = 0.0F;
    constexpr ani_float VAL = 2.0F;
    constexpr ani_float VAL1 = 3.0F;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodFloat.A";
    paramObjOperation.methodName = "floatMethod";
    paramObjOperation.signature = "ff:f";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_float sum = INIT_VALUE;
    ani_float arg1 = VAL;
    ani_float arg2 = VAL1;
    ASSERT_EQ(env->Object_CallMethod_Float(object, method, &sum, arg1, arg2), ANI_OK);
    ASSERT_EQ(sum, arg1 + arg2);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Float_03([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_float INIT_VALUE = 0.0F;
    constexpr ani_float VAL = 2.0F;
    constexpr ani_float VAL1 = 3.0F;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodFloat.A";
    paramObjOperation.methodName = "floatMethod";
    paramObjOperation.signature = "ff:f";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_float sum = INIT_VALUE;
    ani_float arg1 = VAL;
    ani_float arg2 = VAL1;
    ASSERT_EQ(env->c_api->Object_CallMethod_Float(env, object, method, &sum, arg1, arg2), ANI_OK);
    ASSERT_EQ(sum, arg1 + arg2);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Float_04([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_float INIT_VALUE = 0.0F;
    constexpr ani_float VAL = 2.0F;
    constexpr ani_float VAL1 = 3.0F;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodFloat.A";
    paramObjOperation.methodName = "floatMethod";
    paramObjOperation.signature = "ff:f";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_float sum = INIT_VALUE;
    ani_float arg1 = VAL;
    ani_float arg2 = VAL1;
    ASSERT_EQ(env->c_api->Object_CallMethod_Float(nullptr, object, method, &sum, arg1, arg2), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Float_05([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_float INIT_VALUE = 0.0F;
    constexpr ani_float VAL = 2.0F;
    constexpr ani_float VAL1 = 3.0F;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodFloat.A";
    paramObjOperation.methodName = "floatMethod";
    paramObjOperation.signature = "ff:f";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_float sum = INIT_VALUE;
    ani_float arg1 = VAL;
    ani_float arg2 = VAL1;
    ASSERT_EQ(env->Object_CallMethod_Float(object, nullptr, &sum, arg1, arg2), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Float_06([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_float VAL = 2.0F;
    constexpr ani_float VAL1 = 3.0F;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodFloat.A";
    paramObjOperation.methodName = "floatMethod";
    paramObjOperation.signature = "ff:f";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_float arg1 = VAL;
    ani_float arg2 = VAL1;
    ASSERT_EQ(env->Object_CallMethod_Float(object, method, nullptr, arg1, arg2), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Float_07([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_float INIT_VALUE = 0.0F;
    constexpr ani_float VAL = 2.0F;
    constexpr ani_float VAL1 = 3.0F;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodFloat.A";
    paramObjOperation.methodName = "floatMethod";
    paramObjOperation.signature = "ff:f";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_float sum = INIT_VALUE;
    ani_float arg1 = VAL;
    ani_float arg2 = VAL1;
    ASSERT_EQ(env->Object_CallMethod_Float(nullptr, method, &sum, arg1, arg2), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Float_08([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_float INIT_VALUE = 0.0F;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodFloat.A";
    paramObjOperation.methodName = "floatMethod";
    paramObjOperation.signature = "ff:f";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_float sum = INIT_VALUE;
    ASSERT_EQ(env->Object_CallMethod_Float_A(object, method, &sum, nullptr), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Float_09([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_float INIT_VALUE = 0.0F;
    constexpr ani_float VAL3 = 5.0F;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodFloat.A";
    paramObjOperation.methodName = "floatMethodVoidParam";
    paramObjOperation.signature = ":f";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_float result = INIT_VALUE;
    ASSERT_EQ(env->Object_CallMethod_Float(object, method, &result), ANI_OK);
    ASSERT_EQ(result, VAL3);

    ani_value args[2U];
    ASSERT_EQ(env->Object_CallMethod_Float_A(object, method, &result, args), ANI_OK);
    ASSERT_EQ(result, VAL3);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Float_10([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_float INIT_VALUE = 0.0F;
    constexpr ani_float VAL1 = 3.0F;
    constexpr ani_float VAL3 = 5.0F;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodFloat.A";
    paramObjOperation.methodName = "floatMethodMultipleParam";
    paramObjOperation.signature = "szfsf:f";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_value args[5U] = {};
    ani_short arg1 = 2U;
    ani_boolean arg2 = ANI_TRUE;
    ani_float arg3 = VAL1;
    ani_short arg4 = 4U;
    ani_float arg5 = VAL3;
    args[0U].s = arg1;
    args[1U].z = arg2;
    args[2U].f = arg3;
    args[3U].s = arg4;
    args[4U].f = arg5;

    ani_float result = INIT_VALUE;
    ASSERT_EQ(env->Object_CallMethod_Float(object, method, &result, arg1, arg2, arg3, arg4, arg5), ANI_OK);
    ASSERT_EQ(result, arg3 + arg5);

    ASSERT_EQ(env->Object_CallMethod_Float_A(object, method, &result, args), ANI_OK);
    ASSERT_EQ(result, arg3 + arg5);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Float_11([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_float INIT_VALUE = 0.0F;
    constexpr ani_float VAL3 = 5.0F;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodFloat.B";
    paramObjOperation.methodName = "floatMethodVoidParam";
    paramObjOperation.signature = ":f";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_float result = INIT_VALUE;
    ASSERT_EQ(env->Object_CallMethod_Float(object, method, &result), ANI_OK);
    ASSERT_EQ(result, VAL3);

    ani_value args[2U];
    ASSERT_EQ(env->Object_CallMethod_Float_A(object, method, &result, args), ANI_OK);
    ASSERT_EQ(result, VAL3);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Float_12([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_float VAL = 2.0F;
    constexpr ani_float VAL1 = 3.0F;
    constexpr ani_float VAL3 = 5.0F;
    ani_class clsC {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ObjectOperationsMethodFloat.C", &clsC), ANI_OK);
    ASSERT_NE(clsC, nullptr);

    ani_method method {};
    ASSERT_EQ(env->Class_FindMethod(clsC, "func", nullptr, &method), ANI_OK);
    ASSERT_NE(method, nullptr);

    ani_class clsD {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ObjectOperationsMethodFloat.D", &clsD), ANI_OK);
    ASSERT_NE(clsD, nullptr);
    ani_method ctor {};
    ASSERT_EQ(env->Class_FindMethod(clsD, "<ctor>", ":", &ctor), ANI_OK);

    ASSERT_EQ(env->Object_New(clsD, ctor, &object), ANI_OK);
    ASSERT_NE(object, nullptr);

    ani_float result = 0U;
    ani_value args[2U] = {};
    ani_float arg1 = VAL1;
    ani_float arg2 = VAL;
    args[0U].f = arg1;
    args[1U].f = arg2;
    ASSERT_EQ(env->Object_CallMethod_Float(object, method, &result, arg1, arg2), ANI_OK);
    ASSERT_EQ(result, VAL3);

    ASSERT_EQ(env->Object_CallMethod_Float_A(object, method, &result, args), ANI_OK);
    ASSERT_EQ(result, VAL3);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Float_13([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_float VAL = 2.0F;
    constexpr ani_float VAL1 = 3.0F;
    constexpr ani_float VAL3 = 5.0F;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodFloat.E";
    paramObjOperation.methodName = "func";
    paramObjOperation.signature = nullptr;
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_float result = 0U;
    ani_value args[2U] = {};
    ani_float arg1 = VAL3;
    ani_float arg2 = VAL1;
    args[0U].f = arg1;
    args[1U].f = arg2;
    ASSERT_EQ(env->Object_CallMethod_Float(object, method, &result, arg1, arg2), ANI_OK);
    ASSERT_EQ(result, VAL);

    ASSERT_EQ(env->Object_CallMethod_Float_A(object, method, &result, args), ANI_OK);
    ASSERT_EQ(result, VAL);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Float_14([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_float VAL1 = 3.0F;
    constexpr ani_float VAL2 = 4.0F;
    constexpr ani_float VAL4 = 7.0F;
    constexpr ani_int LOOP_COUNT = 3U;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodFloat.A";
    paramObjOperation.methodName = "floatMethod";
    paramObjOperation.signature = "ff:f";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_float result = 0U;
    ani_value args[2U] = {};
    ani_float arg1 = VAL1;
    ani_float arg2 = VAL2;
    args[0U].f = arg1;
    args[1U].f = arg2;

    for (ani_int i = 0; i < LOOP_COUNT; i++) {
        ASSERT_EQ(env->Object_CallMethod_Float(object, method, &result, arg1, arg2), ANI_OK);
        ASSERT_EQ(result, VAL4);
        ASSERT_EQ(env->Object_CallMethod_Float_A(object, method, &result, args), ANI_OK);
        ASSERT_EQ(result, VAL4);
    }
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Float_15([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_float INIT_VALUE = 0.0F;
    constexpr ani_float VAL1 = 3.0F;
    constexpr ani_float VAL2 = 4.0F;
    constexpr ani_float VAL4 = 7.0F;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodFloat.A";
    paramObjOperation.methodName = "nestedMethod";
    paramObjOperation.signature = "ff:f";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_float result = INIT_VALUE;
    ani_value args[2U] = {};
    ani_float arg1 = VAL1;
    ani_float arg2 = VAL2;
    args[0U].f = arg1;
    args[1U].f = arg2;

    ASSERT_EQ(env->Object_CallMethod_Float(object, method, &result, arg1, arg2), ANI_OK);
    ASSERT_EQ(result, VAL4);

    ASSERT_EQ(env->Object_CallMethod_Float_A(object, method, &result, args), ANI_OK);
    ASSERT_EQ(result, VAL4);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Float_16([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_float INIT_VALUE = 0.0F;
    constexpr ani_float VAL1 = 3.0F;
    constexpr ani_float VAL5 = 103.0F;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodFloat.A";
    paramObjOperation.methodName = "recursionMethod";
    paramObjOperation.signature = "f:f";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_float result = INIT_VALUE;
    ani_value args[1U] = {};
    ani_float arg1 = VAL1;
    args[0U].f = arg1;
    ASSERT_EQ(env->Object_CallMethod_Float(object, method, &result, arg1), ANI_OK);
    ASSERT_EQ(result, VAL5);

    ASSERT_EQ(env->Object_CallMethod_Float_A(object, method, &result, args), ANI_OK);
    ASSERT_EQ(result, VAL5);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Int_01([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_int INIT_VALUE = 0U;
    constexpr ani_int VAL = 2U;
    constexpr ani_int VAL1 = 3U;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodInt.A";
    paramObjOperation.methodName = "intMethod";
    paramObjOperation.signature = "ii:i";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_value args[2U];
    ani_int arg1 = VAL;
    ani_int arg2 = VAL1;
    args[0U].i = arg1;
    args[1U].i = arg2;

    ani_int sum = INIT_VALUE;
    ASSERT_EQ(env->Object_CallMethod_Int_A(object, method, &sum, args), ANI_OK);
    ASSERT_EQ(sum, arg1 + arg2);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Int_02([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_int INIT_VALUE = 0U;
    constexpr ani_int VAL = 2U;
    constexpr ani_int VAL1 = 3U;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodInt.A";
    paramObjOperation.methodName = "intMethod";
    paramObjOperation.signature = "ii:i";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_int sum = INIT_VALUE;
    ani_int arg1 = VAL;
    ani_int arg2 = VAL1;
    ASSERT_EQ(env->Object_CallMethod_Int(object, method, &sum, arg1, arg2), ANI_OK);
    ASSERT_EQ(sum, arg1 + arg2);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Int_03([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_int INIT_VALUE = 0U;
    constexpr ani_int VAL = 2U;
    constexpr ani_int VAL1 = 3U;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodInt.A";
    paramObjOperation.methodName = "intMethod";
    paramObjOperation.signature = "ii:i";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_int sum = INIT_VALUE;
    ani_int arg1 = VAL;
    ani_int arg2 = VAL1;
    ASSERT_EQ(env->c_api->Object_CallMethod_Int(env, object, method, &sum, arg1, arg2), ANI_OK);
    ASSERT_EQ(sum, arg1 + arg2);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Int_04([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_int INIT_VALUE = 0U;
    constexpr ani_int VAL2 = 5U;
    constexpr ani_int VAL3 = 6U;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodInt.A";
    paramObjOperation.methodName = "intMethod";
    paramObjOperation.signature = "ii:i";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_int sum = INIT_VALUE;
    ani_int arg1 = VAL2;
    ani_int arg2 = VAL3;
    ASSERT_EQ(env->c_api->Object_CallMethod_Int(nullptr, object, method, &sum, arg1, arg2), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Int_05([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_int INIT_VALUE = 0U;
    constexpr ani_int VAL2 = 5U;
    constexpr ani_int VAL3 = 6U;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodInt.A";
    paramObjOperation.methodName = "intMethod";
    paramObjOperation.signature = "ii:i";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_int sum = INIT_VALUE;
    ani_int arg1 = VAL2;
    ani_int arg2 = VAL3;
    ASSERT_EQ(env->Object_CallMethod_Int(object, nullptr, &sum, arg1, arg2), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Int_06([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_int VAL2 = 5U;
    constexpr ani_int VAL3 = 6U;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodInt.A";
    paramObjOperation.methodName = "intMethod";
    paramObjOperation.signature = "ii:i";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_int arg1 = VAL2;
    ani_int arg2 = VAL3;
    ASSERT_EQ(env->Object_CallMethod_Int(object, method, nullptr, arg1, arg2), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Int_07([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_int INIT_VALUE = 0U;
    constexpr ani_int VAL2 = 5U;
    constexpr ani_int VAL3 = 6U;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodInt.A";
    paramObjOperation.methodName = "intMethod";
    paramObjOperation.signature = "ii:i";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_int sum = INIT_VALUE;
    ani_int arg1 = VAL2;
    ani_int arg2 = VAL3;
    ASSERT_EQ(env->Object_CallMethod_Int(nullptr, method, &sum, arg1, arg2), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Int_08([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_int INIT_VALUE = 0U;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodInt.A";
    paramObjOperation.methodName = "intMethod";
    paramObjOperation.signature = "ii:i";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_int sum = INIT_VALUE;
    ASSERT_EQ(env->Object_CallMethod_Int_A(object, method, &sum, nullptr), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Int_09([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_int INIT_VALUE = 0U;
    constexpr ani_int VAL2 = 5U;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodInt.A";
    paramObjOperation.methodName = "intMethodVoidParam";
    paramObjOperation.signature = ":i";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_int result = INIT_VALUE;
    ASSERT_EQ(env->Object_CallMethod_Int(object, method, &result), ANI_OK);
    ASSERT_EQ(result, VAL2);

    ani_value args[2U];
    ASSERT_EQ(env->Object_CallMethod_Int_A(object, method, &result, args), ANI_OK);
    ASSERT_EQ(result, VAL2);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Int_10([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodInt.A";
    paramObjOperation.methodName = "intMethodVoidParam";
    paramObjOperation.signature = ":i";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_value args[2U];
    ani_int arg1 = 2U;
    ani_int arg2 = 3U;
    args[0U].i = arg1;
    args[1U].i = arg2;

    ani_int sum;
    ASSERT_EQ(env->Object_CallMethod_Int_A(nullptr, method, &sum, args), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Int_11([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodInt.A";
    paramObjOperation.methodName = "intMethodVoidParam";
    paramObjOperation.signature = ":i";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_value args[2U];
    ani_int arg1 = 2U;
    ani_int arg2 = 3U;
    args[0U].i = arg1;
    args[1U].i = arg2;

    ani_int sum;
    ASSERT_EQ(env->Object_CallMethod_Int_A(object, nullptr, &sum, args), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Int_12([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodInt.A";
    paramObjOperation.methodName = "intMethodVoidParam";
    paramObjOperation.signature = ":i";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_value args[2U];
    ani_int arg1 = 2U;
    ani_int arg2 = 3U;
    args[0U].i = arg1;
    args[1U].i = arg2;

    ASSERT_EQ(env->Object_CallMethod_Int_A(object, method, nullptr, args), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Int_13([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_int INIT_VALUE = 0U;
    constexpr ani_int VAL = 2U;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodInt.A";
    paramObjOperation.methodName = "intMethodMultipleParam";
    paramObjOperation.signature = "izfsd:i";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_value args[5U] = {};
    ani_int arg1 = VAL;
    ani_boolean arg2 = ANI_TRUE;
    ani_float arg3 = 3.0F;
    ani_short arg4 = 4U;
    ani_double arg5 = 5.0F;
    args[0U].i = arg1;
    args[1U].z = arg2;
    args[2U].f = arg3;
    args[3U].s = arg4;
    args[4U].d = arg5;

    ani_int result = INIT_VALUE;
    ASSERT_EQ(env->Object_CallMethod_Int(object, method, &result, arg1, arg2, arg3, arg4, arg5), ANI_OK);
    ASSERT_EQ(result, arg1 + arg4);

    ASSERT_EQ(env->Object_CallMethod_Int_A(object, method, &result, args), ANI_OK);
    ASSERT_EQ(result, arg1 + arg4);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Int_14([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_int INIT_VALUE = 0U;
    constexpr ani_int VAL2 = 5U;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodInt.A";
    paramObjOperation.methodName = "intMethodVoidParam";
    paramObjOperation.signature = ":i";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_int result = INIT_VALUE;
    ASSERT_EQ(env->Object_CallMethod_Int(object, method, &result), ANI_OK);
    ASSERT_EQ(result, VAL2);

    ani_value args[2U];
    ASSERT_EQ(env->Object_CallMethod_Int_A(object, method, &result, args), ANI_OK);
    ASSERT_EQ(result, VAL2);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Int_15([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object1)
{
    constexpr ani_int VAL = 2U;
    constexpr ani_int VAL1 = 3U;
    constexpr ani_int VAL2 = 5U;
    ani_class clsC {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ObjectOperationsMethodInt.C", &clsC), ANI_OK);
    ASSERT_NE(clsC, nullptr);

    ani_method method {};
    ASSERT_EQ(env->Class_FindMethod(clsC, "func", nullptr, &method), ANI_OK);
    ASSERT_NE(method, nullptr);

    ani_class clsD {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ObjectOperationsMethodInt.D", &clsD), ANI_OK);
    ASSERT_NE(clsD, nullptr);
    ani_method ctor {};
    ASSERT_EQ(env->Class_FindMethod(clsD, "<ctor>", ":", &ctor), ANI_OK);

    ani_object object {};
    ASSERT_EQ(env->Object_New(clsD, ctor, &object), ANI_OK);
    ASSERT_NE(object, nullptr);

    ani_int result = 0U;
    ani_value args[2U] = {};
    ani_int arg1 = VAL;
    ani_int arg2 = VAL1;
    args[0U].i = arg1;
    args[1U].i = arg2;
    ASSERT_EQ(env->Object_CallMethod_Int(object, method, &result, arg1, arg2), ANI_OK);
    ASSERT_EQ(result, VAL2);

    ASSERT_EQ(env->Object_CallMethod_Int_A(object, method, &result, args), ANI_OK);
    ASSERT_EQ(result, VAL2);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Int_16([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_int VAL1 = 3U;
    constexpr ani_int VAL3 = 6U;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodInt.E";
    paramObjOperation.methodName = "func";
    paramObjOperation.signature = nullptr;
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_int result = 0U;
    ani_value args[2U] = {};
    ani_int arg1 = VAL3;
    ani_int arg2 = VAL1;
    args[0U].i = arg1;
    args[1U].i = arg2;
    ASSERT_EQ(env->Object_CallMethod_Int(object, method, &result, arg1, arg2), ANI_OK);
    ASSERT_EQ(result, VAL1);

    ASSERT_EQ(env->Object_CallMethod_Int_A(object, method, &result, args), ANI_OK);
    ASSERT_EQ(result, VAL1);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Int_17([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_int INIT_VALUE = 0U;
    constexpr ani_int VAL1 = 3U;
    constexpr ani_int VAL3 = 6U;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodInt.A";
    paramObjOperation.methodName = "intMethod";
    paramObjOperation.signature = "ii:i";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_int result = INIT_VALUE;
    ani_value args[2U] = {};
    ani_int arg1 = VAL1;
    ani_int arg2 = VAL1;
    args[0U].i = arg1;
    args[1U].i = arg2;

    for (ani_int i = 0; i < VAL1; i++) {
        ASSERT_EQ(env->Object_CallMethod_Int(object, method, &result, arg1, arg2), ANI_OK);
        ASSERT_EQ(result, VAL3);
        ASSERT_EQ(env->Object_CallMethod_Int_A(object, method, &result, args), ANI_OK);
        ASSERT_EQ(result, VAL3);
    }
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Int_18([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_int INIT_VALUE = 0U;
    constexpr ani_int VAL1 = 3U;
    constexpr ani_int VAL3 = 6U;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodInt.A";
    paramObjOperation.methodName = "nestedMethod";
    paramObjOperation.signature = "ii:i";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_int result = INIT_VALUE;
    ani_value args[2U] = {};
    ani_int arg1 = VAL1;
    ani_int arg2 = VAL1;
    args[0U].i = arg1;
    args[1U].i = arg2;

    ASSERT_EQ(env->Object_CallMethod_Int(object, method, &result, arg1, arg2), ANI_OK);
    ASSERT_EQ(result, VAL3);

    ASSERT_EQ(env->Object_CallMethod_Int_A(object, method, &result, args), ANI_OK);
    ASSERT_EQ(result, VAL3);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Int_19([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_int INIT_VALUE = 0U;
    constexpr ani_int VAL1 = 3U;
    constexpr ani_int VAL4 = 103U;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodInt.A";
    paramObjOperation.methodName = "recursionMethod";
    paramObjOperation.signature = "i:i";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_int result = INIT_VALUE;
    ani_value args[1U] = {};
    ani_int arg1 = VAL1;
    args[0U].i = arg1;
    ASSERT_EQ(env->Object_CallMethod_Int(object, method, &result, arg1), ANI_OK);
    ASSERT_EQ(result, VAL4);

    ASSERT_EQ(env->Object_CallMethod_Int_A(object, method, &result, args), ANI_OK);
    ASSERT_EQ(result, VAL4);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Long_01([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_long INIT_VALUE = 0U;
    constexpr ani_long VAL = 2U;
    constexpr ani_long VAL1 = 3U;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodLong.A";
    paramObjOperation.methodName = "longMethod";
    paramObjOperation.signature = "ll:l";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_value args[2U];
    ani_long arg1 = VAL;
    ani_long arg2 = VAL1;
    args[0U].l = arg1;
    args[1U].l = arg2;

    ani_long sum = INIT_VALUE;
    ASSERT_EQ(env->Object_CallMethod_Long_A(object, method, &sum, args), ANI_OK);
    ASSERT_EQ(sum, arg1 + arg2);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Long_02([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_long INIT_VALUE = 0U;
    constexpr ani_long VAL = 2U;
    constexpr ani_long VAL1 = 3U;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodLong.A";
    paramObjOperation.methodName = "longMethod";
    paramObjOperation.signature = "ll:l";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_long sum = INIT_VALUE;
    ani_long arg1 = VAL;
    ani_long arg2 = VAL1;
    ASSERT_EQ(env->Object_CallMethod_Long(object, method, &sum, arg1, arg2), ANI_OK);
    ASSERT_EQ(sum, arg1 + arg2);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Long_03([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_long INIT_VALUE = 0U;
    constexpr ani_long VAL2 = 5U;
    constexpr ani_long VAL3 = 6U;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodLong.A";
    paramObjOperation.methodName = "longMethod";
    paramObjOperation.signature = "ll:l";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_long sum = INIT_VALUE;
    ani_long arg1 = VAL2;
    ani_long arg2 = VAL3;
    ASSERT_EQ(env->c_api->Object_CallMethod_Long(nullptr, object, method, &sum, arg1, arg2), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Long_04([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_long INIT_VALUE = 0U;
    constexpr ani_long VAL2 = 5U;
    constexpr ani_long VAL3 = 6U;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodLong.A";
    paramObjOperation.methodName = "longMethod";
    paramObjOperation.signature = "ll:l";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_long sum = INIT_VALUE;
    ani_long arg1 = VAL2;
    ani_long arg2 = VAL3;
    ASSERT_EQ(env->Object_CallMethod_Long(object, nullptr, &sum, arg1, arg2), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Long_05([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_long VAL2 = 5U;
    constexpr ani_long VAL3 = 6U;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodLong.A";
    paramObjOperation.methodName = "longMethod";
    paramObjOperation.signature = "ll:l";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_long arg1 = VAL2;
    ani_long arg2 = VAL3;
    ASSERT_EQ(env->Object_CallMethod_Long(object, method, nullptr, arg1, arg2), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Long_06([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_long INIT_VALUE = 0U;
    constexpr ani_long VAL2 = 5U;
    constexpr ani_long VAL3 = 6U;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodLong.A";
    paramObjOperation.methodName = "longMethod";
    paramObjOperation.signature = "ll:l";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_long sum = INIT_VALUE;
    ani_long arg1 = VAL2;
    ani_long arg2 = VAL3;
    ASSERT_EQ(env->Object_CallMethod_Long(nullptr, method, &sum, arg1, arg2), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Long_07([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_long INIT_VALUE = 0U;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodLong.A";
    paramObjOperation.methodName = "longMethod";
    paramObjOperation.signature = "ll:l";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_long sum = INIT_VALUE;
    ASSERT_EQ(env->Object_CallMethod_Long_A(object, method, &sum, nullptr), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Long_08([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_long INIT_VALUE = 0U;
    constexpr ani_long VAL2 = 5U;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodLong.A";
    paramObjOperation.methodName = "longMethodVoidParam";
    paramObjOperation.signature = ":l";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_long result = INIT_VALUE;
    ASSERT_EQ(env->Object_CallMethod_Long(object, method, &result), ANI_OK);
    ASSERT_EQ(result, VAL2);

    ani_value args[2U];
    ASSERT_EQ(env->Object_CallMethod_Long_A(object, method, &result, args), ANI_OK);
    ASSERT_EQ(result, VAL2);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Long_09([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_long INIT_VALUE = 0U;
    constexpr ani_long VAL = 2U;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodLong.A";
    paramObjOperation.methodName = "longMethodMultipleParam";
    paramObjOperation.signature = "lzflf:l";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_value args[5U] = {};
    ani_long arg1 = VAL;
    ani_boolean arg2 = ANI_TRUE;
    ani_float arg3 = 3.0F;
    ani_long arg4 = 4U;
    ani_float arg5 = 5.0F;
    args[0U].i = arg1;
    args[1U].z = arg2;
    args[2U].f = arg3;
    args[3U].s = arg4;
    args[4U].d = arg5;

    ani_long result = INIT_VALUE;
    ASSERT_EQ(env->Object_CallMethod_Long(object, method, &result, arg1, arg2, arg3, arg4, arg5), ANI_OK);
    ASSERT_EQ(result, arg1 + arg4);

    ASSERT_EQ(env->Object_CallMethod_Long_A(object, method, &result, args), ANI_OK);
    ASSERT_EQ(result, arg1 + arg4);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Long_10([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_long INIT_VALUE = 0U;
    constexpr ani_long VAL2 = 5U;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodLong.B";
    paramObjOperation.methodName = "longMethodVoidParam";
    paramObjOperation.signature = ":l";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_long result = INIT_VALUE;
    ASSERT_EQ(env->Object_CallMethod_Long(object, method, &result), ANI_OK);
    ASSERT_EQ(result, VAL2);

    ani_value args[2U];
    ASSERT_EQ(env->Object_CallMethod_Long_A(object, method, &result, args), ANI_OK);
    ASSERT_EQ(result, VAL2);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Long_11([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object1)
{
    constexpr ani_long VAL = 2U;
    constexpr ani_long VAL1 = 3U;
    constexpr ani_long VAL2 = 5U;
    ani_class clsC {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ObjectOperationsMethodLong.C", &clsC), ANI_OK);
    ASSERT_NE(clsC, nullptr);

    ani_method method {};
    ASSERT_EQ(env->Class_FindMethod(clsC, "func", nullptr, &method), ANI_OK);
    ASSERT_NE(method, nullptr);

    ani_class clsD {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ObjectOperationsMethodLong.D", &clsD), ANI_OK);
    ASSERT_NE(clsD, nullptr);
    ani_method ctor {};
    ASSERT_EQ(env->Class_FindMethod(clsD, "<ctor>", ":", &ctor), ANI_OK);

    ani_object object {};
    ASSERT_EQ(env->Object_New(clsD, ctor, &object), ANI_OK);
    ASSERT_NE(object, nullptr);

    ani_long result = 0U;
    ani_value args[2U] = {};
    ani_long arg1 = VAL;
    ani_long arg2 = VAL1;
    args[0U].l = arg1;
    args[1U].l = arg2;
    ASSERT_EQ(env->Object_CallMethod_Long(object, method, &result, arg1, arg2), ANI_OK);
    ASSERT_EQ(result, VAL2);

    ASSERT_EQ(env->Object_CallMethod_Long_A(object, method, &result, args), ANI_OK);
    ASSERT_EQ(result, VAL2);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Long_12([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_long VAL1 = 3U;
    constexpr ani_long VAL3 = 6U;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodLong.E";
    paramObjOperation.methodName = "func";
    paramObjOperation.signature = nullptr;
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_long result = 0U;
    ani_value args[2U] = {};
    ani_long arg1 = VAL3;
    ani_long arg2 = VAL1;
    args[0U].l = arg1;
    args[1U].l = arg2;
    ASSERT_EQ(env->Object_CallMethod_Long(object, method, &result, arg1, arg2), ANI_OK);
    ASSERT_EQ(result, VAL1);

    ASSERT_EQ(env->Object_CallMethod_Long_A(object, method, &result, args), ANI_OK);
    ASSERT_EQ(result, VAL1);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Long_13([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_long INIT_VALUE = 0U;
    constexpr ani_long VAL1 = 3U;
    constexpr ani_long VAL3 = 6U;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodLong.A";
    paramObjOperation.methodName = "longMethod";
    paramObjOperation.signature = "ll:l";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_long result = INIT_VALUE;
    ani_value args[2U] = {};
    ani_long arg1 = VAL1;
    ani_long arg2 = VAL1;
    args[0U].l = arg1;
    args[1U].l = arg2;

    for (ani_long i = 0; i < VAL1; i++) {
        ASSERT_EQ(env->Object_CallMethod_Long(object, method, &result, arg1, arg2), ANI_OK);
        ASSERT_EQ(result, VAL3);
        ASSERT_EQ(env->Object_CallMethod_Long_A(object, method, &result, args), ANI_OK);
        ASSERT_EQ(result, VAL3);
    }
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Long_14([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_long INIT_VALUE = 0U;
    constexpr ani_long VAL1 = 3U;
    constexpr ani_long VAL3 = 6U;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodLong.A";
    paramObjOperation.methodName = "nestedMethod";
    paramObjOperation.signature = "ll:l";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_long result = INIT_VALUE;
    ani_value args[2U] = {};
    ani_long arg1 = VAL1;
    ani_long arg2 = VAL1;
    args[0U].l = arg1;
    args[1U].l = arg2;

    ASSERT_EQ(env->Object_CallMethod_Long(object, method, &result, arg1, arg2), ANI_OK);
    ASSERT_EQ(result, VAL3);

    ASSERT_EQ(env->Object_CallMethod_Long_A(object, method, &result, args), ANI_OK);
    ASSERT_EQ(result, VAL3);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Long_15([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_long INIT_VALUE = 0U;
    constexpr ani_long VAL1 = 3U;
    constexpr ani_long VAL4 = 103U;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodLong.A";
    paramObjOperation.methodName = "recursionMethod";
    paramObjOperation.signature = "l:l";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_long result = INIT_VALUE;
    ani_value args[1U] = {};
    ani_long arg1 = VAL1;
    args[0U].l = arg1;
    ASSERT_EQ(env->Object_CallMethod_Long(object, method, &result, arg1), ANI_OK);
    ASSERT_EQ(result, VAL4);

    ASSERT_EQ(env->Object_CallMethod_Long_A(object, method, &result, args), ANI_OK);
    ASSERT_EQ(result, VAL4);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Short_01([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_short INIT_VALUE = 0U;
    constexpr ani_short VAL = 2U;
    constexpr ani_short VAL1 = 3U;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodShort.A";
    paramObjOperation.methodName = "shortMethod";
    paramObjOperation.signature = "ss:s";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_value args[2U];
    ani_short arg1 = VAL;
    ani_short arg2 = VAL1;
    args[0U].s = arg1;
    args[1U].s = arg2;

    ani_short sum = INIT_VALUE;
    ASSERT_EQ(env->Object_CallMethod_Short_A(object, method, &sum, args), ANI_OK);
    ASSERT_EQ(sum, arg2);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Short_02([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_short INIT_VALUE = 0U;
    constexpr ani_short VAL = 2U;
    constexpr ani_short VAL1 = 3U;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodShort.A";
    paramObjOperation.methodName = "shortMethod";
    paramObjOperation.signature = "ss:s";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_short sum = INIT_VALUE;
    ani_short arg1 = VAL;
    ani_short arg2 = VAL1;
    ASSERT_EQ(env->Object_CallMethod_Short(object, method, &sum, arg1, arg2), ANI_OK);
    ASSERT_EQ(sum, arg2);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Short_03([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_short INIT_VALUE = 0U;
    constexpr ani_short VAL1 = 3U;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodShort.A";
    paramObjOperation.methodName = "shortMethod";
    paramObjOperation.signature = "ss:s";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_short sum = INIT_VALUE;
    ani_short arg1 = 4U;
    ani_short arg2 = VAL1;
    ASSERT_EQ(env->c_api->Object_CallMethod_Short(env, object, method, &sum, arg1, arg2), ANI_OK);
    ASSERT_EQ(sum, arg1);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Short_04([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_short INIT_VALUE = 0U;
    constexpr ani_short VAL2 = 5U;
    constexpr ani_short VAL3 = 6U;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodShort.A";
    paramObjOperation.methodName = "shortMethod";
    paramObjOperation.signature = "ss:s";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_short sum = INIT_VALUE;
    ani_short arg1 = VAL2;
    ani_short arg2 = VAL3;
    ASSERT_EQ(env->c_api->Object_CallMethod_Short(nullptr, object, method, &sum, arg1, arg2), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Short_05([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_short INIT_VALUE = 0U;
    constexpr ani_short VAL2 = 5U;
    constexpr ani_short VAL3 = 6U;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodShort.A";
    paramObjOperation.methodName = "shortMethod";
    paramObjOperation.signature = "ss:s";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_short sum = INIT_VALUE;
    ani_short arg1 = VAL2;
    ani_short arg2 = VAL3;
    ASSERT_EQ(env->Object_CallMethod_Short(object, nullptr, &sum, arg1, arg2), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Short_06([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_short VAL2 = 5U;
    constexpr ani_short VAL3 = 6U;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodShort.A";
    paramObjOperation.methodName = "shortMethod";
    paramObjOperation.signature = "ss:s";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_short arg1 = VAL2;
    ani_short arg2 = VAL3;
    ASSERT_EQ(env->Object_CallMethod_Short(object, method, nullptr, arg1, arg2), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Short_07([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_short INIT_VALUE = 0U;
    constexpr ani_short VAL2 = 5U;
    constexpr ani_short VAL3 = 6U;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodShort.A";
    paramObjOperation.methodName = "shortMethod";
    paramObjOperation.signature = "ss:s";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_short sum = INIT_VALUE;
    ani_short arg1 = VAL2;
    ani_short arg2 = VAL3;
    ASSERT_EQ(env->Object_CallMethod_Short(nullptr, method, &sum, arg1, arg2), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Short_08([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_short INIT_VALUE = 0U;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodShort.A";
    paramObjOperation.methodName = "shortMethod";
    paramObjOperation.signature = "ss:s";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_short sum = INIT_VALUE;
    ASSERT_EQ(env->Object_CallMethod_Short_A(object, method, &sum, nullptr), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Short_09([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_short INIT_VALUE = 0U;
    constexpr ani_short VAL2 = 5U;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodShort.A";
    paramObjOperation.methodName = "shortMethodVoidParam";
    paramObjOperation.signature = ":s";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_short result = INIT_VALUE;
    ASSERT_EQ(env->Object_CallMethod_Short(object, method, &result), ANI_OK);
    ASSERT_EQ(result, VAL2);

    ani_value args[2U];
    ASSERT_EQ(env->Object_CallMethod_Short_A(object, method, &result, args), ANI_OK);
    ASSERT_EQ(result, VAL2);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Short_10([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_short INIT_VALUE = 0U;
    constexpr ani_short VAL = 2U;
    constexpr ani_short VAL2 = 5U;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodShort.A";
    paramObjOperation.methodName = "shortMethodMultipleParam";
    paramObjOperation.signature = "izfss:s";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_value args[5U] = {};
    ani_int arg1 = VAL;
    ani_boolean arg2 = ANI_TRUE;
    ani_float arg3 = 3.0F;
    ani_short arg4 = 4U;
    ani_short arg5 = VAL2;
    args[0U].i = arg1;
    args[1U].z = arg2;
    args[2U].f = arg3;
    args[3U].s = arg4;
    args[4U].s = arg5;

    ani_short result = INIT_VALUE;
    ASSERT_EQ(env->Object_CallMethod_Short(object, method, &result, arg1, arg2, arg3, arg4, arg5), ANI_OK);
    ASSERT_EQ(result, arg4 + arg5);

    ASSERT_EQ(env->Object_CallMethod_Short_A(object, method, &result, args), ANI_OK);
    ASSERT_EQ(result, arg4 + arg5);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Short_11([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_short INIT_VALUE = 0U;
    constexpr ani_short VAL2 = 5U;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodShort.B";
    paramObjOperation.methodName = "shortMethodVoidParam";
    paramObjOperation.signature = ":s";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_short result = INIT_VALUE;
    ASSERT_EQ(env->Object_CallMethod_Short(object, method, &result), ANI_OK);
    ASSERT_EQ(result, VAL2);

    ani_value args[2U];
    ASSERT_EQ(env->Object_CallMethod_Short_A(object, method, &result, args), ANI_OK);
    ASSERT_EQ(result, VAL2);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Short_12([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object1)
{
    constexpr ani_short VAL = 2U;
    constexpr ani_short VAL1 = 3U;
    constexpr ani_short VAL2 = 5U;
    ani_class clsC {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ObjectOperationsMethodShort.C", &clsC), ANI_OK);
    ASSERT_NE(clsC, nullptr);

    ani_method method {};
    ASSERT_EQ(env->Class_FindMethod(clsC, "func", nullptr, &method), ANI_OK);
    ASSERT_NE(method, nullptr);

    ani_class clsD {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ObjectOperationsMethodShort.D", &clsD), ANI_OK);
    ASSERT_NE(clsD, nullptr);
    ani_method ctor {};
    ASSERT_EQ(env->Class_FindMethod(clsD, "<ctor>", ":", &ctor), ANI_OK);

    ani_object object {};
    ASSERT_EQ(env->Object_New(clsD, ctor, &object), ANI_OK);
    ASSERT_NE(object, nullptr);

    ani_short result = 0U;
    ani_value args[2U] = {};
    ani_short arg1 = VAL;
    ani_short arg2 = VAL1;
    args[0U].s = arg1;
    args[1U].s = arg2;
    ASSERT_EQ(env->Object_CallMethod_Short(object, method, &result, arg1, arg2), ANI_OK);
    ASSERT_EQ(result, VAL2);

    ASSERT_EQ(env->Object_CallMethod_Short_A(object, method, &result, args), ANI_OK);
    ASSERT_EQ(result, VAL2);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Short_13([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_short VAL1 = 3U;
    constexpr ani_short VAL3 = 6U;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodShort.E";
    paramObjOperation.methodName = "func";
    paramObjOperation.signature = nullptr;
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_short result = 0U;
    ani_value args[2U] = {};
    ani_short arg1 = VAL3;
    ani_short arg2 = VAL1;
    args[0U].s = arg1;
    args[1U].s = arg2;
    ASSERT_EQ(env->Object_CallMethod_Short(object, method, &result, arg1, arg2), ANI_OK);
    ASSERT_EQ(result, VAL1);

    ASSERT_EQ(env->Object_CallMethod_Short_A(object, method, &result, args), ANI_OK);
    ASSERT_EQ(result, VAL1);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Short_14([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_short INIT_VALUE = 0U;
    constexpr ani_short VAL1 = 3U;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodShort.A";
    paramObjOperation.methodName = "shortMethod";
    paramObjOperation.signature = "ss:s";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_short result = INIT_VALUE;
    ani_value args[2U] = {};
    ani_short arg1 = VAL1;
    ani_short arg2 = 4U;
    args[0U].s = arg1;
    args[1U].s = arg2;

    for (ani_short i = 0; i < VAL1; i++) {
        ASSERT_EQ(env->Object_CallMethod_Short(object, method, &result, arg1, arg2), ANI_OK);
        ASSERT_EQ(result, 4U);
        ASSERT_EQ(env->Object_CallMethod_Short_A(object, method, &result, args), ANI_OK);
        ASSERT_EQ(result, 4U);
    }
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Short_15([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_short INIT_VALUE = 0U;
    constexpr ani_short VAL1 = 3U;
    constexpr ani_short VAL3 = 6U;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodShort.A";
    paramObjOperation.methodName = "nestedMethod";
    paramObjOperation.signature = "ss:s";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_short result = INIT_VALUE;
    ani_value args[2U] = {};
    ani_short arg1 = VAL1;
    ani_short arg2 = VAL1;
    args[0U].i = arg1;
    args[1U].i = arg2;

    ASSERT_EQ(env->Object_CallMethod_Short(object, method, &result, arg1, arg2), ANI_OK);
    ASSERT_EQ(result, VAL3);

    ASSERT_EQ(env->Object_CallMethod_Short_A(object, method, &result, args), ANI_OK);
    ASSERT_EQ(result, VAL3);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Short_16([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_short INIT_VALUE = 0U;
    constexpr ani_short VAL1 = 3U;
    constexpr ani_short VAL4 = 103U;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodShort.A";
    paramObjOperation.methodName = "recursionMethod";
    paramObjOperation.signature = "s:s";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_short result = INIT_VALUE;
    ani_value args[1U] = {};
    ani_short arg1 = VAL1;
    args[0U].i = arg1;
    ASSERT_EQ(env->Object_CallMethod_Short(object, method, &result, arg1), ANI_OK);
    ASSERT_EQ(result, VAL4);

    ASSERT_EQ(env->Object_CallMethod_Short_A(object, method, &result, args), ANI_OK);
    ASSERT_EQ(result, VAL4);
    return ANI_TRUE;
}

ani_int GetValueMethod(ani_env *env, ani_method *checkMethod)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ObjectOperationsMethodVoid.A", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ASSERT_EQ(env->Class_FindMethod(cls, "getCount", ":i", checkMethod), ANI_OK);
    ASSERT_NE(checkMethod, nullptr);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Void_01([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_int INIT_VALUE = 0U;
    constexpr ani_int VAL = 2U;
    constexpr ani_int VAL1 = 3U;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodVoid.A";
    paramObjOperation.methodName = "voidMethod";
    paramObjOperation.signature = "ii:";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);
    ani_method getMethod {};
    GetValueMethod(env, &getMethod);

    ani_value args[2];
    ani_int arg1 = VAL;
    ani_int arg2 = VAL1;
    args[0].i = arg1;
    args[1].i = arg2;
    ani_int sum = INIT_VALUE;
    ASSERT_EQ(env->Object_CallMethod_Void_A(object, method, args), ANI_OK);
    ASSERT_EQ(env->Object_CallMethod_Int(object, getMethod, &sum), ANI_OK);
    ASSERT_EQ(sum, args[0].i + args[1].i);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Void_02([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_int INIT_VALUE = 0U;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodVoid.A";
    paramObjOperation.methodName = "voidMethod";
    paramObjOperation.signature = "ii:";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);
    ani_method getMethod {};
    GetValueMethod(env, &getMethod);

    ani_int a = 4;
    ani_int b = 5;
    ani_int sum = INIT_VALUE;
    ASSERT_EQ(env->Object_CallMethod_Void(object, method, a, b), ANI_OK);
    ASSERT_EQ(env->Object_CallMethod_Int(object, getMethod, &sum), ANI_OK);
    ASSERT_EQ(sum, a + b);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Void_03([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_int INIT_VALUE = 0U;
    constexpr ani_int VAL3 = 6U;
    constexpr ani_int VAL6 = 7U;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodVoid.A";
    paramObjOperation.methodName = "voidMethod";
    paramObjOperation.signature = "ii:";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);
    ani_method getMethod {};
    GetValueMethod(env, &getMethod);

    ani_int a = VAL3;
    ani_int b = VAL6;
    ani_int sum = INIT_VALUE;
    ASSERT_EQ(env->c_api->Object_CallMethod_Void(env, object, method, a, b), ANI_OK);
    ASSERT_EQ(env->Object_CallMethod_Int(object, getMethod, &sum), ANI_OK);
    ASSERT_EQ(sum, a + b);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Void_04([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_int VAL3 = 6U;
    constexpr ani_int VAL6 = 7U;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodVoid.A";
    paramObjOperation.methodName = "voidMethod";
    paramObjOperation.signature = "ii:";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_int a = VAL3;
    ani_int b = VAL6;
    ASSERT_EQ(env->c_api->Object_CallMethod_Void(nullptr, object, method, a, b), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Void_05([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_int VAL3 = 6U;
    constexpr ani_int VAL6 = 7U;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodVoid.A";
    paramObjOperation.methodName = "voidMethod";
    paramObjOperation.signature = "ii:";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_int a = VAL3;
    ani_int b = VAL6;
    ASSERT_EQ(env->Object_CallMethod_Void(object, nullptr, a, b), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Void_06([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_int VAL3 = 6U;
    constexpr ani_int VAL6 = 7U;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodVoid.A";
    paramObjOperation.methodName = "voidMethod";
    paramObjOperation.signature = "ii:";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_int a = VAL3;
    ani_int b = VAL6;
    ASSERT_EQ(env->Object_CallMethod_Void(nullptr, method, a, b), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Void_07([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_int VAL = 2U;
    constexpr ani_int VAL1 = 3U;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodVoid.A";
    paramObjOperation.methodName = "voidMethod";
    paramObjOperation.signature = "ii:";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_value args[2];
    ani_int arg1 = VAL;
    ani_int arg2 = VAL1;
    args[0].i = arg1;
    args[1].i = arg2;
    ASSERT_EQ(env->Object_CallMethod_Void_A(object, nullptr, args), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Void_08([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_int VAL = 2U;
    constexpr ani_int VAL1 = 3U;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodVoid.A";
    paramObjOperation.methodName = "voidMethod";
    paramObjOperation.signature = "ii:";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_value args[2];
    ani_int arg1 = VAL;
    ani_int arg2 = VAL1;
    args[0].i = arg1;
    args[1].i = arg2;
    ASSERT_EQ(env->Object_CallMethod_Void_A(nullptr, method, args), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Void_09([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodVoid.A";
    paramObjOperation.methodName = "voidMethod";
    paramObjOperation.signature = "ii:";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ASSERT_EQ(env->Object_CallMethod_Void_A(object, method, nullptr), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Void_10([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodVoid.A";
    paramObjOperation.methodName = "voidMethod";
    paramObjOperation.signature = "ii:";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);
    ani_int arg1 = 2;
    ani_int arg2 = 3;

    ASSERT_EQ(env->c_api->Object_CallMethod_Void(nullptr, object, method, arg1, arg2), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Void_11([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_int VAL4 = 10U;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodVoid.A";
    paramObjOperation.methodName = "voidMethodVoidParam";
    paramObjOperation.signature = ":";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);
    ani_method checkMethod {};
    GetValueMethod(env, &checkMethod);

    ani_int result {};
    ASSERT_EQ(env->Object_CallMethod_Void(object, method), ANI_OK);
    ASSERT_EQ(env->Object_CallMethod_Int(object, checkMethod, &result), ANI_OK);
    ASSERT_EQ(result, VAL4);

    ani_value args[2U];
    ASSERT_EQ(env->Object_CallMethod_Void_A(object, method, args), ANI_OK);
    ASSERT_EQ(env->Object_CallMethod_Int(object, checkMethod, &result), ANI_OK);
    ASSERT_EQ(result, VAL4);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Void_12([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_int VAL = 2U;
    constexpr ani_int VAL3 = 6U;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodVoid.A";
    paramObjOperation.methodName = "voidMethodMultipleParam";
    paramObjOperation.signature = "izfif:";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    const ani_int arg1 = VAL;
    const ani_boolean arg2 = ANI_TRUE;
    const ani_float arg3 = 3.0F;
    const ani_int arg4 = 4U;
    const ani_float arg5 = 5.0F;
    ani_int result = 0;
    ani_method checkMethod {};
    GetValueMethod(env, &checkMethod);
    ASSERT_EQ(env->Object_CallMethod_Void(object, method, arg1, arg2, arg3, arg4, arg5), ANI_OK);
    ASSERT_EQ(env->Object_CallMethod_Int(object, checkMethod, &result), ANI_OK);
    ASSERT_EQ(result, VAL3);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Void_13([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_int VAL4 = 10U;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodVoid.B";
    paramObjOperation.methodName = "voidMethodVoidParam";
    paramObjOperation.signature = ":";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_int result = 0;
    ani_method checkMethod {};
    GetValueMethod(env, &checkMethod);
    ASSERT_EQ(env->Object_CallMethod_Void(object, method), ANI_OK);
    ASSERT_EQ(env->Object_CallMethod_Int(object, checkMethod, &result), ANI_OK);
    ASSERT_EQ(result, VAL4);

    ani_value args[2U];
    ASSERT_EQ(env->Object_CallMethod_Void_A(object, method, args), ANI_OK);
    ASSERT_EQ(env->Object_CallMethod_Int(object, checkMethod, &result), ANI_OK);
    ASSERT_EQ(result, VAL4);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Void_14([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object1)
{
    constexpr ani_int VAL = 2U;
    constexpr ani_int VAL1 = 3U;
    constexpr ani_int VAL2 = 5U;
    ani_class clsC {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ObjectOperationsMethodVoid.C", &clsC), ANI_OK);
    ASSERT_NE(clsC, nullptr);

    ani_method method {};
    ASSERT_EQ(env->Class_FindMethod(clsC, "func", nullptr, &method), ANI_OK);
    ASSERT_NE(method, nullptr);

    ani_class clsD {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ObjectOperationsMethodVoid.D", &clsD), ANI_OK);
    ASSERT_NE(clsD, nullptr);
    ani_method ctor {};
    ASSERT_EQ(env->Class_FindMethod(clsD, "<ctor>", ":", &ctor), ANI_OK);

    ani_object object {};
    ASSERT_EQ(env->Object_New(clsD, ctor, &object), ANI_OK);
    ASSERT_NE(object, nullptr);

    ani_value args[2U] = {};
    ani_int arg1 = VAL;
    ani_int arg2 = VAL1;
    args[0U].i = arg1;
    args[1U].i = arg2;

    ani_int result = 0;
    ani_method checkMethod {};
    ASSERT_EQ(env->Class_FindMethod(clsD, "getCount", ":i", &checkMethod), ANI_OK);
    ASSERT_NE(checkMethod, nullptr);

    ASSERT_EQ(env->Object_CallMethod_Void(object, method, arg1, arg2), ANI_OK);
    ASSERT_EQ(env->Object_CallMethod_Int(object, checkMethod, &result), ANI_OK);
    ASSERT_EQ(result, VAL2);

    ASSERT_EQ(env->Object_CallMethod_Void_A(object, method, args), ANI_OK);
    ASSERT_EQ(env->Object_CallMethod_Int(object, checkMethod, &result), ANI_OK);
    ASSERT_EQ(result, VAL2);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Void_15([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_int VAL1 = 3U;
    constexpr ani_int VAL3 = 6U;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodVoid.E";
    paramObjOperation.methodName = "func";
    paramObjOperation.signature = nullptr;
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_int result = 0;
    ani_value args[2U] = {};
    ani_int arg1 = VAL3;
    ani_int arg2 = VAL1;
    args[0U].i = arg1;
    args[1U].i = arg2;

    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ObjectOperationsMethodVoid.E", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);
    ani_method checkMethod {};
    ASSERT_EQ(env->Class_FindMethod(cls, "getCount", ":i", &checkMethod), ANI_OK);
    ASSERT_NE(checkMethod, nullptr);

    ASSERT_EQ(env->Object_CallMethod_Void(object, method, arg1, arg2), ANI_OK);
    ASSERT_EQ(env->Object_CallMethod_Int(object, checkMethod, &result), ANI_OK);
    ASSERT_EQ(result, VAL1);

    ASSERT_EQ(env->Object_CallMethod_Void_A(object, method, args), ANI_OK);
    ASSERT_EQ(env->Object_CallMethod_Int(object, checkMethod, &result), ANI_OK);
    ASSERT_EQ(result, VAL1);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Void_16([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_int VAL1 = 3U;
    constexpr ani_int VAL3 = 6U;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodVoid.A";
    paramObjOperation.methodName = "voidMethod";
    paramObjOperation.signature = "ii:";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_value args[2U] = {};
    ani_int arg1 = VAL1;
    ani_int arg2 = VAL1;
    args[0U].i = arg1;
    args[1U].i = arg2;

    ani_int result = 0;
    ani_method checkMethod {};
    GetValueMethod(env, &checkMethod);

    for (ani_int i = 0; i < VAL1; i++) {
        ASSERT_EQ(env->Object_CallMethod_Void(object, method, arg1, arg2), ANI_OK);
        ASSERT_EQ(env->Object_CallMethod_Int(object, checkMethod, &result), ANI_OK);
        ASSERT_EQ(result, VAL3);
        ASSERT_EQ(env->Object_CallMethod_Void_A(object, method, args), ANI_OK);
        ASSERT_EQ(env->Object_CallMethod_Int(object, checkMethod, &result), ANI_OK);
        ASSERT_EQ(result, VAL3);
    }
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Void_17([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_int VAL1 = 3U;
    constexpr ani_int VAL3 = 6U;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodVoid.A";
    paramObjOperation.methodName = "nestedMethod";
    paramObjOperation.signature = "ii:";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_value args[2U] = {};
    ani_int arg1 = VAL1;
    ani_int arg2 = VAL1;
    args[0U].i = arg1;
    args[1U].i = arg2;

    ani_int result = 0;
    ani_method checkMethod {};
    GetValueMethod(env, &checkMethod);
    ASSERT_EQ(env->Object_CallMethod_Void(object, method, arg1, arg2), ANI_OK);
    ASSERT_EQ(env->Object_CallMethod_Int(object, checkMethod, &result), ANI_OK);
    ASSERT_EQ(result, VAL3);

    ASSERT_EQ(env->Object_CallMethod_Void_A(object, method, args), ANI_OK);
    ASSERT_EQ(env->Object_CallMethod_Int(object, checkMethod, &result), ANI_OK);
    ASSERT_EQ(result, VAL3);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Void_18([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_int VAL1 = 3U;
    constexpr ani_int VAL5 = 103U;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodVoid.A";
    paramObjOperation.methodName = "recursionMethod";
    paramObjOperation.signature = "i:";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_value args[1U] = {};
    ani_int arg1 = VAL1;
    args[0U].i = arg1;

    ani_int result = 0;
    ani_method checkMethod {};
    GetValueMethod(env, &checkMethod);
    ASSERT_EQ(env->Object_CallMethod_Void(object, method, arg1), ANI_OK);
    ASSERT_EQ(env->Object_CallMethod_Int(object, checkMethod, &result), ANI_OK);
    ASSERT_EQ(result, VAL5);

    ASSERT_EQ(env->Object_CallMethod_Void_A(object, method, args), ANI_OK);
    ASSERT_EQ(env->Object_CallMethod_Int(object, checkMethod, &result), ANI_OK);
    ASSERT_EQ(result, VAL5);
    return ANI_TRUE;
}

ani_int GetMethodData(ani_env *env, ani_object *objectResult)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ObjectOperationsMethodByNameBoolean.A", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_static_method newMethod {};
    ASSERT_EQ(
        env->Class_FindStaticMethod(cls, "new_A",
            ":C{entry.src.main.src.ets.ObjectOperationsMethodByNameBoolean.A}", &newMethod),
        ANI_OK);
    ani_ref ref {};
    ASSERT_EQ(env->Class_CallStaticMethod_Ref(cls, newMethod, &ref), ANI_OK);
    *objectResult = static_cast<ani_object>(ref);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Boolean_By_Name_01([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object1)
{
    constexpr ani_int VAL1 = 5;
    constexpr ani_int VAL2 = 6;
    ani_object object {};
    GetMethodData(env, &object);

    ani_value args[2U];
    args[0U].i = VAL1;
    args[1U].i = VAL2;

    ani_boolean res = ANI_FALSE;
    ASSERT_EQ(env->Object_CallMethodByName_Boolean_A(object, "booleanByNameMethod", "ii:z", &res, args), ANI_OK);
    ASSERT_EQ(res, ANI_TRUE);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Boolean_By_Name_02([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object1)
{
    constexpr ani_int VAL1 = 5;
    constexpr ani_int VAL2 = 6;
    ani_object object {};
    GetMethodData(env, &object);

    ani_boolean res = ANI_FALSE;
    ASSERT_EQ(env->Object_CallMethodByName_Boolean(object, "booleanByNameMethod", "ii:z", &res, VAL1, VAL2), ANI_OK);
    ASSERT_EQ(res, ANI_TRUE);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Boolean_By_Name_03([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object1)
{
    constexpr ani_int VAL1 = 5;
    constexpr ani_int VAL2 = 6;
    ani_object object {};
    GetMethodData(env, &object);

    ani_boolean res = ANI_FALSE;
    ASSERT_EQ(env->Object_CallMethodByName_Boolean(object, "booleanByNameMethod", "ii:x", &res, VAL1, VAL2),
              ANI_INVALID_DESCRIPTOR);
    ASSERT_EQ(env->Object_CallMethodByName_Boolean(object, "unknown_function", "ii:z", &res, VAL1, VAL2),
              ANI_NOT_FOUND);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Boolean_By_Name_04([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object1)
{
    constexpr ani_int VAL1 = 5;
    constexpr ani_int VAL2 = 6;
    ani_object object {};
    GetMethodData(env, &object);

    ani_boolean res = ANI_FALSE;
    ASSERT_EQ(
        env->c_api->Object_CallMethodByName_Boolean(env, object, "booleanByNameMethod", "ii:z", &res, VAL1, VAL2),
        ANI_OK);
    ASSERT_EQ(res, ANI_TRUE);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Boolean_By_Name_05([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object1)
{
    constexpr ani_int VAL1 = 5;
    constexpr ani_int VAL2 = 6;
    ani_object object {};
    GetMethodData(env, &object);

    ani_boolean res = ANI_FALSE;
    ASSERT_EQ(env->Object_CallMethodByName_Boolean(object, nullptr, "ii:z", &res, VAL1, VAL2), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Boolean_By_Name_06([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object1)
{
    constexpr ani_int VAL1 = 5;
    constexpr ani_int VAL2 = 6;
    ani_object object {};
    GetMethodData(env, &object);

    ASSERT_EQ(env->Object_CallMethodByName_Boolean(object, "booleanByNameMethod", "ii:z", nullptr, VAL1, VAL2),
              ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Boolean_By_Name_07([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object1)
{
    ani_object object {};
    GetMethodData(env, &object);

    ani_boolean res = ANI_FALSE;
    ASSERT_EQ(env->Object_CallMethodByName_Boolean(nullptr, "booleanByNameMethod", "ii:z", &res, VAL1, VAL2),
              ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Boolean_By_Name_08([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object1)
{
    ani_object object {};
    GetMethodData(env, &object);

    ani_boolean res = ANI_FALSE;
    ASSERT_EQ(env->Object_CallMethodByName_Boolean(nullptr, "booleanByNameMethod", "ii:z", &res, nullptr),
              ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Boolean_By_Name_09([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object1)
{
    constexpr ani_int VAL1 = 5;
    constexpr ani_int VAL2 = 6;
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ObjectOperationsMethodByNameBoolean.B", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_method method {};
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", "i:", &method), ANI_OK);

    ani_object obj {};
    const ani_int arg = 100;
    ASSERT_EQ(env->Object_New(cls, method, &obj, arg), ANI_OK);

    ani_boolean res = ANI_FALSE;
    ASSERT_EQ(env->Object_CallMethodByName_Boolean(obj, "booleanMethod", "ii:z", &res, VAL1, VAL2), ANI_OK);
    ASSERT_EQ(res, ANI_FALSE);

    ani_value args[2U];
    args[0U].i = VAL1;
    args[1U].i = VAL2;
    ASSERT_EQ(env->Object_CallMethodByName_Boolean_A(obj, "booleanMethod", "ii:z", &res, args), ANI_OK);
    ASSERT_EQ(res, ANI_FALSE);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Boolean_By_Name_10([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object1)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ObjectOperationsMethodByNameBoolean.B", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_method method {};
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", "i:", &method), ANI_OK);

    ani_object obj {};
    const ani_int arg = 100;
    ASSERT_EQ(env->Object_New(cls, method, &obj, arg), ANI_OK);

    const ani_int value = 5;
    ani_boolean res = ANI_FALSE;
    ASSERT_EQ(env->Object_CallMethodByName_Boolean(obj, "booleanMethod", "i:z", &res, value), ANI_OK);
    ASSERT_EQ(res, ANI_TRUE);

    ani_value args[1U];
    args[0U].i = value;
    ASSERT_EQ(env->Object_CallMethodByName_Boolean_A(obj, "booleanMethod", "i:z", &res, args), ANI_OK);
    ASSERT_EQ(res, ANI_TRUE);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Boolean_By_Name_11([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object1)
{
    constexpr ani_int VAL1 = 5;
    constexpr ani_int VAL2 = 6;
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ObjectOperationsMethodByNameBoolean.C", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_method method {};
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", "i:", &method), ANI_OK);

    ani_object obj {};
    const ani_int arg = 100;
    ASSERT_EQ(env->Object_New(cls, method, &obj, arg), ANI_OK);

    ani_boolean res = ANI_FALSE;
    ASSERT_EQ(env->Object_CallMethodByName_Boolean(obj, "booleanCompareMethod", "ii:z", &res, VAL1, VAL2), ANI_OK);
    ASSERT_EQ(res, ANI_FALSE);

    ani_value args[2U];
    args[0U].i = VAL1;
    args[1U].i = VAL2;
    ASSERT_EQ(env->Object_CallMethodByName_Boolean_A(obj, "booleanCompareMethod", "ii:z", &res, args), ANI_OK);
    ASSERT_EQ(res, ANI_FALSE);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Boolean_By_Name_12([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object1)
{
    constexpr ani_int VAL1 = 5;
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ObjectOperationsMethodByNameBoolean.C", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_method method {};
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", "i:", &method), ANI_OK);

    ani_object obj {};
    const ani_int arg = 100;
    ASSERT_EQ(env->Object_New(cls, method, &obj, arg), ANI_OK);

    ani_boolean res = ANI_FALSE;
    ASSERT_EQ(env->Object_CallMethodByName_Boolean(obj, "booleanMethod", "ii:z", &res, VAL1, VAL1), ANI_OK);
    ASSERT_EQ(res, ANI_TRUE);

    ani_value args[2U];
    args[0U].i = VAL1;
    args[1U].i = VAL1;
    ASSERT_EQ(env->Object_CallMethodByName_Boolean_A(obj, "booleanMethod", "ii:z", &res, args), ANI_OK);
    ASSERT_EQ(res, ANI_TRUE);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Boolean_By_Name_13([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object1)
{
    constexpr ani_int VAL1 = 5;
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ObjectOperationsMethodByNameBoolean.B", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_method method {};
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", "i:", &method), ANI_OK);

    ani_object obj {};
    const ani_int arg = 5;
    ASSERT_EQ(env->Object_New(cls, method, &obj, arg), ANI_OK);

    ani_boolean res = ANI_FALSE;
    ani_value args[1U];
    args[0U].i = VAL1;
    ASSERT_EQ(env->Object_CallMethodByName_Boolean(obj, "protectedMethod", "i:z", &res, VAL1), ANI_OK);
    ASSERT_EQ(res, ANI_TRUE);
    ASSERT_EQ(env->Object_CallMethodByName_Boolean_A(obj, "protectedMethod", "i:z", &res, args), ANI_OK);
    ASSERT_EQ(res, ANI_TRUE);

    ASSERT_EQ(env->Object_CallMethodByName_Boolean(obj, "privateMethod", "i:z", &res, VAL1), ANI_OK);
    ASSERT_EQ(res, ANI_FALSE);
    ASSERT_EQ(env->Object_CallMethodByName_Boolean_A(obj, "privateMethod", "i:z", &res, args), ANI_OK);
    ASSERT_EQ(res, ANI_FALSE);

    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ObjectOperationsMethodByNameBoolean.C", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", nullptr, &method), ANI_OK);
    ASSERT_EQ(env->Object_New(cls, method, &obj, arg), ANI_OK);
    ASSERT_EQ(env->Object_CallMethodByName_Boolean(obj, "callProtected", "i:z", &res, VAL1), ANI_OK);
    ASSERT_EQ(res, ANI_TRUE);
    ASSERT_EQ(env->Object_CallMethodByName_Boolean_A(obj, "callProtected", "i:z", &res, args), ANI_OK);
    ASSERT_EQ(res, ANI_TRUE);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Boolean_By_Name_14([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object1)
{
    constexpr ani_int VAL1 = 5;
    constexpr ani_int VAL2 = 6;
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ObjectOperationsMethodByNameBoolean.B", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_method method {};
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", "i:", &method), ANI_OK);

    ani_object obj {};
    ASSERT_EQ(env->Object_New(cls, method, &obj, VAL1), ANI_OK);

    ani_boolean res = ANI_FALSE;
    ASSERT_EQ(env->Object_CallMethodByName_Boolean(obj, "nestedMethod", "i:z", &res, VAL2), ANI_OK);
    ASSERT_EQ(res, ANI_FALSE);

    ani_value args[1U];
    args[0U].i = VAL2;
    ASSERT_EQ(env->Object_CallMethodByName_Boolean_A(obj, "nestedMethod", "i:z", &res, args), ANI_OK);
    ASSERT_EQ(res, ANI_FALSE);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Boolean_By_Name_15([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object1)
{
    constexpr ani_int VAL1 = 5;
    constexpr ani_int VAL2 = 6;
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ObjectOperationsMethodByNameBoolean.B", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_method method {};
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", "i:", &method), ANI_OK);

    ani_object obj {};
    ASSERT_EQ(env->Object_New(cls, method, &obj, VAL2), ANI_OK);

    ani_boolean res = ANI_FALSE;
    ani_value argsA[1];
    argsA[0].i = VAL1;
    ASSERT_EQ(env->Object_CallMethodByName_Boolean(obj, "recursiveMethod", "i:z", &res, VAL1), ANI_OK);
    ASSERT_EQ(res, ANI_TRUE);
    ASSERT_EQ(env->Object_CallMethodByName_Boolean_A(obj, "recursiveMethod", "i:z", &res, argsA), ANI_OK);
    ASSERT_EQ(res, ANI_TRUE);

    const ani_int value1 = -5;
    ani_value argsB[1];
    argsB[0].i = value1;
    ASSERT_EQ(env->Object_CallMethodByName_Boolean(obj, "recursiveMethod", "i:z", &res, value1), ANI_OK);
    ASSERT_EQ(res, ANI_FALSE);
    ASSERT_EQ(env->Object_CallMethodByName_Boolean_A(obj, "recursiveMethod", "i:z", &res, argsB), ANI_OK);
    ASSERT_EQ(res, ANI_FALSE);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Boolean_By_Name_16([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object1)
{
    constexpr ani_int VAL1 = 5;
    constexpr ani_int VAL2 = 6;
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ObjectOperationsMethodByNameBoolean.B", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_method method {};
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", "i:", &method), ANI_OK);

    ani_object obj {};
    ASSERT_EQ(env->Object_New(cls, method, &obj, VAL2), ANI_OK);

    ani_boolean res = ANI_FALSE;
    ani_char cValue1 = 'A';
    ani_double dValue1 = 1.0;
    ASSERT_EQ(env->Object_CallMethodByName_Boolean(obj, "calculateSum", nullptr, &res, VAL1, cValue1, dValue1),
              ANI_OK);
    ASSERT_EQ(res, ANI_TRUE);

    ani_char cValue2 = 'B';
    ani_value args[3U];
    args[0U].i = VAL1;
    args[1U].c = cValue2;
    args[2U].d = dValue1;
    ASSERT_EQ(env->Object_CallMethodByName_Boolean_A(obj, "calculateSum", nullptr, &res, args), ANI_OK);
    ASSERT_EQ(res, ANI_FALSE);

    ani_double dValue2 = 2U;
    ASSERT_EQ(env->Object_CallMethodByName_Boolean(obj, "calculateSum", nullptr, &res, VAL1, cValue2, dValue2),
              ANI_OK);
    ASSERT_EQ(res, ANI_TRUE);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Boolean_By_Name_17([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object1)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ObjectOperationsMethodByNameBoolean.B", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_method method {};
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", "i:", &method), ANI_OK);

    ani_object obj {};
    const ani_int arg = 15;
    ASSERT_EQ(env->Object_New(cls, method, &obj, arg), ANI_OK);

    ani_boolean res = ANI_FALSE;
    const ani_int value1 = 5;
    const ani_int value2 = 6;
    ASSERT_EQ(env->Object_CallMethodByName_Boolean(obj, "booleanMethod", "ii:z", &res, value1, value2), ANI_OK);
    ASSERT_EQ(res, ANI_FALSE);

    const ani_int value3 = 7;
    ASSERT_EQ(env->Object_CallMethodByName_Boolean(obj, "booleanMethod", "ii:z", &res, value1, value3), ANI_OK);
    ASSERT_EQ(res, ANI_FALSE);

    const ani_int value4 = 3;
    ani_value args[2U];
    args[0U].i = value1;
    args[1U].i = value4;
    ASSERT_EQ(env->Object_CallMethodByName_Boolean_A(obj, "booleanMethod", "ii:z", &res, args), ANI_OK);
    ASSERT_EQ(res, ANI_FALSE);

    const ani_int value5 = 5;
    ASSERT_EQ(env->Object_CallMethodByName_Boolean(obj, "booleanMethod", "ii:z", &res, value1, value5), ANI_OK);
    ASSERT_EQ(res, ANI_TRUE);

    const ani_int value6 = 12;
    ASSERT_EQ(env->Object_CallMethodByName_Boolean(obj, "booleanMethod", "ii:z", &res, value1, value6), ANI_OK);
    ASSERT_EQ(res, ANI_FALSE);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Boolean_By_Name_18([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object1)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ObjectOperationsMethodByNameBoolean.C", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_method method {};
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", "i:", &method), ANI_OK);

    ani_object obj {};
    const ani_int arg = 10;
    ASSERT_EQ(env->Object_New(cls, method, &obj, arg), ANI_OK);

    ani_boolean res = ANI_FALSE;
    const ani_int value = 10;
    ASSERT_EQ(env->Object_CallMethodByName_Boolean(obj, "jf", "i:z", &res, value), ANI_OK);
    ASSERT_EQ(res, ANI_TRUE);

    ani_value args[1U];
    args[0U].i = value;
    ASSERT_EQ(env->Object_CallMethodByName_Boolean_A(obj, "jf", "i:z", &res, args), ANI_OK);
    ASSERT_EQ(res, ANI_TRUE);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Boolean_By_Name_19([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object1)
{
    constexpr ani_int VAL1 = 5;
    constexpr ani_int VAL2 = 6;
    ani_object object {};
    GetMethodData(env, &object);

    ani_value args[2U];
    args[0U].i = VAL1;
    args[1U].i = VAL2;

    ani_boolean res = ANI_FALSE;
    ASSERT_EQ(
        env->c_api->Object_CallMethodByName_Boolean(nullptr, object, "booleanByNameMethod", "ii:z", &res, VAL1, VAL2),
        ANI_INVALID_ARGS);
    ASSERT_EQ(
        env->c_api->Object_CallMethodByName_Boolean_A(nullptr, object, "booleanByNameMethod", "ii:z", &res, args),
        ANI_INVALID_ARGS);

    ASSERT_EQ(env->Object_CallMethodByName_Boolean(nullptr, "booleanByNameMethod", "ii:z", &res, VAL1, VAL2),
              ANI_INVALID_ARGS);
    ASSERT_EQ(env->Object_CallMethodByName_Boolean_A(nullptr, "booleanByNameMethod", "ii:z", &res, args),
              ANI_INVALID_ARGS);

    ASSERT_EQ(env->Object_CallMethodByName_Boolean(object, nullptr, "ii:z", &res, VAL1, VAL2), ANI_INVALID_ARGS);
    ASSERT_EQ(env->Object_CallMethodByName_Boolean_A(object, nullptr, "ii:z", &res, args), ANI_INVALID_ARGS);

    ASSERT_EQ(env->Object_CallMethodByName_Boolean(object, "booleanByNameMethod", nullptr, &res, VAL1, VAL2), ANI_OK);
    ASSERT_EQ(env->Object_CallMethodByName_Boolean_A(object, "booleanByNameMethod", nullptr, &res, args), ANI_OK);

    ASSERT_EQ(env->Object_CallMethodByName_Boolean(object, "booleanByNameMethod", "ii:z", nullptr, VAL1, VAL2),
              ANI_INVALID_ARGS);
    ASSERT_EQ(env->Object_CallMethodByName_Boolean_A(object, "booleanByNameMethod", "ii:z", nullptr, args),
              ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Boolean_By_Name_20([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object1)
{
    constexpr ani_int VAL1 = 5;
    constexpr ani_int VAL2 = 6;
    ani_object object {};
    GetMethodData(env, &object);

    ani_value args[2U];
    args[0U].i = VAL1;
    args[1U].i = VAL2;

    const std::array<std::string_view, 4U> invalidMethodNames = {{"", "测试emoji🙂🙂", "\n\r\t", "\x01\x02\x03"}};

    ani_boolean res = ANI_FALSE;
    for (const auto &methodName : invalidMethodNames) {
        ASSERT_EQ(env->Object_CallMethodByName_Boolean(object, methodName.data(), "ii:z", &res, VAL1, VAL2),
                  ANI_NOT_FOUND);
        ASSERT_EQ(env->Object_CallMethodByName_Boolean_A(object, methodName.data(), "ii:z", &res, args),
                  ANI_NOT_FOUND);
    }
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Boolean_By_Name_21([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object1)
{
    constexpr ani_int VAL1 = 5;
    constexpr ani_int VAL2 = 6;
    ani_object object {};
    GetMethodData(env, &object);

    ani_value args[2U];
    args[0U].i = VAL1;
    args[1U].i = VAL2;

    const std::array<std::string_view, 4U> invalidMethodNames = {{"", "测试emoji🙂🙂", "\n\r\t", "\x01\x02\x03"}};

    ani_boolean res = ANI_FALSE;
    for (const auto &methodName : invalidMethodNames) {
        ASSERT_EQ(
            env->Object_CallMethodByName_Boolean(object, "booleanByNameMethod", methodName.data(), &res, VAL1, VAL2),
            ANI_INVALID_DESCRIPTOR);
        ASSERT_EQ(env->Object_CallMethodByName_Boolean_A(object, "booleanByNameMethod", methodName.data(), &res, args),
                  ANI_INVALID_DESCRIPTOR);
    }
    return ANI_TRUE;
}

ani_int GetMethodDataByte(ani_env *env, ani_object *objectResult)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ObjectOperationsMethodByNameByte.A", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_static_method newMethod {};
    ASSERT_EQ(
        env->Class_FindStaticMethod(cls, "new_A",
            ":C{entry.src.main.src.ets.ObjectOperationsMethodByNameByte.A}", &newMethod),
        ANI_OK);
    ani_ref ref {};
    ASSERT_EQ(env->Class_CallStaticMethod_Ref(cls, newMethod, &ref), ANI_OK);
    *objectResult = static_cast<ani_object>(ref);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Byte_By_Name_01([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object1)
{
    constexpr ani_byte VAL1 = 5U;
    constexpr ani_byte VAL2 = 6U;
    ani_object object {};
    GetMethodDataByte(env, &object);

    ani_value args[2U];
    args[0U].b = VAL1;
    args[1U].b = VAL2;

    ani_byte res {};
    ASSERT_EQ(env->Object_CallMethodByName_Byte_A(object, "byteByNameMethod", "bb:b", &res, args), ANI_OK);
    ASSERT_EQ(res, VAL1 + VAL2);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Byte_By_Name_02([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object1)
{
    constexpr ani_byte VAL1 = 5U;
    constexpr ani_byte VAL2 = 6U;
    ani_object object {};
    GetMethodDataByte(env, &object);

    ani_byte res {};
    ASSERT_EQ(env->Object_CallMethodByName_Byte(object, "byteByNameMethod", "bb:b", &res, VAL1, VAL2), ANI_OK);
    ASSERT_EQ(res, VAL1 + VAL2);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Byte_By_Name_03([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object1)
{
    constexpr ani_byte VAL1 = 5U;
    constexpr ani_byte VAL2 = 6U;
    ani_object object {};
    GetMethodDataByte(env, &object);

    ani_byte res {};
    ASSERT_EQ(env->c_api->Object_CallMethodByName_Byte(env, object, "byteByNameMethod", "bb:b", &res, VAL1, VAL2),
              ANI_OK);
    ASSERT_EQ(res, VAL1 + VAL2);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Byte_By_Name_04([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object1)
{
    constexpr ani_byte VAL1 = 5U;
    constexpr ani_byte VAL2 = 6U;
    ani_object object {};
    GetMethodDataByte(env, &object);

    ani_byte res {};
    ASSERT_EQ(env->Object_CallMethodByName_Byte(object, "byteByNameMethod", "bb:x", &res, VAL1, VAL2),
                 ANI_INVALID_DESCRIPTOR);
    ASSERT_EQ(env->Object_CallMethodByName_Byte(object, "unknown_function", "bb:b", &res, VAL1, VAL2), ANI_NOT_FOUND);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Byte_By_Name_05([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object1)
{
    constexpr ani_byte VAL1 = 5U;
    constexpr ani_byte VAL2 = 6U;
    ani_object object {};
    GetMethodDataByte(env, &object);

    ani_byte res {};
    ASSERT_EQ(env->Object_CallMethodByName_Byte(object, nullptr, "bb:b", &res, VAL1, VAL2), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Byte_By_Name_06([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object1)
{
    constexpr ani_byte VAL1 = 5U;
    constexpr ani_byte VAL2 = 6U;
    ani_object object {};
    GetMethodDataByte(env, &object);

    ASSERT_EQ(env->Object_CallMethodByName_Byte(object, "byteByNameMethod", "bb:b", nullptr, VAL1, VAL2),
              ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Byte_By_Name_07([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object1)
{
    constexpr ani_byte VAL1 = 5U;
    constexpr ani_byte VAL2 = 6U;
    ani_object object {};
    GetMethodDataByte(env, &object);

    ani_byte res {};
    ASSERT_EQ(env->Object_CallMethodByName_Byte(nullptr, "byteByNameMethod", "bb:b", &res, VAL1, VAL2),
              ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Byte_By_Name_08([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object1)
{
    ani_object object {};
    GetMethodDataByte(env, &object);

    ani_byte res {};
    ASSERT_EQ(env->Object_CallMethodByName_Byte(nullptr, "byteByNameMethod", "bb:b", &res, nullptr),
              ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Byte_By_Name_09([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object1)
{
    constexpr ani_byte VAL1 = 5U;
    constexpr ani_byte VAL2 = 6U;
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ObjectOperationsMethodByNameByte.B", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_method method {};
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", "b:", &method), ANI_OK);

    ani_object obj {};
    const ani_byte arg = 100U;
    ASSERT_EQ(env->Object_New(cls, method, &obj, arg), ANI_OK);

    ani_byte sum {};
    ASSERT_EQ(env->Object_CallMethodByName_Byte(obj, "byteMethod", "bb:b", &sum, VAL1, VAL2), ANI_OK);
    ASSERT_EQ(sum, arg);

    ani_value args[2U];
    args[0U].b = VAL1;
    args[1U].b = VAL2;
    ASSERT_EQ(env->Object_CallMethodByName_Byte_A(obj, "byteMethod", "bb:b", &sum, args), ANI_OK);
    ASSERT_EQ(sum, arg);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Byte_By_Name_10([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object1)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ObjectOperationsMethodByNameByte.B", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_method method {};
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", "b:", &method), ANI_OK);

    ani_object obj {};
    const ani_byte arg = 100U;
    ASSERT_EQ(env->Object_New(cls, method, &obj, arg), ANI_OK);

    ani_byte sum {};
    const ani_byte value = 5U;
    ASSERT_EQ(env->Object_CallMethodByName_Byte(obj, "byteMethod", "b:b", &sum, value), ANI_OK);
    ASSERT_EQ(sum, arg);

    ani_value args[1U];
    args[0U].b = value;
    ASSERT_EQ(env->Object_CallMethodByName_Byte_A(obj, "byteMethod", "b:b", &sum, args), ANI_OK);
    ASSERT_EQ(sum, arg);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Byte_By_Name_11([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object1)
{
    constexpr ani_byte VAL1 = 5U;
    constexpr ani_byte VAL2 = 6U;
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ObjectOperationsMethodByNameByte.C", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_method method {};
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", "b:", &method), ANI_OK);

    ani_object obj {};
    const ani_byte arg = 100U;
    ASSERT_EQ(env->Object_New(cls, method, &obj, arg), ANI_OK);

    ani_byte sum {};
    ASSERT_EQ(env->Object_CallMethodByName_Byte(obj, "byteAddMethod", "bb:b", &sum, VAL1, VAL2), ANI_OK);
    ASSERT_EQ(sum, arg + VAL1 + VAL2);

    ani_value args[2U];
    args[0U].b = VAL1;
    args[1U].b = VAL2;
    ASSERT_EQ(env->Object_CallMethodByName_Byte_A(obj, "byteAddMethod", "bb:b", &sum, args), ANI_OK);
    ASSERT_EQ(sum, arg + VAL1 + VAL2);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Byte_By_Name_12([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object1)
{
    constexpr ani_byte VAL1 = 5U;
    constexpr ani_byte VAL2 = 6U;
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ObjectOperationsMethodByNameByte.C", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_method method {};
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", "b:", &method), ANI_OK);

    ani_object obj {};
    const ani_byte arg = 100U;
    ASSERT_EQ(env->Object_New(cls, method, &obj, arg), ANI_OK);

    ani_byte sum {};
    ASSERT_EQ(env->Object_CallMethodByName_Byte(obj, "byteMethod", "bb:b", &sum, VAL1, VAL2), ANI_OK);
    ASSERT_EQ(sum, arg - VAL1 - VAL2);

    ani_value args[2U];
    args[0U].b = VAL1;
    args[1U].b = VAL2;
    ASSERT_EQ(env->Object_CallMethodByName_Byte_A(obj, "byteMethod", "bb:b", &sum, args), ANI_OK);
    ASSERT_EQ(sum, arg - VAL1 - VAL2);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Byte_By_Name_13([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object1)
{
    constexpr ani_byte VAL1 = 5U;
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ObjectOperationsMethodByNameByte.B", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_method method {};
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", "b:", &method), ANI_OK);

    ani_object obj {};
    const ani_byte arg = 100U;
    ASSERT_EQ(env->Object_New(cls, method, &obj, arg), ANI_OK);

    ani_byte num {};
    ani_value args[1U];
    args[0U].b = VAL1;
    ASSERT_EQ(env->Object_CallMethodByName_Byte(obj, "protectedMethod", "b:b", &num, VAL1), ANI_OK);
    ASSERT_EQ(num, arg + VAL1);
    ASSERT_EQ(env->Object_CallMethodByName_Byte_A(obj, "protectedMethod", "b:b", &num, args), ANI_OK);
    ASSERT_EQ(num, arg + VAL1);

    ASSERT_EQ(env->Object_CallMethodByName_Byte(obj, "privateMethod", "b:b", &num, VAL1), ANI_OK);
    ASSERT_EQ(num, arg - VAL1);
    ASSERT_EQ(env->Object_CallMethodByName_Byte_A(obj, "privateMethod", "b:b", &num, args), ANI_OK);
    ASSERT_EQ(num, arg - VAL1);

    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ObjectOperationsMethodByNameByte.C", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", "b:", &method), ANI_OK);
    ASSERT_EQ(env->Object_New(cls, method, &obj, arg), ANI_OK);
    ASSERT_EQ(env->Object_CallMethodByName_Byte(obj, "callProtected", "b:b", &num, VAL1), ANI_OK);
    ASSERT_EQ(num, arg + VAL1);
    ASSERT_EQ(env->Object_CallMethodByName_Byte_A(obj, "callProtected", "b:b", &num, args), ANI_OK);
    ASSERT_EQ(num, arg + VAL1);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Byte_By_Name_14([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object1)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ObjectOperationsMethodByNameByte.B", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_method method {};
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", "b:", &method), ANI_OK);

    ani_object obj {};
    const ani_byte arg = 6U;
    ASSERT_EQ(env->Object_New(cls, method, &obj, arg), ANI_OK);

    ani_byte sum {};
    ASSERT_EQ(env->Object_CallMethodByName_Byte(obj, "nestedMethod", "b:b", &sum, VAL1), ANI_OK);
    ASSERT_EQ(sum, arg + VAL1);

    ani_value args[1U];
    args[0U].b = VAL1;
    ASSERT_EQ(env->Object_CallMethodByName_Byte_A(obj, "nestedMethod", "b:b", &sum, args), ANI_OK);
    ASSERT_EQ(sum, arg + VAL1);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Byte_By_Name_15([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object1)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ObjectOperationsMethodByNameByte.B", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_method method {};
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", "b:", &method), ANI_OK);

    ani_object obj {};
    const ani_byte arg = 6U;
    ASSERT_EQ(env->Object_New(cls, method, &obj, arg), ANI_OK);

    ani_byte sum {};
    const ani_int value1 = 5;
    const ani_byte result = 120;
    ASSERT_EQ(env->Object_CallMethodByName_Byte(obj, "recursiveMethod", "i:b", &sum, value1), ANI_OK);
    ASSERT_EQ(sum, result);

    ani_value args[1U];
    args[0U].i = value1;
    ASSERT_EQ(env->Object_CallMethodByName_Byte_A(obj, "recursiveMethod", "i:b", &sum, args), ANI_OK);
    ASSERT_EQ(sum, result);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Byte_By_Name_16([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object1)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ObjectOperationsMethodByNameByte.B", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_method method {};
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", "b:", &method), ANI_OK);

    ani_object obj {};
    const ani_byte arg = 6U;
    ASSERT_EQ(env->Object_New(cls, method, &obj, arg), ANI_OK);

    ani_byte sum {};
    const ani_byte value = 1U;
    const ani_char cValue1 = 'A';
    const ani_int iValue1 = 1;
    ASSERT_EQ(env->Object_CallMethodByName_Byte(obj, "calculateSum", "bci:b", &sum, value, cValue1, iValue1), ANI_OK);
    ASSERT_EQ(sum, arg - value);

    const ani_char cValue2 = 'B';
    ani_value args[3U];
    args[0U].b = value;
    args[1U].c = cValue2;
    args[2U].i = iValue1;
    ASSERT_EQ(env->Object_CallMethodByName_Byte_A(obj, "calculateSum", "bci:b", &sum, args), ANI_OK);
    ASSERT_EQ(sum, value);

    const ani_int iValue2 = 2U;
    ASSERT_EQ(env->Object_CallMethodByName_Byte(obj, "calculateSum", "bci:b", &sum, value, cValue2, iValue2), ANI_OK);
    ASSERT_EQ(sum, arg + value);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Byte_By_Name_17([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object1)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ObjectOperationsMethodByNameByte.B", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_method method {};
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", "b:", &method), ANI_OK);

    ani_object obj {};
    const ani_byte arg = 15U;
    ASSERT_EQ(env->Object_New(cls, method, &obj, arg), ANI_OK);

    ani_byte sum {};
    const ani_byte value1 = 5U;
    const ani_byte value2 = 6U;
    ASSERT_EQ(env->Object_CallMethodByName_Byte(obj, "byteMethod", "bb:b", &sum, value1, value2), ANI_OK);
    ASSERT_EQ(sum, arg);

    const ani_byte value3 = 7U;
    ASSERT_EQ(env->Object_CallMethodByName_Byte(obj, "byteMethod", "bb:b", &sum, value1, value3), ANI_OK);
    ASSERT_EQ(sum, arg);

    const ani_byte value4 = 3U;
    ani_value args[2U];
    args[0U].b = value1;
    args[1U].b = value4;
    ASSERT_EQ(env->Object_CallMethodByName_Byte_A(obj, "byteMethod", "bb:b", &sum, args), ANI_OK);
    ASSERT_EQ(sum, arg);

    const ani_byte value5 = 10U;
    ASSERT_EQ(env->Object_CallMethodByName_Byte(obj, "byteMethod", "bb:b", &sum, value1, value5), ANI_OK);
    ASSERT_EQ(sum, value1 + value5);

    const ani_byte value6 = 12U;
    ASSERT_EQ(env->Object_CallMethodByName_Byte(obj, "byteMethod", "bb:b", &sum, value1, value6), ANI_OK);
    ASSERT_EQ(sum, value1 + value6);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Byte_By_Name_18([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object1)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ObjectOperationsMethodByNameByte.C", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_method method {};
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", "b:", &method), ANI_OK);

    ani_object obj {};
    const ani_byte arg = 10U;
    ASSERT_EQ(env->Object_New(cls, method, &obj, arg), ANI_OK);

    ani_byte sum {};
    const ani_byte value = 2U;
    ASSERT_EQ(env->Object_CallMethodByName_Byte(obj, "jf", "b:b", &sum, value), ANI_OK);
    ASSERT_EQ(sum, arg + value);

    ani_value args[1U];
    args[0U].b = value;
    ASSERT_EQ(env->Object_CallMethodByName_Byte_A(obj, "jf", "b:b", &sum, args), ANI_OK);
    ASSERT_EQ(sum, arg + value);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Byte_By_Name_19([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object1)
{
    constexpr ani_byte VAL1 = 5U;
    constexpr ani_byte VAL2 = 6U;
    ani_object object {};
    GetMethodDataByte(env, &object);

    ani_value args[2U];
    args[0U].b = VAL1;
    args[1U].b = VAL2;

    ani_byte res = 0U;
    ASSERT_EQ(env->c_api->Object_CallMethodByName_Byte(nullptr, object, "byteByNameMethod", "bb:b", &res, VAL1, VAL2),
              ANI_INVALID_ARGS);
    ASSERT_EQ(env->c_api->Object_CallMethodByName_Byte_A(nullptr, object, "byteByNameMethod", "bb:b", &res, args),
              ANI_INVALID_ARGS);

    ASSERT_EQ(env->Object_CallMethodByName_Byte(nullptr, "byteByNameMethod", "bb:b", &res, VAL1, VAL2),
              ANI_INVALID_ARGS);
    ASSERT_EQ(env->Object_CallMethodByName_Byte_A(nullptr, "byteByNameMethod", "bb:b", &res, args), ANI_INVALID_ARGS);

    ASSERT_EQ(env->Object_CallMethodByName_Byte(object, nullptr, "bb:b", &res, VAL1, VAL2), ANI_INVALID_ARGS);
    ASSERT_EQ(env->Object_CallMethodByName_Byte_A(object, nullptr, "bb:b", &res, args), ANI_INVALID_ARGS);

    ASSERT_EQ(env->Object_CallMethodByName_Byte(object, "byteByNameMethod", nullptr, &res, VAL1, VAL2), ANI_OK);
    ASSERT_EQ(env->Object_CallMethodByName_Byte_A(object, "byteByNameMethod", nullptr, &res, args), ANI_OK);

    ASSERT_EQ(env->Object_CallMethodByName_Byte(object, "byteByNameMethod", "bb:b", nullptr, VAL1, VAL2),
              ANI_INVALID_ARGS);
    ASSERT_EQ(env->Object_CallMethodByName_Byte_A(object, "byteByNameMethod", "bb:b", nullptr, args),
              ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Byte_By_Name_20([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object1)
{
    constexpr ani_byte VAL1 = 5U;
    constexpr ani_byte VAL2 = 6U;
    ani_object object {};
    GetMethodDataByte(env, &object);

    ani_value args[2U];
    args[0U].b = VAL1;
    args[1U].b = VAL2;

    const std::array<std::string_view, 4U> invalidMethodNames = {{"", "测试emoji🙂🙂", "\n\r\t", "\x01\x02\x03"}};

    ani_byte res = 0U;
    for (const auto &methodName : invalidMethodNames) {
        ASSERT_EQ(env->Object_CallMethodByName_Byte(object, methodName.data(), "bb:b", &res, VAL1, VAL2),
                  ANI_NOT_FOUND);
        ASSERT_EQ(env->Object_CallMethodByName_Byte_A(object, methodName.data(), "bb:b", &res, args), ANI_NOT_FOUND);
    }
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Byte_By_Name_21([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object1)
{
    constexpr ani_byte VAL1 = 5U;
    constexpr ani_byte VAL2 = 6U;
    ani_object object {};
    GetMethodDataByte(env, &object);

    ani_value args[2U];
    args[0U].b = VAL1;
    args[1U].b = VAL2;

    const std::array<std::string_view, 4U> invalidMethodNames = {{"", "测试emoji🙂🙂", "\n\r\t", "\x01\x02\x03"}};

    ani_byte res = 0U;
    for (const auto &methodName : invalidMethodNames) {
        ASSERT_EQ(env->Object_CallMethodByName_Byte(object, "byteByNameMethod", methodName.data(), &res, VAL1, VAL2),
                  ANI_INVALID_DESCRIPTOR);
        ASSERT_EQ(env->Object_CallMethodByName_Byte_A(object, "byteByNameMethod", methodName.data(), &res, args),
                  ANI_INVALID_DESCRIPTOR);
    }
    return ANI_TRUE;
}

ani_int GetMethodCharData(ani_env *env, ani_object *objectResult)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ObjectOperationsMethodByNameChar.A", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_static_method newMethod {};
    ASSERT_EQ(env->Class_FindStaticMethod(cls,
                  "new_A", ":C{entry.src.main.src.ets.ObjectOperationsMethodByNameChar.A}", &newMethod),
        ANI_OK);
    ani_ref ref {};
    ASSERT_EQ(env->Class_CallStaticMethod_Ref(cls, newMethod, &ref), ANI_OK);
    *objectResult = static_cast<ani_object>(ref);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Char_By_Name_01([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object1)
{
    constexpr ani_char VAL = 'a';
    constexpr ani_char VAL1 = 'C';
    constexpr ani_char VAL2 = 'A';
    ani_object object {};
    GetMethodCharData(env, &object);

    ani_value args[2U];
    args[0U].c = VAL2;
    args[1U].c = VAL1;

    ani_char res = VAL;
    ASSERT_EQ(env->Object_CallMethodByName_Char_A(object, "charByNameMethod", "cc:c", &res, args), ANI_OK);
    ASSERT_EQ(res, VAL1);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Char_By_Name_02([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object1)
{
    constexpr ani_char VAL = 'a';
    constexpr ani_char VAL1 = 'C';
    constexpr ani_char VAL2 = 'A';
    ani_object object {};
    GetMethodCharData(env, &object);

    ani_char res = VAL;
    ASSERT_EQ(env->Object_CallMethodByName_Char(object, "charByNameMethod", "cc:c", &res, VAL1, VAL2), ANI_OK);
    ASSERT_EQ(res, VAL1);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Char_By_Name_03([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object1)
{
    constexpr ani_char VAL = 'a';
    constexpr ani_char VAL1 = 'C';
    constexpr ani_char VAL2 = 'A';
    ani_object object {};
    GetMethodCharData(env, &object);

    ani_char res = VAL;
    ASSERT_EQ(env->c_api->Object_CallMethodByName_Char(env, object, "charByNameMethod", "cc:c", &res, VAL1, VAL2),
              ANI_OK);
    ASSERT_EQ(res, VAL1);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Char_By_Name_04([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object1)
{
    constexpr ani_char VAL = 'a';
    constexpr ani_char VAL1 = 'C';
    constexpr ani_char VAL2 = 'A';
    ani_object object {};
    GetMethodCharData(env, &object);

    ani_char res = VAL;
    ASSERT_EQ(env->Object_CallMethodByName_Char(object, "charByNameMethod", "cc:x", &res, VAL1, VAL2),
                 ANI_INVALID_DESCRIPTOR);
    ASSERT_EQ(env->Object_CallMethodByName_Char(object, "unknown_function", "cc:c", &res, VAL1, VAL2), ANI_NOT_FOUND);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Char_By_Name_05([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object1)
{
    constexpr ani_char VAL = 'a';
    constexpr ani_char VAL1 = 'C';
    constexpr ani_char VAL2 = 'A';
    ani_object object {};
    GetMethodCharData(env, &object);

    ani_char res = VAL;
    ASSERT_EQ(env->Object_CallMethodByName_Char(object, nullptr, "cc:c", &res, VAL1, VAL2), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Char_By_Name_06([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object1)
{
    constexpr ani_char VAL1 = 'C';
    constexpr ani_char VAL2 = 'A';
    ani_object object {};
    GetMethodCharData(env, &object);

    ASSERT_EQ(env->Object_CallMethodByName_Char(object, "charByNameMethod", "cc:c", nullptr, VAL1, VAL2),
              ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Char_By_Name_07([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object1)
{
    constexpr ani_char VAL = 'a';
    constexpr ani_char VAL1 = 'C';
    constexpr ani_char VAL2 = 'A';
    ani_object object {};
    GetMethodCharData(env, &object);

    ani_char res = VAL;
    ASSERT_EQ(env->Object_CallMethodByName_Char(nullptr, "charByNameMethod", "cc:c", &res, VAL1, VAL2),
              ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Char_By_Name_08([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object1)
{
    constexpr ani_char VAL = 'a';
    ani_object object {};
    GetMethodCharData(env, &object);

    ani_char res = VAL;
    ASSERT_EQ(env->Object_CallMethodByName_Char(nullptr, "charByNameMethod", "cc:c", &res, nullptr), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Char_By_Name_09([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object1)
{
    constexpr ani_char VAL = 'a';
    constexpr ani_char VAL1 = 'C';
    constexpr ani_char VAL2 = 'A';
    constexpr ani_char VAL3 = 'H';
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ObjectOperationsMethodByNameChar.B", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_method method {};
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", "c:", &method), ANI_OK);

    ani_object obj {};
    ASSERT_EQ(env->Object_New(cls, method, &obj, VAL3), ANI_OK);

    ani_char sum = VAL;
    ASSERT_EQ(env->Object_CallMethodByName_Char(obj, "charMethod", "cc:c", &sum, VAL2, VAL1), ANI_OK);
    ASSERT_EQ(sum, VAL1);

    ani_value args[2U];
    args[0U].c = VAL2;
    args[1U].c = VAL1;
    ASSERT_EQ(env->Object_CallMethodByName_Char_A(obj, "charMethod", "cc:c", &sum, args), ANI_OK);
    ASSERT_EQ(sum, VAL1);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Char_By_Name_10([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object1)
{
    constexpr ani_char VAL = 'a';
    constexpr ani_char VAL3 = 'H';
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ObjectOperationsMethodByNameChar.B", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_method method {};
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", "c:", &method), ANI_OK);

    ani_object obj {};
    ASSERT_EQ(env->Object_New(cls, method, &obj, VAL3), ANI_OK);

    ani_char sum = VAL;
    const ani_char value1 = 'A';
    ASSERT_EQ(env->Object_CallMethodByName_Char(obj, "charMethod", "c:c", &sum, value1), ANI_OK);
    ASSERT_EQ(sum, VAL3);

    const ani_char value2 = 'Z';
    ani_value args[1U];
    args[0U].c = value2;
    ASSERT_EQ(env->Object_CallMethodByName_Char_A(obj, "charMethod", "c:c", &sum, args), ANI_OK);
    ASSERT_EQ(sum, value2);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Char_By_Name_11([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object1)
{
    constexpr ani_char VAL = 'a';
    constexpr ani_char VAL1 = 'C';
    constexpr ani_char VAL2 = 'A';
    constexpr ani_char VAL3 = 'H';
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ObjectOperationsMethodByNameChar.C", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_method method {};
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", "c:", &method), ANI_OK);

    ani_object obj {};
    ASSERT_EQ(env->Object_New(cls, method, &obj, VAL3), ANI_OK);

    ani_char sum = VAL;
    ASSERT_EQ(env->Object_CallMethodByName_Char(obj, "charComparisonMethod", "cc:c", &sum, VAL1, VAL2), ANI_OK);
    ASSERT_EQ(sum, VAL1);

    ani_value args[2U];
    args[0U].c = VAL1;
    args[1U].c = VAL2;
    ASSERT_EQ(env->Object_CallMethodByName_Char_A(obj, "charComparisonMethod", "cc:c", &sum, args), ANI_OK);
    ASSERT_EQ(sum, VAL1);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Char_By_Name_12([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object1)
{
    constexpr ani_char VAL = 'a';
    constexpr ani_char VAL1 = 'C';
    constexpr ani_char VAL2 = 'A';
    constexpr ani_char VAL3 = 'H';
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ObjectOperationsMethodByNameChar.C", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_method method {};
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", "c:", &method), ANI_OK);

    ani_object obj {};
    ASSERT_EQ(env->Object_New(cls, method, &obj, VAL3), ANI_OK);

    ani_char sum = VAL;
    ASSERT_EQ(env->Object_CallMethodByName_Char(obj, "charMethod", "cc:c", &sum, VAL1, VAL2), ANI_OK);
    ASSERT_EQ(sum, VAL2);

    ani_value args[2U];
    args[0U].c = VAL1;
    args[1U].c = VAL2;
    ASSERT_EQ(env->Object_CallMethodByName_Char_A(obj, "charMethod", "cc:c", &sum, args), ANI_OK);
    ASSERT_EQ(sum, VAL2);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Char_By_Name_13([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object1)
{
    constexpr ani_char VAL3 = 'H';
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ObjectOperationsMethodByNameChar.B", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_method method {};
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", "c:", &method), ANI_OK);

    ani_object obj {};
    ASSERT_EQ(env->Object_New(cls, method, &obj, VAL3), ANI_OK);

    ani_char num;
    const ani_char value1 = 'A';
    const ani_char value2 = 'V';
    ani_value argsA[1U];
    argsA[0U].c = value1;
    ASSERT_EQ(env->Object_CallMethodByName_Char(obj, "protectedMethod", "c:c", &num, value1), ANI_OK);
    ASSERT_EQ(num, VAL3);
    ASSERT_EQ(env->Object_CallMethodByName_Char_A(obj, "protectedMethod", "c:c", &num, argsA), ANI_OK);
    ASSERT_EQ(num, VAL3);

    ani_value argsB[2U];
    argsB[0U].c = value1;
    argsB[1U].c = value2;
    ASSERT_EQ(env->Object_CallMethodByName_Char(obj, "privateMethod", "cc:c", &num, value1, value2), ANI_OK);
    ASSERT_EQ(num, value2);
    ASSERT_EQ(env->Object_CallMethodByName_Char_A(obj, "privateMethod", "cc:c", &num, argsB), ANI_OK);
    ASSERT_EQ(num, value2);

    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ObjectOperationsMethodByNameChar.C", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", "c:", &method), ANI_OK);
    ASSERT_EQ(env->Object_New(cls, method, &obj, VAL3), ANI_OK);
    ASSERT_EQ(env->Object_CallMethodByName_Char(obj, "callProtected", "c:c", &num, value1), ANI_OK);
    ASSERT_EQ(num, VAL3);

    ASSERT_EQ(env->Object_CallMethodByName_Char_A(obj, "callProtected", "c:c", &num, argsA), ANI_OK);
    ASSERT_EQ(num, VAL3);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Char_By_Name_14([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object1)
{
    constexpr ani_char VAL = 'a';
    constexpr ani_char VAL3 = 'H';
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ObjectOperationsMethodByNameChar.B", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_method method {};
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", "c:", &method), ANI_OK);

    ani_object obj {};
    ASSERT_EQ(env->Object_New(cls, method, &obj, VAL3), ANI_OK);

    ani_char sum = VAL;
    const ani_char value = 'D';
    ASSERT_EQ(env->Object_CallMethodByName_Char(obj, "nestedMethod", "c:c", &sum, value), ANI_OK);
    ASSERT_EQ(sum, VAL3);

    ani_value args[1U];
    args[0U].c = value;
    ASSERT_EQ(env->Object_CallMethodByName_Char_A(obj, "nestedMethod", "c:c", &sum, args), ANI_OK);
    ASSERT_EQ(sum, VAL3);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Char_By_Name_15([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object1)
{
    constexpr ani_char VAL = 'a';
    constexpr ani_char VAL3 = 'H';
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ObjectOperationsMethodByNameChar.B", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_method method {};
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", "c:", &method), ANI_OK);

    ani_object obj {};
    ASSERT_EQ(env->Object_New(cls, method, &obj, VAL3), ANI_OK);

    ani_char sum = VAL;
    const ani_int value1 = 5;
    const ani_char result1 = 'Z';
    ASSERT_EQ(env->Object_CallMethodByName_Char(obj, "recursiveMethod", "i:c", &sum, value1), ANI_OK);
    ASSERT_EQ(sum, result1);

    const ani_int value2 = -1;
    const ani_char result2 = 'A';
    ani_value args[1U];
    args[0U].i = value2;
    ASSERT_EQ(env->Object_CallMethodByName_Char_A(obj, "recursiveMethod", "i:c", &sum, args), ANI_OK);
    ASSERT_EQ(sum, result2);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Char_By_Name_16([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object1)
{
    constexpr ani_char VAL = 'a';
    constexpr ani_char VAL1 = 'C';
    constexpr ani_char VAL2 = 'A';
    constexpr ani_char VAL3 = 'H';
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ObjectOperationsMethodByNameChar.B", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_method method {};
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", "c:", &method), ANI_OK);

    ani_object obj {};
    ASSERT_EQ(env->Object_New(cls, method, &obj, VAL3), ANI_OK);

    ani_char sum = VAL;
    const ani_double dValue1 = 1.0;
    const ani_int iValue1 = 1;
    ASSERT_EQ(env->Object_CallMethodByName_Char(obj, "calculateSum", "ccdi:c", &sum, VAL1, VAL2, dValue1, iValue1),
              ANI_OK);
    ASSERT_EQ(sum, VAL3);

    const ani_double dValue2 = 2.0;
    ani_value args[4U];
    args[0U].c = VAL1;
    args[1U].c = VAL2;
    args[2U].d = dValue2;
    args[3U].i = iValue1;
    ASSERT_EQ(env->Object_CallMethodByName_Char_A(obj, "calculateSum", "ccdi:c", &sum, args), ANI_OK);
    ASSERT_EQ(sum, VAL1);

    const ani_int iValue2 = 2;
    ASSERT_EQ(env->Object_CallMethodByName_Char(obj, "calculateSum", "ccdi:c", &sum, VAL1, VAL2, dValue2, iValue2),
              ANI_OK);
    ASSERT_EQ(sum, VAL2);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Char_By_Name_17([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object1)
{
    constexpr ani_char VAL = 'a';
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ObjectOperationsMethodByNameChar.B", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_method method {};
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", "c:", &method), ANI_OK);

    ani_object obj {};
    ASSERT_EQ(env->Object_New(cls, method, &obj, VAL3), ANI_OK);

    ani_char sum = VAL;
    const ani_char value1 = 'D';
    const ani_char value2 = 'S';
    ASSERT_EQ(env->Object_CallMethodByName_Char(obj, "charMethod", "cc:c", &sum, value1, value2), ANI_OK);
    ASSERT_EQ(sum, value2);

    const ani_char value3 = 'D';
    ASSERT_EQ(env->Object_CallMethodByName_Char(obj, "charMethod", "cc:c", &sum, value1, value3), ANI_OK);
    ASSERT_EQ(sum, value3);

    const ani_char value4 = 'Z';
    ani_value args[2U];
    args[0U].c = value1;
    args[1U].c = value4;
    ASSERT_EQ(env->Object_CallMethodByName_Char_A(obj, "charMethod", "cc:c", &sum, args), ANI_OK);
    ASSERT_EQ(sum, value4);

    const ani_char value5 = 'A';
    ASSERT_EQ(env->Object_CallMethodByName_Char(obj, "charMethod", "cc:c", &sum, value1, value5), ANI_OK);
    ASSERT_EQ(sum, value1);

    const ani_char value6 = 'B';
    ASSERT_EQ(env->Object_CallMethodByName_Char(obj, "charMethod", "cc:c", &sum, value1, value6), ANI_OK);
    ASSERT_EQ(sum, value1);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Char_By_Name_18([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object1)
{
    constexpr ani_char VAL = 'a';
    constexpr ani_char VAL3 = 'H';
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ObjectOperationsMethodByNameChar.C", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_method method {};
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", "c:", &method), ANI_OK);

    ani_object obj {};
    ASSERT_EQ(env->Object_New(cls, method, &obj, VAL3), ANI_OK);

    ani_char sum = VAL;
    const ani_char value = 'C';
    ASSERT_EQ(env->Object_CallMethodByName_Char(obj, "jf", "c:c", &sum, value), ANI_OK);
    ASSERT_EQ(sum, value);

    ani_value args[1U];
    args[0U].c = value;
    ASSERT_EQ(env->Object_CallMethodByName_Char_A(obj, "jf", "c:c", &sum, args), ANI_OK);
    ASSERT_EQ(sum, value);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Char_By_Name_19([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object1)
{
    constexpr ani_char VAL = 'a';
    constexpr ani_char VAL1 = 'C';
    constexpr ani_char VAL2 = 'A';
    ani_object object {};
    GetMethodCharData(env, &object);

    ani_value args[2U];
    args[0U].c = VAL1;
    args[1U].c = VAL2;

    ani_char res = VAL;
    ASSERT_EQ(env->c_api->Object_CallMethodByName_Char(nullptr, object, "charByNameMethod", "cc:c", &res, VAL1, VAL2),
              ANI_INVALID_ARGS);
    ASSERT_EQ(env->c_api->Object_CallMethodByName_Char_A(nullptr, object, "charByNameMethod", "cc:c", &res, args),
              ANI_INVALID_ARGS);

    ASSERT_EQ(env->Object_CallMethodByName_Char(nullptr, "charByNameMethod", "cc:c", &res, VAL1, VAL2),
              ANI_INVALID_ARGS);
    ASSERT_EQ(env->Object_CallMethodByName_Char_A(nullptr, "charByNameMethod", "cc:c", &res, args), ANI_INVALID_ARGS);

    ASSERT_EQ(env->Object_CallMethodByName_Char(object, nullptr, "cc:c", &res, VAL1, VAL2), ANI_INVALID_ARGS);
    ASSERT_EQ(env->Object_CallMethodByName_Char_A(object, nullptr, "cc:c", &res, args), ANI_INVALID_ARGS);

    ASSERT_EQ(env->Object_CallMethodByName_Char(object, "charByNameMethod", nullptr, &res, VAL1, VAL2), ANI_OK);
    ASSERT_EQ(env->Object_CallMethodByName_Char_A(object, "charByNameMethod", nullptr, &res, args), ANI_OK);

    ASSERT_EQ(env->Object_CallMethodByName_Char(object, "charByNameMethod", "cc:c", nullptr, VAL1, VAL2),
              ANI_INVALID_ARGS);
    ASSERT_EQ(env->Object_CallMethodByName_Char_A(object, "charByNameMethod", "cc:c", nullptr, args),
              ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Char_By_Name_20([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object1)
{
    constexpr ani_char VAL = 'a';
    constexpr ani_char VAL1 = 'C';
    constexpr ani_char VAL2 = 'A';
    ani_object object {};
    GetMethodCharData(env, &object);

    ani_value args[2U];
    args[0U].c = VAL1;
    args[1U].c = VAL2;

    ani_char res = VAL;
    const std::array<std::string_view, 4U> invalidMethodNames = {{"", "测试emoji🙂🙂", "\n\r\t", "\x01\x02\x03"}};

    for (const auto &methodName : invalidMethodNames) {
        ASSERT_EQ(env->Object_CallMethodByName_Char(object, methodName.data(), "cc:c", &res, VAL1, VAL2),
                  ANI_NOT_FOUND);
        ASSERT_EQ(env->Object_CallMethodByName_Char_A(object, methodName.data(), "cc:c", &res, args), ANI_NOT_FOUND);
    }
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Char_By_Name_21([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object1)
{
    constexpr ani_char VAL = 'a';
    constexpr ani_char VAL1 = 'C';
    constexpr ani_char VAL2 = 'A';
    ani_object object {};
    GetMethodCharData(env, &object);

    ani_value args[2U];
    args[0U].c = VAL1;
    args[1U].c = VAL2;

    ani_char res = VAL;
    const std::array<std::string_view, 4U> invalidMethodNames = {{"", "测试emoji🙂🙂", "\n\r\t", "\x01\x02\x03"}};

    for (const auto &methodName : invalidMethodNames) {
        ASSERT_EQ(env->Object_CallMethodByName_Char(object, "charByNameMethod", methodName.data(), &res, VAL1, VAL2),
                  ANI_INVALID_DESCRIPTOR);
        ASSERT_EQ(env->Object_CallMethodByName_Char_A(object, "charByNameMethod", methodName.data(), &res, args),
                  ANI_INVALID_DESCRIPTOR);
    }
    return ANI_TRUE;
}

ani_int GetMethodDataDouble(ani_env *env, ani_object *objectResult)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ObjectOperationsMethodByNameDouble.A", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_static_method newMethod {};
    ASSERT_EQ(
        env->Class_FindStaticMethod(cls,
            "new_A", ":C{entry.src.main.src.ets.ObjectOperationsMethodByNameDouble.A}", &newMethod),
        ANI_OK);
    ani_ref ref {};
    ASSERT_EQ(env->Class_CallStaticMethod_Ref(cls, newMethod, &ref), ANI_OK);

    *objectResult = static_cast<ani_object>(ref);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Double_By_Name_01([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object1)
{
    constexpr ani_double VAL1 = 2.0;
    constexpr ani_double VAL2 = 3.0;
    ani_object object {};
    GetMethodDataDouble(env, &object);

    ani_value args[2U];
    args[0U].d = VAL1;
    args[1U].d = VAL2;
    ani_double sum = 0.0;

    ASSERT_EQ(env->Object_CallMethodByName_Double_A(object, "doubleMethod", "dd:d", &sum, args), ANI_OK);
    ASSERT_EQ(sum, VAL1 + VAL2);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Double_By_Name_02([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object1)
{
    constexpr ani_double VAL1 = 2.0;
    constexpr ani_double VAL2 = 3.0;
    ani_object object {};
    GetMethodDataDouble(env, &object);

    ani_value args[2U];
    args[0U].d = VAL1;
    args[1U].d = VAL2;
    ani_double sum = 0.0;

    ASSERT_EQ(env->Object_CallMethodByName_Double_A(object, "doubleMethod", nullptr, &sum, args), ANI_OK);
    ASSERT_EQ(sum, VAL1 + VAL2);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Double_By_Name_03([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object1)
{
    constexpr ani_double VAL1 = 2.0;
    constexpr ani_double VAL2 = 3.0;
    ani_object object {};
    GetMethodDataDouble(env, &object);

    ani_value args[2U];
    args[0U].d = VAL1;
    args[1U].d = VAL2;
    ani_double sum = 0.0;
    ASSERT_EQ(env->Object_CallMethodByName_Double_A(object, "xxxxxxx", "dd:d", &sum, args), ANI_NOT_FOUND);
    ASSERT_EQ(env->Object_CallMethodByName_Double_A(object, "doubleMethod", "dd:i", &sum, args), ANI_NOT_FOUND);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Double_By_Name_04([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object1)
{
    constexpr ani_double VAL1 = 2.0;
    constexpr ani_double VAL2 = 3.0;
    ani_value args[2U];
    args[0U].d = VAL1;
    args[1U].d = VAL2;
    ani_double sum = 0.0;
    ASSERT_EQ(env->Object_CallMethodByName_Double_A(nullptr, "doubleMethod", "dd:d", &sum, args), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Double_By_Name_05([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object1)
{
    constexpr ani_double VAL1 = 2.0;
    constexpr ani_double VAL2 = 3.0;
    ani_object object {};
    GetMethodDataDouble(env, &object);

    ani_value args[2U];
    args[0U].d = VAL1;
    args[1U].d = VAL2;
    ani_double sum = 0.0;
    ASSERT_EQ(env->Object_CallMethodByName_Double_A(object, nullptr, "dd:d", &sum, args), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Double_By_Name_06([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object1)
{
    constexpr ani_double VAL1 = 2.0;
    constexpr ani_double VAL2 = 3.0;
    ani_object object {};
    GetMethodDataDouble(env, &object);

    ani_value args[2U];
    args[0U].d = VAL1;
    args[1U].d = VAL2;
    ASSERT_EQ(env->Object_CallMethodByName_Double_A(object, "doubleMethod", "dd:d", nullptr, args), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Double_By_Name_07([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object1)
{
    ani_object object {};
    GetMethodDataDouble(env, &object);

    ani_double sum = 0.0;
    ASSERT_EQ(env->Object_CallMethodByName_Double_A(object, "doubleMethod", "dd:d", &sum, nullptr), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Double_By_Name_08([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object1)
{
    constexpr ani_double VAL1 = 2.0;
    constexpr ani_double VAL2 = 3.0;
    ani_object object {};
    GetMethodDataDouble(env, &object);

    ani_double sum = 0.0;
    ASSERT_EQ(env->Object_CallMethodByName_Double(object, "doubleMethod", "dd:d", &sum, VAL1, VAL2), ANI_OK);
    ASSERT_EQ(sum, VAL1 + VAL2);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Double_By_Name_09([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object1)
{
    constexpr ani_double VAL1 = 2.0;
    constexpr ani_double VAL2 = 3.0;
    ani_object object {};
    GetMethodDataDouble(env, &object);

    ani_double sum = 0.0;
    ASSERT_EQ(env->Object_CallMethodByName_Double(object, "doubleMethod", nullptr, &sum, VAL1, VAL2), ANI_OK);
    ASSERT_EQ(sum, VAL1 + VAL2);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Double_By_Name_10([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object1)
{
    constexpr ani_double VAL1 = 2.0;
    constexpr ani_double VAL2 = 3.0;
    ani_object object {};
    GetMethodDataDouble(env, &object);

    ani_double sum = 0.0;
    ASSERT_EQ(env->Object_CallMethodByName_Double(object, "xxxxxxx", "dd:d", &sum, VAL1, VAL2), ANI_NOT_FOUND);
    ASSERT_EQ(env->Object_CallMethodByName_Double(object, "doubleMethod", "dd:i", &sum, VAL1, VAL2), ANI_NOT_FOUND);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Double_By_Name_11([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object1)
{
    constexpr ani_double VAL1 = 2.0;
    constexpr ani_double VAL2 = 3.0;
    ani_double sum = 0.0;
    ASSERT_EQ(env->Object_CallMethodByName_Double(nullptr, "doubleMethod", "dd:d", &sum, VAL1, VAL2),
              ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Double_By_Name_12([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object1)
{
    constexpr ani_double VAL1 = 2.0;
    constexpr ani_double VAL2 = 3.0;
    ani_object object {};
    GetMethodDataDouble(env, &object);

    ani_double sum = 0.0;
    ASSERT_EQ(env->Object_CallMethodByName_Double(object, nullptr, "dd:d", &sum, VAL1, VAL2), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Double_By_Name_13([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object1)
{
    constexpr ani_double VAL1 = 2.0;
    constexpr ani_double VAL2 = 3.0;
    ani_object object {};
    GetMethodDataDouble(env, &object);

    ASSERT_EQ(env->Object_CallMethodByName_Double(object, "doubleMethod", "dd:d", nullptr, VAL1, VAL2),
              ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Double_By_Name_14([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object1)
{
    constexpr ani_double VAL1 = 2.0;
    constexpr ani_double VAL2 = 3.0;
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ObjectOperationsMethodByNameDouble.B", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_method method {};
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", "d:", &method), ANI_OK);

    ani_object obj {};
    const ani_double arg = 100.0;
    ASSERT_EQ(env->Object_New(cls, method, &obj, arg), ANI_OK);

    ani_double sum = 0.0;
    ASSERT_EQ(env->Object_CallMethodByName_Double(obj, "doubleMethod", "dd:d", &sum, VAL1, VAL2), ANI_OK);
    ASSERT_EQ(sum, arg);

    ani_value args[2U];
    args[0U].d = VAL1;
    args[1U].d = VAL2;
    ASSERT_EQ(env->Object_CallMethodByName_Double_A(obj, "doubleMethod", "dd:d", &sum, args), ANI_OK);
    ASSERT_EQ(sum, arg);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Double_By_Name_15([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object1)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ObjectOperationsMethodByNameDouble.B", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_method method {};
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", "d:", &method), ANI_OK);

    ani_object obj {};
    const ani_double arg = 100.0;
    ASSERT_EQ(env->Object_New(cls, method, &obj, arg), ANI_OK);

    ani_double sum = 0.0;
    const ani_double value = 5.0;
    ASSERT_EQ(env->Object_CallMethodByName_Double(obj, "doubleMethod", "d:d", &sum, value), ANI_OK);
    ASSERT_EQ(sum, arg);

    ani_value args[1U];
    args[0U].d = value;
    ASSERT_EQ(env->Object_CallMethodByName_Double_A(obj, "doubleMethod", "d:d", &sum, args), ANI_OK);
    ASSERT_EQ(sum, arg);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Double_By_Name_16([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object1)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ObjectOperationsMethodByNameDouble.C", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_method method {};
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", "d:", &method), ANI_OK);

    ani_object obj {};
    const ani_double arg = 100.0;
    ASSERT_EQ(env->Object_New(cls, method, &obj, arg), ANI_OK);

    ani_double sum = 0.0;
    const ani_double value1 = 5.0;
    const ani_double value2 = 8.0;
    ASSERT_EQ(env->Object_CallMethodByName_Double(obj, "doubleAddMethod", "dd:d", &sum, value1, value2), ANI_OK);
    ASSERT_EQ(sum, arg + value1 + value2);

    ani_value args[2U];
    args[0U].d = value1;
    args[1U].d = value2;
    ASSERT_EQ(env->Object_CallMethodByName_Double_A(obj, "doubleAddMethod", "dd:d", &sum, args), ANI_OK);
    ASSERT_EQ(sum, arg + value1 + value2);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Double_By_Name_17([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object1)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ObjectOperationsMethodByNameDouble.C", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_method method {};
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", "d:", &method), ANI_OK);

    ani_object obj {};
    const ani_double arg = 100.0;
    ASSERT_EQ(env->Object_New(cls, method, &obj, arg), ANI_OK);

    ani_double sum = 0.0;
    const ani_double value1 = 5.0;
    const ani_double value2 = 8.0;
    ASSERT_EQ(env->Object_CallMethodByName_Double(obj, "doubleMethod", "dd:d", &sum, value1, value2), ANI_OK);
    ASSERT_EQ(sum, arg - value1 - value2);

    ani_value args[2U];
    args[0U].d = value1;
    args[1U].d = value2;
    ASSERT_EQ(env->Object_CallMethodByName_Double_A(obj, "doubleMethod", "dd:d", &sum, args), ANI_OK);
    ASSERT_EQ(sum, arg - value1 - value2);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Double_By_Name_18([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object1)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ObjectOperationsMethodByNameDouble.B", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_method method {};
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", "d:", &method), ANI_OK);

    ani_object obj {};
    const ani_double arg = 100.0;
    ASSERT_EQ(env->Object_New(cls, method, &obj, arg), ANI_OK);

    ani_double num = 0.0;
    const ani_double value = 5.0;
    ani_value args[1U];
    args[0U].d = value;
    ASSERT_EQ(env->Object_CallMethodByName_Double(obj, "protectedMethod", "d:d", &num, value), ANI_OK);
    ASSERT_EQ(num, arg + value);
    ASSERT_EQ(env->Object_CallMethodByName_Double_A(obj, "protectedMethod", "d:d", &num, args), ANI_OK);
    ASSERT_EQ(num, arg + value);

    ASSERT_EQ(env->Object_CallMethodByName_Double(obj, "privateMethod", "d:d", &num, value), ANI_OK);
    ASSERT_EQ(num, arg - value);
    ASSERT_EQ(env->Object_CallMethodByName_Double_A(obj, "privateMethod", "d:d", &num, args), ANI_OK);
    ASSERT_EQ(num, arg - value);

    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ObjectOperationsMethodByNameDouble.C", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", "d:", &method), ANI_OK);
    ASSERT_EQ(env->Object_New(cls, method, &obj, arg), ANI_OK);
    ASSERT_EQ(env->Object_CallMethodByName_Double(obj, "callProtected", "d:d", &num, value), ANI_OK);
    ASSERT_EQ(num, arg + value);
    ASSERT_EQ(env->Object_CallMethodByName_Double_A(obj, "callProtected", "d:d", &num, args), ANI_OK);
    ASSERT_EQ(num, arg + value);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Double_By_Name_19([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object1)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ObjectOperationsMethodByNameDouble.B", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_method method {};
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", "d:", &method), ANI_OK);

    ani_object obj {};
    const ani_double arg = 6.0;
    ASSERT_EQ(env->Object_New(cls, method, &obj, arg), ANI_OK);

    ani_double sum = 0.0;
    const ani_double value = 5.0;
    ASSERT_EQ(env->Object_CallMethodByName_Double(obj, "nestedMethod", "d:d", &sum, value), ANI_OK);
    ASSERT_EQ(sum, arg + value);

    ani_value args[1U];
    args[0U].d = value;
    ASSERT_EQ(env->Object_CallMethodByName_Double_A(obj, "nestedMethod", "d:d", &sum, args), ANI_OK);
    ASSERT_EQ(sum, arg + value);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Double_By_Name_20([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object1)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ObjectOperationsMethodByNameDouble.B", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_method method {};
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", "d:", &method), ANI_OK);

    ani_object obj {};
    const ani_double arg = 6.0;
    ASSERT_EQ(env->Object_New(cls, method, &obj, arg), ANI_OK);

    ani_double sum = 0.0;
    const ani_int value1 = 5;
    const ani_double result = 120;
    ASSERT_EQ(env->Object_CallMethodByName_Double(obj, "recursiveMethod", "i:d", &sum, value1), ANI_OK);
    ASSERT_EQ(sum, result);

    ani_value args[1U];
    args[0U].i = value1;
    ASSERT_EQ(env->Object_CallMethodByName_Double_A(obj, "recursiveMethod", "i:d", &sum, args), ANI_OK);
    ASSERT_EQ(sum, result);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Double_By_Name_21([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object1)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ObjectOperationsMethodByNameDouble.B", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_method method {};
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", "d:", &method), ANI_OK);

    ani_object obj {};
    const ani_double arg = 6.0;
    ASSERT_EQ(env->Object_New(cls, method, &obj, arg), ANI_OK);

    ani_double sum = 0.0;
    const ani_double value1 = 1.0;
    const ani_char value2 = 'A';
    const ani_int value3 = 1;
    ASSERT_EQ(env->Object_CallMethodByName_Double(obj, "calculateSum", "dci:d", &sum, value1, value2, value3), ANI_OK);
    ASSERT_EQ(sum, arg - value1);

    const ani_char value4 = 'B';
    ani_value args[3U];
    args[0U].d = value1;
    args[1U].c = value4;
    args[2U].i = value3;
    ASSERT_EQ(env->Object_CallMethodByName_Double_A(obj, "calculateSum", "dci:d", &sum, args), ANI_OK);
    ASSERT_EQ(sum, value1);

    const ani_int value5 = 2U;
    ASSERT_EQ(env->Object_CallMethodByName_Double(obj, "calculateSum", "dci:d", &sum, value1, value4, value5), ANI_OK);
    ASSERT_EQ(sum, arg + value1);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Double_By_Name_22([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object1)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ObjectOperationsMethodByNameDouble.B", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_method method {};
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", "d:", &method), ANI_OK);

    ani_object obj {};
    const ani_double arg = 15.0;
    ASSERT_EQ(env->Object_New(cls, method, &obj, arg), ANI_OK);

    ani_double sum = 0.0;
    const ani_double value1 = 5.0;
    const ani_double value2 = 6.0;
    ASSERT_EQ(env->Object_CallMethodByName_Double(obj, "doubleMethod", "dd:d", &sum, value1, value2), ANI_OK);
    ASSERT_EQ(sum, arg);

    const ani_double value3 = 7.0;
    ASSERT_EQ(env->Object_CallMethodByName_Double(obj, "doubleMethod", "dd:d", &sum, value1, value3), ANI_OK);
    ASSERT_EQ(sum, arg);

    const ani_double value4 = 3.0;
    ani_value args[2U];
    args[0U].d = value1;
    args[1U].d = value4;
    ASSERT_EQ(env->Object_CallMethodByName_Double_A(obj, "doubleMethod", "dd:d", &sum, args), ANI_OK);
    ASSERT_EQ(sum, arg);

    const ani_double value5 = 10.0;
    ASSERT_EQ(env->Object_CallMethodByName_Double(obj, "doubleMethod", "dd:d", &sum, value1, value5), ANI_OK);
    ASSERT_EQ(sum, value1 + value5);

    const ani_double value6 = 12.0;
    ASSERT_EQ(env->Object_CallMethodByName_Double(obj, "doubleMethod", "dd:d", &sum, value1, value6), ANI_OK);
    ASSERT_EQ(sum, value1 + value6);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Double_By_Name_23([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object1)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ObjectOperationsMethodByNameDouble.C", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_method method {};
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", "d:", &method), ANI_OK);

    ani_object obj {};
    const ani_double arg = 10.0;
    ASSERT_EQ(env->Object_New(cls, method, &obj, arg), ANI_OK);

    ani_double sum = 0.0;
    const ani_double value = 2.0;
    ASSERT_EQ(env->Object_CallMethodByName_Double(obj, "jf", "d:d", &sum, value), ANI_OK);
    ASSERT_EQ(sum, arg + value);

    ani_value args[1U];
    args[0U].d = value;
    ASSERT_EQ(env->Object_CallMethodByName_Double_A(obj, "jf", "d:d", &sum, args), ANI_OK);
    ASSERT_EQ(sum, arg + value);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Double_By_Name_24([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object1)
{
    ani_object obj {};
    GetMethodDataDouble(env, &obj);

    ani_double sum = 0.0;
    const ani_double value1 = std::numeric_limits<ani_double>::max();
    const ani_double value2 = 0;
    ani_value args1[2U];
    args1[0U].d = value1;
    args1[1U].d = value2;
    ASSERT_EQ(env->Object_CallMethodByName_Double(obj, "doubleMethod", "dd:d", &sum, value1, value2), ANI_OK);
    ASSERT_EQ(sum, value1 + value2);
    ASSERT_EQ(env->Object_CallMethodByName_Double_A(obj, "doubleMethod", "dd:d", &sum, args1), ANI_OK);
    ASSERT_EQ(sum, value1 + value2);

    const ani_double value3 = std::numeric_limits<ani_double>::min();
    ani_value args2[2U];
    args2[0U].d = value3;
    args2[1U].d = value2;
    ASSERT_EQ(env->Object_CallMethodByName_Double(obj, "doubleMethod", "dd:d", &sum, value3, value2), ANI_OK);
    ASSERT_EQ(sum, value3 + value2);
    ASSERT_EQ(env->Object_CallMethodByName_Double_A(obj, "doubleMethod", "dd:d", &sum, args2), ANI_OK);
    ASSERT_EQ(sum, value3 + value2);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Double_By_Name_25([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object1)
{
    constexpr ani_double VAL1 = 2.0;
    constexpr ani_double VAL2 = 3.0;
    ani_object object {};
    GetMethodDataDouble(env, &object);

    ani_value args[2U];
    args[0U].d = VAL1;
    args[1U].d = VAL2;

    ani_double res = 0.0;
    ASSERT_EQ(env->c_api->Object_CallMethodByName_Double(nullptr, object, "doubleMethod", "dd:d", &res, VAL1, VAL2),
              ANI_INVALID_ARGS);
    ASSERT_EQ(env->c_api->Object_CallMethodByName_Double_A(nullptr, object, "doubleMethod", "dd:d", &res, args),
              ANI_INVALID_ARGS);

    ASSERT_EQ(env->Object_CallMethodByName_Double(nullptr, "doubleMethod", "dd:d", &res, VAL1, VAL2),
              ANI_INVALID_ARGS);
    ASSERT_EQ(env->Object_CallMethodByName_Double_A(nullptr, "doubleMethod", "dd:d", &res, args), ANI_INVALID_ARGS);

    ASSERT_EQ(env->Object_CallMethodByName_Double(object, nullptr, "dd:d", &res, VAL1, VAL2), ANI_INVALID_ARGS);
    ASSERT_EQ(env->Object_CallMethodByName_Double_A(object, nullptr, "dd:d", &res, args), ANI_INVALID_ARGS);

    ASSERT_EQ(env->Object_CallMethodByName_Double(object, "doubleMethod", nullptr, &res, VAL1, VAL2), ANI_OK);
    ASSERT_EQ(env->Object_CallMethodByName_Double_A(object, "doubleMethod", nullptr, &res, args), ANI_OK);

    ASSERT_EQ(env->Object_CallMethodByName_Double(object, "doubleMethod", "dd:d", nullptr, VAL1, VAL2),
              ANI_INVALID_ARGS);
    ASSERT_EQ(env->Object_CallMethodByName_Double_A(object, "doubleMethod", "dd:d", nullptr, args), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Double_By_Name_26([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object1)
{
    constexpr ani_double VAL1 = 2.0;
    constexpr ani_double VAL2 = 3.0;
    ani_object object {};
    GetMethodDataDouble(env, &object);

    ani_value args[2U];
    args[0U].d = VAL1;
    args[1U].d = VAL2;

    ani_double res = 0.0;
    const std::array<std::string_view, 4U> invalidMethodNames = {{"", "测试emoji🙂🙂", "\n\r\t", "\x01\x02\x03"}};

    for (const auto &methodName : invalidMethodNames) {
        ASSERT_EQ(env->Object_CallMethodByName_Double(object, methodName.data(), "dd:d", &res, VAL1, VAL2),
                  ANI_NOT_FOUND);
        ASSERT_EQ(env->Object_CallMethodByName_Double_A(object, methodName.data(), "dd:d", &res, args), ANI_NOT_FOUND);
    }
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Double_By_Name_27([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object1)
{
    constexpr ani_double VAL1 = 2.0;
    constexpr ani_double VAL2 = 3.0;
    ani_object object {};
    GetMethodDataDouble(env, &object);

    ani_value args[2U];
    args[0U].d = VAL1;
    args[1U].d = VAL2;

    ani_double res = 0.0;
    const std::array<std::string_view, 4U> invalidMethodNames = {{"", "测试emoji🙂🙂", "\n\r\t", "\x01\x02\x03"}};

    for (const auto &methodName : invalidMethodNames) {
        ASSERT_EQ(env->Object_CallMethodByName_Double(object, methodName.data(), "", &res, VAL1, VAL2),
                     ANI_INVALID_DESCRIPTOR);
        ASSERT_EQ(env->Object_CallMethodByName_Double_A(object, methodName.data(), "", &res, args),
                     ANI_INVALID_DESCRIPTOR);
    }
    return ANI_TRUE;
}

ani_int GetMethodDataFloat(ani_env *env, ani_object *objectResult)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ObjectOperationsMethodByNameFloat.A", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_static_method newMethod {};
    ASSERT_EQ(env->Class_FindStaticMethod(cls,
                  "new_A", ":C{entry.src.main.src.ets.ObjectOperationsMethodByNameFloat.A}", &newMethod),
        ANI_OK);
    ani_ref ref {};
    ASSERT_EQ(env->Class_CallStaticMethod_Ref(cls, newMethod, &ref), ANI_OK);

    *objectResult = static_cast<ani_object>(ref);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Float_By_Name_01([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object obj)
{
    constexpr ani_float VAL1 = 2.0F;
    constexpr ani_float VAL2 = 3.0F;
    ani_object object {};
    GetMethodDataFloat(env, &object);

    ani_value args[2U];
    args[0U].f = VAL1;
    args[1U].f = VAL2;
    ani_float sum = 0.0F;
    ASSERT_EQ(env->Object_CallMethodByName_Float_A(object, "floatMethod", "ff:f", &sum, args), ANI_OK);
    ASSERT_EQ(sum, VAL1 + VAL2);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Float_By_Name_02([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object obj)
{
    constexpr ani_float VAL1 = 2.0F;
    constexpr ani_float VAL2 = 3.0F;
    ani_object object {};
    GetMethodDataFloat(env, &object);

    ani_value args[2U];
    args[0U].f = VAL1;
    args[1U].f = VAL2;
    ani_float sum = 0.0F;
    ASSERT_EQ(env->Object_CallMethodByName_Float_A(object, "floatMethod", nullptr, &sum, args), ANI_OK);
    ASSERT_EQ(sum, VAL1 + VAL2);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Float_By_Name_03([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object obj)
{
    constexpr ani_float VAL1 = 2.0F;
    constexpr ani_float VAL2 = 3.0F;
    ani_object object {};
    GetMethodDataFloat(env, &object);

    ani_value args[2U];
    args[0U].f = VAL1;
    args[1U].f = VAL2;
    ani_float sum = 0.0F;
    ASSERT_EQ(env->Object_CallMethodByName_Float_A(object, "xxxxxxxxx", "ff:f", &sum, args), ANI_NOT_FOUND);
    ASSERT_EQ(env->Object_CallMethodByName_Float_A(object, "floatMethod", "ff:i", &sum, args), ANI_NOT_FOUND);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Float_By_Name_04([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object obj)
{
    constexpr ani_float VAL1 = 2.0F;
    constexpr ani_float VAL2 = 3.0F;
    ani_value args[2U];
    args[0U].f = VAL1;
    args[1U].f = VAL2;
    ani_float sum = 0.0F;
    ASSERT_EQ(env->Object_CallMethodByName_Float_A(nullptr, "floatMethod", "ff:f", &sum, args), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Float_By_Name_05([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object obj)
{
    constexpr ani_float VAL1 = 2.0F;
    constexpr ani_float VAL2 = 3.0F;
    ani_object object {};
    GetMethodDataFloat(env, &object);

    ani_value args[2U];
    args[0U].f = VAL1;
    args[1U].f = VAL2;
    ani_float sum = 0.0F;
    ASSERT_EQ(env->Object_CallMethodByName_Float_A(object, nullptr, "ff:f", &sum, args), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Float_By_Name_06([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object obj)
{
    constexpr ani_float VAL1 = 2.0F;
    constexpr ani_float VAL2 = 3.0F;
    ani_object object {};
    GetMethodDataFloat(env, &object);

    ani_value args[2U];
    args[0U].f = VAL1;
    args[1U].f = VAL2;
    ASSERT_EQ(env->Object_CallMethodByName_Float_A(object, "floatMethod", "ff:f", nullptr, args), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Float_By_Name_07([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object obj)
{
    ani_object object {};
    GetMethodDataFloat(env, &object);

    ani_float sum = 0.0F;
    ASSERT_EQ(env->Object_CallMethodByName_Float_A(object, "floatMethod", "ff:f", &sum, nullptr), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Float_By_Name_08([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object obj)
{
    constexpr ani_float VAL1 = 2.0F;
    constexpr ani_float VAL2 = 3.0F;
    ani_object object {};
    GetMethodDataFloat(env, &object);

    ani_float sum = 0.0F;
    ASSERT_EQ(env->Object_CallMethodByName_Float(object, "floatMethod", "ff:f", &sum, VAL1, VAL2), ANI_OK);
    ASSERT_EQ(sum, VAL1 + VAL2);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Float_By_Name_09([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object obj)
{
    constexpr ani_float VAL1 = 2.0F;
    constexpr ani_float VAL2 = 3.0F;
    ani_object object {};
    GetMethodDataFloat(env, &object);

    ani_float sum = 0.0F;
    ASSERT_EQ(env->Object_CallMethodByName_Float(object, "floatMethod", nullptr, &sum, VAL1, VAL2), ANI_OK);
    ASSERT_EQ(sum, VAL1 + VAL2);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Float_By_Name_10([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object obj)
{
    constexpr ani_float VAL1 = 2.0F;
    constexpr ani_float VAL2 = 3.0F;
    ani_object object {};
    GetMethodDataFloat(env, &object);

    ani_float sum = 0.0F;
    ASSERT_EQ(env->Object_CallMethodByName_Float(object, "xxxxxxxxxx", "ff:f", &sum, VAL1, VAL2), ANI_NOT_FOUND);
    ASSERT_EQ(env->Object_CallMethodByName_Float(object, "floatMethod", "ff:i", &sum, VAL1, VAL2), ANI_NOT_FOUND);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Float_By_Name_11([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object obj)
{
    constexpr ani_float VAL1 = 2.0F;
    constexpr ani_float VAL2 = 3.0F;
    ani_float sum = 0.0F;
    ASSERT_EQ(env->Object_CallMethodByName_Float(nullptr, "floatMethod", "ff:f", &sum, VAL1, VAL2), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Float_By_Name_12([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object obj)
{
    constexpr ani_float VAL1 = 2.0F;
    constexpr ani_float VAL2 = 3.0F;
    ani_object object {};
    GetMethodDataFloat(env, &object);

    ani_float sum = 0.0F;
    ASSERT_EQ(env->Object_CallMethodByName_Float(object, nullptr, "ff:f", &sum, VAL1, VAL2), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Float_By_Name_13([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object obj)
{
    constexpr ani_float VAL1 = 2.0F;
    constexpr ani_float VAL2 = 3.0F;
    ani_object object {};
    GetMethodDataFloat(env, &object);

    ASSERT_EQ(env->Object_CallMethodByName_Float(object, "floatMethod", "ff:f", nullptr, VAL1, VAL2),
              ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Float_By_Name_14([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_float VAL1 = 2.0F;
    constexpr ani_float VAL2 = 3.0F;
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ObjectOperationsMethodByNameFloat.B", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_method method {};
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", "f:", &method), ANI_OK);

    ani_object obj {};
    const ani_float arg = 100.0F;
    ASSERT_EQ(env->Object_New(cls, method, &obj, arg), ANI_OK);

    ani_float sum = 0.0F;
    ASSERT_EQ(env->Object_CallMethodByName_Float(obj, "floatMethod", "ff:f", &sum, VAL1, VAL2), ANI_OK);
    ASSERT_EQ(sum, arg);

    ani_value args[2U];
    args[0U].f = VAL1;
    args[1U].f = VAL2;
    ASSERT_EQ(env->Object_CallMethodByName_Float_A(obj, "floatMethod", "ff:f", &sum, args), ANI_OK);
    ASSERT_EQ(sum, arg);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Float_By_Name_15([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ObjectOperationsMethodByNameFloat.B", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_method method {};
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", "f:", &method), ANI_OK);

    ani_object obj {};
    const ani_float arg = 100.0F;
    ASSERT_EQ(env->Object_New(cls, method, &obj, arg), ANI_OK);

    ani_float sum = 0.0F;
    const ani_float value = 5.0F;
    ASSERT_EQ(env->Object_CallMethodByName_Float(obj, "floatMethod", "f:f", &sum, value), ANI_OK);
    ASSERT_EQ(sum, arg);

    ani_value args[1U];
    args[0U].f = value;
    ASSERT_EQ(env->Object_CallMethodByName_Float_A(obj, "floatMethod", "f:f", &sum, args), ANI_OK);
    ASSERT_EQ(sum, arg);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Float_By_Name_16([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ObjectOperationsMethodByNameFloat.C", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_method method {};
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", "f:", &method), ANI_OK);

    ani_object obj {};
    const ani_float arg = 100.0F;
    ASSERT_EQ(env->Object_New(cls, method, &obj, arg), ANI_OK);

    ani_float sum = 0.0F;
    const ani_float value1 = 5.0F;
    const ani_float value2 = 8.0F;
    ASSERT_EQ(env->Object_CallMethodByName_Float(obj, "floatAddMethod", "ff:f", &sum, value1, value2), ANI_OK);
    ASSERT_EQ(sum, arg + value1 + value2);

    ani_value args[2U];
    args[0U].f = value1;
    args[1U].f = value2;
    ASSERT_EQ(env->Object_CallMethodByName_Float_A(obj, "floatAddMethod", "ff:f", &sum, args), ANI_OK);
    ASSERT_EQ(sum, arg + value1 + value2);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Float_By_Name_17([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ObjectOperationsMethodByNameFloat.C", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_method method {};
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", "f:", &method), ANI_OK);

    ani_object obj {};
    const ani_float arg = 100.0F;
    ASSERT_EQ(env->Object_New(cls, method, &obj, arg), ANI_OK);

    ani_float sum = 0.0F;
    const ani_float value1 = 5.0F;
    const ani_float value2 = 8.0F;
    ASSERT_EQ(env->Object_CallMethodByName_Float(obj, "floatMethod", "ff:f", &sum, value1, value2), ANI_OK);
    ASSERT_EQ(sum, arg - value1 - value2);

    ani_value args[2U];
    args[0U].f = value1;
    args[1U].f = value2;
    ASSERT_EQ(env->Object_CallMethodByName_Float_A(obj, "floatMethod", "ff:f", &sum, args), ANI_OK);
    ASSERT_EQ(sum, arg - value1 - value2);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Float_By_Name_18([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ObjectOperationsMethodByNameFloat.B", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_method method {};
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", "f:", &method), ANI_OK);

    ani_object obj {};
    const ani_float arg = 100.0F;
    ASSERT_EQ(env->Object_New(cls, method, &obj, arg), ANI_OK);

    ani_float num = 0.0F;
    const ani_float value = 5.0F;
    ani_value args[1U];
    args[0U].f = value;
    ASSERT_EQ(env->Object_CallMethodByName_Float(obj, "protectedMethod", "f:f", &num, value), ANI_OK);
    ASSERT_EQ(num, arg + value);
    ASSERT_EQ(env->Object_CallMethodByName_Float_A(obj, "protectedMethod", "f:f", &num, args), ANI_OK);
    ASSERT_EQ(num, arg + value);

    ASSERT_EQ(env->Object_CallMethodByName_Float(obj, "privateMethod", "f:f", &num, value), ANI_OK);
    ASSERT_EQ(num, arg - value);
    ASSERT_EQ(env->Object_CallMethodByName_Float_A(obj, "privateMethod", "f:f", &num, args), ANI_OK);
    ASSERT_EQ(num, arg - value);

    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ObjectOperationsMethodByNameFloat.C", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", "f:", &method), ANI_OK);
    ASSERT_EQ(env->Object_New(cls, method, &obj, arg), ANI_OK);
    ASSERT_EQ(env->Object_CallMethodByName_Float(obj, "callProtected", "f:f", &num, value), ANI_OK);
    ASSERT_EQ(num, arg + value);
    ASSERT_EQ(env->Object_CallMethodByName_Float_A(obj, "callProtected", "f:f", &num, args), ANI_OK);
    ASSERT_EQ(num, arg + value);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Float_By_Name_19([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ObjectOperationsMethodByNameFloat.B", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_method method {};
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", "f:", &method), ANI_OK);

    ani_object obj {};
    const ani_float arg = 6.0F;
    ASSERT_EQ(env->Object_New(cls, method, &obj, arg), ANI_OK);

    ani_float sum = 0.0F;
    const ani_float value = 5.0F;
    ASSERT_EQ(env->Object_CallMethodByName_Float(obj, "nestedMethod", "f:f", &sum, value), ANI_OK);
    ASSERT_EQ(sum, arg + value);

    ani_value args[1U];
    args[0U].f = value;
    ASSERT_EQ(env->Object_CallMethodByName_Float_A(obj, "nestedMethod", "f:f", &sum, args), ANI_OK);
    ASSERT_EQ(sum, arg + value);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Float_By_Name_20([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ObjectOperationsMethodByNameFloat.B", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_method method {};
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", "f:", &method), ANI_OK);

    ani_object obj {};
    const ani_float arg = 6.0F;
    ASSERT_EQ(env->Object_New(cls, method, &obj, arg), ANI_OK);

    ani_float sum = 0.0F;
    const ani_int value1 = 5;
    const ani_float result = 120.0F;
    ASSERT_EQ(env->Object_CallMethodByName_Float(obj, "recursiveMethod", "i:f", &sum, value1), ANI_OK);
    ASSERT_EQ(sum, result);

    ani_value args[1U];
    args[0U].i = value1;
    ASSERT_EQ(env->Object_CallMethodByName_Float_A(obj, "recursiveMethod", "i:f", &sum, args), ANI_OK);
    ASSERT_EQ(sum, result);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Float_By_Name_21([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ObjectOperationsMethodByNameFloat.B", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_method method {};
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", "f:", &method), ANI_OK);

    ani_object obj {};
    const ani_float arg = 60.0F;
    ASSERT_EQ(env->Object_New(cls, method, &obj, arg), ANI_OK);

    ani_float sum = 0.0F;
    const ani_float value1 = 10.0F;
    const ani_char value2 = 'A';
    const ani_int value3 = 1;
    ASSERT_EQ(env->Object_CallMethodByName_Float(obj, "calculateSum", "fci:f", &sum, value1, value2, value3), ANI_OK);
    ASSERT_EQ(sum, arg - value1);

    const ani_char value4 = 'B';
    ani_value args[3U];
    args[0U].f = value1;
    args[1U].c = value4;
    args[2U].i = value3;
    ASSERT_EQ(env->Object_CallMethodByName_Float_A(obj, "calculateSum", "fci:f", &sum, args), ANI_OK);
    ASSERT_EQ(sum, value1);

    const ani_int value5 = 2U;
    ASSERT_EQ(env->Object_CallMethodByName_Float(obj, "calculateSum", "fci:f", &sum, value1, value4, value5), ANI_OK);
    ASSERT_EQ(sum, arg + value1);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Float_By_Name_22([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ObjectOperationsMethodByNameFloat.B", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_method method {};
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", "f:", &method), ANI_OK);

    ani_object obj {};
    const ani_float arg = 15.0F;
    ASSERT_EQ(env->Object_New(cls, method, &obj, arg), ANI_OK);

    ani_float sum = 0.0F;
    const ani_float value1 = 5.0F;
    const ani_float value2 = 6.0F;
    ASSERT_EQ(env->Object_CallMethodByName_Float(obj, "floatMethod", "ff:f", &sum, value1, value2), ANI_OK);
    ASSERT_EQ(sum, arg);

    const ani_float value3 = 7.0F;
    ASSERT_EQ(env->Object_CallMethodByName_Float(obj, "floatMethod", "ff:f", &sum, value1, value3), ANI_OK);
    ASSERT_EQ(sum, arg);

    const ani_float value4 = 3.0F;
    ani_value args[2U];
    args[0U].f = value1;
    args[1U].f = value4;
    ASSERT_EQ(env->Object_CallMethodByName_Float_A(obj, "floatMethod", "ff:f", &sum, args), ANI_OK);
    ASSERT_EQ(sum, arg);

    const ani_float value5 = 10.0F;
    ASSERT_EQ(env->Object_CallMethodByName_Float(obj, "floatMethod", "ff:f", &sum, value1, value5), ANI_OK);
    ASSERT_EQ(sum, value1 + value5);

    const ani_float value6 = 12.0F;
    ASSERT_EQ(env->Object_CallMethodByName_Float(obj, "floatMethod", "ff:f", &sum, value1, value6), ANI_OK);
    ASSERT_EQ(sum, value1 + value6);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Float_By_Name_23([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ObjectOperationsMethodByNameFloat.C", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_method method {};
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", "f:", &method), ANI_OK);

    ani_object obj {};
    const ani_float arg = 10.0F;
    ASSERT_EQ(env->Object_New(cls, method, &obj, arg), ANI_OK);

    ani_float sum = 0.0F;
    const ani_float value = 2.0F;
    ASSERT_EQ(env->Object_CallMethodByName_Float(obj, "jf", "f:f", &sum, value), ANI_OK);
    ASSERT_EQ(sum, arg + value);

    ani_value args[1U];
    args[0U].f = value;
    ASSERT_EQ(env->Object_CallMethodByName_Float_A(obj, "jf", "f:f", &sum, args), ANI_OK);
    ASSERT_EQ(sum, arg + value);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Float_By_Name_24([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object obj {};
    GetMethodDataFloat(env, &obj);

    ani_float sum = 0.0F;
    const ani_float value1 = std::numeric_limits<ani_float>::max();
    const ani_float value2 = 0.0F;
    ani_value args1[2U];
    args1[0U].f = value1;
    args1[1U].f = value2;
    ASSERT_EQ(env->Object_CallMethodByName_Float(obj, "floatMethod", "ff:f", &sum, value1, value2), ANI_OK);
    ASSERT_EQ(sum, value1 + value2);
    ASSERT_EQ(env->Object_CallMethodByName_Float_A(obj, "floatMethod", "ff:f", &sum, args1), ANI_OK);
    ASSERT_EQ(sum, value1 + value2);

    const ani_float value3 = std::numeric_limits<ani_float>::min();
    ani_value args2[2U];
    args2[0U].f = value3;
    args2[1U].f = value2;
    ASSERT_EQ(env->Object_CallMethodByName_Float(obj, "floatMethod", "ff:f", &sum, value3, value2), ANI_OK);
    ASSERT_EQ(sum, value3 + value2);
    ASSERT_EQ(env->Object_CallMethodByName_Float_A(obj, "floatMethod", "ff:f", &sum, args2), ANI_OK);
    ASSERT_EQ(sum, value3 + value2);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Float_By_Name_25([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object obj)
{
    constexpr ani_float VAL1 = 2.0F;
    constexpr ani_float VAL2 = 3.0F;
    ani_object object {};
    GetMethodDataFloat(env, &object);

    ani_value args[2U];
    args[0U].f = VAL1;
    args[1U].f = VAL2;

    ani_float res = 0.0F;
    ASSERT_EQ(env->c_api->Object_CallMethodByName_Float(nullptr, object, "floatMethod", "ff:f", &res, VAL1, VAL2),
              ANI_INVALID_ARGS);
    ASSERT_EQ(env->c_api->Object_CallMethodByName_Float_A(nullptr, object, "floatMethod", "ff:f", &res, args),
              ANI_INVALID_ARGS);

    ASSERT_EQ(env->Object_CallMethodByName_Float(nullptr, "floatMethod", "ff:f", &res, VAL1, VAL2), ANI_INVALID_ARGS);
    ASSERT_EQ(env->Object_CallMethodByName_Float_A(nullptr, "floatMethod", "ff:f", &res, args), ANI_INVALID_ARGS);

    ASSERT_EQ(env->Object_CallMethodByName_Float(object, nullptr, "ff:f", &res, VAL1, VAL2), ANI_INVALID_ARGS);
    ASSERT_EQ(env->Object_CallMethodByName_Float_A(object, nullptr, "ff:f", &res, args), ANI_INVALID_ARGS);

    ASSERT_EQ(env->Object_CallMethodByName_Float(object, "floatMethod", nullptr, &res, VAL1, VAL2), ANI_OK);
    ASSERT_EQ(env->Object_CallMethodByName_Float_A(object, "floatMethod", nullptr, &res, args), ANI_OK);

    ASSERT_EQ(env->Object_CallMethodByName_Float(object, "floatMethod", "ff:f", nullptr, VAL1, VAL2),
              ANI_INVALID_ARGS);
    ASSERT_EQ(env->Object_CallMethodByName_Float_A(object, "floatMethod", "ff:f", nullptr, args), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Float_By_Name_26([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object obj)
{
    constexpr ani_float VAL1 = 2.0F;
    constexpr ani_float VAL2 = 3.0F;
    ani_object object {};
    GetMethodDataFloat(env, &object);

    ani_value args[2U];
    args[0U].f = VAL1;
    args[1U].f = VAL2;

    ani_float res = 0.0F;
    const std::array<std::string_view, 4U> invalidMethodNames = {{"", "测试emoji🙂🙂", "\n\r\t", "\x01\x02\x03"}};

    for (const auto &methodName : invalidMethodNames) {
        ASSERT_EQ(env->Object_CallMethodByName_Float(object, methodName.data(), "ff:f", &res, VAL1, VAL2),
                  ANI_NOT_FOUND);
        ASSERT_EQ(env->Object_CallMethodByName_Float_A(object, methodName.data(), "ff:f", &res, args), ANI_NOT_FOUND);
    }
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Float_By_Name_27([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object obj)
{
    constexpr ani_float VAL1 = 2.0F;
    constexpr ani_float VAL2 = 3.0F;
    ani_object object {};
    GetMethodDataFloat(env, &object);

    ani_value args[2U];
    args[0U].f = VAL1;
    args[1U].f = VAL2;

    ani_float res = 0.0F;
    const std::array<std::string_view, 4U> invalidMethodNames = {{"", "测试emoji🙂🙂", "\n\r\t", "\x01\x02\x03"}};

    for (const auto &methodName : invalidMethodNames) {
        ASSERT_EQ(env->Object_CallMethodByName_Float(object, "floatMethod", methodName.data(), &res, VAL1, VAL2),
                  ANI_INVALID_DESCRIPTOR);
        ASSERT_EQ(env->Object_CallMethodByName_Float_A(object, "floatMethod", methodName.data(), &res, args),
                  ANI_INVALID_DESCRIPTOR);
    }
    return ANI_TRUE;
}

ani_int GetMethodDataInt(ani_env *env, ani_object *objectResult)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ObjectOperationsMethodByNameInt.A", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_static_method newMethod {};
    ASSERT_EQ(env->Class_FindStaticMethod(cls,
                  "new_A", ":C{entry.src.main.src.ets.ObjectOperationsMethodByNameInt.A}", &newMethod),
              ANI_OK);
    ani_ref ref {};
    ASSERT_EQ(env->Class_CallStaticMethod_Ref(cls, newMethod, &ref), ANI_OK);
    *objectResult = static_cast<ani_object>(ref);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Int_By_Name_01([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object obj)
{
    constexpr ani_int VAL1 = 5;
    constexpr ani_int VAL2 = 6;
    ani_object object {};
    GetMethodDataInt(env, &object);

    ani_value args[2U];
    args[0U].i = VAL1;
    args[1U].i = VAL2;

    ani_int res = 0;
    ASSERT_EQ(env->Object_CallMethodByName_Int_A(object, "intByNameMethod", "ii:i", &res, args), ANI_OK);
    ASSERT_EQ(res, VAL1 + VAL2);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Int_By_Name_02([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object obj)
{
    constexpr ani_int VAL1 = 5;
    constexpr ani_int VAL2 = 6;
    ani_object object {};
    GetMethodDataInt(env, &object);

    ani_int res = 0;
    ASSERT_EQ(env->Object_CallMethodByName_Int(object, "intByNameMethod", "ii:i", &res, VAL1, VAL2), ANI_OK);
    ASSERT_EQ(res, VAL1 + VAL2);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Int_By_Name_03([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object obj)
{
    constexpr ani_int VAL1 = 5;
    constexpr ani_int VAL2 = 6;
    ani_object object {};
    GetMethodDataInt(env, &object);

    ani_int res = 0;
    ASSERT_EQ(env->c_api->Object_CallMethodByName_Int(env, object, "intByNameMethod", "ii:i", &res, VAL1, VAL2),
              ANI_OK);
    ASSERT_EQ(res, VAL1 + VAL2);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Int_By_Name_04([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object obj)
{
    constexpr ani_int VAL1 = 5;
    constexpr ani_int VAL2 = 6;
    ani_object object {};
    GetMethodDataInt(env, &object);

    ani_int res = 0;
    ASSERT_EQ(env->Object_CallMethodByName_Int(object, "intByNameMethod", "ii:x", &res, VAL1, VAL2),
                 ANI_INVALID_DESCRIPTOR);
    ASSERT_EQ(env->Object_CallMethodByName_Int(object, "unknown_function", "ii:i", &res, VAL1, VAL2), ANI_NOT_FOUND);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Int_By_Name_05([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object obj)
{
    constexpr ani_int VAL1 = 5;
    constexpr ani_int VAL2 = 6;
    ani_object object {};
    GetMethodDataInt(env, &object);

    ani_int res = 0;
    ASSERT_EQ(env->Object_CallMethodByName_Int(object, nullptr, "ii:i", &res, VAL1, VAL2), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Int_By_Name_06([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object obj)
{
    constexpr ani_int VAL1 = 5;
    constexpr ani_int VAL2 = 6;
    ani_object object {};
    GetMethodDataInt(env, &object);

    ASSERT_EQ(env->Object_CallMethodByName_Int(object, "intByNameMethod", "ii:i", nullptr, VAL1, VAL2),
              ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Int_By_Name_07([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object obj)
{
    constexpr ani_int VAL1 = 5;
    constexpr ani_int VAL2 = 6;
    ani_object object {};
    GetMethodDataInt(env, &object);

    ani_int res = 0;
    ASSERT_EQ(env->Object_CallMethodByName_Int(nullptr, "intByNameMethod", "ii:i", &res, VAL1, VAL2),
              ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Int_By_Name_08([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object obj)
{
    ani_object object {};
    GetMethodDataInt(env, &object);

    ani_int res = 0;
    ASSERT_EQ(env->Object_CallMethodByName_Int(nullptr, "intByNameMethod", "ii:i", &res, nullptr), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Int_By_Name_09([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_int VAL1 = 5;
    constexpr ani_int VAL2 = 6;
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ObjectOperationsMethodByNameInt.B", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_method method {};
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", "i:", &method), ANI_OK);

    ani_object obj {};
    const ani_int arg = 100;
    ASSERT_EQ(env->Object_New(cls, method, &obj, arg), ANI_OK);

    ani_int sum = 0;
    ASSERT_EQ(env->Object_CallMethodByName_Int(obj, "intMethod", "ii:i", &sum, VAL1, VAL2), ANI_OK);
    ASSERT_EQ(sum, arg);

    ani_value args[2U];
    args[0U].i = VAL1;
    args[1U].i = VAL2;
    ASSERT_EQ(env->Object_CallMethodByName_Int_A(obj, "intMethod", "ii:i", &sum, args), ANI_OK);
    ASSERT_EQ(sum, arg);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Int_By_Name_10([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ObjectOperationsMethodByNameInt.B", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_method method {};
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", "i:", &method), ANI_OK);

    ani_object obj {};
    const ani_int arg = 100;
    ASSERT_EQ(env->Object_New(cls, method, &obj, arg), ANI_OK);

    ani_int sum = 0;
    const ani_int value = 5;
    ASSERT_EQ(env->Object_CallMethodByName_Int(obj, "intMethod", "i:i", &sum, value), ANI_OK);
    ASSERT_EQ(sum, arg);

    ani_value args[1U];
    args[0U].i = value;
    ASSERT_EQ(env->Object_CallMethodByName_Int_A(obj, "intMethod", "i:i", &sum, args), ANI_OK);
    ASSERT_EQ(sum, arg);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Int_By_Name_11([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_int VAL1 = 5;
    constexpr ani_int VAL2 = 6;
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ObjectOperationsMethodByNameInt.C", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_method method {};
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", "i:", &method), ANI_OK);

    ani_object obj {};
    const ani_int arg = 100;
    ASSERT_EQ(env->Object_New(cls, method, &obj, arg), ANI_OK);

    ani_int sum = 0;
    ASSERT_EQ(env->Object_CallMethodByName_Int(obj, "intAddMethod", "ii:i", &sum, VAL1, VAL2), ANI_OK);
    ASSERT_EQ(sum, arg + VAL1 + VAL2);

    ani_value args[2U];
    args[0U].i = VAL1;
    args[1U].i = VAL2;
    ASSERT_EQ(env->Object_CallMethodByName_Int_A(obj, "intAddMethod", "ii:i", &sum, args), ANI_OK);
    ASSERT_EQ(sum, arg + VAL1 + VAL2);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Int_By_Name_12([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_int VAL1 = 5;
    constexpr ani_int VAL2 = 6;
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ObjectOperationsMethodByNameInt.C", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_method method {};
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", "i:", &method), ANI_OK);

    ani_object obj {};
    const ani_int arg = 100;
    ASSERT_EQ(env->Object_New(cls, method, &obj, arg), ANI_OK);

    ani_int sum = 0;
    ASSERT_EQ(env->Object_CallMethodByName_Int(obj, "intMethod", "ii:i", &sum, VAL1, VAL2), ANI_OK);
    ASSERT_EQ(sum, arg - VAL1 - VAL2);

    ani_value args[2U];
    args[0U].i = VAL1;
    args[1U].i = VAL2;
    ASSERT_EQ(env->Object_CallMethodByName_Int_A(obj, "intMethod", "ii:i", &sum, args), ANI_OK);
    ASSERT_EQ(sum, arg - VAL1 - VAL2);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Int_By_Name_13([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ObjectOperationsMethodByNameInt.B", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_method method {};
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", "i:", &method), ANI_OK);

    ani_object obj {};
    const ani_int arg = 100;
    ASSERT_EQ(env->Object_New(cls, method, &obj, arg), ANI_OK);

    ani_int num = 0;
    const ani_int value = 5;
    ani_value args[1U];
    args[0U].i = value;
    ASSERT_EQ(env->Object_CallMethodByName_Int(obj, "protectedMethod", "i:i", &num, value), ANI_OK);
    ASSERT_EQ(num, arg + value);
    ASSERT_EQ(env->Object_CallMethodByName_Int_A(obj, "protectedMethod", "i:i", &num, args), ANI_OK);
    ASSERT_EQ(num, arg + value);

    ASSERT_EQ(env->Object_CallMethodByName_Int(obj, "privateMethod", "i:i", &num, value), ANI_OK);
    ASSERT_EQ(num, arg - value);
    ASSERT_EQ(env->Object_CallMethodByName_Int_A(obj, "privateMethod", "i:i", &num, args), ANI_OK);
    ASSERT_EQ(num, arg - value);

    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ObjectOperationsMethodByNameInt.C", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", "i:", &method), ANI_OK);
    ASSERT_EQ(env->Object_New(cls, method, &obj, arg), ANI_OK);
    ASSERT_EQ(env->Object_CallMethodByName_Int(obj, "callProtected", "i:i", &num, value), ANI_OK);
    ASSERT_EQ(num, arg + value);
    ASSERT_EQ(env->Object_CallMethodByName_Int_A(obj, "callProtected", "i:i", &num, args), ANI_OK);
    ASSERT_EQ(num, arg + value);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Int_By_Name_14([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ObjectOperationsMethodByNameInt.B", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_method method {};
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", "i:", &method), ANI_OK);

    ani_object obj {};
    const ani_int arg = 6;
    ASSERT_EQ(env->Object_New(cls, method, &obj, arg), ANI_OK);

    ani_int sum = 0;
    const ani_int value = 5;
    ASSERT_EQ(env->Object_CallMethodByName_Int(obj, "nestedMethod", "i:i", &sum, value), ANI_OK);
    ASSERT_EQ(sum, arg + value);

    ani_value args[1U];
    args[0U].i = value;
    ASSERT_EQ(env->Object_CallMethodByName_Int_A(obj, "nestedMethod", "i:i", &sum, args), ANI_OK);
    ASSERT_EQ(sum, arg + value);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Int_By_Name_15([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ObjectOperationsMethodByNameInt.B", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_method method {};
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", "i:", &method), ANI_OK);

    ani_object obj {};
    const ani_int arg = 6;
    ASSERT_EQ(env->Object_New(cls, method, &obj, arg), ANI_OK);

    ani_int sum = 0;
    const ani_int value1 = 5;
    const ani_int result = 120;
    ASSERT_EQ(env->Object_CallMethodByName_Int(obj, "recursiveMethod", "i:i", &sum, value1), ANI_OK);
    ASSERT_EQ(sum, result);

    ani_value args[1U];
    args[0U].i = value1;
    ASSERT_EQ(env->Object_CallMethodByName_Int_A(obj, "recursiveMethod", "i:i", &sum, args), ANI_OK);
    ASSERT_EQ(sum, result);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Int_By_Name_16([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ObjectOperationsMethodByNameInt.B", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_method method {};
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", "i:", &method), ANI_OK);

    ani_object obj {};
    const ani_int arg = 6;
    ASSERT_EQ(env->Object_New(cls, method, &obj, arg), ANI_OK);

    ani_int sum = 0;
    const ani_int value1 = 1;
    const ani_char value2 = 'A';
    const ani_double value3 = 1.0;
    ASSERT_EQ(env->Object_CallMethodByName_Int(obj, "calculateSum", "icd:i", &sum, value1, value2, value3), ANI_OK);
    ASSERT_EQ(sum, arg - value1);

    const ani_char value4 = 'B';
    ani_value args[3U];
    args[0U].i = value1;
    args[1U].c = value4;
    args[2U].d = value3;
    ASSERT_EQ(env->Object_CallMethodByName_Int_A(obj, "calculateSum", "icd:i", &sum, args), ANI_OK);
    ASSERT_EQ(sum, value1);

    const ani_double value5 = 2U;
    ASSERT_EQ(env->Object_CallMethodByName_Int(obj, "calculateSum", "icd:i", &sum, value1, value4, value5), ANI_OK);
    ASSERT_EQ(sum, arg + value1);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Int_By_Name_17([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ObjectOperationsMethodByNameInt.B", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_method method {};
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", "i:", &method), ANI_OK);

    ani_object obj {};
    const ani_int arg = 15;
    ASSERT_EQ(env->Object_New(cls, method, &obj, arg), ANI_OK);

    ani_int sum = 0;
    const ani_int value1 = 5;
    const ani_int value2 = 6;
    ASSERT_EQ(env->Object_CallMethodByName_Int(obj, "intMethod", "ii:i", &sum, value1, value2), ANI_OK);
    ASSERT_EQ(sum, arg);

    const ani_int value3 = 7;
    ASSERT_EQ(env->Object_CallMethodByName_Int(obj, "intMethod", "ii:i", &sum, value1, value3), ANI_OK);
    ASSERT_EQ(sum, arg);

    const ani_int value4 = 3;
    ani_value args[2U];
    args[0U].i = value1;
    args[1U].i = value4;
    ASSERT_EQ(env->Object_CallMethodByName_Int_A(obj, "intMethod", "ii:i", &sum, args), ANI_OK);
    ASSERT_EQ(sum, arg);

    const ani_int value5 = 10;
    ASSERT_EQ(env->Object_CallMethodByName_Int(obj, "intMethod", "ii:i", &sum, value1, value5), ANI_OK);
    ASSERT_EQ(sum, value1 + value5);

    const ani_int value6 = 12;
    ASSERT_EQ(env->Object_CallMethodByName_Int(obj, "intMethod", "ii:i", &sum, value1, value6), ANI_OK);
    ASSERT_EQ(sum, value1 + value6);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Int_By_Name_18([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ObjectOperationsMethodByNameInt.C", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_method method {};
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", "i:", &method), ANI_OK);

    ani_object obj {};
    const ani_int arg = 10;
    ASSERT_EQ(env->Object_New(cls, method, &obj, arg), ANI_OK);

    ani_int sum = 0;
    const ani_int value = 2;
    ASSERT_EQ(env->Object_CallMethodByName_Int(obj, "jf", "i:i", &sum, value), ANI_OK);
    ASSERT_EQ(sum, arg + value);

    ani_value args[1U];
    args[0U].i = value;
    ASSERT_EQ(env->Object_CallMethodByName_Int_A(obj, "jf", "i:i", &sum, args), ANI_OK);
    ASSERT_EQ(sum, arg + value);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Int_By_Name_19([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object obj {};
    GetMethodDataInt(env, &obj);

    ani_int sum = 0;
    const ani_int value1 = std::numeric_limits<ani_int>::max();
    const ani_int value2 = 0;
    ani_value args1[2U];
    args1[0U].i = value1;
    args1[1U].i = value2;
    ASSERT_EQ(env->Object_CallMethodByName_Int(obj, "intByNameMethod", "ii:i", &sum, value1, value2), ANI_OK);
    ASSERT_EQ(sum, value1 + value2);
    ASSERT_EQ(env->Object_CallMethodByName_Int_A(obj, "intByNameMethod", "ii:i", &sum, args1), ANI_OK);
    ASSERT_EQ(sum, value1 + value2);

    const ani_int value3 = std::numeric_limits<ani_int>::min();
    ani_value args2[2U];
    args2[0U].i = value3;
    args2[1U].i = value2;
    ASSERT_EQ(env->Object_CallMethodByName_Int(obj, "intByNameMethod", "ii:i", &sum, value3, value2), ANI_OK);
    ASSERT_EQ(sum, value3 + value2);
    ASSERT_EQ(env->Object_CallMethodByName_Int_A(obj, "intByNameMethod", "ii:i", &sum, args2), ANI_OK);
    ASSERT_EQ(sum, value3 + value2);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Int_By_Name_20([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object obj)
{
    constexpr ani_int VAL1 = 5;
    constexpr ani_int VAL2 = 6;
    ani_object object {};
    GetMethodDataInt(env, &object);

    ani_value args[2U];
    args[0U].i = VAL1;
    args[1U].i = VAL2;

    ani_int res = 0;
    ASSERT_EQ(env->c_api->Object_CallMethodByName_Int(nullptr, object, "intByNameMethod", "ii:i", &res, VAL1, VAL2),
              ANI_INVALID_ARGS);
    ASSERT_EQ(env->c_api->Object_CallMethodByName_Int_A(nullptr, object, "intByNameMethod", "ii:i", &res, args),
              ANI_INVALID_ARGS);

    ASSERT_EQ(env->Object_CallMethodByName_Int(nullptr, "intByNameMethod", "ii:i", &res, VAL1, VAL2),
              ANI_INVALID_ARGS);
    ASSERT_EQ(env->Object_CallMethodByName_Int_A(nullptr, "intByNameMethod", "ii:i", &res, args), ANI_INVALID_ARGS);

    ASSERT_EQ(env->Object_CallMethodByName_Int(object, nullptr, "ii:i", &res, VAL1, VAL2), ANI_INVALID_ARGS);
    ASSERT_EQ(env->Object_CallMethodByName_Int_A(object, nullptr, "ii:i", &res, args), ANI_INVALID_ARGS);

    ASSERT_EQ(env->Object_CallMethodByName_Int(object, "intByNameMethod", nullptr, &res, VAL1, VAL2), ANI_OK);
    ASSERT_EQ(env->Object_CallMethodByName_Int_A(object, "intByNameMethod", nullptr, &res, args), ANI_OK);

    ASSERT_EQ(env->Object_CallMethodByName_Int(object, "intByNameMethod", "ii:i", nullptr, VAL1, VAL2),
              ANI_INVALID_ARGS);
    ASSERT_EQ(env->Object_CallMethodByName_Int_A(object, "intByNameMethod", "ii:i", nullptr, args), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Int_By_Name_21([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object obj)
{
    constexpr ani_int VAL1 = 5;
    constexpr ani_int VAL2 = 6;
    ani_object object {};
    GetMethodDataInt(env, &object);

    ani_value args[2U];
    args[0U].i = VAL1;
    args[1U].i = VAL2;

    ani_int res = 0;
    const std::array<std::string_view, 4U> invalidMethodNames = {{"", "测试emoji🙂🙂", "\n\r\t", "\x01\x02\x03"}};

    for (const auto &methodName : invalidMethodNames) {
        ASSERT_EQ(env->Object_CallMethodByName_Int(object, methodName.data(), "ii:i", &res, VAL1, VAL2),
                  ANI_NOT_FOUND);
        ASSERT_EQ(env->Object_CallMethodByName_Int_A(object, methodName.data(), "ii:i", &res, args), ANI_NOT_FOUND);
    }
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Int_By_Name_22([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object obj)
{
    constexpr ani_int VAL1 = 5;
    constexpr ani_int VAL2 = 6;
    ani_object object {};
    GetMethodDataInt(env, &object);

    ani_value args[2U];
    args[0U].i = VAL1;
    args[1U].i = VAL2;

    ani_int res = 0;
    const std::array<std::string_view, 4U> invalidMethodNames = {{"", "测试emoji🙂🙂", "\n\r\t", "\x01\x02\x03"}};

    for (const auto &methodName : invalidMethodNames) {
        ASSERT_EQ(env->Object_CallMethodByName_Int(object, "intByNameMethod", methodName.data(), &res, VAL1, VAL2),
                  ANI_INVALID_DESCRIPTOR);
        ASSERT_EQ(env->Object_CallMethodByName_Int_A(object, "intByNameMethod", methodName.data(), &res, args),
                  ANI_INVALID_DESCRIPTOR);
    }
    return ANI_TRUE;
}

ani_int GetMethodDataLong(ani_env *env, ani_object *objectResult)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ObjectOperationsMethodByNameLong.A", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_static_method newMethod {};
    ASSERT_EQ(env->Class_FindStaticMethod(cls,
                  "new_A", ":C{entry.src.main.src.ets.ObjectOperationsMethodByNameLong.A}", &newMethod),
        ANI_OK);
    ani_ref ref {};
    ASSERT_EQ(env->Class_CallStaticMethod_Ref(cls, newMethod, &ref), ANI_OK);

    *objectResult = static_cast<ani_object>(ref);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Long_By_Name_01([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object obj)
{
    constexpr ani_long VAL1 = 5000;
    constexpr ani_long VAL2 = 6000;
    ani_object object {};
    GetMethodDataLong(env, &object);

    ani_value args[2U];
    args[0U].l = VAL1;
    args[1U].l = VAL2;
    ani_long sum {};
    ASSERT_EQ(env->Object_CallMethodByName_Long_A(object, "longMethod", "ll:l", &sum, args), ANI_OK);
    ASSERT_EQ(sum, VAL1 + VAL2);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Long_By_Name_02([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object obj)
{
    constexpr ani_long VAL1 = 5000;
    constexpr ani_long VAL2 = 6000;
    ani_object object {};
    GetMethodDataLong(env, &object);

    ani_value args[2U];
    args[0U].l = VAL1;
    args[1U].l = VAL2;
    ani_long sum {};
    ASSERT_EQ(env->Object_CallMethodByName_Long_A(object, "longMethod", nullptr, &sum, args), ANI_OK);
    ASSERT_EQ(sum, VAL1 + VAL2);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Long_By_Name_03([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object obj)
{
    constexpr ani_long VAL1 = 5000;
    constexpr ani_long VAL2 = 6000;
    ani_object object {};
    GetMethodDataLong(env, &object);

    ani_value args[2U];
    args[0U].l = VAL1;
    args[1U].l = VAL2;
    ani_long sum {};
    ASSERT_EQ(env->Object_CallMethodByName_Long_A(object, "xxxxxxxxxx", "ll:l", &sum, args), ANI_NOT_FOUND);
    ASSERT_EQ(env->Object_CallMethodByName_Long_A(object, "longMethod", "ll:i", &sum, args), ANI_NOT_FOUND);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Long_By_Name_04([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object obj)
{
    constexpr ani_long VAL1 = 5000;
    constexpr ani_long VAL2 = 6000;
    ani_value args[2U];
    args[0U].l = VAL1;
    args[1U].l = VAL2;
    ani_long sum {};
    ASSERT_EQ(env->Object_CallMethodByName_Long_A(nullptr, "longMethod", "ll:l", &sum, args), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Long_By_Name_05([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object obj)
{
    constexpr ani_long VAL1 = 5000;
    constexpr ani_long VAL2 = 6000;
    ani_object object {};
    GetMethodDataLong(env, &object);

    ani_value args[2U];
    args[0U].l = VAL1;
    args[1U].l = VAL2;
    ani_long sum {};
    ASSERT_EQ(env->Object_CallMethodByName_Long_A(object, nullptr, "ll:l", &sum, args), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Long_By_Name_06([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object obj)
{
    constexpr ani_long VAL1 = 5000;
    constexpr ani_long VAL2 = 6000;
    ani_object object {};
    GetMethodDataLong(env, &object);

    ani_value args[2U];
    args[0U].l = VAL1;
    args[1U].l = VAL2;
    ASSERT_EQ(env->Object_CallMethodByName_Long_A(object, "longMethod", "ll:l", nullptr, args), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Long_By_Name_07([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object obj)
{
    ani_object object {};
    GetMethodDataLong(env, &object);

    ani_long sum {};
    ASSERT_EQ(env->Object_CallMethodByName_Long_A(object, "longMethod", "ll:l", &sum, nullptr), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Long_By_Name_08([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object obj)
{
    constexpr ani_long VAL1 = 5000;
    constexpr ani_long VAL2 = 6000;
    ani_object object {};
    GetMethodDataLong(env, &object);

    ani_long sum {};
    ASSERT_EQ(env->Object_CallMethodByName_Long(object, "longMethod", "ll:l", &sum, VAL1, VAL2), ANI_OK);
    ASSERT_EQ(sum, VAL1 + VAL2);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Long_By_Name_09([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object obj)
{
    constexpr ani_long VAL1 = 5000;
    constexpr ani_long VAL2 = 6000;
    ani_object object {};
    GetMethodDataLong(env, &object);

    ani_long sum {};
    ASSERT_EQ(env->Object_CallMethodByName_Long(object, "longMethod", nullptr, &sum, VAL1, VAL2), ANI_OK);
    ASSERT_EQ(sum, VAL1 + VAL2);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Long_By_Name_10([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object obj)
{
    constexpr ani_long VAL1 = 5000;
    constexpr ani_long VAL2 = 6000;
    ani_object object {};
    GetMethodDataLong(env, &object);

    ani_long sum {};
    ASSERT_EQ(env->Object_CallMethodByName_Long(object, "XXXXXXX", "ll:l", &sum, VAL1, VAL2), ANI_NOT_FOUND);
    ASSERT_EQ(env->Object_CallMethodByName_Long(object, "longMethod", "ll:i", &sum, VAL1, VAL2), ANI_NOT_FOUND);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Long_By_Name_11([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object obj)
{
    constexpr ani_long VAL1 = 5000;
    constexpr ani_long VAL2 = 6000;
    ani_long sum {};
    ASSERT_EQ(env->Object_CallMethodByName_Long(nullptr, "longMethod", "ll:l", &sum, VAL1, VAL2), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Long_By_Name_12([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object obj)
{
    constexpr ani_long VAL1 = 5000;
    constexpr ani_long VAL2 = 6000;
    ani_object object {};
    GetMethodDataLong(env, &object);

    ani_long sum {};
    ASSERT_EQ(env->Object_CallMethodByName_Long(object, nullptr, "ll:l", &sum, VAL1, VAL2), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Long_By_Name_13([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object obj)
{
    constexpr ani_long VAL1 = 5000;
    constexpr ani_long VAL2 = 6000;
    ani_object object {};
    GetMethodDataLong(env, &object);

    ASSERT_EQ(env->Object_CallMethodByName_Long(object, "longMethod", "ll:l", nullptr, VAL1, VAL2), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Long_By_Name_14([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_long VAL0 = 1000000;
    constexpr ani_long VAL1 = 5000;
    constexpr ani_long VAL2 = 6000;
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ObjectOperationsMethodByNameLong.B", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_method method {};
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", "l:", &method), ANI_OK);

    ani_object obj {};
    ASSERT_EQ(env->Object_New(cls, method, &obj, VAL0), ANI_OK);

    ani_long sum {};
    ASSERT_EQ(env->Object_CallMethodByName_Long(obj, "longMethod", "ll:l", &sum, VAL1, VAL2), ANI_OK);
    ASSERT_EQ(sum, VAL0);

    ani_value args[2U];
    args[0U].l = VAL1;
    args[1U].l = VAL2;
    ASSERT_EQ(env->Object_CallMethodByName_Long_A(obj, "longMethod", "ll:l", &sum, args), ANI_OK);
    ASSERT_EQ(sum, VAL0);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Long_By_Name_15([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_long VAL0 = 1000000;
    constexpr ani_long VAL1 = 5000;
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ObjectOperationsMethodByNameLong.B", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_method method {};
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", "l:", &method), ANI_OK);

    ani_object obj {};
    ASSERT_EQ(env->Object_New(cls, method, &obj, VAL0), ANI_OK);

    ani_long sum {};
    ASSERT_EQ(env->Object_CallMethodByName_Long(obj, "longMethod", "l:l", &sum, VAL1), ANI_OK);
    ASSERT_EQ(sum, VAL0);

    ani_value args[1U];
    args[0U].l = VAL1;
    ASSERT_EQ(env->Object_CallMethodByName_Long_A(obj, "longMethod", "l:l", &sum, args), ANI_OK);
    ASSERT_EQ(sum, VAL0);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Long_By_Name_16([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_long VAL0 = 1000000;
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ObjectOperationsMethodByNameLong.C", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_method method {};
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", "l:", &method), ANI_OK);

    ani_object obj {};
    ASSERT_EQ(env->Object_New(cls, method, &obj, VAL0), ANI_OK);

    ani_long sum {};
    const ani_long value1 = 50000;
    const ani_long value2 = 80000;
    ASSERT_EQ(env->Object_CallMethodByName_Long(obj, "longAddMethod", "ll:l", &sum, value1, value2), ANI_OK);
    ASSERT_EQ(sum, VAL0 + value1 + value2);

    ani_value args[2U];
    args[0U].l = value1;
    args[1U].l = value2;
    ASSERT_EQ(env->Object_CallMethodByName_Long_A(obj, "longAddMethod", "ll:l", &sum, args), ANI_OK);
    ASSERT_EQ(sum, VAL0 + value1 + value2);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Long_By_Name_17([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_long VAL0 = 1000000;
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ObjectOperationsMethodByNameLong.C", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_method method {};
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", "l:", &method), ANI_OK);

    ani_object obj {};
    ASSERT_EQ(env->Object_New(cls, method, &obj, VAL0), ANI_OK);

    ani_long sum {};
    const ani_long value1 = 50000;
    const ani_long value2 = 80000;
    ASSERT_EQ(env->Object_CallMethodByName_Long(obj, "longMethod", "ll:l", &sum, value1, value2), ANI_OK);
    ASSERT_EQ(sum, VAL0 - value1 - value2);

    ani_value args[2U];
    args[0U].l = value1;
    args[1U].l = value2;
    ASSERT_EQ(env->Object_CallMethodByName_Long_A(obj, "longMethod", "ll:l", &sum, args), ANI_OK);
    ASSERT_EQ(sum, VAL0 - value1 - value2);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Long_By_Name_18([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_long VAL0 = 1000000;
    constexpr ani_long VAL1 = 5000;
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ObjectOperationsMethodByNameLong.B", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_method method {};
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", "l:", &method), ANI_OK);

    ani_object obj {};
    ASSERT_EQ(env->Object_New(cls, method, &obj, VAL0), ANI_OK);

    ani_long num {};
    ani_value args[1U];
    args[0U].l = VAL1;
    ASSERT_EQ(env->Object_CallMethodByName_Long(obj, "protectedMethod", "l:l", &num, VAL1), ANI_OK);
    ASSERT_EQ(num, VAL0 + VAL1);
    ASSERT_EQ(env->Object_CallMethodByName_Long_A(obj, "protectedMethod", "l:l", &num, args), ANI_OK);
    ASSERT_EQ(num, VAL0 + VAL1);

    ASSERT_EQ(env->Object_CallMethodByName_Long(obj, "privateMethod", "l:l", &num, VAL1), ANI_OK);
    ASSERT_EQ(num, VAL0 - VAL1);
    ASSERT_EQ(env->Object_CallMethodByName_Long_A(obj, "privateMethod", "l:l", &num, args), ANI_OK);
    ASSERT_EQ(num, VAL0 - VAL1);

    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ObjectOperationsMethodByNameLong.C", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", "l:", &method), ANI_OK);
    ASSERT_EQ(env->Object_New(cls, method, &obj, VAL0), ANI_OK);
    ASSERT_EQ(env->Object_CallMethodByName_Long(obj, "callProtected", "l:l", &num, VAL1), ANI_OK);
    ASSERT_EQ(num, VAL0 + VAL1);
    ASSERT_EQ(env->Object_CallMethodByName_Long_A(obj, "callProtected", "l:l", &num, args), ANI_OK);
    ASSERT_EQ(num, VAL0 + VAL1);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Long_By_Name_19([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_long VAL1 = 5000;
    constexpr ani_long VAL2 = 6000;
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ObjectOperationsMethodByNameLong.B", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_method method {};
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", "l:", &method), ANI_OK);

    ani_object obj {};
    ASSERT_EQ(env->Object_New(cls, method, &obj, VAL2), ANI_OK);

    ani_long sum {};
    ASSERT_EQ(env->Object_CallMethodByName_Long(obj, "nestedMethod", "l:l", &sum, VAL1), ANI_OK);
    ASSERT_EQ(sum, VAL2 + VAL1);

    ani_value args[1U];
    args[0U].l = VAL1;
    ASSERT_EQ(env->Object_CallMethodByName_Long_A(obj, "nestedMethod", "l:l", &sum, args), ANI_OK);
    ASSERT_EQ(sum, VAL2 + VAL1);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Long_By_Name_20([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_long VAL2 = 6000;
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ObjectOperationsMethodByNameLong.B", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_method method {};
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", "l:", &method), ANI_OK);

    ani_object obj {};
    ASSERT_EQ(env->Object_New(cls, method, &obj, VAL2), ANI_OK);

    ani_long sum {};
    const ani_int value1 = 5;
    const ani_long result = 120;
    ASSERT_EQ(env->Object_CallMethodByName_Long(obj, "recursiveMethod", "i:l", &sum, value1), ANI_OK);
    ASSERT_EQ(sum, result);

    ani_value args[1U];
    args[0U].i = value1;
    ASSERT_EQ(env->Object_CallMethodByName_Long_A(obj, "recursiveMethod", "i:l", &sum, args), ANI_OK);
    ASSERT_EQ(sum, result);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Long_By_Name_21([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_long VAL2 = 6000;
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ObjectOperationsMethodByNameLong.B", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_method method {};
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", "l:", &method), ANI_OK);

    ani_object obj {};
    ASSERT_EQ(env->Object_New(cls, method, &obj, VAL2), ANI_OK);

    ani_long sum {};
    const ani_long value1 = 1000;
    const ani_char value2 = 'A';
    const ani_int value3 = 1;
    ASSERT_EQ(env->Object_CallMethodByName_Long(obj, "calculateSum", "lci:l", &sum, value1, value2, value3), ANI_OK);
    ASSERT_EQ(sum, VAL2 - value1);

    const ani_char value4 = 'B';
    ani_value args[3U];
    args[0U].l = value1;
    args[1U].c = value4;
    args[2U].i = value3;
    ASSERT_EQ(env->Object_CallMethodByName_Long_A(obj, "calculateSum", "lci:l", &sum, args), ANI_OK);
    ASSERT_EQ(sum, value1);

    const ani_int value5 = 2U;
    ASSERT_EQ(env->Object_CallMethodByName_Long(obj, "calculateSum", "lci:l", &sum, value1, value4, value5), ANI_OK);
    ASSERT_EQ(sum, VAL2 + value1);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Long_By_Name_22([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ObjectOperationsMethodByNameLong.B", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_method method {};
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", "l:", &method), ANI_OK);

    ani_object obj {};
    const ani_long arg = 15000;
    ASSERT_EQ(env->Object_New(cls, method, &obj, arg), ANI_OK);

    ani_long sum {};
    const ani_long value1 = 5000;
    const ani_long value2 = 6000;
    ASSERT_EQ(env->Object_CallMethodByName_Long(obj, "longMethod", "ll:l", &sum, value1, value2), ANI_OK);
    ASSERT_EQ(sum, arg);

    const ani_long value3 = 7000;
    ASSERT_EQ(env->Object_CallMethodByName_Long(obj, "longMethod", "ll:l", &sum, value1, value3), ANI_OK);
    ASSERT_EQ(sum, arg);

    const ani_long value4 = 3000;
    ani_value args[2U];
    args[0U].l = value1;
    args[1U].l = value4;
    ASSERT_EQ(env->Object_CallMethodByName_Long_A(obj, "longMethod", "ll:l", &sum, args), ANI_OK);
    ASSERT_EQ(sum, arg);

    const ani_long value5 = 10000;
    ASSERT_EQ(env->Object_CallMethodByName_Long(obj, "longMethod", "ll:l", &sum, value1, value5), ANI_OK);
    ASSERT_EQ(sum, value1 + value5);

    const ani_long value6 = 12000;
    ASSERT_EQ(env->Object_CallMethodByName_Long(obj, "longMethod", "ll:l", &sum, value1, value6), ANI_OK);
    ASSERT_EQ(sum, value1 + value6);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Long_By_Name_23([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ObjectOperationsMethodByNameLong.C", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_method method {};
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", "l:", &method), ANI_OK);

    ani_object obj {};
    ani_long arg = 1000;
    ASSERT_EQ(env->Object_New(cls, method, &obj, arg), ANI_OK);

    ani_long sum {};
    const ani_long value = 200;
    ASSERT_EQ(env->Object_CallMethodByName_Long(obj, "jf", "l:l", &sum, value), ANI_OK);
    ASSERT_EQ(sum, arg + value);

    ani_value args[1U];
    args[0U].l = value;
    ASSERT_EQ(env->Object_CallMethodByName_Long_A(obj, "jf", "l:l", &sum, args), ANI_OK);
    ASSERT_EQ(sum, arg + value);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Long_By_Name_24([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object obj {};
    GetMethodDataLong(env, &obj);

    ani_long sum = 0L;
    const ani_long value1 = std::numeric_limits<ani_long>::max();
    const ani_long value2 = 0L;
    ani_value args1[2U];
    args1[0U].l = value1;
    args1[1U].l = value2;
    ASSERT_EQ(env->Object_CallMethodByName_Long(obj, "longMethod", "ll:l", &sum, value1, value2), ANI_OK);
    ASSERT_EQ(sum, value1 + value2);
    ASSERT_EQ(env->Object_CallMethodByName_Long_A(obj, "longMethod", "ll:l", &sum, args1), ANI_OK);
    ASSERT_EQ(sum, value1 + value2);

    const ani_long value3 = std::numeric_limits<ani_long>::min();
    ani_value args2[2U];
    args2[0U].l = value3;
    args2[1U].l = value2;
    ASSERT_EQ(env->Object_CallMethodByName_Long(obj, "longMethod", "ll:l", &sum, value3, value2), ANI_OK);
    ASSERT_EQ(sum, value3 + value2);
    ASSERT_EQ(env->Object_CallMethodByName_Long_A(obj, "longMethod", "ll:l", &sum, args2), ANI_OK);
    ASSERT_EQ(sum, value3 + value2);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Long_By_Name_25([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object obj)
{
    constexpr ani_long VAL1 = 5000;
    constexpr ani_long VAL2 = 6000;
    ani_object object {};
    GetMethodDataLong(env, &object);

    ani_value args[2U];
    args[0U].l = VAL1;
    args[1U].l = VAL2;

    ani_long res = 0;
    ASSERT_EQ(env->c_api->Object_CallMethodByName_Long(nullptr, object, "longMethod", "ll:l", &res, VAL1, VAL2),
              ANI_INVALID_ARGS);
    ASSERT_EQ(env->c_api->Object_CallMethodByName_Long_A(nullptr, object, "longMethod", "ll:l", &res, args),
              ANI_INVALID_ARGS);

    ASSERT_EQ(env->Object_CallMethodByName_Long(nullptr, "longMethod", "ll:l", &res, VAL1, VAL2), ANI_INVALID_ARGS);
    ASSERT_EQ(env->Object_CallMethodByName_Long_A(nullptr, "longMethod", "ll:l", &res, args), ANI_INVALID_ARGS);

    ASSERT_EQ(env->Object_CallMethodByName_Long(object, nullptr, "ll:l", &res, VAL1, VAL2), ANI_INVALID_ARGS);
    ASSERT_EQ(env->Object_CallMethodByName_Long_A(object, nullptr, "ll:l", &res, args), ANI_INVALID_ARGS);

    ASSERT_EQ(env->Object_CallMethodByName_Long(object, "longMethod", nullptr, &res, VAL1, VAL2), ANI_OK);
    ASSERT_EQ(env->Object_CallMethodByName_Long_A(object, "longMethod", nullptr, &res, args), ANI_OK);

    ASSERT_EQ(env->Object_CallMethodByName_Long(object, "longMethod", "ll:l", nullptr, VAL1, VAL2), ANI_INVALID_ARGS);
    ASSERT_EQ(env->Object_CallMethodByName_Long_A(object, "longMethod", "ll:l", nullptr, args), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Long_By_Name_26([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object obj)
{
    constexpr ani_long VAL1 = 5000;
    constexpr ani_long VAL2 = 6000;
    ani_object object {};
    GetMethodDataLong(env, &object);

    ani_value args[2U];
    args[0U].l = VAL1;
    args[1U].l = VAL2;

    ani_long res = 0;
    const std::array<std::string_view, 4U> invalidMethodNames = {{"", "测试emoji🙂🙂", "\n\r\t", "\x01\x02\x03"}};

    for (const auto &methodName : invalidMethodNames) {
        ASSERT_EQ(env->Object_CallMethodByName_Long(object, methodName.data(), "ll:l", &res, VAL1, VAL2),
                  ANI_NOT_FOUND);
        ASSERT_EQ(env->Object_CallMethodByName_Long_A(object, methodName.data(), "ll:l", &res, args), ANI_NOT_FOUND);
    }
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Long_By_Name_27([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object obj)
{
    constexpr ani_long VAL1 = 5000;
    constexpr ani_long VAL2 = 6000;
    ani_object object {};
    GetMethodDataLong(env, &object);

    ani_value args[2U];
    args[0U].l = VAL1;
    args[1U].l = VAL2;

    ani_long res = 0;
    const std::array<std::string_view, 4U> invalidMethodNames = {{"", "测试emoji🙂🙂", "\n\r\t", "\x01\x02\x03"}};

    for (const auto &methodName : invalidMethodNames) {
        ASSERT_EQ(env->Object_CallMethodByName_Long(object, "longMethod", methodName.data(), &res, VAL1, VAL2),
                  ANI_INVALID_DESCRIPTOR);
        ASSERT_EQ(env->Object_CallMethodByName_Long_A(object, "longMethod", methodName.data(), &res, args),
                  ANI_INVALID_DESCRIPTOR);
    }
    return ANI_TRUE;
}

ani_int GetMethodDataRef(ani_env *env, ani_object *objectResult)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ObjectOperationsMethodByNameRef.A", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_static_method newMethod {};
    ASSERT_EQ(env->Class_FindStaticMethod(cls,
                  "new_A", ":C{entry.src.main.src.ets.ObjectOperationsMethodByNameRef.A}", &newMethod),
        ANI_OK);
    ani_ref ref {};
    ASSERT_EQ(env->Class_CallStaticMethod_Ref(cls, newMethod, &ref), ANI_OK);

    *objectResult = static_cast<ani_object>(ref);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Ref_By_Name_01([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object obj)
{
    static constexpr ani_int VAL1 = 10;
    static constexpr ani_int VAL2 = 20;
    ani_object object {};
    GetMethodDataRef(env, &object);

    ani_value args[2U];
    args[0U].i = VAL1;
    args[1U].i = VAL2;
    ani_ref ref = nullptr;
    ASSERT_EQ(env->Object_CallMethodByName_Ref_A(object, "getName", nullptr, &ref, args), ANI_OK);
    ASSERT_NE(ref, nullptr);

    auto string = reinterpret_cast<ani_string>(ref);
    ani_size result = 0U;
    ASSERT_EQ(env->String_GetUTF8Size(string, &result), ANI_OK);
    ASSERT_EQ(result, 8U);

    ani_size substrOffset = 0U;
    ani_size substrSize = result;
    const uint32_t bufferSize = 11U;
    char utfBuffer[bufferSize] = {};
    result = 0U;

    auto status =
        env->String_GetUTF8SubString(string, substrOffset, substrSize, utfBuffer, sizeof(utfBuffer), &result);
    ASSERT_EQ(status, ANI_OK);
    ASSERT_STREQ(utfBuffer, "Equality");
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Ref_By_Name_02([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object obj)
{
    ani_object object {};
    GetMethodDataRef(env, &object);

    ani_value args[2U];
    const ani_int arg1 = 11;
    const ani_int arg2 = 21;
    args[0U].i = arg1;
    args[1U].i = arg2;
    ani_ref ref = nullptr;
    ASSERT_EQ(env->Object_CallMethodByName_Ref_A(object, "getName", nullptr, &ref, args), ANI_OK);
    ASSERT_NE(ref, nullptr);

    auto string = reinterpret_cast<ani_string>(ref);
    ani_size result = 0U;
    ASSERT_EQ(env->String_GetUTF8Size(string, &result), ANI_OK);
    ASSERT_EQ(result, 10U);

    ani_size substrOffset = 0U;
    ani_size substrSize = result;
    const uint32_t bufferSize = 11U;
    char utfBuffer[bufferSize] = {};
    result = 0U;

    auto status =
        env->String_GetUTF8SubString(string, substrOffset, substrSize, utfBuffer, sizeof(utfBuffer), &result);
    ASSERT_EQ(status, ANI_OK);
    ASSERT_STREQ(utfBuffer, "Inequality");
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Ref_By_Name_03([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object obj)
{
    constexpr ani_int VAL1 = 10;
    constexpr ani_int VAL2 = 20;
    ani_object object {};
    GetMethodDataRef(env, &object);

    ani_value args[2U];
    args[0U].i = VAL1;
    args[1U].i = VAL2;
    ani_ref ref = nullptr;
    ASSERT_EQ(env->Object_CallMethodByName_Ref_A(object, "xxxxxx", nullptr, &ref, args), ANI_NOT_FOUND);
    ASSERT_EQ(env->Object_CallMethodByName_Ref_A(object, "getName", "ii:z", &ref, args), ANI_NOT_FOUND);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Ref_By_Name_04([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object obj)
{
    constexpr ani_int VAL1 = 10;
    constexpr ani_int VAL2 = 20;
    ani_object object {};
    GetMethodDataRef(env, &object);

    ani_value args[2U];
    args[0U].i = VAL1;
    args[1U].i = VAL2;
    ani_ref ref = nullptr;

    ASSERT_EQ(env->Object_CallMethodByName_Ref_A(nullptr, "getName", nullptr, &ref, args), ANI_INVALID_ARGS);
    ASSERT_EQ(ref, nullptr);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Ref_By_Name_05([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object obj)
{
    constexpr ani_int VAL1 = 10;
    constexpr ani_int VAL2 = 20;
    ani_object object {};
    GetMethodDataRef(env, &object);

    ani_value args[2U];
    args[0U].i = VAL1;
    args[1U].i = VAL2;
    ani_ref ref = nullptr;

    ASSERT_EQ(env->Object_CallMethodByName_Ref_A(object, nullptr, nullptr, &ref, args), ANI_INVALID_ARGS);
    ASSERT_EQ(ref, nullptr);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Ref_By_Name_06([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object obj)
{
    constexpr ani_int VAL1 = 10;
    constexpr ani_int VAL2 = 20;
    ani_object object {};
    GetMethodDataRef(env, &object);

    ani_value args[2U];
    args[0U].i = VAL1;
    args[1U].i = VAL2;
    ani_ref ref = nullptr;

    ASSERT_EQ(env->Object_CallMethodByName_Ref_A(object, "getName", nullptr, nullptr, args), ANI_INVALID_ARGS);
    ASSERT_EQ(ref, nullptr);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Ref_By_Name_07([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object obj)
{
    constexpr ani_int VAL1 = 10;
    constexpr ani_int VAL2 = 20;
    ani_object object {};
    GetMethodDataRef(env, &object);

    ani_ref ref = nullptr;
    ASSERT_EQ(env->Object_CallMethodByName_Ref(object, "getName", nullptr, &ref, VAL1, VAL2), ANI_OK);
    ASSERT_NE(ref, nullptr);

    auto string = reinterpret_cast<ani_string>(ref);
    ani_size result = 0U;
    ASSERT_EQ(env->String_GetUTF8Size(string, &result), ANI_OK);
    ASSERT_EQ(result, 8U);

    ani_size substrOffset = 0U;
    ani_size substrSize = result;
    const uint32_t bufferSize = 11U;
    char utfBuffer[bufferSize] = {};
    result = 0U;

    auto status =
        env->String_GetUTF8SubString(string, substrOffset, substrSize, utfBuffer, sizeof(utfBuffer), &result);
    ASSERT_EQ(status, ANI_OK);
    ASSERT_STREQ(utfBuffer, "Equality");
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Ref_By_Name_08([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object obj)
{
    ani_object object {};
    GetMethodDataRef(env, &object);

    const ani_int arg1 = 11;
    const ani_int arg2 = 20;
    ani_ref ref = nullptr;
    ASSERT_EQ(env->Object_CallMethodByName_Ref(object, "getName", nullptr, &ref, arg1, arg2), ANI_OK);
    ASSERT_NE(ref, nullptr);

    auto string = reinterpret_cast<ani_string>(ref);
    ani_size result = 0U;
    ASSERT_EQ(env->String_GetUTF8Size(string, &result), ANI_OK);
    ASSERT_EQ(result, 10U);

    ani_size substrOffset = 0U;
    ani_size substrSize = result;
    const uint32_t bufferSize = 11U;
    char utfBuffer[bufferSize] = {};
    result = 0U;

    auto status =
        env->String_GetUTF8SubString(string, substrOffset, substrSize, utfBuffer, sizeof(utfBuffer), &result);
    ASSERT_EQ(status, ANI_OK);
    ASSERT_STREQ(utfBuffer, "Inequality");
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Ref_By_Name_09([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object obj)
{
    constexpr ani_int VAL1 = 10;
    constexpr ani_int VAL2 = 20;
    ani_object object {};
    GetMethodDataRef(env, &object);

    ani_ref ref = nullptr;
    ASSERT_EQ(env->Object_CallMethodByName_Ref(object, "xxxxxxxx", nullptr, &ref, VAL1, VAL2), ANI_NOT_FOUND);
    ASSERT_EQ(env->Object_CallMethodByName_Ref(object, "getName", "ii:l", &ref, VAL1, VAL2), ANI_NOT_FOUND);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Ref_By_Name_10([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object obj)
{
    constexpr ani_int VAL1 = 10;
    constexpr ani_int VAL2 = 20;
    ani_ref ref = nullptr;
    ASSERT_EQ(env->Object_CallMethodByName_Ref(nullptr, "getName", nullptr, &ref, VAL1, VAL2), ANI_INVALID_ARGS);
    ASSERT_EQ(ref, nullptr);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Ref_By_Name_11([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object obj)
{
    constexpr ani_int VAL1 = 10;
    constexpr ani_int VAL2 = 20;
    ani_object object {};
    GetMethodDataRef(env, &object);

    ani_ref ref = nullptr;
    ASSERT_EQ(env->Object_CallMethodByName_Ref(object, nullptr, nullptr, &ref, VAL1, VAL2), ANI_INVALID_ARGS);
    ASSERT_EQ(ref, nullptr);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Ref_By_Name_12([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object obj)
{
    ani_object object {};
    GetMethodDataRef(env, &object);

    ani_ref ref = nullptr;
    ASSERT_EQ(env->Object_CallMethodByName_Ref(object, "getName", nullptr, nullptr), ANI_INVALID_ARGS);
    ASSERT_EQ(ref, nullptr);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Ref_By_Name_13([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_int VAL0 = 100;
    constexpr ani_int VAL1 = 10;
    constexpr ani_int VAL2 = 20;
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ObjectOperationsMethodByNameRef.B", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_method method {};
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", "i:", &method), ANI_OK);

    ani_object obj {};
    ASSERT_EQ(env->Object_New(cls, method, &obj, VAL0), ANI_OK);

    std::string result {};
    ani_ref ref = nullptr;
    ASSERT_EQ(env->Object_CallMethodByName_Ref(obj, "refMethod", "ii:C{std.core.String}", &ref, VAL1, VAL2), ANI_OK);
    ASSERT_NE(ref, nullptr);
    GetStdString(env, static_cast<ani_string>(ref), result);
    ASSERT_STREQ(result.c_str(), "Inequality");

    ani_value args[2U];
    args[0U].i = VAL1;
    args[1U].i = VAL2;
    ASSERT_EQ(env->Object_CallMethodByName_Ref_A(obj, "refMethod", "ii:C{std.core.String}", &ref, args), ANI_OK);
    ASSERT_NE(ref, nullptr);
    GetStdString(env, static_cast<ani_string>(ref), result);
    ASSERT_STREQ(result.c_str(), "Inequality");
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Ref_By_Name_14([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_int VAL0 = 100;
    constexpr ani_int VAL1 = 10;
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ObjectOperationsMethodByNameRef.B", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_method method {};
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", "i:", &method), ANI_OK);

    ani_object obj {};
    ASSERT_EQ(env->Object_New(cls, method, &obj, VAL0), ANI_OK);

    std::string result {};
    ani_ref ref = nullptr;
    ASSERT_EQ(env->Object_CallMethodByName_Ref(obj, "refMethod", "i:C{std.core.String}", &ref, VAL1), ANI_OK);
    ASSERT_NE(ref, nullptr);
    GetStdString(env, static_cast<ani_string>(ref), result);
    ASSERT_STREQ(result.c_str(), "Greater");

    ani_value args[1U];
    args[0U].i = VAL1;
    ASSERT_EQ(env->Object_CallMethodByName_Ref_A(obj, "refMethod", "i:C{std.core.String}", &ref, args), ANI_OK);
    ASSERT_NE(ref, nullptr);
    GetStdString(env, static_cast<ani_string>(ref), result);
    ASSERT_STREQ(result.c_str(), "Greater");
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Ref_By_Name_15([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_int VAL0 = 100;
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ObjectOperationsMethodByNameRef.C", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_method method {};
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", "i:", &method), ANI_OK);

    ani_object obj {};
    ASSERT_EQ(env->Object_New(cls, method, &obj, VAL0), ANI_OK);

    std::string result {};
    ani_ref ref = nullptr;
    const ani_int value1 = 5;
    const ani_int value2 = 8;
    ASSERT_EQ(env->Object_CallMethodByName_Ref(obj, "refCompareMethod", nullptr, &ref, value1, value2), ANI_OK);
    ASSERT_NE(ref, nullptr);
    GetStdString(env, static_cast<ani_string>(ref), result);
    ASSERT_STREQ(result.c_str(), "Less");

    ani_value args[2U];
    args[0U].i = value1;
    args[1U].i = value2;
    ASSERT_EQ(env->Object_CallMethodByName_Ref_A(obj, "refCompareMethod", nullptr, &ref, args), ANI_OK);
    ASSERT_NE(ref, nullptr);
    GetStdString(env, static_cast<ani_string>(ref), result);
    ASSERT_STREQ(result.c_str(), "Less");
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Ref_By_Name_16([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_int VAL0 = 100;
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ObjectOperationsMethodByNameRef.C", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_method method {};
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", "i:", &method), ANI_OK);

    ani_object obj {};
    ASSERT_EQ(env->Object_New(cls, method, &obj, VAL0), ANI_OK);

    std::string result {};
    ani_ref ref = nullptr;
    const ani_int value1 = 5;
    const ani_int value2 = 8;
    ASSERT_EQ(env->Object_CallMethodByName_Ref(obj, "refMethod", "ii:C{std.core.String}", &ref, value1, value2),
              ANI_OK);
    ASSERT_NE(ref, nullptr);
    GetStdString(env, static_cast<ani_string>(ref), result);
    ASSERT_STREQ(result.c_str(), "Inequality");

    ani_value args[2U];
    args[0U].i = value1;
    args[1U].i = value2;
    ASSERT_EQ(env->Object_CallMethodByName_Ref_A(obj, "refMethod", "ii:C{std.core.String}", &ref, args), ANI_OK);
    ASSERT_NE(ref, nullptr);
    GetStdString(env, static_cast<ani_string>(ref), result);
    ASSERT_STREQ(result.c_str(), "Inequality");
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Ref_By_Name_17([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_int VAL0 = 100;
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ObjectOperationsMethodByNameRef.B", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_method method {};
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", "i:", &method), ANI_OK);

    ani_object obj {};
    ASSERT_EQ(env->Object_New(cls, method, &obj, VAL0), ANI_OK);

    std::string result {};
    ani_ref ref = nullptr;
    const ani_int value = 5;
    ani_value args[1U];
    args[0U].i = value;
    ASSERT_EQ(env->Object_CallMethodByName_Ref(obj, "protectedMethod", nullptr, &ref, value), ANI_OK);
    ASSERT_NE(ref, nullptr);
    GetStdString(env, static_cast<ani_string>(ref), result);
    ASSERT_STREQ(result.c_str(), "Greater");

    ASSERT_EQ(env->Object_CallMethodByName_Ref_A(obj, "protectedMethod", nullptr, &ref, args), ANI_OK);
    ASSERT_NE(ref, nullptr);
    GetStdString(env, static_cast<ani_string>(ref), result);
    ASSERT_STREQ(result.c_str(), "Greater");

    ASSERT_EQ(env->Object_CallMethodByName_Ref(obj, "privateMethod", nullptr, &ref, value), ANI_OK);
    ASSERT_NE(ref, nullptr);
    GetStdString(env, static_cast<ani_string>(ref), result);
    ASSERT_STREQ(result.c_str(), "Greater");

    ASSERT_EQ(env->Object_CallMethodByName_Ref_A(obj, "privateMethod", nullptr, &ref, args), ANI_OK);
    ASSERT_NE(ref, nullptr);
    GetStdString(env, static_cast<ani_string>(ref), result);
    ASSERT_STREQ(result.c_str(), "Greater");

    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ObjectOperationsMethodByNameRef.C", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", nullptr, &method), ANI_OK);
    ASSERT_EQ(env->Object_New(cls, method, &obj, VAL0), ANI_OK);
    ASSERT_EQ(env->Object_CallMethodByName_Ref(obj, "callProtected", nullptr, &ref, value), ANI_OK);
    ASSERT_NE(ref, nullptr);
    GetStdString(env, static_cast<ani_string>(ref), result);
    ASSERT_STREQ(result.c_str(), "Greater");

    ASSERT_EQ(env->Object_CallMethodByName_Ref_A(obj, "callProtected", nullptr, &ref, args), ANI_OK);
    ASSERT_NE(ref, nullptr);
    GetStdString(env, static_cast<ani_string>(ref), result);
    ASSERT_STREQ(result.c_str(), "Greater");
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Ref_By_Name_18([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ObjectOperationsMethodByNameRef.B", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_method method {};
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", "i:", &method), ANI_OK);

    ani_object obj {};
    const ani_int arg = 6;
    ASSERT_EQ(env->Object_New(cls, method, &obj, arg), ANI_OK);

    std::string result {};
    ani_ref ref = nullptr;
    const ani_int value = 10;
    ASSERT_EQ(env->Object_CallMethodByName_Ref(obj, "nestedMethod", nullptr, &ref, value), ANI_OK);
    ASSERT_NE(ref, nullptr);
    GetStdString(env, static_cast<ani_string>(ref), result);
    ASSERT_STREQ(result.c_str(), "Less");

    ani_value args[1U];
    args[0U].i = value;
    ASSERT_EQ(env->Object_CallMethodByName_Ref_A(obj, "nestedMethod", nullptr, &ref, args), ANI_OK);
    ASSERT_NE(ref, nullptr);
    GetStdString(env, static_cast<ani_string>(ref), result);
    ASSERT_STREQ(result.c_str(), "Less");
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Ref_By_Name_19([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ObjectOperationsMethodByNameRef.B", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_method method {};
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", "i:", &method), ANI_OK);

    ani_object obj {};
    const ani_int arg = 6;
    ASSERT_EQ(env->Object_New(cls, method, &obj, arg), ANI_OK);

    std::string result {};
    ani_ref ref = nullptr;
    const ani_int value1 = 5;
    ASSERT_EQ(env->Object_CallMethodByName_Ref(obj, "recursiveMethod", nullptr, &ref, value1), ANI_OK);
    ASSERT_NE(ref, nullptr);
    GetStdString(env, static_cast<ani_string>(ref), result);
    ASSERT_STREQ(result.c_str(), "Greater");

    const ani_int value2 = -5;
    ani_value args[1U];
    args[0U].i = value2;
    ASSERT_EQ(env->Object_CallMethodByName_Ref_A(obj, "recursiveMethod", nullptr, &ref, args), ANI_OK);
    ASSERT_NE(ref, nullptr);
    GetStdString(env, static_cast<ani_string>(ref), result);
    ASSERT_STREQ(result.c_str(), "Less");
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Ref_By_Name_20([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ObjectOperationsMethodByNameRef.B", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_method method {};
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", "i:", &method), ANI_OK);

    ani_object obj {};
    const ani_int arg = 6;
    ASSERT_EQ(env->Object_New(cls, method, &obj, arg), ANI_OK);

    std::string result {};
    ani_ref ref = nullptr;
    const ani_int value1 = 1;
    const ani_char value2 = 'A';
    const ani_double value3 = 1.0;
    ASSERT_EQ(env->Object_CallMethodByName_Ref(obj, "calculateSum", nullptr, &ref, value1, value2, value3), ANI_OK);
    ASSERT_NE(ref, nullptr);
    GetStdString(env, static_cast<ani_string>(ref), result);
    ASSERT_STREQ(result.c_str(), "CharEquality");

    const ani_char value4 = 'B';
    ani_value args[3U];
    args[0U].i = value1;
    args[1U].c = value4;
    args[2U].d = value3;
    ASSERT_EQ(env->Object_CallMethodByName_Ref_A(obj, "calculateSum", nullptr, &ref, args), ANI_OK);
    ASSERT_NE(ref, nullptr);
    GetStdString(env, static_cast<ani_string>(ref), result);
    ASSERT_STREQ(result.c_str(), "NumEquality");

    const ani_double value5 = 2U;
    ASSERT_EQ(env->Object_CallMethodByName_Ref(obj, "calculateSum", nullptr, &ref, value1, value4, value5), ANI_OK);
    ASSERT_NE(ref, nullptr);
    GetStdString(env, static_cast<ani_string>(ref), result);
    ASSERT_STREQ(result.c_str(), "Inequality");
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Ref_By_Name_21([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ObjectOperationsMethodByNameRef.B", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_method method {};
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", "i:", &method), ANI_OK);

    ani_object obj {};
    const ani_int arg = 15;
    ASSERT_EQ(env->Object_New(cls, method, &obj, arg), ANI_OK);

    std::string result {};
    ani_ref ref = nullptr;
    const ani_int value1 = 5;
    const ani_int value2 = 6;
    ASSERT_EQ(env->Object_CallMethodByName_Ref(obj, "refMethod", "ii:C{std.core.String}", &ref, value1, value2),
              ANI_OK);
    ASSERT_NE(ref, nullptr);
    GetStdString(env, static_cast<ani_string>(ref), result);
    ASSERT_STREQ(result.c_str(), "Inequality");

    const ani_int value3 = 7;
    ASSERT_EQ(env->Object_CallMethodByName_Ref(obj, "refMethod", "ii:C{std.core.String}", &ref, value1, value3),
              ANI_OK);
    ASSERT_NE(ref, nullptr);
    GetStdString(env, static_cast<ani_string>(ref), result);
    ASSERT_STREQ(result.c_str(), "Inequality");

    const ani_int value4 = 3;
    ani_value args[3U];
    args[0U].i = value1;
    args[1U].i = value4;
    ASSERT_EQ(env->Object_CallMethodByName_Ref_A(obj, "refMethod", "ii:C{std.core.String}", &ref, args), ANI_OK);
    ASSERT_NE(ref, nullptr);
    GetStdString(env, static_cast<ani_string>(ref), result);
    ASSERT_STREQ(result.c_str(), "Inequality");

    const ani_int value5 = 5;
    ASSERT_EQ(env->Object_CallMethodByName_Ref(obj, "refMethod", "ii:C{std.core.String}", &ref, value1, value5),
              ANI_OK);
    ASSERT_NE(ref, nullptr);
    GetStdString(env, static_cast<ani_string>(ref), result);
    ASSERT_STREQ(result.c_str(), "Equality");

    const ani_int value6 = 12;
    ASSERT_EQ(env->Object_CallMethodByName_Ref(obj, "refMethod", "ii:C{std.core.String}", &ref, value1, value6),
              ANI_OK);
    ASSERT_NE(ref, nullptr);
    GetStdString(env, static_cast<ani_string>(ref), result);
    ASSERT_STREQ(result.c_str(), "Inequality");
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Ref_By_Name_22([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ObjectOperationsMethodByNameRef.C", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_method method {};
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", "i:", &method), ANI_OK);

    ani_object obj {};
    const ani_int arg = 10;
    ASSERT_EQ(env->Object_New(cls, method, &obj, arg), ANI_OK);

    std::string result {};
    ani_ref ref = nullptr;
    const ani_int value = 10;
    ASSERT_EQ(env->Object_CallMethodByName_Ref(obj, "jf", nullptr, &ref, value), ANI_OK);
    ASSERT_NE(ref, nullptr);
    GetStdString(env, static_cast<ani_string>(ref), result);
    ASSERT_STREQ(result.c_str(), "Equality");

    ani_value args[1U];
    args[0U].i = value;
    ASSERT_EQ(env->Object_CallMethodByName_Ref_A(obj, "jf", nullptr, &ref, args), ANI_OK);
    ASSERT_NE(ref, nullptr);
    GetStdString(env, static_cast<ani_string>(ref), result);
    ASSERT_STREQ(result.c_str(), "Equality");
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Ref_By_Name_23([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object obj)
{
    constexpr ani_int VAL1 = 10;
    constexpr ani_int VAL2 = 20;
    ani_object object {};
    GetMethodDataRef(env, &object);

    ani_value args[2U];
    args[0U].i = VAL1;
    args[1U].i = VAL2;

    ani_ref res = nullptr;
    ASSERT_EQ(
        env->c_api->Object_CallMethodByName_Ref(nullptr, object, "getName", "ii:C{std.core.String}", &res, VAL1, VAL2),
        ANI_INVALID_ARGS);
    ASSERT_EQ(
        env->c_api->Object_CallMethodByName_Ref_A(nullptr, object, "getName", "ii:C{std.core.String}", &res, args),
        ANI_INVALID_ARGS);

    ASSERT_EQ(env->Object_CallMethodByName_Ref(nullptr, "getName", "ii:C{std.core.String}", &res, VAL1, VAL2),
              ANI_INVALID_ARGS);
    ASSERT_EQ(env->Object_CallMethodByName_Ref_A(nullptr, "getName", "ii:C{std.core.String}", &res, args),
              ANI_INVALID_ARGS);

    ASSERT_EQ(env->Object_CallMethodByName_Ref(object, nullptr, "ii:C{std.core.String}", &res, VAL1, VAL2),
              ANI_INVALID_ARGS);
    ASSERT_EQ(env->Object_CallMethodByName_Ref_A(object, nullptr, "ii:C{std.core.String}", &res, args),
              ANI_INVALID_ARGS);

    ASSERT_EQ(env->Object_CallMethodByName_Ref(object, "getName", nullptr, &res, VAL1, VAL2), ANI_OK);
    ASSERT_EQ(env->Object_CallMethodByName_Ref_A(object, "getName", nullptr, &res, args), ANI_OK);

    ASSERT_EQ(env->Object_CallMethodByName_Ref(object, "getName", "ii:C{std.core.String}", nullptr, VAL1, VAL2),
              ANI_INVALID_ARGS);
    ASSERT_EQ(env->Object_CallMethodByName_Ref_A(object, "getName", "ii:C{std.core.String}", nullptr, args),
              ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Ref_By_Name_24([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object obj)
{
    constexpr ani_int VAL1 = 10;
    constexpr ani_int VAL2 = 20;
    ani_object object {};
    GetMethodDataRef(env, &object);

    ani_value args[2U];
    args[0U].l = VAL1;
    args[1U].l = VAL2;

    ani_ref res = nullptr;
    const std::array<std::string_view, 4U> invalidMethodNames = {{"", "测试emoji🙂🙂", "\n\r\t", "\x01\x02\x03"}};

    for (const auto &methodName : invalidMethodNames) {
        ASSERT_EQ(
            env->Object_CallMethodByName_Ref(object, methodName.data(), "ii:C{std.core.String}", &res, VAL1, VAL2),
            ANI_NOT_FOUND);
        ASSERT_EQ(env->Object_CallMethodByName_Ref_A(object, methodName.data(), "ii:C{std.core.String}", &res, args),
                  ANI_NOT_FOUND);
    }
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Ref_By_Name_25([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object obj)
{
    constexpr ani_int VAL1 = 10;
    constexpr ani_int VAL2 = 20;
    ani_object object {};
    GetMethodDataRef(env, &object);

    ani_value args[2U];
    args[0U].l = VAL1;
    args[1U].l = VAL2;

    ani_ref res = nullptr;
    const std::array<std::string_view, 4U> invalidMethodNames = {{"", "测试emoji🙂🙂", "\n\r\t", "\x01\x02\x03"}};

    for (const auto &methodName : invalidMethodNames) {
        ASSERT_EQ(env->Object_CallMethodByName_Ref(object, "getName", methodName.data(), &res, VAL1, VAL2),
                  ANI_INVALID_DESCRIPTOR);
        ASSERT_EQ(env->Object_CallMethodByName_Ref_A(object, "getName", methodName.data(), &res, args),
                 ANI_INVALID_DESCRIPTOR);
    }
    return ANI_TRUE;
}

ani_int GetMethodDataShort(ani_env *env, ani_object *objectResult)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ObjectOperationsMethodByNameShort.A", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_static_method newMethod {};
    ASSERT_EQ(env->Class_FindStaticMethod(cls,
                  "new_A", ":C{entry.src.main.src.ets.ObjectOperationsMethodByNameShort.A}", &newMethod),
        ANI_OK);
    ani_ref ref {};
    ASSERT_EQ(env->Class_CallStaticMethod_Ref(cls, newMethod, &ref), ANI_OK);

    *objectResult = static_cast<ani_object>(ref);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Short_By_Name_01([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object obj)
{
    const ani_short VAL1 = 5;
    const ani_short VAL2 = 6;
    ani_object object {};
    GetMethodDataShort(env, &object);

    ani_value args[2U];
    args[0U].s = VAL1;
    args[1U].s = VAL2;

    ani_short res {};
    ASSERT_EQ(env->Object_CallMethodByName_Short_A(object, "shortByNameMethod", "ss:s", &res, args), ANI_OK);
    ASSERT_EQ(res, VAL1 + VAL2);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Short_By_Name_02([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object obj)
{
    const ani_short VAL1 = 5;
    const ani_short VAL2 = 6;
    ani_object object {};
    GetMethodDataShort(env, &object);

    ani_short res {};
    ASSERT_EQ(env->Object_CallMethodByName_Short(object, "shortByNameMethod", "ss:s", &res, VAL1, VAL2), ANI_OK);
    ASSERT_EQ(res, VAL1 + VAL2);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Short_By_Name_03([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object obj)
{
    const ani_short VAL1 = 5;
    const ani_short VAL2 = 6;
    ani_object object {};
    GetMethodDataShort(env, &object);

    ani_short res {};
    ASSERT_EQ(env->c_api->Object_CallMethodByName_Short(env, object, "shortByNameMethod", "ss:s", &res, VAL1, VAL2),
              ANI_OK);
    ASSERT_EQ(res, VAL1 + VAL2);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Short_By_Name_04([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object obj)
{
    const ani_short VAL1 = 5;
    const ani_short VAL2 = 6;
    ani_object object {};
    GetMethodDataShort(env, &object);

    ani_short res {};
    ASSERT_EQ(env->Object_CallMethodByName_Short(object, "shortByNameMethod", "ss:x", &res, VAL1, VAL2),
              ANI_INVALID_DESCRIPTOR);
    ASSERT_EQ(env->Object_CallMethodByName_Short(object, "unknown_function", "ss:s", &res, VAL1, VAL2), ANI_NOT_FOUND);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Short_By_Name_05([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object obj)
{
    const ani_short VAL1 = 5;
    const ani_short VAL2 = 6;
    ani_object object {};
    GetMethodDataShort(env, &object);

    ani_short res {};
    ASSERT_EQ(env->Object_CallMethodByName_Short(object, nullptr, "ss:s", &res, VAL1, VAL2), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Short_By_Name_06([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object obj)
{
    const ani_short VAL1 = 5;
    const ani_short VAL2 = 6;
    ani_object object {};
    GetMethodDataShort(env, &object);

    ASSERT_EQ(env->Object_CallMethodByName_Short(object, "shortByNameMethod", "ss:s", nullptr, VAL1, VAL2),
              ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Short_By_Name_07([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object obj)
{
    const ani_short VAL1 = 5;
    const ani_short VAL2 = 6;
    ani_object object {};
    GetMethodDataShort(env, &object);

    ani_short res {};
    ASSERT_EQ(env->Object_CallMethodByName_Short(nullptr, "shortByNameMethod", "ss:s", &res, VAL1, VAL2),
              ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Short_By_Name_08([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object obj)
{
    ani_object object {};
    GetMethodDataShort(env, &object);

    ani_short res {};
    ASSERT_EQ(env->Object_CallMethodByName_Short(nullptr, "shortByNameMethod", "ss:s", &res, nullptr),
              ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Short_By_Name_09([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object obj)
{
    const ani_short VAL0 = 100;
    const ani_short VAL1 = 5;
    const ani_short VAL2 = 6;
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ObjectOperationsMethodByNameShort.B", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_method method {};
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", "s:", &method), ANI_OK);

    ASSERT_EQ(env->Object_New(cls, method, &obj, VAL0), ANI_OK);

    ani_short sum {};
    ASSERT_EQ(env->Object_CallMethodByName_Short(obj, "shortMethod", "ss:s", &sum, VAL1, VAL2), ANI_OK);
    ASSERT_EQ(sum, VAL0);

    ani_value args[2U];
    args[0U].s = VAL1;
    args[1U].s = VAL2;
    ASSERT_EQ(env->Object_CallMethodByName_Short_A(obj, "shortMethod", "ss:s", &sum, args), ANI_OK);
    ASSERT_EQ(sum, VAL0);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Short_By_Name_10([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object obj)
{
    const ani_short VAL0 = 100;
    const ani_short VAL1 = 5;
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ObjectOperationsMethodByNameShort.B", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_method method {};
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", "s:", &method), ANI_OK);

    ASSERT_EQ(env->Object_New(cls, method, &obj, VAL0), ANI_OK);

    ani_short sum {};
    ASSERT_EQ(env->Object_CallMethodByName_Short(obj, "shortMethod", "s:s", &sum, VAL1), ANI_OK);
    ASSERT_EQ(sum, VAL0);

    ani_value args[1U];
    args[0U].s = VAL1;
    ASSERT_EQ(env->Object_CallMethodByName_Short_A(obj, "shortMethod", "s:s", &sum, args), ANI_OK);
    ASSERT_EQ(sum, VAL0);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Short_By_Name_11([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object obj)
{
    const ani_short VAL0 = 100;
    const ani_short VAL1 = 5;
    const ani_short VAL2 = 6;
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ObjectOperationsMethodByNameShort.C", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_method method {};
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", "s:", &method), ANI_OK);

    ASSERT_EQ(env->Object_New(cls, method, &obj, VAL0), ANI_OK);

    ani_short sum {};
    ASSERT_EQ(env->Object_CallMethodByName_Short(obj, "shortAddMethod", "ss:s", &sum, VAL1, VAL2), ANI_OK);
    ASSERT_EQ(sum, VAL0 + VAL1 + VAL2);

    ani_value args[2U];
    args[0U].s = VAL1;
    args[1U].s = VAL2;
    ASSERT_EQ(env->Object_CallMethodByName_Short_A(obj, "shortAddMethod", "ss:s", &sum, args), ANI_OK);
    ASSERT_EQ(sum, VAL0 + VAL1 + VAL2);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Short_By_Name_12([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object obj)
{
    const ani_short VAL0 = 100;
    const ani_short VAL1 = 5;
    const ani_short VAL2 = 6;
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ObjectOperationsMethodByNameShort.C", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_method method {};
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", "s:", &method), ANI_OK);

    ASSERT_EQ(env->Object_New(cls, method, &obj, VAL0), ANI_OK);

    ani_short sum {};
    ASSERT_EQ(env->Object_CallMethodByName_Short(obj, "shortMethod", "ss:s", &sum, VAL1, VAL2), ANI_OK);
    ASSERT_EQ(sum, VAL0 - VAL1 - VAL2);

    ani_value args[2U];
    args[0U].s = VAL1;
    args[1U].s = VAL2;
    ASSERT_EQ(env->Object_CallMethodByName_Short_A(obj, "shortMethod", "ss:s", &sum, args), ANI_OK);
    ASSERT_EQ(sum, VAL0 - VAL1 - VAL2);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Short_By_Name_13([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object obj)
{
    const ani_short VAL0 = 100;
    const ani_short VAL1 = 5;
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ObjectOperationsMethodByNameShort.B", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_method method {};
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", "s:", &method), ANI_OK);

    ASSERT_EQ(env->Object_New(cls, method, &obj, VAL0), ANI_OK);

    ani_short num {};
    ani_value args[1U];
    args[0U].s = VAL1;
    ASSERT_EQ(env->Object_CallMethodByName_Short(obj, "protectedMethod", "s:s", &num, VAL1), ANI_OK);
    ASSERT_EQ(num, VAL0 + VAL1);
    ASSERT_EQ(env->Object_CallMethodByName_Short_A(obj, "protectedMethod", "s:s", &num, args), ANI_OK);
    ASSERT_EQ(num, VAL0 + VAL1);

    ASSERT_EQ(env->Object_CallMethodByName_Short(obj, "privateMethod", "s:s", &num, VAL1), ANI_OK);
    ASSERT_EQ(num, VAL0 - VAL1);
    ASSERT_EQ(env->Object_CallMethodByName_Short_A(obj, "privateMethod", "s:s", &num, args), ANI_OK);
    ASSERT_EQ(num, VAL0 - VAL1);

    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ObjectOperationsMethodByNameShort.C", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", "s:", &method), ANI_OK);
    ASSERT_EQ(env->Object_New(cls, method, &obj, VAL0), ANI_OK);
    ASSERT_EQ(env->Object_CallMethodByName_Short(obj, "callProtected", "s:s", &num, VAL1), ANI_OK);
    ASSERT_EQ(num, VAL0 + VAL1);
    ASSERT_EQ(env->Object_CallMethodByName_Short_A(obj, "callProtected", "s:s", &num, args), ANI_OK);
    ASSERT_EQ(num, VAL0 + VAL1);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Short_By_Name_14([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object obj)
{
    const ani_short VAL1 = 5;
    const ani_short VAL2 = 6;
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ObjectOperationsMethodByNameShort.B", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_method method {};
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", "s:", &method), ANI_OK);

    ASSERT_EQ(env->Object_New(cls, method, &obj, VAL2), ANI_OK);

    ani_short sum {};
    ASSERT_EQ(env->Object_CallMethodByName_Short(obj, "nestedMethod", "s:s", &sum, VAL1), ANI_OK);
    ASSERT_EQ(sum, VAL2 + VAL1);

    ani_value args[1U];
    args[0U].s = VAL1;
    ASSERT_EQ(env->Object_CallMethodByName_Short_A(obj, "nestedMethod", "s:s", &sum, args), ANI_OK);
    ASSERT_EQ(sum, VAL2 + VAL1);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Short_By_Name_15([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object obj)
{
    const ani_short VAL2 = 6;
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ObjectOperationsMethodByNameShort.B", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_method method {};
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", "s:", &method), ANI_OK);

    ASSERT_EQ(env->Object_New(cls, method, &obj, VAL2), ANI_OK);

    ani_short sum {};
    const ani_int value1 = 5;
    const ani_short result = 120;
    ASSERT_EQ(env->Object_CallMethodByName_Short(obj, "recursiveMethod", "i:s", &sum, value1), ANI_OK);
    ASSERT_EQ(sum, result);

    ani_value args[1U];
    args[0U].i = VAL1;
    ASSERT_EQ(env->Object_CallMethodByName_Short_A(obj, "recursiveMethod", "i:s", &sum, args), ANI_OK);
    ASSERT_EQ(sum, result);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Short_By_Name_16([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object obj)
{
    const ani_short VAL2 = 6;
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ObjectOperationsMethodByNameShort.B", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_method method {};
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", "s:", &method), ANI_OK);

    ASSERT_EQ(env->Object_New(cls, method, &obj, VAL2), ANI_OK);

    ani_short sum {};
    const ani_short value1 = 1;
    const ani_char value2 = 'A';
    const ani_double value3 = 1.0;
    ASSERT_EQ(env->Object_CallMethodByName_Short(obj, "calculateSum", "scd:s", &sum, value1, value2, value3), ANI_OK);
    ASSERT_EQ(sum, VAL2 - value1);

    const ani_char value4 = 'B';
    ani_value args[3U];
    args[0U].s = value1;
    args[1U].c = value4;
    args[2U].d = value3;
    ASSERT_EQ(env->Object_CallMethodByName_Short_A(obj, "calculateSum", "scd:s", &sum, args), ANI_OK);
    ASSERT_EQ(sum, value1);

    const ani_double value5 = 2U;
    ASSERT_EQ(env->Object_CallMethodByName_Short(obj, "calculateSum", "scd:s", &sum, value1, value4, value5), ANI_OK);
    ASSERT_EQ(sum, VAL2 + value1);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Short_By_Name_17([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object obj)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ObjectOperationsMethodByNameShort.B", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_method method {};
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", "s:", &method), ANI_OK);

    const ani_short arg = 15;
    ASSERT_EQ(env->Object_New(cls, method, &obj, arg), ANI_OK);

    ani_short sum {};
    const ani_short value1 = 5;
    const ani_short value2 = 6;
    ASSERT_EQ(env->Object_CallMethodByName_Short(obj, "shortMethod", "ss:s", &sum, value1, value2), ANI_OK);
    ASSERT_EQ(sum, arg);

    const ani_short value3 = 7;
    ASSERT_EQ(env->Object_CallMethodByName_Short(obj, "shortMethod", "ss:s", &sum, value1, value3), ANI_OK);
    ASSERT_EQ(sum, arg);

    const ani_short value4 = 3;
    ani_value args[2U];
    args[0U].s = value1;
    args[1U].s = value4;
    ASSERT_EQ(env->Object_CallMethodByName_Short_A(obj, "shortMethod", "ss:s", &sum, args), ANI_OK);
    ASSERT_EQ(sum, arg);

    const ani_short value5 = 10;
    ASSERT_EQ(env->Object_CallMethodByName_Short(obj, "shortMethod", "ss:s", &sum, value1, value5), ANI_OK);
    ASSERT_EQ(sum, value1 + value5);

    const ani_short value6 = 12;
    ASSERT_EQ(env->Object_CallMethodByName_Short(obj, "shortMethod", "ss:s", &sum, value1, value6), ANI_OK);
    ASSERT_EQ(sum, value1 + value6);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Short_By_Name_18([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object obj)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ObjectOperationsMethodByNameShort.C", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_method method {};
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", "s:", &method), ANI_OK);

    const ani_short arg = 10;
    ASSERT_EQ(env->Object_New(cls, method, &obj, arg), ANI_OK);

    ani_short sum {};
    const ani_short value = 2;
    ASSERT_EQ(env->Object_CallMethodByName_Short(obj, "jf", "s:s", &sum, value), ANI_OK);
    ASSERT_EQ(sum, arg + value);

    ani_value args[1U];
    args[0U].s = value;
    ASSERT_EQ(env->Object_CallMethodByName_Short_A(obj, "jf", "s:s", &sum, args), ANI_OK);
    ASSERT_EQ(sum, arg + value);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Short_By_Name_19([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object obj)
{
    GetMethodDataShort(env, &obj);

    ani_short sum = 0;
    const ani_short value1 = std::numeric_limits<ani_short>::max();
    const ani_short value2 = 0;
    ani_value args1[2U];
    args1[0U].s = value1;
    args1[1U].s = value2;
    ASSERT_EQ(env->Object_CallMethodByName_Short(obj, "shortByNameMethod", "ss:s", &sum, value1, value2), ANI_OK);
    ASSERT_EQ(sum, value1 + value2);
    ASSERT_EQ(env->Object_CallMethodByName_Short_A(obj, "shortByNameMethod", "ss:s", &sum, args1), ANI_OK);
    ASSERT_EQ(sum, value1 + value2);

    const ani_short value3 = std::numeric_limits<ani_short>::min();
    ani_value args2[2U];
    args2[0U].s = value3;
    args2[1U].s = value2;
    ASSERT_EQ(env->Object_CallMethodByName_Short(obj, "shortByNameMethod", "ss:s", &sum, value3, value2), ANI_OK);
    ASSERT_EQ(sum, value3 + value2);
    ASSERT_EQ(env->Object_CallMethodByName_Short_A(obj, "shortByNameMethod", "ss:s", &sum, args2), ANI_OK);
    ASSERT_EQ(sum, value3 + value2);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Short_By_Name_20([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object obj)
{
    const ani_short VAL1 = 5;
    const ani_short VAL2 = 6;
    ani_object object {};
    GetMethodDataShort(env, &object);

    ani_value args[2U];
    args[0U].s = VAL1;
    args[1U].s = VAL2;

    ani_short res {};
    ASSERT_EQ(
        env->c_api->Object_CallMethodByName_Short(nullptr, object, "shortByNameMethod", "ss:s", &res, VAL1, VAL2),
        ANI_INVALID_ARGS);
    ASSERT_EQ(env->c_api->Object_CallMethodByName_Short_A(nullptr, object, "shortByNameMethod", "ss:s", &res, args),
              ANI_INVALID_ARGS);

    ASSERT_EQ(env->Object_CallMethodByName_Short(nullptr, "shortByNameMethod", "ss:s", &res, VAL1, VAL2),
              ANI_INVALID_ARGS);
    ASSERT_EQ(env->Object_CallMethodByName_Short_A(nullptr, "shortByNameMethod", "ss:s", &res, args),
              ANI_INVALID_ARGS);

    ASSERT_EQ(env->Object_CallMethodByName_Short(object, nullptr, "ss:s", &res, VAL1, VAL2), ANI_INVALID_ARGS);
    ASSERT_EQ(env->Object_CallMethodByName_Short_A(object, nullptr, "ss:s", &res, args), ANI_INVALID_ARGS);

    ASSERT_EQ(env->Object_CallMethodByName_Short(object, "shortByNameMethod", nullptr, &res, VAL1, VAL2), ANI_OK);
    ASSERT_EQ(env->Object_CallMethodByName_Short_A(object, "shortByNameMethod", nullptr, &res, args), ANI_OK);

    ASSERT_EQ(env->Object_CallMethodByName_Short(object, "shortByNameMethod", "ss:s", nullptr, VAL1, VAL2),
              ANI_INVALID_ARGS);
    ASSERT_EQ(env->Object_CallMethodByName_Short_A(object, "shortByNameMethod", "ss:s", nullptr, args),
              ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Short_By_Name_21([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object obj)
{
    const ani_short VAL1 = 5;
    const ani_short VAL2 = 6;
    ani_object object {};
    GetMethodDataShort(env, &object);

    ani_value args[2U];
    args[0U].s = VAL1;
    args[1U].s = VAL2;

    ani_short res {};
    const std::array<std::string_view, 4U> invalidMethodNames = {{"", "测试emoji🙂🙂", "\n\r\t", "\x01\x02\x03"}};

    for (const auto &methodName : invalidMethodNames) {
        ASSERT_EQ(env->Object_CallMethodByName_Short(object, methodName.data(), "ss:s", &res, VAL1, VAL2),
                  ANI_NOT_FOUND);
        ASSERT_EQ(env->Object_CallMethodByName_Short_A(object, methodName.data(), "ss:s", &res, args), ANI_NOT_FOUND);
    }
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Short_By_Name_22([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object obj)
{
    const ani_short VAL1 = 5;
    const ani_short VAL2 = 6;
    ani_object object {};
    GetMethodDataShort(env, &object);

    ani_value args[2U];
    args[0U].s = VAL1;
    args[1U].s = VAL2;

    ani_short res {};
    const std::array<std::string_view, 4U> invalidMethodNames = {{"", "测试emoji🙂🙂", "\n\r\t", "\x01\x02\x03"}};

    for (const auto &methodName : invalidMethodNames) {
        ASSERT_EQ(env->Object_CallMethodByName_Short(object, methodName.data(), "", &res, VAL1, VAL2), ANI_INVALID_DESCRIPTOR);
        ASSERT_EQ(env->Object_CallMethodByName_Short_A(object, methodName.data(), "", &res, args), ANI_INVALID_DESCRIPTOR);
    }
    return ANI_TRUE;
}

ani_int GetMethodDataVoid(ani_env *env, ani_object *objectResult)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ObjectOperationsMethodByNameVoid.A", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_static_method newMethod {};
    ASSERT_EQ(env->Class_FindStaticMethod(cls,
                  "new_A", ":C{entry.src.main.src.ets.ObjectOperationsMethodByNameVoid.A}", &newMethod),
        ANI_OK);
    ani_ref ref {};
    ASSERT_EQ(env->Class_CallStaticMethod_Ref(cls, newMethod, &ref), ANI_OK);
    *objectResult = static_cast<ani_object>(ref);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Void_By_Name_01([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object obj)
{
    const ani_long VAL1 = 1000000;
    const ani_long VAL2 = 2000000;
    ani_object object {};
    GetMethodDataVoid(env, &object);

    ani_value args[2U];
    args[0U].l = VAL1;
    args[1U].l = VAL2;
    ani_long value {};

    ASSERT_EQ(env->Object_CallMethodByName_Void_A(object, "voidMethod", "ll:", args), ANI_OK);
    ASSERT_EQ(env->Object_CallMethodByName_Long(object, "getValue", nullptr, &value), ANI_OK);
    ASSERT_EQ(value, VAL1 + VAL2);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Void_By_Name_02([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object obj)
{
    const ani_long VAL1 = 1000000;
    const ani_long VAL2 = 2000000;
    ani_object object {};
    GetMethodDataVoid(env, &object);

    ani_value args[2U];
    args[0U].l = VAL1;
    args[1U].l = VAL2;
    ani_long value {};

    ASSERT_EQ(env->Object_CallMethodByName_Void_A(object, "voidMethod", nullptr, args), ANI_OK);
    ASSERT_EQ(env->Object_CallMethodByName_Long(object, "getValue", nullptr, &value), ANI_OK);
    ASSERT_EQ(value, VAL1 + VAL2);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Void_By_Name_03([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object obj)
{
    const ani_long VAL1 = 1000000;
    const ani_long VAL2 = 2000000;
    ani_object object {};
    GetMethodDataVoid(env, &object);

    ani_value args[2U];
    args[0U].l = VAL1;
    args[1U].l = VAL2;
    ani_long value {};

    ASSERT_EQ(env->Object_CallMethodByName_Void_A(object, "xxxxxxx", "ll:", args), ANI_NOT_FOUND);
    ASSERT_EQ(env->Object_CallMethodByName_Long(object, "getValue", "ll:l", &value), ANI_NOT_FOUND);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Void_By_Name_04([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object obj)
{
    const ani_long VAL1 = 1000000;
    const ani_long VAL2 = 2000000;
    ani_value args[2U];
    args[0U].l = VAL1;
    args[1U].l = VAL2;
    ASSERT_EQ(env->Object_CallMethodByName_Void_A(nullptr, "voidMethod", "ll:", args), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Void_By_Name_05([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object obj)
{
    const ani_long VAL1 = 1000000;
    const ani_long VAL2 = 2000000;
    ani_object object {};
    GetMethodDataVoid(env, &object);

    ani_value args[2U];
    args[0U].l = VAL1;
    args[1U].l = VAL2;

    ASSERT_EQ(env->Object_CallMethodByName_Void_A(object, nullptr, "ll:", args), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Void_By_Name_06([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object obj)
{
    ani_object object {};
    GetMethodDataVoid(env, &object);

    ASSERT_EQ(env->Object_CallMethodByName_Void_A(object, "voidMethod", "ll:", nullptr), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Void_By_Name_07([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object obj)
{
    const ani_long VAL1 = 1000000;
    const ani_long VAL2 = 2000000;
    ani_object object {};
    GetMethodDataVoid(env, &object);

    ani_long value {};
    ASSERT_EQ(env->Object_CallMethodByName_Void(object, "voidMethod", "ll:", VAL1, VAL2), ANI_OK);
    ASSERT_EQ(env->Object_CallMethodByName_Long(object, "getValue", nullptr, &value), ANI_OK);
    ASSERT_EQ(value, VAL1 + VAL2);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Void_By_Name_08([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object obj)
{
    const ani_long VAL1 = 1000000;
    const ani_long VAL2 = 2000000;
    ani_object object {};
    GetMethodDataVoid(env, &object);

    ani_long value {};
    ASSERT_EQ(env->Object_CallMethodByName_Void(object, "voidMethod", nullptr, VAL1, VAL2), ANI_OK);
    ASSERT_EQ(env->Object_CallMethodByName_Long(object, "getValue", nullptr, &value), ANI_OK);
    ASSERT_EQ(value, VAL1 + VAL2);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Void_By_Name_09([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object obj)
{
    const ani_long VAL1 = 1000000;
    const ani_long VAL2 = 2000000;
    ani_object object {};
    GetMethodDataVoid(env, &object);

    ani_long value {};
    ASSERT_EQ(env->Object_CallMethodByName_Void(object, "xxxxxxxxx", "ll:", VAL1, VAL2), ANI_NOT_FOUND);
    ASSERT_EQ(env->Object_CallMethodByName_Long(object, "getValue", "ll:l", &value), ANI_NOT_FOUND);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Void_By_Name_10([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object obj)
{
    const ani_long VAL1 = 1000000;
    const ani_long VAL2 = 2000000;
    ASSERT_EQ(env->Object_CallMethodByName_Void(nullptr, "voidMethod", "ll:", VAL1, VAL2), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Void_By_Name_11([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object obj)
{
    const ani_long VAL1 = 1000000;
    const ani_long VAL2 = 2000000;
    ani_object object {};
    GetMethodDataVoid(env, &object);

    ASSERT_EQ(env->Object_CallMethodByName_Void(object, nullptr, "ll:", VAL1, VAL2), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Void_By_Name_12([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ObjectOperationsMethodByNameVoid.B", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_method method {};
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", "i:", &method), ANI_OK);

    ani_object obj {};
    const ani_int arg = 100;
    ASSERT_EQ(env->Object_New(cls, method, &obj, arg), ANI_OK);

    const ani_int value1 = 5;
    const ani_int value2 = 6;
    ani_int res = 0;
    ASSERT_EQ(env->Object_CallMethodByName_Void(obj, "voidMethod", "ii:", value1, value2), ANI_OK);
    ASSERT_EQ(env->Object_CallMethodByName_Int(obj, "getIntValue", ":i", &res), ANI_OK);
    ASSERT_EQ(res, value1 + value2);

    ani_value args[2U];
    args[0U].i = value1;
    args[1U].i = value2;
    ASSERT_EQ(env->Object_CallMethodByName_Void_A(obj, "voidMethod", "ii:", args), ANI_OK);
    ASSERT_EQ(env->Object_CallMethodByName_Int(obj, "getIntValue", ":i", &res), ANI_OK);
    ASSERT_EQ(res, value1 + value2);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Void_By_Name_13([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ObjectOperationsMethodByNameVoid.B", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_method method {};
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", "i:", &method), ANI_OK);

    ani_object obj {};
    const ani_int arg = 100;
    ASSERT_EQ(env->Object_New(cls, method, &obj, arg), ANI_OK);

    ani_char res = 'a';
    const ani_char value = 'D';
    ASSERT_EQ(env->Object_CallMethodByName_Void(obj, "voidMethod", "c:", value), ANI_OK);
    ASSERT_EQ(env->Object_CallMethodByName_Char(obj, "getCharValue", ":c", &res), ANI_OK);
    ASSERT_EQ(res, value);

    ani_value args[1U];
    args[0U].c = value;
    ASSERT_EQ(env->Object_CallMethodByName_Void_A(obj, "voidMethod", "c:", args), ANI_OK);
    ASSERT_EQ(env->Object_CallMethodByName_Char(obj, "getCharValue", ":c", &res), ANI_OK);
    ASSERT_EQ(res, value);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Void_By_Name_14([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ObjectOperationsMethodByNameVoid.C", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_method method {};
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", "i:", &method), ANI_OK);

    ani_object obj {};
    ani_int arg = 100;
    ASSERT_EQ(env->Object_New(cls, method, &obj, arg), ANI_OK);

    ani_int res = 0;
    const ani_int value1 = 5;
    const ani_int value2 = 8;
    ASSERT_EQ(env->Object_CallMethodByName_Void(obj, "voidSunMethod", "ii:", value1, value2), ANI_OK);
    ASSERT_EQ(env->Object_CallMethodByName_Int(obj, "getIntValue", ":i", &res), ANI_OK);
    ASSERT_EQ(res, value1 + value2);

    ani_value args[2U];
    args[0U].i = value1;
    args[1U].i = value2;
    ASSERT_EQ(env->Object_CallMethodByName_Void_A(obj, "voidSunMethod", "ii:", args), ANI_OK);
    ASSERT_EQ(env->Object_CallMethodByName_Int(obj, "getIntValue", ":i", &res), ANI_OK);
    ASSERT_EQ(res, value1 + value2);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Void_By_Name_15([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ObjectOperationsMethodByNameVoid.C", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_method method {};
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", "i:", &method), ANI_OK);

    ani_object obj {};
    const ani_int arg = 10;
    ASSERT_EQ(env->Object_New(cls, method, &obj, arg), ANI_OK);

    ani_int res = 0;
    const ani_int value1 = 5;
    const ani_int value2 = 5;
    ASSERT_EQ(env->Object_CallMethodByName_Void(obj, "voidMethod", "ii:", value1, value2), ANI_OK);
    ASSERT_EQ(env->Object_CallMethodByName_Int(obj, "getIntValue", ":i", &res), ANI_OK);
    ASSERT_EQ(res, arg + value1 + value2);

    ani_value args[2U];
    args[0U].i = value1;
    args[1U].i = value2;
    ASSERT_EQ(env->Object_CallMethodByName_Void_A(obj, "voidMethod", "ii:", args), ANI_OK);
    ASSERT_EQ(env->Object_CallMethodByName_Int(obj, "getIntValue", ":i", &res), ANI_OK);
    ASSERT_EQ(res, arg + value1 + value2);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Void_By_Name_16([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ObjectOperationsMethodByNameVoid.B", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_method method {};
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", "i:", &method), ANI_OK);

    ani_object obj {};
    const ani_int arg = 5;
    ASSERT_EQ(env->Object_New(cls, method, &obj, arg), ANI_OK);

    ani_int res = 0;
    const ani_int value = 5;
    ani_value argsA[1U];
    argsA[0U].i = value;
    ASSERT_EQ(env->Object_CallMethodByName_Void(obj, "protectedMethod", "i:", value), ANI_OK);
    ASSERT_EQ(env->Object_CallMethodByName_Int(obj, "getIntValue", ":i", &res), ANI_OK);
    ASSERT_EQ(res, value);
    ASSERT_EQ(env->Object_CallMethodByName_Void_A(obj, "protectedMethod", "i:", argsA), ANI_OK);
    ASSERT_EQ(env->Object_CallMethodByName_Int(obj, "getIntValue", ":i", &res), ANI_OK);
    ASSERT_EQ(res, value);

    ani_double res1 = 0.0;
    const ani_double value1 = 5.0;
    ASSERT_EQ(env->Object_CallMethodByName_Void(obj, "privateMethod", "d:", value1), ANI_OK);
    ASSERT_EQ(env->Object_CallMethodByName_Double(obj, "getDoubleValue", ":d", &res1), ANI_OK);
    ASSERT_EQ(res1, value1);
    ani_value argsB[1U];
    argsB[0U].d = value1;
    ASSERT_EQ(env->Object_CallMethodByName_Void_A(obj, "privateMethod", "d:", argsB), ANI_OK);
    ASSERT_EQ(env->Object_CallMethodByName_Double(obj, "getDoubleValue", ":d", &res1), ANI_OK);
    ASSERT_EQ(res1, value1);

    const ani_int value2 = 5;
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ObjectOperationsMethodByNameVoid.C", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", nullptr, &method), ANI_OK);
    ASSERT_EQ(env->Object_New(cls, method, &obj, arg), ANI_OK);
    ASSERT_EQ(env->Object_CallMethodByName_Void(obj, "callProtected", "ii:", value, value2), ANI_OK);
    ASSERT_EQ(env->Object_CallMethodByName_Int(obj, "getIntValue", ":i", &res), ANI_OK);
    ASSERT_EQ(res, value + value2);
    ani_value argsC[2U];
    argsC[0U].i = value;
    argsC[1U].i = value2;
    ASSERT_EQ(env->Object_CallMethodByName_Void_A(obj, "callProtected", "ii:", argsC), ANI_OK);
    ASSERT_EQ(env->Object_CallMethodByName_Int(obj, "getIntValue", ":i", &res), ANI_OK);
    ASSERT_EQ(res, value + value2);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Void_By_Name_17([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ObjectOperationsMethodByNameVoid.B", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_method method {};
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", "i:", &method), ANI_OK);

    ani_object obj {};
    const ani_int arg = 6;
    ASSERT_EQ(env->Object_New(cls, method, &obj, arg), ANI_OK);

    ani_int res = 0;
    const ani_int value = 10;
    ASSERT_EQ(env->Object_CallMethodByName_Void(obj, "nestedMethod", "i:", value), ANI_OK);
    ASSERT_EQ(env->Object_CallMethodByName_Int(obj, "getIntValue", ":i", &res), ANI_OK);
    ASSERT_EQ(res, arg + value);

    ani_value args[1U];
    args[0U].i = value;
    ASSERT_EQ(env->Object_CallMethodByName_Void_A(obj, "nestedMethod", "i:", args), ANI_OK);
    ASSERT_EQ(env->Object_CallMethodByName_Int(obj, "getIntValue", ":i", &res), ANI_OK);
    ASSERT_EQ(res, arg + value);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Void_By_Name_18([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ObjectOperationsMethodByNameVoid.B", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_method method {};
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", "i:", &method), ANI_OK);

    ani_object obj {};
    const ani_int arg = 6;
    ASSERT_EQ(env->Object_New(cls, method, &obj, arg), ANI_OK);

    ani_int res = 0;
    const ani_int value1 = 5;
    const ani_int value2 = 15;
    ASSERT_EQ(env->Object_CallMethodByName_Void(obj, "recursiveMethod", "i:", value1), ANI_OK);
    ASSERT_EQ(env->Object_CallMethodByName_Int(obj, "getIntValue", ":i", &res), ANI_OK);
    ASSERT_EQ(res, value2);

    ani_value args[1U];
    args[0U].i = value1;
    ASSERT_EQ(env->Object_CallMethodByName_Void_A(obj, "recursiveMethod", "i:", args), ANI_OK);
    ASSERT_EQ(env->Object_CallMethodByName_Int(obj, "getIntValue", ":i", &res), ANI_OK);
    ASSERT_EQ(res, value2 + value2);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Void_By_Name_19([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ObjectOperationsMethodByNameVoid.B", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_method method {};
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", "i:", &method), ANI_OK);

    ani_object obj {};
    const ani_int arg = 6;
    ASSERT_EQ(env->Object_New(cls, method, &obj, arg), ANI_OK);

    ani_int res1 = 0;
    ani_char res2 = 'a';
    ani_double res3 = 0.0;
    const ani_int value1 = 1;
    const ani_char value2 = 'A';
    const ani_double value3 = 1.0;
    ASSERT_EQ(env->Object_CallMethodByName_Void(obj, "calculateSum", "icd:", value1, value2, value3), ANI_OK);
    ASSERT_EQ(env->Object_CallMethodByName_Int(obj, "getIntValue", ":i", &res1), ANI_OK);
    ASSERT_EQ(res1, value1);
    ASSERT_EQ(env->Object_CallMethodByName_Char(obj, "getCharValue", ":c", &res2), ANI_OK);
    ASSERT_EQ(res2, value2);
    ASSERT_EQ(env->Object_CallMethodByName_Double(obj, "getDoubleValue", ":d", &res3), ANI_OK);
    ASSERT_EQ(res1, value3);

    ani_value args[3U];
    args[0U].i = value1;
    args[1U].c = value2;
    args[2U].c = value3;
    ASSERT_EQ(env->Object_CallMethodByName_Void_A(obj, "calculateSum", "icd:", args), ANI_OK);
    ASSERT_EQ(env->Object_CallMethodByName_Int(obj, "getIntValue", ":i", &res1), ANI_OK);
    ASSERT_EQ(res1, value1);
    ASSERT_EQ(env->Object_CallMethodByName_Char(obj, "getCharValue", ":c", &res2), ANI_OK);
    ASSERT_EQ(res2, value2);
    ASSERT_EQ(env->Object_CallMethodByName_Double(obj, "getDoubleValue", ":d", &res3), ANI_OK);
    ASSERT_EQ(res1, value3);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Void_By_Name_20([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ObjectOperationsMethodByNameVoid.B", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_method method {};
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", "i:", &method), ANI_OK);

    ani_object obj {};
    ani_int arg = 15;
    ASSERT_EQ(env->Object_New(cls, method, &obj, arg), ANI_OK);

    ani_int res = 0;
    const ani_int value1 = 5;
    const ani_int value2 = 6;
    ASSERT_EQ(env->Object_CallMethodByName_Void(obj, "voidMethod", "ii:", value1, value2), ANI_OK);
    ASSERT_EQ(env->Object_CallMethodByName_Int(obj, "getIntValue", ":i", &res), ANI_OK);
    ASSERT_EQ(res, value1 + value2);

    const ani_int value3 = 7;
    ASSERT_EQ(env->Object_CallMethodByName_Void(obj, "voidMethod", "ii:", value1, value3), ANI_OK);
    ASSERT_EQ(env->Object_CallMethodByName_Int(obj, "getIntValue", ":i", &res), ANI_OK);
    ASSERT_EQ(res, value1 + value3);

    const ani_int value4 = 3;
    ani_value args[2U];
    args[0U].i = value1;
    args[1U].i = value4;
    ASSERT_EQ(env->Object_CallMethodByName_Void_A(obj, "voidMethod", "ii:", args), ANI_OK);
    ASSERT_EQ(env->Object_CallMethodByName_Int(obj, "getIntValue", ":i", &res), ANI_OK);
    ASSERT_EQ(res, value1 + value4);

    const ani_int value5 = 5;
    ASSERT_EQ(env->Object_CallMethodByName_Void(obj, "voidMethod", "ii:", value1, value5), ANI_OK);
    ASSERT_EQ(env->Object_CallMethodByName_Int(obj, "getIntValue", ":i", &res), ANI_OK);
    ASSERT_EQ(res, value1 + value5);

    const ani_int value6 = 12;
    ASSERT_EQ(env->Object_CallMethodByName_Void(obj, "voidMethod", "ii:", value1, value6), ANI_OK);
    ASSERT_EQ(env->Object_CallMethodByName_Int(obj, "getIntValue", ":i", &res), ANI_OK);
    ASSERT_EQ(res, value1 + value6);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Void_By_Name_21([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ObjectOperationsMethodByNameVoid.C", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_method method {};
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", "i:", &method), ANI_OK);

    ani_object obj {};
    const ani_int arg = 10;
    ASSERT_EQ(env->Object_New(cls, method, &obj, arg), ANI_OK);

    ani_int res = 0;
    const ani_int value = 10;
    ASSERT_EQ(env->Object_CallMethodByName_Void(obj, "jf", "i:", value), ANI_OK);
    ASSERT_EQ(env->Object_CallMethodByName_Int(obj, "getIntValue", ":i", &res), ANI_OK);
    ASSERT_EQ(res, arg + value);

    ani_value args[1U];
    args[0U].i = value;
    ASSERT_EQ(env->Object_CallMethodByName_Void_A(obj, "jf", "i:", args), ANI_OK);
    ASSERT_EQ(env->Object_CallMethodByName_Int(obj, "getIntValue", ":i", &res), ANI_OK);
    ASSERT_EQ(res, arg + value);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Void_By_Name_22([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object obj)
{
    const ani_long VAL1 = 1000000;
    const ani_long VAL2 = 2000000;
    ani_object object {};
    GetMethodDataVoid(env, &object);

    ani_value args[2U];
    args[0U].l = VAL1;
    args[1U].l = VAL2;

    ASSERT_EQ(env->c_api->Object_CallMethodByName_Void(nullptr, object, "voidMethod", "ll:", VAL1, VAL2),
              ANI_INVALID_ARGS);
    ASSERT_EQ(env->c_api->Object_CallMethodByName_Void_A(nullptr, object, "voidMethod", "ll:", args),
              ANI_INVALID_ARGS);

    ASSERT_EQ(env->Object_CallMethodByName_Void(nullptr, "voidMethod", "ll:", VAL1, VAL2), ANI_INVALID_ARGS);
    ASSERT_EQ(env->Object_CallMethodByName_Void_A(nullptr, "voidMethod", "ll:", args), ANI_INVALID_ARGS);

    ASSERT_EQ(env->Object_CallMethodByName_Void(object, nullptr, "ll:", VAL1, VAL2), ANI_INVALID_ARGS);
    ASSERT_EQ(env->Object_CallMethodByName_Void_A(object, nullptr, "ll:", args), ANI_INVALID_ARGS);

    ASSERT_EQ(env->Object_CallMethodByName_Void(object, "voidMethod", nullptr, VAL1, VAL2), ANI_OK);
    ASSERT_EQ(env->Object_CallMethodByName_Void_A(object, "voidMethod", nullptr, args), ANI_OK);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Void_By_Name_23([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object obj)
{
    const ani_long VAL1 = 1000000;
    const ani_long VAL2 = 2000000;
    ani_object object {};
    GetMethodDataVoid(env, &object);

    ani_value args[2U];
    args[0U].l = VAL1;
    args[1U].l = VAL2;

    const std::array<std::string_view, 4U> invalidMethodNames = {{"", "测试emoji🙂🙂", "\n\r\t", "\x01\x02\x03"}};

    for (const auto &methodName : invalidMethodNames) {
        ASSERT_EQ(env->Object_CallMethodByName_Void(object, methodName.data(), "ll:", VAL1, VAL2), ANI_NOT_FOUND);
        ASSERT_EQ(env->Object_CallMethodByName_Void_A(object, methodName.data(), "ll:", args), ANI_NOT_FOUND);
    }
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Void_By_Name_24([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object obj)
{
    const ani_long VAL1 = 1000000;
    const ani_long VAL2 = 2000000;
    ani_object object {};
    GetMethodDataVoid(env, &object);

    ani_value args[2U];
    args[0U].l = VAL1;
    args[1U].l = VAL2;

    const std::array<std::string_view, 4U> invalidMethodNames = {{"", "测试emoji🙂🙂", "\n\r\t", "\x01\x02\x03"}};

    for (const auto &methodName : invalidMethodNames) {
        ASSERT_EQ(env->Object_CallMethodByName_Void(object, methodName.data(), "", VAL1, VAL2), ANI_INVALID_DESCRIPTOR);
        ASSERT_EQ(env->Object_CallMethodByName_Void_A(object, methodName.data(), "", args), ANI_INVALID_DESCRIPTOR);
    }
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Ref_01([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_int VAL = 2;
    const ani_int VAL1 = 3;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodRef.A";
    paramObjOperation.methodName = "stringMethod";
    paramObjOperation.signature = nullptr;
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_value args[2U];
    ani_int arg1 = VAL;
    ani_int arg2 = VAL1;
    args[0U].i = arg1;
    args[1U].i = arg2;

    std::string str {};
    ani_ref result {};
    ASSERT_EQ(env->Object_CallMethod_Ref_A(object, method, &result, args), ANI_OK);
    ASSERT_NE(result, nullptr);
    GetStdString(env, static_cast<ani_string>(result), str);
    ASSERT_STREQ(str.c_str(), "nihao");
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Ref_02([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_int VAL = 2;
    const ani_int VAL1 = 3;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodRef.A";
    paramObjOperation.methodName = "stringMethod";
    paramObjOperation.signature = nullptr;
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_int arg1 = VAL;
    ani_int arg2 = VAL1;
    std::string str {};
    ani_ref result {};
    ASSERT_EQ(env->Object_CallMethod_Ref(object, method, &result, arg1, arg2), ANI_OK);
    ASSERT_NE(result, nullptr);
    GetStdString(env, static_cast<ani_string>(result), str);
    ASSERT_STREQ(str.c_str(), "nihao");
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Ref_03([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_int VAL2 = 5;
    const ani_int VAL3 = 6;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodRef.A";
    paramObjOperation.methodName = "stringMethod";
    paramObjOperation.signature = nullptr;
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_ref result {};
    ani_int arg1 = VAL2;
    ani_int arg2 = VAL3;
    ASSERT_EQ(env->c_api->Object_CallMethod_Ref(nullptr, object, method, &result, arg1, arg2), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Ref_04([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_int VAL2 = 5;
    const ani_int VAL3 = 6;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodRef.A";
    paramObjOperation.methodName = "stringMethod";
    paramObjOperation.signature = nullptr;
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_ref result {};
    ani_int arg1 = VAL2;
    ani_int arg2 = VAL3;
    ASSERT_EQ(env->Object_CallMethod_Ref(object, nullptr, &result, arg1, arg2), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Ref_05([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_int VAL2 = 5;
    const ani_int VAL3 = 6;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodRef.A";
    paramObjOperation.methodName = "stringMethod";
    paramObjOperation.signature = nullptr;
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_int arg1 = VAL2;
    ani_int arg2 = VAL3;
    ASSERT_EQ(env->Object_CallMethod_Ref(object, method, nullptr, arg1, arg2), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Ref_06([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_int VAL2 = 5;
    const ani_int VAL3 = 6;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodRef.A";
    paramObjOperation.methodName = "stringMethod";
    paramObjOperation.signature = nullptr;
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_ref result {};
    ani_int arg1 = VAL2;
    ani_int arg2 = VAL3;
    ASSERT_EQ(env->Object_CallMethod_Ref(nullptr, method, &result, arg1, arg2), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Ref_07([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodRef.A";
    paramObjOperation.methodName = "stringMethod";
    paramObjOperation.signature = nullptr;
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_ref result {};
    ASSERT_EQ(env->Object_CallMethod_Ref_A(object, method, &result, nullptr), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Ref_08([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodRef.A";
    paramObjOperation.methodName = "stringMethodVoidParam";
    paramObjOperation.signature = nullptr;
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    std::string str {};
    ani_ref result {};
    ASSERT_EQ(env->Object_CallMethod_Ref(object, method, &result), ANI_OK);
    ASSERT_NE(result, nullptr);
    GetStdString(env, static_cast<ani_string>(result), str);
    ASSERT_STREQ(str.c_str(), "hello world");

    ani_value args[2U];
    ASSERT_EQ(env->Object_CallMethod_Ref_A(object, method, &result, args), ANI_OK);
    ASSERT_NE(result, nullptr);
    GetStdString(env, static_cast<ani_string>(result), str);
    ASSERT_STREQ(str.c_str(), "hello world");
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Ref_09([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_int VAL = 2;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodRef.A";
    paramObjOperation.methodName = "stringMethodMultipleParam";
    paramObjOperation.signature = nullptr;
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_value args[5U] = {};
    ani_int arg1 = VAL;
    ani_boolean arg2 = ANI_TRUE;
    ani_float arg3 = 3.0F;
    ani_short arg4 = 4U;
    ani_double arg5 = 5.0F;
    args[0U].i = arg1;
    args[1U].z = arg2;
    args[2U].f = arg3;
    args[3U].s = arg4;
    args[4U].d = arg5;

    std::string str {};
    ani_ref result {};
    ASSERT_EQ(env->Object_CallMethod_Ref(object, method, &result, arg1, arg2, arg3, arg4, arg5), ANI_OK);
    ASSERT_NE(result, nullptr);
    GetStdString(env, static_cast<ani_string>(result), str);
    ASSERT_STREQ(str.c_str(), "china");

    ASSERT_EQ(env->Object_CallMethod_Ref_A(object, method, &result, args), ANI_OK);
    ASSERT_NE(result, nullptr);
    GetStdString(env, static_cast<ani_string>(result), str);
    ASSERT_STREQ(str.c_str(), "china");
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Ref_10([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodRef.A";
    paramObjOperation.methodName = "stringMethodVoidParam";
    paramObjOperation.signature = nullptr;
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    std::string str {};
    ani_ref result {};
    ASSERT_EQ(env->Object_CallMethod_Ref(object, method, &result), ANI_OK);
    ASSERT_NE(result, nullptr);
    GetStdString(env, static_cast<ani_string>(result), str);
    ASSERT_STREQ(str.c_str(), "hello world");

    ani_value args[2U];
    ASSERT_EQ(env->Object_CallMethod_Ref_A(object, method, &result, args), ANI_OK);
    ASSERT_NE(result, nullptr);
    GetStdString(env, static_cast<ani_string>(result), str);
    ASSERT_STREQ(str.c_str(), "hello world");
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Ref_11([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object obj)
{
    const ani_int VAL3 = 6;
    const ani_int VAL4 = 11;
    ani_class clsC {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ObjectOperationsMethodRef.C", &clsC), ANI_OK);
    ASSERT_NE(clsC, nullptr);

    ani_method method {};
    ASSERT_EQ(env->Class_FindMethod(clsC, "func", nullptr, &method), ANI_OK);
    ASSERT_NE(method, nullptr);

    ani_class clsD {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ObjectOperationsMethodRef.D", &clsD), ANI_OK);
    ASSERT_NE(clsD, nullptr);
    ani_method ctor {};
    ASSERT_EQ(env->Class_FindMethod(clsD, "<ctor>", ":", &ctor), ANI_OK);

    ani_object object {};
    ASSERT_EQ(env->Object_New(clsD, ctor, &object), ANI_OK);
    ASSERT_NE(object, nullptr);

    ani_value args[2U] = {};
    ani_int arg1 = VAL3;
    ani_int arg2 = VAL4;
    args[0U].i = arg1;
    args[1U].i = arg2;

    std::string str {};
    ani_ref result {};
    ASSERT_EQ(env->Object_CallMethod_Ref(object, method, &result, arg1, arg2), ANI_OK);
    ASSERT_NE(result, nullptr);
    GetStdString(env, static_cast<ani_string>(result), str);
    ASSERT_STREQ(str.c_str(), "nihao");

    ASSERT_EQ(env->Object_CallMethod_Ref_A(object, method, &result, args), ANI_OK);
    ASSERT_NE(result, nullptr);
    GetStdString(env, static_cast<ani_string>(result), str);
    ASSERT_STREQ(str.c_str(), "nihao");
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Ref_12([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_int VAL2 = 5;
    const ani_int VAL3 = 6;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodRef.E";
    paramObjOperation.methodName = "func";
    paramObjOperation.signature = nullptr;
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_value args[2U] = {};
    ani_int arg1 = VAL3;
    ani_int arg2 = VAL2;
    args[0U].i = arg1;
    args[1U].i = arg2;

    std::string str {};
    ani_ref result {};
    ASSERT_EQ(env->Object_CallMethod_Ref(object, method, &result, arg1, arg2), ANI_OK);
    ASSERT_NE(result, nullptr);
    GetStdString(env, static_cast<ani_string>(result), str);
    ASSERT_STREQ(str.c_str(), "hello world");

    ASSERT_EQ(env->Object_CallMethod_Ref_A(object, method, &result, args), ANI_OK);
    ASSERT_NE(result, nullptr);
    GetStdString(env, static_cast<ani_string>(result), str);
    ASSERT_STREQ(str.c_str(), "hello world");
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Ref_13([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_int VAL1 = 3;
    const ani_int VAL3 = 6;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodRef.A";
    paramObjOperation.methodName = "stringMethod";
    paramObjOperation.signature = nullptr;
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    std::string str {};
    ani_ref result {};
    ani_value args[2U] = {};
    ani_int arg1 = VAL1;
    ani_int arg2 = VAL1;
    args[0U].i = arg1;
    args[1U].i = arg2;
    for (ani_int i = 0; i < VAL3; i++) {
        ASSERT_EQ(env->Object_CallMethod_Ref(object, method, &result, arg1, arg2), ANI_OK);
        ASSERT_NE(result, nullptr);
        GetStdString(env, static_cast<ani_string>(result), str);
        ASSERT_STREQ(str.c_str(), "nihao");

        ASSERT_EQ(env->Object_CallMethod_Ref_A(object, method, &result, args), ANI_OK);
        ASSERT_NE(result, nullptr);
        GetStdString(env, static_cast<ani_string>(result), str);
        ASSERT_STREQ(str.c_str(), "nihao");
    }
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Ref_14([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_int VAL1 = 3;
    const ani_int VAL2 = 5;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodRef.A";
    paramObjOperation.methodName = "nestedMethod";
    paramObjOperation.signature = nullptr;
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    std::string str {};
    ani_ref result {};
    ani_value args[2U] = {};
    ani_int arg1 = VAL1;
    ani_int arg2 = VAL2;
    args[0U].i = arg1;
    args[1U].i = arg2;
    ASSERT_EQ(env->Object_CallMethod_Ref(object, method, &result, arg1, arg2), ANI_OK);
    ASSERT_NE(result, nullptr);
    GetStdString(env, static_cast<ani_string>(result), str);
    ASSERT_STREQ(str.c_str(), "nihao");

    ASSERT_EQ(env->Object_CallMethod_Ref_A(object, method, &result, args), ANI_OK);
    ASSERT_NE(result, nullptr);
    GetStdString(env, static_cast<ani_string>(result), str);
    ASSERT_STREQ(str.c_str(), "nihao");
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Ref_15([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_int VAL1 = 3;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodRef.A";
    paramObjOperation.methodName = "recursionMethod";
    paramObjOperation.signature = nullptr;
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    std::string str {};
    ani_ref result {};
    ani_value args[1U] = {};
    ani_int arg1 = VAL1;
    args[0U].i = arg1;
    ASSERT_EQ(env->Object_CallMethod_Ref(object, method, &result, arg1), ANI_OK);
    ASSERT_NE(result, nullptr);
    GetStdString(env, static_cast<ani_string>(result), str);
    ASSERT_STREQ(str.c_str(), "hello");

    ASSERT_EQ(env->Object_CallMethod_Ref_A(object, method, &result, args), ANI_OK);
    ASSERT_NE(result, nullptr);
    GetStdString(env, static_cast<ani_string>(result), str);
    ASSERT_STREQ(str.c_str(), "hello");
    return ANI_TRUE;
}

ani_int test_Object_New([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls = {};
    ani_object obj = {};
    ASSERT_EQ(GetClsData(env, &obj, &cls), ANI_TRUE);

    ani_method ctor {};
    ani_object objResult {};
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", ":", &ctor), ANI_OK);
    ASSERT_EQ(env->Object_New(cls, ctor, &objResult), ANI_OK);
    ASSERT_NE(objResult, nullptr);
    return ANI_TRUE;
}

ani_int test_Object_InstanceOf([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_string result = nullptr;
    auto status = env->String_NewUTF8("a", 1U, &result);
    ASSERT_EQ(status, ANI_OK);
    ASSERT_NE(result, nullptr);

    ani_type type {};
    ani_boolean res = ANI_FALSE;
    ASSERT_EQ(env->Object_GetType(result, &type), ANI_OK);
    return ANI_TRUE;
}

ani_int test_Object_GetType([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_string result = nullptr;
    auto status = env->String_NewUTF8("a", 1U, &result);
    ASSERT_EQ(status, ANI_OK);
    ASSERT_NE(result, nullptr);

    ani_type type {};
    ani_boolean res = ANI_FALSE;
    ASSERT_EQ(env->Object_GetType(result, &type), ANI_OK);
    ASSERT_EQ(env->Object_InstanceOf(result, type, &res), ANI_OK);
    ASSERT_EQ(res, ANI_TRUE);
    return ANI_TRUE;
}

ani_int test_Reference_IsNull([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ASSERT_EQ(env->CreateEscapeLocalScope(SPECIFIED_CAPACITY), ANI_OK);
    ani_ref nullRef;
    ASSERT_EQ(env->GetNull(&nullRef), ANI_OK);
    ani_ref result;
    ASSERT_EQ(env->DestroyEscapeLocalScope(nullRef, &result), ANI_OK);
    ani_boolean isNull = ANI_FALSE;
    ASSERT_EQ(env->Reference_IsNull(result, &isNull), ANI_OK);
    ASSERT_EQ(isNull, ANI_TRUE);
    return ANI_TRUE;
}

ani_int test_Reference_IsUndefined([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ASSERT_EQ(env->CreateEscapeLocalScope(SPECIFIED_CAPACITY), ANI_OK);
    ani_ref undefined;
    ASSERT_EQ(env->GetUndefined(&undefined), ANI_OK);
    ani_ref result;
    ASSERT_EQ(env->DestroyEscapeLocalScope(undefined, &result), ANI_OK);
    ani_boolean isUndefined = ANI_FALSE;
    ASSERT_EQ(env->Reference_IsUndefined(result, &isUndefined), ANI_OK);
    ASSERT_EQ(isUndefined, ANI_TRUE);
    return ANI_TRUE;
}

ani_int test_Reference_Equals([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_enum aniEnum {};
    ASSERT_EQ(env->FindEnum("entry.src.main.src.ets.ObjectOperations.ToFind", &aniEnum), ANI_OK);
    ASSERT_NE(aniEnum, nullptr);

    ani_enum_item redName {};
    ASSERT_EQ(env->Enum_GetEnumItemByName(aniEnum, "RED", &redName), ANI_OK);
    ani_enum_item redIndex {};
    ASSERT_EQ(env->Enum_GetEnumItemByIndex(aniEnum, 0U, &redIndex), ANI_OK);
    ani_boolean isRedEqual = ANI_FALSE;
    ASSERT_EQ(env->Reference_Equals(redName, redIndex, &isRedEqual), ANI_OK);
    ASSERT_EQ(isRedEqual, ANI_TRUE);
    return ANI_TRUE;
}

ani_int test_Array_New([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_ref undefinedRef {};
    ASSERT_EQ(env->GetUndefined(&undefinedRef), ANI_OK);

    ani_array array = nullptr;
    ASSERT_EQ(env->Array_New(LENGTH_5, undefinedRef, nullptr), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_New_A([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_int weight = 200;
    const char m[] = "Pure P60";
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ObjectOperations.MobilePhone", &cls), ANI_OK);
    ani_method ctor {};
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", "C{std.core.String}i:", &ctor), ANI_OK);
    ani_string model {};
    ASSERT_EQ(env->String_NewUTF8(m, strlen(m), &model), ANI_OK);
    ani_value args[2U];
    args[0U].r = model;
    args[1U].i = weight;
    ani_object phone {};
    ASSERT_EQ(env->Object_New_A(cls, ctor, &phone, args), ANI_OK);
    return ANI_TRUE;
}

// NOLINTBEGIN(cppcoreguidelines-pro-type-vararg)
template <typename R, typename... Args>
ani_int DoCallFunctionV(ani_env *env, std::optional<R> *result, ani_function fn, Args &&...args)
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
ani_int CallEtsFunctionImplV(ani_env *env, std::optional<R> *result, const std::string &moduleDescriptor,
                             const std::string &fnName, Args &&...args)
{
    ani_module mod {};
    ASSERT_EQ(env->FindModule(moduleDescriptor.c_str(), &mod), ANI_OK);
    ani_function fn {};
    ASSERT_EQ(env->Module_FindFunction(mod, fnName.c_str(), nullptr, &fn), ANI_OK);
    ASSERT_EQ(DoCallFunctionV(env, result, fn, std::forward<Args>(args)...), ANI_TRUE);
    return ANI_TRUE;
}

/// Call function with name `fnName` from module denoted by `moduleDescriptor`
template <typename R, typename... Args>
R CallEtsFunctionV(ani_env *env, const std::string &moduleName, const std::string &fnName, Args &&...args)
{
    std::optional<R> result;
    //auto moduleDescriptor = "L" + moduleName + ";";
    CallEtsFunctionImplV(env, &result, moduleName, fnName, std::forward<Args>(args)...);
    if constexpr (!std::is_same_v<R, void>) {
        return result.value();
    }
}

ani_status TestFuncV(ani_env *env, ani_class cls, ani_method method, ani_object *result,
                     ...)
{
    va_list args {};
    va_start(args, result);
    ani_status aniResult = ANI_ERROR;
    aniResult = env->c_api->Object_New_V(env, cls, method, result, args);
    va_end(args);
    return aniResult;
}

ani_int GetTestString(ani_env *env, ani_string *tag)
{
    const char model[] = "Pure P60";
    ASSERT_EQ(env->String_NewUTF8(model, strlen(model), tag), ANI_OK);
    ASSERT_NE(*tag, nullptr);
    return ANI_TRUE;
}

ani_int test_Object_New_V([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ObjectOperations.Test", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_method ctor {};
    const char *tmpName = "iC{std.core.String}C{entry.src.main.src.ets.ObjectOperations.Animal}:";
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", tmpName, &ctor), ANI_OK);
    ASSERT_NE(ctor, nullptr);

    ani_string tag {};
    ASSERT_EQ(GetTestString(env, &tag), ANI_TRUE);
    auto animalRef = CallEtsFunctionV<ani_ref>(env, "entry.src.main.src.ets.ObjectOperations", "newAnimalObject");

    ani_object tmpObj {};
    ani_int value1 = 200;
    ASSERT_EQ(TestFuncV(env, cls, ctor, &tmpObj, value1, tag, animalRef), ANI_OK);
    return ANI_TRUE;
}

ani_int test_Reference_IsNullishValue([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    auto ref = CallEtsFunctionV<ani_ref>(env, "entry.src.main.src.ets.ObjectOperations", "getNull");
    ani_boolean isUndefined = ANI_FALSE;
    ASSERT_EQ(env->Reference_IsNullishValue(ref, &isUndefined), ANI_OK);
    ASSERT_EQ(isUndefined, ANI_TRUE);
    return ANI_TRUE;
}

ani_int GetTestDataFiledBool(ani_env *env,
                             ani_object *objectResult,
                             ani_field *fieldNameResult,
                             ani_field *fieldMarriedResult)
{
    auto sarahRef = CallEtsFunctionV<ani_ref>(env, "entry.src.main.src.ets.ObjectOperations", "newSarahObject");
    auto sarah = static_cast<ani_object>(sarahRef);

    ani_class cls;
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ObjectOperations.Woman", &cls), ANI_OK);

    ani_field fieldName;
    ASSERT_EQ(env->Class_FindField(cls, "name", &fieldName), ANI_OK);

    ani_field fieldMarried;
    ASSERT_EQ(env->Class_FindField(cls, "married", &fieldMarried), ANI_OK);

    *objectResult = sarah;
    *fieldNameResult = fieldName;
    *fieldMarriedResult = fieldMarried;
    return ANI_TRUE;
}

ani_int test_Object_Get_Field_Boolean_01([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object sarah {};
    ani_field field {};
    ani_field fieldMarried {};
    GetTestDataFiledBool(env, &sarah, &field, &fieldMarried);

    ani_boolean married = ANI_FALSE;
    ASSERT_EQ(env->Object_GetField_Boolean(sarah, fieldMarried, &married), ANI_OK);
    ASSERT_EQ(married, true);
    return ANI_TRUE;
}

ani_int test_Object_Get_Field_Boolean_02([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object sarah {};
    ani_field field {};
    ani_field fieldMarried {};
    GetTestDataFiledBool(env, &sarah, &field, &fieldMarried);

    ani_boolean married = ANI_FALSE;
    ASSERT_EQ(env->c_api->Object_GetField_Boolean(nullptr, sarah, fieldMarried, &married), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Get_Field_Boolean_03([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object sarah {};
    ani_field field {};
    ani_field fieldMarried {};
    GetTestDataFiledBool(env, &sarah, &field, &fieldMarried);

    ani_boolean married = ANI_FALSE;
    ASSERT_EQ(env->Object_GetField_Boolean(sarah, field, &married), ANI_INVALID_TYPE);
    return ANI_TRUE;
}

ani_int test_Object_Get_Field_Boolean_04([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object sarah {};
    ani_field field {};
    ani_field fieldMarried {};
    GetTestDataFiledBool(env, &sarah, &field, &fieldMarried);

    ani_boolean married = ANI_FALSE;
    ASSERT_EQ(env->Object_GetField_Boolean(nullptr, field, &married), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Get_Field_Boolean_05([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object sarah {};
    ani_field field {};
    ani_field fieldMarried {};
    GetTestDataFiledBool(env, &sarah, &field, &fieldMarried);

    ani_boolean married = ANI_FALSE;
    ASSERT_EQ(env->Object_GetField_Boolean(sarah, nullptr, &married), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Get_Field_Boolean_06([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object sarah {};
    ani_field field {};
    ani_field fieldMarried {};
    GetTestDataFiledBool(env, &sarah, &field, &fieldMarried);

    ASSERT_EQ(env->Object_GetField_Boolean(sarah, field, nullptr), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int GetTestDataFiledByte(ani_env *env,
                             ani_object *objectResult,
                             ani_field *fieldNameResult,
                             ani_field *fieldAgeResult)
{
    auto sarahRef = CallEtsFunctionV<ani_ref>(env, "entry.src.main.src.ets.ObjectOperations", "newSarahObject2");
    auto sarah = static_cast<ani_object>(sarahRef);

    ani_class cls;
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ObjectOperations.Woman2", &cls), ANI_OK);

    ani_field fieldName;
    ASSERT_EQ(env->Class_FindField(cls, "name", &fieldName), ANI_OK);

    ani_field fieldAge;
    ASSERT_EQ(env->Class_FindField(cls, "age", &fieldAge), ANI_OK);

    *objectResult = sarah;
    *fieldNameResult = fieldName;
    *fieldAgeResult = fieldAge;
    return ANI_TRUE;
}

ani_int test_Object_Get_Field_Byte_01([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object sarah {};
    ani_field field {};
    ani_field fieldAge {};
    GetTestDataFiledByte(env, &sarah, &field, &fieldAge);

    ani_byte age {};
    ASSERT_EQ(env->Object_GetField_Byte(sarah, fieldAge, &age), ANI_OK);
    ASSERT_EQ(age, 24L);
    return ANI_TRUE;
}

ani_int test_Object_Get_Field_Byte_02([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object sarah {};
    ani_field field {};
    ani_field fieldAge {};
    GetTestDataFiledByte(env, &sarah, &field, &fieldAge);

    ani_byte age {};
    ASSERT_EQ(env->c_api->Object_GetField_Byte(nullptr, sarah, fieldAge, &age), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Get_Field_Byte_03([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object sarah {};
    ani_field field {};
    ani_field fieldAge {};
    GetTestDataFiledByte(env, &sarah, &field, &fieldAge);

    ani_byte age {};
    ASSERT_EQ(env->Object_GetField_Byte(sarah, field, &age), ANI_INVALID_TYPE);
    return ANI_TRUE;
}

ani_int test_Object_Get_Field_Byte_04([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object sarah {};
    ani_field field {};
    ani_field fieldAge {};
    GetTestDataFiledByte(env, &sarah, &field, &fieldAge);

    ani_byte age {};
    ASSERT_EQ(env->Object_GetField_Byte(nullptr, field, &age), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Get_Field_Byte_05([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object sarah {};
    ani_field field {};
    ani_field fieldAge {};
    GetTestDataFiledByte(env, &sarah, &field, &fieldAge);

    ani_byte age {};
    ASSERT_EQ(env->Object_GetField_Byte(sarah, nullptr, &age), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Get_Field_Byte_06([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object sarah {};
    ani_field field {};
    ani_field fieldAge {};
    GetTestDataFiledByte(env, &sarah, &field, &fieldAge);

    ASSERT_EQ(env->Object_GetField_Byte(sarah, field, nullptr), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int GetTestDataFiledChar(ani_env *env,
                             ani_object *objectResult,
                             ani_field *fieldNameResult,
                             ani_field *fieldIndexResult)
{
    auto sarahRef = CallEtsFunctionV<ani_ref>(env, "entry.src.main.src.ets.ObjectOperations", "newSarahObject3");
    auto sarah = static_cast<ani_object>(sarahRef);

    ani_class cls;
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ObjectOperations.Woman3", &cls), ANI_OK);

    ani_field fieldName;
    ASSERT_EQ(env->Class_FindField(cls, "name", &fieldName), ANI_OK);

    ani_field fieldIndex;
    ASSERT_EQ(env->Class_FindField(cls, "index", &fieldIndex), ANI_OK);

    *objectResult = sarah;
    *fieldNameResult = fieldName;
    *fieldIndexResult = fieldIndex;
    return ANI_TRUE;
}

ani_int test_Object_Get_Field_Char_01([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object sarah {};
    ani_field field {};
    ani_field fieldIndex {};
    GetTestDataFiledChar(env, &sarah, &field, &fieldIndex);

    ani_char index = '\0';
    ani_char xx = 'a';
    ASSERT_EQ(env->Object_GetField_Char(sarah, fieldIndex, &index), ANI_OK);
    ASSERT_EQ(index, xx);
    return ANI_TRUE;
}

ani_int test_Object_Get_Field_Char_02([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object sarah {};
    ani_field field {};
    ani_field fieldIndex {};
    GetTestDataFiledChar(env, &sarah, &field, &fieldIndex);

    ani_char index = '\0';
    ASSERT_EQ(env->c_api->Object_GetField_Char(nullptr, sarah, fieldIndex, &index), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Get_Field_Char_03([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object sarah {};
    ani_field field {};
    ani_field fieldIndex {};
    GetTestDataFiledChar(env, &sarah, &field, &fieldIndex);

    ani_char index = '\0';
    ASSERT_EQ(env->Object_GetField_Char(sarah, field, &index), ANI_INVALID_TYPE);
    return ANI_TRUE;
}

ani_int test_Object_Get_Field_Char_04([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object sarah {};
    ani_field field {};
    ani_field fieldIndex {};
    GetTestDataFiledChar(env, &sarah, &field, &fieldIndex);

    ani_char index = '\0';
    ASSERT_EQ(env->Object_GetField_Char(nullptr, field, &index), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Get_Field_Char_05([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object sarah {};
    ani_field field {};
    ani_field fieldIndex {};
    GetTestDataFiledChar(env, &sarah, &field, &fieldIndex);

    ani_char index = '\0';
    ASSERT_EQ(env->Object_GetField_Char(sarah, nullptr, &index), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Get_Field_Char_06([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object sarah {};
    ani_field field {};
    ani_field fieldIndex {};
    GetTestDataFiledChar(env, &sarah, &field, &fieldIndex);

    ASSERT_EQ(env->Object_GetField_Char(sarah, field, nullptr), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int GetTestDataFiledDouble(ani_env *env,
                               ani_object *objectResult,
                               ani_field *fieldNameResult,
                               ani_field *fieldAgeResult)
{
    auto sarahRef = CallEtsFunctionV<ani_ref>(env, "entry.src.main.src.ets.ObjectOperations", "newSarahObject4");
    auto sarah = static_cast<ani_object>(sarahRef);

    ani_class cls;
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ObjectOperations.Woman4", &cls), ANI_OK);

    ani_field fieldName;
    ASSERT_EQ(env->Class_FindField(cls, "name", &fieldName), ANI_OK);

    ani_field fieldAge;
    ASSERT_EQ(env->Class_FindField(cls, "age", &fieldAge), ANI_OK);

    *objectResult = sarah;
    *fieldNameResult = fieldName;
    *fieldAgeResult = fieldAge;
    return ANI_TRUE;
}

ani_int test_Object_Get_Field_Double_01([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object sarah {};
    ani_field field {};
    ani_field fieldAge {};
    GetTestDataFiledDouble(env, &sarah, &field, &fieldAge);

    ani_double age = 0.0F;
    ASSERT_EQ(env->Object_GetField_Double(sarah, fieldAge, &age), ANI_OK);
    ASSERT_EQ(age, 24.0F);
    return ANI_TRUE;
}

ani_int test_Object_Get_Field_Double_02([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object sarah {};
    ani_field field {};
    ani_field fieldAge {};
    GetTestDataFiledDouble(env, &sarah, &field, &fieldAge);

    ani_double age = 0.0F;
    ASSERT_EQ(env->c_api->Object_GetField_Double(nullptr, sarah, fieldAge, &age), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Get_Field_Double_03([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object sarah {};
    ani_field field {};
    ani_field fieldAge {};
    GetTestDataFiledDouble(env, &sarah, &field, &fieldAge);

    ani_double age = 0.0F;
    ASSERT_EQ(env->Object_GetField_Double(sarah, field, &age), ANI_INVALID_TYPE);
    return ANI_TRUE;
}

ani_int test_Object_Get_Field_Double_04([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object sarah {};
    ani_field field {};
    ani_field fieldAge {};
    GetTestDataFiledDouble(env, &sarah, &field, &fieldAge);

    ani_double age = 0.0F;
    ASSERT_EQ(env->Object_GetField_Double(nullptr, field, &age), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Get_Field_Double_05([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object sarah {};
    ani_field field {};
    ani_field fieldAge {};
    GetTestDataFiledDouble(env, &sarah, &field, &fieldAge);

    ani_double age = 0.0F;
    ASSERT_EQ(env->Object_GetField_Double(sarah, nullptr, &age), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Get_Field_Double_06([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object sarah {};
    ani_field field {};
    ani_field fieldAge {};
    GetTestDataFiledDouble(env, &sarah, &field, &fieldAge);

    ASSERT_EQ(env->Object_GetField_Double(sarah, field, nullptr), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int GetTestDataFiledFloat(ani_env *env,
                              ani_object *objectResult,
                              ani_field *fieldNameResult,
                              ani_field *fieldAgeResult)
{
    auto sarahRef = CallEtsFunctionV<ani_ref>(env, "entry.src.main.src.ets.ObjectOperations", "newSarahObject5");
    auto sarah = static_cast<ani_object>(sarahRef);

    ani_class cls;
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ObjectOperations.Woman5", &cls), ANI_OK);

    ani_field fieldName;
    ASSERT_EQ(env->Class_FindField(cls, "name", &fieldName), ANI_OK);

    ani_field fieldAge;
    ASSERT_EQ(env->Class_FindField(cls, "age", &fieldAge), ANI_OK);

    *objectResult = sarah;
    *fieldNameResult = fieldName;
    *fieldAgeResult = fieldAge;
    return ANI_TRUE;
}

ani_int test_Object_Get_Field_Float_01([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object sarah {};
    ani_field field {};
    ani_field fieldAge {};
    GetTestDataFiledFloat(env, &sarah, &field, &fieldAge);

    ani_float age = 0.0F;
    ASSERT_EQ(env->Object_GetField_Float(sarah, fieldAge, &age), ANI_OK);
    ASSERT_EQ(age, 24.0F);
    return ANI_TRUE;
}

ani_int test_Object_Get_Field_Float_02([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object sarah {};
    ani_field field {};
    ani_field fieldAge {};
    GetTestDataFiledFloat(env, &sarah, &field, &fieldAge);

    ani_float age = 0.0F;
    ASSERT_EQ(env->c_api->Object_GetField_Float(nullptr, sarah, fieldAge, &age), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Get_Field_Float_03([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object sarah {};
    ani_field field {};
    ani_field fieldAge {};
    GetTestDataFiledFloat(env, &sarah, &field, &fieldAge);

    ani_float age = 0.0F;
    ASSERT_EQ(env->Object_GetField_Float(sarah, field, &age), ANI_INVALID_TYPE);
    return ANI_TRUE;
}

ani_int test_Object_Get_Field_Float_04([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object sarah {};
    ani_field field {};
    ani_field fieldAge {};
    GetTestDataFiledFloat(env, &sarah, &field, &fieldAge);

    ani_float age = 0.0F;
    ASSERT_EQ(env->Object_GetField_Float(nullptr, field, &age), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Get_Field_Float_05([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object sarah {};
    ani_field field {};
    ani_field fieldAge {};
    GetTestDataFiledFloat(env, &sarah, &field, &fieldAge);

    ani_float age = 0.0F;
    ASSERT_EQ(env->Object_GetField_Float(sarah, nullptr, &age), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Get_Field_Float_06([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object sarah {};
    ani_field field {};
    ani_field fieldAge {};
    GetTestDataFiledFloat(env, &sarah, &field, &fieldAge);

    ASSERT_EQ(env->Object_GetField_Float(sarah, field, nullptr), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int GetTestDataFiledInt(ani_env *env,
                            ani_object *objectResult,
                            ani_field *fieldNameResult,
                            ani_field *fieldAgeResult)
{
    auto sarahRef = CallEtsFunctionV<ani_ref>(env, "entry.src.main.src.ets.ObjectOperations", "newSarahObject6");
    auto sarah = static_cast<ani_object>(sarahRef);

    ani_class cls;
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ObjectOperations.Woman6", &cls), ANI_OK);

    ani_field fieldName;
    ASSERT_EQ(env->Class_FindField(cls, "name", &fieldName), ANI_OK);

    ani_field fieldAge;
    ASSERT_EQ(env->Class_FindField(cls, "age", &fieldAge), ANI_OK);

    *objectResult = sarah;
    *fieldNameResult = fieldName;
    *fieldAgeResult = fieldAge;
    return ANI_TRUE;
}

ani_int test_Object_Get_Field_Int_01([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object sarah {};
    ani_field field {};
    ani_field fieldAge {};
    GetTestDataFiledInt(env, &sarah, &field, &fieldAge);

    ani_int age = 0U;
    ASSERT_EQ(env->Object_GetField_Int(sarah, fieldAge, &age), ANI_OK);
    ASSERT_EQ(age, 24U);
    return ANI_TRUE;
}

ani_int test_Object_Get_Field_Int_02([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object sarah {};
    ani_field field {};
    ani_field fieldAge {};
    GetTestDataFiledInt(env, &sarah, &field, &fieldAge);

    ani_int age = 0U;
    ASSERT_EQ(env->c_api->Object_GetField_Int(nullptr, sarah, fieldAge, &age), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Get_Field_Int_03([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object sarah {};
    ani_field field {};
    ani_field fieldAge {};
    GetTestDataFiledInt(env, &sarah, &field, &fieldAge);

    ani_int age = 0U;
    ASSERT_EQ(env->Object_GetField_Int(sarah, field, &age), ANI_INVALID_TYPE);
    return ANI_TRUE;
}

ani_int test_Object_Get_Field_Int_04([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object sarah {};
    ani_field field {};
    ani_field fieldAge {};
    GetTestDataFiledInt(env, &sarah, &field, &fieldAge);

    ani_int age = 0U;
    ASSERT_EQ(env->Object_GetField_Int(nullptr, field, &age), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Get_Field_Int_05([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object sarah {};
    ani_field field {};
    ani_field fieldAge {};
    GetTestDataFiledInt(env, &sarah, &field, &fieldAge);

    ani_int age = 0U;
    ASSERT_EQ(env->Object_GetField_Int(sarah, nullptr, &age), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Get_Field_Int_06([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object sarah {};
    ani_field field {};
    ani_field fieldAge {};
    GetTestDataFiledInt(env, &sarah, &field, &fieldAge);

    ASSERT_EQ(env->Object_GetField_Int(sarah, field, nullptr), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int GetTestDataFiledLong(ani_env *env,
                             ani_object *objectResult,
                             ani_field *fieldNameResult,
                             ani_field *fieldAgeResult)
{
    auto sarahRef = CallEtsFunctionV<ani_ref>(env, "entry.src.main.src.ets.ObjectOperations", "newSarahObject7");
    auto sarah = static_cast<ani_object>(sarahRef);

    ani_class cls;
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ObjectOperations.Woman7", &cls), ANI_OK);

    ani_field fieldName;
    ASSERT_EQ(env->Class_FindField(cls, "name", &fieldName), ANI_OK);

    ani_field fieldAge;
    ASSERT_EQ(env->Class_FindField(cls, "age", &fieldAge), ANI_OK);

    *objectResult = sarah;
    *fieldNameResult = fieldName;
    *fieldAgeResult = fieldAge;
    return ANI_TRUE;
}

ani_int test_Object_Get_Field_Long_01([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object sarah {};
    ani_field field {};
    ani_field fieldAge {};
    GetTestDataFiledLong(env, &sarah, &field, &fieldAge);

    ani_long age = 0L;
    ASSERT_EQ(env->Object_GetField_Long(sarah, fieldAge, &age), ANI_OK);
    ASSERT_EQ(age, 24L);
    return ANI_TRUE;
}

ani_int test_Object_Get_Field_Long_02([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object sarah {};
    ani_field field {};
    ani_field fieldAge {};
    GetTestDataFiledLong(env, &sarah, &field, &fieldAge);

    ani_long age = 0L;
    ASSERT_EQ(env->c_api->Object_GetField_Long(nullptr, sarah, fieldAge, &age), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Get_Field_Long_03([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object sarah {};
    ani_field field {};
    ani_field fieldAge {};
    GetTestDataFiledLong(env, &sarah, &field, &fieldAge);

    ani_long age = 0L;
    ASSERT_EQ(env->Object_GetField_Long(sarah, field, &age), ANI_INVALID_TYPE);
    return ANI_TRUE;
}

ani_int test_Object_Get_Field_Long_04([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object sarah {};
    ani_field field {};
    ani_field fieldAge {};
    GetTestDataFiledLong(env, &sarah, &field, &fieldAge);

    ani_long age = 0L;
    ASSERT_EQ(env->Object_GetField_Long(nullptr, field, &age), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Get_Field_Long_05([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object sarah {};
    ani_field field {};
    ani_field fieldAge {};
    GetTestDataFiledLong(env, &sarah, &field, &fieldAge);

    ani_long age = 0L;
    ASSERT_EQ(env->Object_GetField_Long(sarah, nullptr, &age), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Get_Field_Long_06([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object sarah {};
    ani_field field {};
    ani_field fieldAge {};
    GetTestDataFiledLong(env, &sarah, &field, &fieldAge);

    ASSERT_EQ(env->Object_GetField_Long(sarah, field, nullptr), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int GetTestDataFiledShort(ani_env *env,
                              ani_object *objectResult,
                              ani_field *fieldNameResult,
                              ani_field *fieldAgeResult)
{
    auto sarahRef = CallEtsFunctionV<ani_ref>(env, "entry.src.main.src.ets.ObjectOperations", "newSarahObject8");
    auto sarah = static_cast<ani_object>(sarahRef);

    ani_class cls;
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ObjectOperations.Woman8", &cls), ANI_OK);

    ani_field fieldName;
    ASSERT_EQ(env->Class_FindField(cls, "name", &fieldName), ANI_OK);

    ani_field fieldAge;
    ASSERT_EQ(env->Class_FindField(cls, "age", &fieldAge), ANI_OK);

    *objectResult = sarah;
    *fieldNameResult = fieldName;
    *fieldAgeResult = fieldAge;
    return ANI_TRUE;
}

ani_int test_Object_Get_Field_Short_01([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object sarah {};
    ani_field field {};
    ani_field fieldAge {};
    GetTestDataFiledShort(env, &sarah, &field, &fieldAge);

    ani_short age = 0U;
    ASSERT_EQ(env->Object_GetField_Short(sarah, fieldAge, &age), ANI_OK);
    ASSERT_EQ(age, 24U);
    return ANI_TRUE;
}

ani_int test_Object_Get_Field_Short_02([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object sarah {};
    ani_field field {};
    ani_field fieldAge {};
    GetTestDataFiledShort(env, &sarah, &field, &fieldAge);

    ani_short age = 0U;
    ASSERT_EQ(env->c_api->Object_GetField_Short(nullptr, sarah, fieldAge, &age), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Get_Field_Short_03([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object sarah {};
    ani_field field {};
    ani_field fieldAge {};
    GetTestDataFiledShort(env, &sarah, &field, &fieldAge);

    ani_short age = 0U;
    ASSERT_EQ(env->Object_GetField_Short(sarah, field, &age), ANI_INVALID_TYPE);
    return ANI_TRUE;
}

ani_int test_Object_Get_Field_Short_04([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object sarah {};
    ani_field field {};
    ani_field fieldAge {};
    GetTestDataFiledShort(env, &sarah, &field, &fieldAge);

    ani_short age = 0U;
    ASSERT_EQ(env->Object_GetField_Short(nullptr, field, &age), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Get_Field_Short_05([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object sarah {};
    ani_field field {};
    ani_field fieldAge {};
    GetTestDataFiledShort(env, &sarah, &field, &fieldAge);

    ani_short age = 0U;
    ASSERT_EQ(env->Object_GetField_Short(sarah, nullptr, &age), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Get_Field_Short_06([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object sarah {};
    ani_field field {};
    ani_field fieldAge {};
    GetTestDataFiledShort(env, &sarah, &field, &fieldAge);

    ASSERT_EQ(env->Object_GetField_Short(sarah, field, nullptr), ANI_INVALID_ARGS);
    return ANI_TRUE;
}
#endif //ARKTS_ANI_TEST_OBJECTOPERATIONS_H
