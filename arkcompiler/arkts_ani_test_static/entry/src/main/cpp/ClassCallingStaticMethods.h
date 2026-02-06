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

#ifndef ARKTS_ANI_TEST_CALLINGSTATICMETHODS_H
#define ARKTS_ANI_TEST_CALLINGSTATICMETHODS_H
#include "Common.h"

ani_boolean test_Class_CallStaticMethodByName_Boolean([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls = {};
    ASSERT_EQ(GetClsByClassCallingName(env, "OperationsBoll;", &cls), ANI_TRUE);
    ani_boolean value = ANI_FALSE;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Boolean(cls, "or", nullptr, &value, ANI_TRUE, ANI_FALSE), ANI_OK);
    ASSERT_EQ(value, ANI_TRUE);
    return ANI_TRUE;
}

ani_boolean test_Class_CallStaticMethodByName_Boolean_A([[maybe_unused]] ani_env *env,
                                                        [[maybe_unused]] ani_object object)
{
    ani_class cls = {};
    ASSERT_EQ(GetClsByClassCallingName(env, "OperationsBoll;", &cls), ANI_TRUE);

    ani_boolean value = ANI_FALSE;
    ani_value args[2U];
    args[0U].z = ANI_TRUE;
    args[1U].z = ANI_FALSE;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Boolean_A(cls, "or", nullptr, &value, args), ANI_OK);
    ASSERT_EQ(value, ANI_TRUE);
    return ANI_TRUE;
}

ani_boolean TestFuncV([[maybe_unused]] ani_env *env_, ani_class cls, const char *name, ani_boolean *value, ...)
{
    va_list args{};
    va_start(args, value);
    auto result = env_->Class_CallStaticMethodByName_Boolean_V(cls, name, nullptr, value, args);
    va_end(args);
    ASSERT_EQ(result, ANI_OK);
    return ANI_TRUE;
}

ani_boolean test_Class_CallStaticMethodByName_Boolean_V([[maybe_unused]] ani_env *env,
                                                        [[maybe_unused]] ani_object object)
{
    ani_class cls = {};
    ASSERT_EQ(GetClsByClassCallingName(env, "OperationsBoll;", &cls), ANI_TRUE);
    ani_boolean value = ANI_FALSE;
    ASSERT_EQ(TestFuncV(env, cls, "or", &value, ANI_TRUE, ANI_FALSE), ANI_TRUE);
    ASSERT_EQ(value, ANI_TRUE);
    return ANI_TRUE;
}

ani_boolean test_Class_CallStaticMethodByName_Char([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls = {};
    ASSERT_EQ(GetClsByClassCallingName(env, "OperationsChar;", &cls), ANI_TRUE);

    ani_char value = '\0';
    char c = 'C' - 'A';
    ASSERT_EQ(env->Class_CallStaticMethodByName_Char(cls, "sub", "CC:C", &value, 'A', 'C'), ANI_OK);
    ASSERT_EQ(value, c);
    return ANI_TRUE;
}

ani_boolean test_Class_CallStaticMethodByName_Char_A([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls = {};
    ASSERT_EQ(GetClsByClassCallingName(env, "OperationsChar;", &cls), ANI_TRUE);

    ani_value args[2U];
    args[0U].c = 'A';
    args[1U].c = 'C';
    ani_char valueA = '\0';
    ASSERT_EQ(env->Class_CallStaticMethodByName_Char_A(cls, "sub", "CC:C", &valueA, args), ANI_OK);
    ASSERT_EQ(valueA, args[1U].c - args[0U].c);
    return ANI_TRUE;
}

ani_boolean TestFuncV([[maybe_unused]] ani_env *env, ani_class cls, const char *name, ani_char *value, ...)
{
    va_list args{};
    va_start(args, value);
    auto result = env->Class_CallStaticMethodByName_Char_V(cls, name, "CC:C", value, args);
    va_end(args);
    ASSERT_EQ(result, ANI_OK);
    return ANI_TRUE;
}

ani_boolean test_Class_CallStaticMethodByName_Char_V([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls = {};
    ASSERT_EQ(GetClsByClassCallingName(env, "OperationsChar;", &cls), ANI_TRUE);
    va_list args{};
    ani_char value = '\0';
    char c = 'C' - 'A';
    ASSERT_EQ(TestFuncV(env, cls, "sub", &value, 'A', 'C'), ANI_TRUE);
    ASSERT_EQ(value, c);
    return ANI_TRUE;
}

ani_boolean test_Class_CallStaticMethodByName_Byte([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls = {};
    ASSERT_EQ(GetClsByClassCallingName(env, "OperationsByte;", &cls), ANI_TRUE);

    ani_byte value = 0;
    ani_int VAL1 = TEST_INT_VAL1;
    ani_int VAL2 = TEST_INT_VAL2;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Byte(cls, "sum", nullptr, &value, VAL1, VAL2), ANI_OK);
    ASSERT_EQ(value, VAL1 + VAL2);
    return ANI_TRUE;
}

ani_boolean test_Class_CallStaticMethodByName_Byte_A([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls = {};
    ASSERT_EQ(GetClsByClassCallingName(env, "OperationsByte;", &cls), ANI_TRUE);

    ani_value args[2U];
    args[0U].b = TEST_INT_VAL1;
    args[1U].b = TEST_INT_VAL2;
    ani_byte value = 0;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Byte_A(cls, "sum", nullptr, &value, args), ANI_OK);
    ASSERT_EQ(value, TEST_INT_VAL1 + TEST_INT_VAL2);
    return ANI_TRUE;
}

ani_boolean TestFuncV([[maybe_unused]] ani_env *env_, ani_class cls, const char *name, ani_byte *value, ...)
{
    va_list args{};
    va_start(args, value);
    auto result = env_->Class_CallStaticMethodByName_Byte_V(cls, name, "BB:B", value, args);
    va_end(args);
    ASSERT_EQ(result, ANI_OK);
    return ANI_TRUE;
}

ani_boolean test_Class_CallStaticMethodByName_Byte_V([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls = {};
    ani_int VAL1 = TEST_INT_VAL1;
    ani_int VAL2 = TEST_INT_VAL2;
    ani_byte value = 0;
    ASSERT_EQ(GetClsByClassCallingName(env, "OperationsByte;", &cls), ANI_TRUE);
    ASSERT_EQ(TestFuncV(env, cls, "sum", &value, VAL1, VAL2), ANI_TRUE);
    ASSERT_EQ(value, VAL1 + VAL2);
    return ANI_TRUE;
}

ani_boolean test_Class_CallStaticMethodByName_Short([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls = {};
    ASSERT_EQ(GetClsByClassCallingName(env, "OperationsShort;", &cls), ANI_TRUE);

    ani_short value = 0;
    ani_int VAL1 = TEST_INT_VAL1;
    ani_int VAL2 = TEST_INT_VAL2;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Short(cls, "sum", nullptr, &value, VAL1, VAL2), ANI_OK);
    ASSERT_EQ(value, VAL1 + VAL2);
    return ANI_TRUE;
}

ani_boolean test_Class_CallStaticMethodByName_Short_A([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls = {};
    ASSERT_EQ(GetClsByClassCallingName(env, "OperationsShort;", &cls), ANI_TRUE);

    ani_short VAL1 = TEST_INT_VAL1;
    ani_short VAL2 = TEST_INT_VAL2;
    ani_value args[2U];
    args[0U].s = VAL1;
    args[1U].s = VAL2;

    ani_short value = 0;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Short_A(cls, "sum", nullptr, &value, args), ANI_OK);
    ASSERT_EQ(value, VAL1 + VAL2);
    return ANI_TRUE;
}

ani_boolean TestFuncV([[maybe_unused]] ani_env *env, ani_class cls, const char *name, ani_short *value, ...)
{
    va_list args{};
    va_start(args, value);
    auto result = env->Class_CallStaticMethodByName_Short_V(cls, name, "SS:S", value, args);
    va_end(args);
    ASSERT_EQ(result, ANI_OK);
    return ANI_TRUE;
}

ani_boolean test_Class_CallStaticMethodByName_Short_V([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls = {};
    ASSERT_EQ(GetClsByClassCallingName(env, "OperationsShort;", &cls), ANI_TRUE);
    ani_short value = 0;
    ani_int VAL1 = TEST_INT_VAL1;
    ani_int VAL2 = TEST_INT_VAL2;
    ASSERT_EQ(TestFuncV(env, cls, "sum", &value, VAL1, VAL2), ANI_TRUE);
    ASSERT_EQ(value, VAL1 + VAL2);
    return ANI_TRUE;
}

ani_boolean test_Class_CallStaticMethodByName_Int([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls = {};
    ASSERT_EQ(GetClsByClassCallingName(env, "OperationsInt;", &cls), ANI_TRUE);

    ani_int VAL3 = TEST_INT_VAL1;
    ani_int VAL4 = TEST_INT_VAL2;
    ani_int value = 0;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Int(cls, "sum", nullptr, &value, VAL3, VAL4), ANI_OK);
    ASSERT_EQ(value, VAL3 + VAL4);
    return ANI_TRUE;
}

ani_boolean test_Class_CallStaticMethodByName_Int_A([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls = {};
    ASSERT_EQ(GetClsByClassCallingName(env, "OperationsInt;", &cls), ANI_TRUE);

    ani_value args[2U];
    args[0U].i = TEST_INT_VAL1;
    args[1U].i = TEST_INT_VAL2;

    ani_int sum = 0;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Int_A(cls, "sum", nullptr, &sum, args), ANI_OK);
    ASSERT_EQ(sum, TEST_INT_VAL1 + TEST_INT_VAL2);
    return ANI_TRUE;
}

ani_boolean TestFuncV([[maybe_unused]] ani_env *env, ani_class cls, const char *name, ani_int *value, ...)
{
    va_list args{};
    va_start(args, value);
    auto result = env->Class_CallStaticMethodByName_Int_V(cls, name, "II:I", value, args);
    va_end(args);
    ASSERT_EQ(result, ANI_OK);
    return ANI_TRUE;
}

ani_boolean test_Class_CallStaticMethodByName_Int_V([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls = {};
    ASSERT_EQ(GetClsByClassCallingName(env, "OperationsInt;", &cls), ANI_TRUE);
    ani_int VAL3 = TEST_INT_VAL1;
    ani_int VAL4 = TEST_INT_VAL2;
    ani_int value = 0;
    ASSERT_EQ(TestFuncV(env, cls, "sum", &value, VAL3, VAL4), ANI_TRUE);
    ASSERT_EQ(value, TEST_INT_VAL1 + TEST_INT_VAL2);
    return ANI_TRUE;
}

ani_boolean test_Class_CallStaticMethodByName_Long([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls = {};
    ASSERT_EQ(GetClsByClassCallingName(env, "OperationsLong;", &cls), ANI_TRUE);

    ani_long sum = 0L;
    const ani_long v1 = 123L;
    const ani_long v2 = 456L;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Long(cls, "sum", nullptr, &sum, v1, v2), ANI_OK);
    ASSERT_EQ(sum, v1 + v2);
    return ANI_TRUE;
}

ani_boolean test_Class_CallStaticMethodByName_Long_A([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls = {};
    ASSERT_EQ(GetClsByClassCallingName(env, "OperationsLong;", &cls), ANI_TRUE);

    ani_value args[2U];
    args[0U].l = 123L;
    args[1U].l = 456L;
    ani_long sum = 0L;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Long_A(cls, "sum", nullptr, &sum, args), ANI_OK);
    ASSERT_EQ(sum, 123L + 456L);
    return ANI_TRUE;
}

ani_boolean TestFuncV([[maybe_unused]] ani_env *env, ani_class cls, const char *name, ani_long *value, ...)
{
    va_list args{};
    va_start(args, value);
    auto result = env->Class_CallStaticMethodByName_Long_V(cls, name, "ll:l", value, args);
    va_end(args);
    ASSERT_EQ(result, ANI_OK);
    return ANI_TRUE;
}

ani_boolean test_Class_CallStaticMethodByName_Long_V([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls = {};
    ASSERT_EQ(GetClsByClassCallingName(env, "OperationsLong;", &cls), ANI_TRUE);
    ani_long sum = 0L;
    const ani_long v1 = 123L;
    const ani_long v2 = 456L;
    ASSERT_EQ(TestFuncV(env, cls, "sum", &sum, v1, v2), ANI_TRUE);
    ASSERT_EQ(sum, v1 + v2);
    return ANI_TRUE;
}

ani_boolean test_Class_CallStaticMethodByName_Float([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls = {};
    ASSERT_EQ(GetClsByClassCallingName(env, "OperationsFloat;", &cls), ANI_TRUE);

    ani_float FLOAT_VAL1 = 1.5F;
    ani_float FLOAT_VAL2 = 2.5F;
    ani_float sum{};
    ASSERT_EQ(env->Class_CallStaticMethodByName_Float(cls, "sum", nullptr, &sum, FLOAT_VAL1, FLOAT_VAL2), ANI_OK);
    ASSERT_EQ(sum, FLOAT_VAL1 + FLOAT_VAL2);
    return ANI_TRUE;
}

ani_boolean test_Class_CallStaticMethodByName_Float_A([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls = {};
    ASSERT_EQ(GetClsByClassCallingName(env, "OperationsFloat;", &cls), ANI_TRUE);

    ani_float FLOAT_VAL1 = 1.5F;
    ani_float FLOAT_VAL2 = 2.5F;
    ani_value args[2U];
    args[0U].f = FLOAT_VAL1;
    args[1U].f = FLOAT_VAL2;
    ani_float sum{};
    ASSERT_EQ(env->Class_CallStaticMethodByName_Float_A(cls, "sum", nullptr, &sum, args), ANI_OK);
    ASSERT_EQ(sum, FLOAT_VAL1 + FLOAT_VAL2);
    return ANI_TRUE;
}

ani_boolean TestFuncV([[maybe_unused]] ani_env *env, ani_class cls, const char *name, ani_float *value, ...)
{
    va_list args{};
    va_start(args, value);
    auto result = env->Class_CallStaticMethodByName_Float_V(cls, name, "FF:F", value, args);
    va_end(args);
    ASSERT_EQ(result, ANI_OK);
    return ANI_TRUE;
}

ani_boolean test_Class_CallStaticMethodByName_Float_V([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls = {};
    ASSERT_EQ(GetClsByClassCallingName(env, "OperationsFloat;", &cls), ANI_TRUE);

    ani_float FLOAT_VAL1 = 1.5F;
    ani_float FLOAT_VAL2 = 2.5F;
    ani_float sum{};
    ASSERT_EQ(TestFuncV(env, cls, "sum", &sum, FLOAT_VAL1, FLOAT_VAL2), ANI_TRUE);
    ASSERT_EQ(sum, FLOAT_VAL1 + FLOAT_VAL2);
    return ANI_TRUE;
}

ani_boolean test_Class_CallStaticMethodByName_Double([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls = {};
    ASSERT_EQ(GetClsByClassCallingName(env, "OperationsDouble;", &cls), ANI_TRUE);

    ani_double sum = 0.0;
    ani_double VAL1 = 1.5;
    ani_double VAL2 = 2.5;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Double(cls, "sum", nullptr, &sum, VAL1, VAL2), ANI_OK);
    ASSERT_EQ(sum, VAL1 + VAL2);
    return ANI_TRUE;
}

ani_boolean test_Class_CallStaticMethodByName_Double_A([[maybe_unused]] ani_env *env,
                                                       [[maybe_unused]] ani_object object)
{
    ani_class cls = {};
    ASSERT_EQ(GetClsByClassCallingName(env, "OperationsDouble;", &cls), ANI_TRUE);

    ani_double VAL1 = 1.5;
    ani_double VAL2 = 2.5;
    ani_value args[2U];
    args[0U].d = VAL1;
    args[1U].d = VAL2;

    ani_double sum = 0.0;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Double_A(cls, "sum", nullptr, &sum, args), ANI_OK);
    ASSERT_EQ(sum, VAL1 + VAL2);
    return ANI_TRUE;
}

ani_boolean TestFuncV([[maybe_unused]] ani_env *env, ani_class cls, const char *name, ani_double *value, ...)
{
    va_list args{};
    va_start(args, value);
    auto result = env->Class_CallStaticMethodByName_Double_V(cls, name, "DD:D", value, args);
    va_end(args);
    ASSERT_EQ(result, ANI_OK);
    return ANI_TRUE;
}

ani_boolean test_Class_CallStaticMethodByName_Double_V([[maybe_unused]] ani_env *env,
                                                       [[maybe_unused]] ani_object object)
{
    ani_class cls = {};
    ASSERT_EQ(GetClsByClassCallingName(env, "OperationsDouble;", &cls), ANI_TRUE);
    ani_double sum = 0.0;
    ani_double VAL1 = 1.5;
    ani_double VAL2 = 2.5;
    ASSERT_EQ(TestFuncV(env, cls, "sum", &sum, VAL1, VAL2), ANI_TRUE);
    ASSERT_EQ(sum, VAL1 + VAL2);
    return ANI_TRUE;
}

ani_boolean test_Class_CallStaticMethodByName_Ref([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls = {};
    ASSERT_EQ(GetClsByClassCallingName(env, "PhoneRef;", &cls), ANI_TRUE);

    ani_ref ref = nullptr;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Ref(cls, "get_button_names", nullptr, &ref), ANI_OK);
    ASSERT_NE(ref, nullptr);
    return ANI_TRUE;
}

ani_boolean test_Class_CallStaticMethodByName_Ref_A([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls = {};
    ASSERT_EQ(GetClsByClassCallingName(env, "PhoneRef;", &cls), ANI_TRUE);

    ani_ref ref = nullptr;
    ani_int VAL3 = TEST_INT_VAL1;
    ani_int VAL4 = TEST_INT_VAL2;
    ani_value args[2U];
    args[0U].i = VAL3;
    args[1U].i = VAL4;
    ASSERT_EQ(env->Class_CallStaticMethodByName_Ref_A(cls, "get_num_string", nullptr, &ref, args), ANI_OK);
    ASSERT_NE(ref, nullptr);
    return ANI_TRUE;
}

ani_boolean TestFuncV([[maybe_unused]] ani_env *env, ani_class cls, const char *name, ani_ref *value, ...)
{
    va_list args{};
    va_start(args, value);
    auto result = env->Class_CallStaticMethodByName_Ref_V(cls, name, "II:Lstd/core/String;", value, args);
    va_end(args);
    ASSERT_EQ(result, ANI_OK);
    return ANI_TRUE;
}

ani_boolean test_Class_CallStaticMethodByName_Ref_V([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls = {};
    ASSERT_EQ(GetClsByClassCallingName(env, "PhoneRef;", &cls), ANI_TRUE);
    ani_ref ref = nullptr;
    static constexpr ani_int VAL3 = 5;
    static constexpr ani_int VAL4 = 6;
    ASSERT_EQ(TestFuncV(env, cls, "funcA", &ref, VAL3, VAL4), ANI_TRUE);
    ASSERT_NE(ref, nullptr);
    return ANI_TRUE;
}

ani_boolean test_Class_CallStaticMethodByName_Void([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls = {};
    ASSERT_EQ(GetClsByClassCallingName(env, "OperationsVoid;", &cls), ANI_TRUE);

    ani_int VAL1 = TEST_INT_VAL1;
    ani_int VAL2 = TEST_INT_VAL2;

    ani_value args[2];
    args[0].i = VAL1;
    args[1].i = VAL2;
    ani_int sum = 0;

    ASSERT_EQ(env->Class_CallStaticMethodByName_Void(cls, "voidMethod", nullptr, VAL1, VAL2), ANI_OK);
    ASSERT_EQ(env->Class_CallStaticMethodByName_Int(cls, "getCount", nullptr, &sum), ANI_OK);
    ASSERT_EQ(sum, VAL1 + VAL2);
    return ANI_TRUE;
}

ani_boolean test_Class_CallStaticMethodByName_Void_A([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls = {};
    ASSERT_EQ(GetClsByClassCallingName(env, "OperationsVoid;", &cls), ANI_TRUE);

    ani_static_field field{};
    ASSERT_EQ(env->Class_FindStaticField(cls, "count", &field), ANI_OK);
    ASSERT_EQ(env->Class_SetStaticField_Int(cls, field, 0U), ANI_OK);
    ani_int VAL1 = TEST_INT_VAL1;
    ani_int VAL2 = TEST_INT_VAL2;

    ani_value args[2];
    args[0].i = VAL1;
    args[1].i = VAL2;
    ani_int sum = 0;

    ASSERT_EQ(env->Class_CallStaticMethodByName_Void_A(cls, "voidMethod", nullptr, args), ANI_OK);
    ASSERT_EQ(env->Class_CallStaticMethodByName_Int(cls, "getCount", nullptr, &sum), ANI_OK);
    ASSERT_EQ(sum, VAL1 + VAL2);
    return ANI_TRUE;
}

ani_boolean TestFuncV([[maybe_unused]] ani_env *env, ani_class cls, const char *name, ...)
{
    va_list args{};
    va_start(args, name);
    auto result = env->Class_CallStaticMethodByName_Void_V(cls, name, "II:V", args);
    va_end(args);
    ASSERT_EQ(result, ANI_OK);
    return ANI_TRUE;
}

ani_boolean test_Class_CallStaticMethodByName_Void_V([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls = {};
    ASSERT_EQ(GetClsByClassCallingName(env, "OperationsVoid;", &cls), ANI_TRUE);

    ani_static_field field{};
    ASSERT_EQ(env->Class_FindStaticField(cls, "count", &field), ANI_OK);
    ASSERT_EQ(env->Class_SetStaticField_Int(cls, field, 0U), ANI_OK);
    ani_int VAL1 = TEST_INT_VAL1;
    ani_int VAL2 = TEST_INT_VAL2;
    ani_int sum = 0;
    ASSERT_EQ(TestFuncV(env, cls, "voidMethod", VAL1, VAL2), ANI_TRUE);
    ASSERT_EQ(env->Class_CallStaticMethodByName_Int(cls, "getCount", nullptr, &sum), ANI_OK);
    ASSERT_EQ(sum, VAL1 + VAL2);
    return ANI_TRUE;
}

ani_boolean test_Class_CallStaticMethod_Short([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls = {};
    ASSERT_EQ(GetClsByClassCallingName(env, "OperationsMeds;", &cls), ANI_TRUE);

    ani_static_method method;
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "sum", "SS:S", &method), ANI_OK);
    ASSERT_NE(method, nullptr);

    ani_int VAL1 = 5U;
    ani_int VAL2 = 6U;
    ani_short sum = 0;
    ASSERT_EQ(env->Class_CallStaticMethod_Short(cls, method, &sum, VAL1, VAL2), ANI_OK);
    ASSERT_EQ(sum, VAL1 + VAL2);
    return ANI_TRUE;
}

ani_boolean test_Class_CallStaticMethod_Short_A([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls = {};
    ASSERT_EQ(GetClsByClassCallingName(env, "OperationsMeds;", &cls), ANI_TRUE);

    ani_static_method method;
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "sum", "SS:S", &method), ANI_OK);
    ASSERT_NE(method, nullptr);

    ani_int VAL1 = 5U;
    ani_int VAL2 = 6U;
    ani_value args[2U];
    args[0U].s = VAL1;
    args[1U].s = VAL2;
    ani_short sum = 0;

    ASSERT_EQ(env->Class_CallStaticMethod_Short_A(cls, method, &sum, args), ANI_OK);
    ASSERT_EQ(sum, VAL1 + VAL2);
    return ANI_TRUE;
}

ani_boolean TestFuncShortV([[maybe_unused]] ani_env *env, ani_class cls, ani_static_method method,
                           ani_short *value, ...)
{
    va_list args{};
    va_start(args, value);
    auto result = env->Class_CallStaticMethod_Short_V(cls, method, value, args);
    va_end(args);
    ASSERT_EQ(result, ANI_OK);
    return ANI_TRUE;
}

ani_boolean test_Class_CallStaticMethod_Short_V([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls = {};
    ASSERT_EQ(GetClsByClassCallingName(env, "OperationsMeds;", &cls), ANI_TRUE);

    ani_static_method method;
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "sum", "SS:S", &method), ANI_OK);
    ASSERT_NE(method, nullptr);

    ani_int VAL1 = 5U;
    ani_int VAL2 = 6U;
    ani_short sum = 0;
    ASSERT_EQ(TestFuncShortV(env, cls, method, &sum, VAL1, VAL2), ANI_TRUE);
    ASSERT_EQ(sum, VAL1 + VAL2);
    return ANI_TRUE;
}

ani_boolean test_Class_CallStaticMethod_Int([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls = {};
    ASSERT_EQ(GetClsByClassCallingName(env, "OperationsMedInt;", &cls), ANI_TRUE);

    ani_static_method method;
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "sum", "II:I", &method), ANI_OK);
    ASSERT_NE(method, nullptr);
    ani_int VAL1 = 5U;
    ani_int VAL2 = 6U;
    ani_int sum;

    ASSERT_EQ(env->Class_CallStaticMethod_Int(cls, method, &sum, VAL1, VAL2), ANI_OK);
    ASSERT_EQ(sum, VAL1 + VAL2);
    return ANI_TRUE;
}

ani_boolean test_Class_CallStaticMethod_Int_A([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls = {};
    ASSERT_EQ(GetClsByClassCallingName(env, "OperationsMedInt;", &cls), ANI_TRUE);

    ani_static_method method;
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "sum", "II:I", &method), ANI_OK);
    ASSERT_NE(method, nullptr);
    ani_int VAL1 = TEST_INT_VAL1;
    ani_int VAL2 = TEST_INT_VAL2;
    ani_int sum = 0;
    ani_value args[2U];
    args[0U].i = VAL1;
    args[1U].i = VAL2;

    ASSERT_EQ(env->Class_CallStaticMethod_Int_A(cls, method, &sum, args), ANI_OK);
    ASSERT_EQ(sum, VAL1 + VAL2);
    return ANI_TRUE;
}

ani_boolean TestFuncIntV([[maybe_unused]] ani_env *env, ani_class cls, ani_static_method method, ani_int *value, ...)
{
    va_list args{};
    va_start(args, value);
    auto result = env->Class_CallStaticMethod_Int_V(cls, method, value, args);
    va_end(args);
    ASSERT_EQ(result, ANI_OK);
    return ANI_TRUE;
}

ani_boolean test_Class_CallStaticMethod_Int_V([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls = {};
    ASSERT_EQ(GetClsByClassCallingName(env, "OperationsMedInt;", &cls), ANI_TRUE);
    ani_static_method method;
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "sum", "II:I", &method), ANI_OK);
    ASSERT_NE(method, nullptr);
    ani_int VAL1 = 5U;
    ani_int VAL2 = 6U;
    ani_int sum;
    ASSERT_EQ(TestFuncIntV(env, cls, method, &sum, VAL1, VAL2), ANI_TRUE);
    ASSERT_EQ(sum, VAL1 + VAL2);
    return ANI_TRUE;
}

ani_boolean TestFuncLongV([[maybe_unused]] ani_env *env, ani_class cls, ani_static_method method, ani_long *value, ...)
{
    va_list args{};
    va_start(args, value);
    auto result = env->Class_CallStaticMethod_Long_V(cls, method, value, args);
    va_end(args);
    ASSERT_EQ(result, ANI_OK);
    return ANI_TRUE;
}

ani_boolean test_Class_CallStaticMethod_Long([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls{};
    ASSERT_EQ(GetClsByClassCallingName(env, "OperationsMedLong;", &cls), ANI_TRUE);

    ani_static_method method;
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "sum", "ll:l", &method), ANI_OK);

    const ani_long arg1 = 123;
    const ani_long arg2 = 456;
    ani_long sumResult = 0L;

    ASSERT_EQ(env->Class_CallStaticMethod_Long(cls, method, &sumResult, arg1, arg2), ANI_OK);
    ASSERT_EQ(sumResult, arg1 + arg2);

    ani_value args[2];
    args[0U].l = arg1;
    args[1U].l = arg2;
    ASSERT_EQ(env->Class_CallStaticMethod_Long_A(cls, method, &sumResult, args), ANI_OK);
    ASSERT_EQ(sumResult, arg1 + arg2);
    ASSERT_EQ(TestFuncLongV(env, cls, method, &sumResult, arg1, arg2), ANI_TRUE);
    ASSERT_EQ(sumResult, arg1 + arg2);
    return ANI_TRUE;
}

ani_boolean TestFuncFloatV([[maybe_unused]] ani_env *env, ani_class cls, ani_static_method method,
                           ani_float *value, ...)
{
    va_list args{};
    va_start(args, value);
    auto result = env->Class_CallStaticMethod_Float_V(cls, method, value, args);
    va_end(args);
    ASSERT_EQ(result, ANI_OK);
    return ANI_TRUE;
}

ani_boolean test_Class_CallStaticMethod_Float([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls{};
    ASSERT_EQ(GetClsByClassCallingName(env, "OperationsMedFloat;", &cls), ANI_TRUE);

    ani_static_method method;
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "sum", "FF:F", &method), ANI_OK);

    const ani_float arg1 = 1.0f;
    const ani_float arg2 = 2.0f;
    ani_float sumResult = 0.0f;

    ASSERT_EQ(env->Class_CallStaticMethod_Float(cls, method, &sumResult, arg1, arg2), ANI_OK);
    ASSERT_EQ(sumResult, arg1 + arg2);

    ani_value args[2];
    args[0U].f = arg1;
    args[1U].f = arg2;
    ASSERT_EQ(env->Class_CallStaticMethod_Float_A(cls, method, &sumResult, args), ANI_OK);
    ASSERT_EQ(sumResult, arg1 + arg2);
    ASSERT_EQ(TestFuncFloatV(env, cls, method, &sumResult, arg1, arg2), ANI_TRUE);
    ASSERT_EQ(sumResult, arg1 + arg2);
    return ANI_TRUE;
}

ani_int test_Class_CallStaticMethod_Double([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls = {};
    ASSERT_EQ(env->FindClass("Lentry/src/main/src/ets/ClassCallingStaticMethods/TestDouble;", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_static_method method;
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "funcA", "DD:D", &method), ANI_OK);

    ani_double value;
    ani_double val1 = 1.0;
    ani_double val2 = 2.0;
    ASSERT_EQ(env->Class_CallStaticMethod_Double(cls, method, &value, val1, val2), ANI_OK);
    return ANI_TRUE;
}

ani_int test_Class_CallStaticMethod_Double_A([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls = {};
    ASSERT_EQ(env->FindClass("Lentry/src/main/src/ets/ClassCallingStaticMethods/TestDouble;", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_static_method method;
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "funcA", "DD:D", &method), ANI_OK);

    ani_double value;
    ani_value args[2U];
    ani_double arg1 = 1.0;
    ani_double arg2 = 2.0;
    args[0U].d = arg1;
    args[1U].d = arg2;
    ASSERT_EQ(env->Class_CallStaticMethod_Double_A(cls, method, &value, args), ANI_OK);
    return ANI_TRUE;
}

ani_double TestObjectCallMethodDoubleV([[maybe_unused]] ani_env *env, ani_class cls, ani_static_method method,
                                       ani_double *value, ...)
{
    va_list args{};
    va_start(args, value);
    ani_double result;
    ASSERT_EQ(env->Class_CallStaticMethod_Double_V(cls, method, &result, args), ANI_OK);
    va_end(args);

    return result;
}

ani_int test_Class_CallStaticMethod_Double_V([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls = {};
    ASSERT_EQ(env->FindClass("Lentry/src/main/src/ets/ClassCallingStaticMethods/TestDouble;", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_static_method method;
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "funcA", "DD:D", &method), ANI_OK);

    ani_double arg1 = 2.0F;
    ani_double arg2 = 3.0F;
    TestObjectCallMethodDoubleV(env, cls, method, &arg1, &arg2);
    return ANI_TRUE;
}

ani_int test_Class_CallStaticMethod_Void([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls = {};
    ASSERT_EQ(env->FindClass("Lentry/src/main/src/ets/ClassCallingStaticMethods/TestVoid;", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_static_method method;
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "funcA", "II:V", &method), ANI_OK);

    ani_int VAL1 = 5U;
    ani_int VAL2 = 6U;
    ASSERT_EQ(env->Class_CallStaticMethod_Void(cls, method, VAL1, VAL2), ANI_OK);
    return ANI_TRUE;
}

ani_int test_Class_CallStaticMethod_Void_A([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls = {};
    ASSERT_EQ(env->FindClass("Lentry/src/main/src/ets/ClassCallingStaticMethods/TestVoid;", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_static_method method;
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "funcA", "II:V", &method), ANI_OK);

    ani_value args[2U];
    args[0U].i = 1U;
    args[1U].i = 2U;
    ASSERT_EQ(env->Class_CallStaticMethod_Void_A(cls, method, args), ANI_OK);
    return ANI_TRUE;
}

ani_int TestObjectCallMethodVoidV([[maybe_unused]] ani_env *env, ani_class cls, ani_static_method method,
                                  ani_int *value, ...)
{
    va_list args{};
    va_start(args, value);
    ASSERT_EQ(env->Class_CallStaticMethod_Void_V(cls, method, args), ANI_OK);
    va_end(args);
    return ANI_TRUE;
}

ani_int test_Class_CallStaticMethod_Void_V([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls = {};
    ASSERT_EQ(env->FindClass("Lentry/src/main/src/ets/ClassCallingStaticMethods/TestVoid;", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_static_method method;
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "funcA", "II:V", &method), ANI_OK);

    ani_int arg1 = 2U;
    ani_int arg2 = 3U;
    TestObjectCallMethodVoidV(env, cls, method, &arg1, &arg2);
    return ANI_TRUE;
}

ani_int test_Class_CallStaticMethod_Ref([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls = nullptr;
    ASSERT_EQ(env->FindClass("Lentry/src/main/src/ets/ClassCallingStaticMethods/FooStatic;", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_static_method method = nullptr;
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "get_button_names", nullptr, &method), ANI_OK);
    ASSERT_NE(method, nullptr);

    ani_ref ref = nullptr;
    ASSERT_EQ(env->Class_CallStaticMethod_Ref(cls, method, &ref), ANI_OK);
    ASSERT_NE(ref, nullptr);

    return ANI_TRUE;
}

ani_int test_Class_CallStaticMethod_Ref_VV([[maybe_unused]] ani_env *env, ani_class cls, ani_static_method method,
                                           ani_ref *value, ...)
{
    va_list args{};
    va_start(args, value);
    ASSERT_EQ(env->Class_CallStaticMethod_Ref_V(cls, method, value, args), ANI_OK);
    va_end(args);
    return ANI_TRUE;
}

ani_int test_Class_CallStaticMethod_Ref_V([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls = nullptr;
    ASSERT_EQ(env->FindClass("Lentry/src/main/src/ets/ClassCallingStaticMethods/FooStatic;", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_static_method method = nullptr;
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "get_button_names_v", nullptr, &method), ANI_OK);
    ASSERT_NE(method, nullptr);

    ani_ref result;
    ani_int arg1 = 2U;
    test_Class_CallStaticMethod_Ref_VV(env, cls, method, &result, &arg1);
    ASSERT_NE(result, nullptr);

    return ANI_TRUE;
}

ani_int test_Class_CallStaticMethod_Ref_A([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls = nullptr;
    ASSERT_EQ(env->FindClass("Lentry/src/main/src/ets/ClassCallingStaticMethods/FooStatic;", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_static_method method = nullptr;
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "get_button_names_v", nullptr, &method), ANI_OK);
    ASSERT_NE(method, nullptr);

    const ani_int BUTTON_INDEX = 3;
    ani_value args[2U];
    args[0].i = BUTTON_INDEX;
    args[1].i = BUTTON_INDEX;
    ani_ref valueA = nullptr;
    ASSERT_EQ(env->Class_CallStaticMethod_Ref_A(cls, method, &valueA, args), ANI_OK);
    ASSERT_NE(valueA, nullptr);

    return ANI_TRUE;
}

ani_int test_Class_CallStaticMethod_Boolean([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls = nullptr;
    ASSERT_EQ(env->FindClass("Lentry/src/main/src/ets/ClassCallingStaticMethods/FooStatic;", &cls), ANI_OK);

    ani_static_method method = nullptr;
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "funcA", "ZZ:Z", &method), ANI_OK);

    ani_boolean value = ANI_FALSE;
    ASSERT_EQ(env->Class_CallStaticMethod_Boolean(cls, method, &value, ANI_TRUE, ANI_FALSE), ANI_OK);
    ASSERT_EQ(value, ANI_TRUE);

    return ANI_TRUE;
}

ani_int test_Class_CallStaticMethod_Boolean_A([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls = nullptr;
    ASSERT_EQ(env->FindClass("Lentry/src/main/src/ets/ClassCallingStaticMethods/FooStatic;", &cls), ANI_OK);

    ani_static_method method = nullptr;
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "funcA", "ZZ:Z", &method), ANI_OK);

    ani_value args[2U];
    args[0].z = ANI_TRUE;
    args[1].z = ANI_FALSE;
    ani_boolean valueA = ANI_FALSE;
    ASSERT_EQ(env->Class_CallStaticMethod_Boolean_A(cls, method, &valueA, args), ANI_OK);
    ASSERT_EQ(valueA, ANI_TRUE);

    return ANI_TRUE;
}

ani_status test_Class_CallStaticMethod_Boolean_VV(
    ani_env *env, ani_class cls, ani_static_method method, ani_boolean *result, ...)
{
    va_list args{};
    va_start(args, result);
    ani_status status = env->Class_CallStaticMethod_Boolean_V(cls, method, result, args);
    va_end(args);

    return status;
}

ani_int test_Class_CallStaticMethod_Boolean_V([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls = nullptr;
    ASSERT_EQ(env->FindClass("Lentry/src/main/src/ets/ClassCallingStaticMethods/FooStatic;", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_static_method method = nullptr;
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "funcA", "ZZ:Z", &method), ANI_OK);
    ASSERT_NE(method, nullptr);

    ani_boolean result;
    ASSERT_EQ(test_Class_CallStaticMethod_Boolean_VV(env, cls, method, &result, ANI_TRUE, ANI_FALSE), ANI_OK);
    ASSERT_EQ(result, ANI_TRUE);

    return ANI_TRUE;
}
#endif // ARKTS_ANI_TEST_CALLINGSTATICMETHODS_H
