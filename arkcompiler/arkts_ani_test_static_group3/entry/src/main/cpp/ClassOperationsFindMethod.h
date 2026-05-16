/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#ifndef ARKTS_ANI_TEST_CLASSOPERATIONSFINDMETHOD_H
#define ARKTS_ANI_TEST_CLASSOPERATIONSFINDMETHOD_H
#include "Common.h"

constexpr ani_int TEST_EXPECTED_VALUE1 = 5;
constexpr ani_int TEST_EXPECTED_VALUE2 = 4;
constexpr ani_int TEST_EXPECTED_VALUE3 = 9;
constexpr ani_int TEST_EXPECTED_VALUE4 = 2;
constexpr ani_int TEST_EXPECTED_VALUE5 = 6;
constexpr ani_int TEST_EXPECTED_VALUE6 = 3;

constexpr ani_int TEST_ARG1 = 2;
constexpr ani_int TEST_ARG2 = 3;
constexpr ani_double TEST_ARG3 = 1.0;
constexpr ani_boolean TEST_ARG4 = ANI_TRUE;
constexpr ani_float TEST_ARG5 = 3.0;
constexpr ani_float TEST_ARG6 = 4.0;

constexpr ani_int TEST_NATIVE_PARAM1 = 2;
constexpr ani_int TEST_NATIVE_PARAM2 = 3;

constexpr std::string_view ARG_STRING = "abab";


ani_boolean GetFunc(ani_env *env, ani_function *fn, const char *funcName)
{
    ani_module module;
    ASSERT_EQ(env->FindModule("test", &module), ANI_OK);
    ASSERT_NE(module, nullptr);

    ASSERT_EQ(env->Module_FindFunction(module, funcName, nullptr, fn), ANI_OK);
    ASSERT_NE(fn, nullptr);
    return ANI_TRUE;
}

ani_boolean GetObject(ani_env *env, ani_object *objectResult, ani_class cls)
{
    ani_method ctor;
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", ":", &ctor), ANI_OK);
    ASSERT_EQ(env->Object_New(cls, ctor, objectResult), ANI_OK);
    return ANI_TRUE;
}

ani_boolean TupleCreator(ani_env *env, ani_ref *result)
{
    ani_function fn {};
    ani_value args[2U];
    args[0U].i = TEST_ARG1;
    args[1U].l = TEST_ARG2;
    GetFunc(env, &fn, "CreateTuple");
    env->Function_Call_Ref_A(fn, result, args);
    return ANI_TRUE;
}

ani_boolean PartialCreator(ani_env *env, ani_ref *result, ani_int arg = TEST_ARG1)
{
    ani_function fn {};
    GetFunc(env, &fn, "CreatePartial");
    env->Function_Call_Ref(fn, result, arg);
    return ANI_TRUE;
}

ani_boolean RequiredCreator(ani_env *env, ani_ref *result)
{
    ani_function fn {};
    GetFunc(env, &fn, "CreateRequired");
    env->Function_Call_Ref(fn, result, TEST_ARG1);
    return ANI_TRUE;
}

ani_boolean ReadonlyCreator(ani_env *env, ani_ref *result)
{
    ani_function fn {};
    GetFunc(env, &fn, "CreateReadonly");
    env->Function_Call_Ref(fn, result, TEST_ARG1);
    return ANI_TRUE;
}

ani_boolean RecordCreator(ani_env *env, ani_class *cls, ani_object *result)
{
    ASSERT_EQ(env->FindClass("escompat.Record", cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_method ctor;
    ASSERT_EQ(env->Class_FindMethod(*cls, "<ctor>", ":", &ctor), ANI_OK);

    ASSERT_EQ(env->Object_New(*cls, ctor, result), ANI_OK);
    return ANI_TRUE;
}

ani_boolean BigintCreator(ani_env *env, ani_class *cls, ani_object *result)
{
    ASSERT_EQ(env->FindClass("escompat.BigInt", cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_method ctor;
    ASSERT_EQ(env->Class_FindMethod(*cls, "<ctor>", "i:", &ctor), ANI_OK);

    ani_int arg = TEST_ARG1;

    ASSERT_EQ(env->Object_New(*cls, ctor, result, arg), ANI_OK);
    return ANI_TRUE;
}

void LambdaCreator(ani_env *env, ani_ref *result, const char *funcName)
{
    ani_function fn {};
    GetFunc(env, &fn, funcName);
    env->Function_Call_Ref(fn, result);
}

ani_boolean Int(ani_env *env, ani_object *obj, ani_int value)
{
    ani_class cls;
    ASSERT_EQ(env->FindClass("std.core.Int", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_method ctor;
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", "i:", &ctor), ANI_OK);

    ASSERT_EQ(env->Object_New(cls, ctor, obj, value), ANI_OK);
    return ANI_TRUE;
}

ani_boolean test_Class_Find_Method_11([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("test.FindOverloadedConstructor", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_method ctor {};
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", nullptr, &ctor), ANI_AMBIGUOUS);
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", ":", &ctor), ANI_OK);
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", "i:", &ctor), ANI_OK);

    ASSERT_EQ(env->FindClass("test.FindConstructorWithDefaultParams", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", nullptr, &ctor), ANI_AMBIGUOUS);
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", ":", &ctor), ANI_OK);
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", "C{std.core.Int}:", &ctor), ANI_OK);
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", "C{std.core.Int}C{std.core.Int}:", &ctor), ANI_OK);
    return ANI_TRUE;
}

ani_boolean test_Class_Find_Method_14([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls;
    ASSERT_EQ(env->FindClass(nullptr, &cls), ANI_INVALID_ARGS);

    ani_method method;
    ASSERT_EQ(env->Class_FindMethod(cls, nullptr, nullptr, &method), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_Find_Method_15([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_method method;
    ASSERT_EQ(env->Class_FindMethod(nullptr, "int_method", nullptr, &method), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_Find_Method_16([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("test.A", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_method method {};
    ASSERT_EQ(env->Class_FindMethod(cls, "int_method", nullptr, nullptr), ANI_INVALID_ARGS);

    ASSERT_EQ(env->c_api->Class_FindMethod(nullptr, cls, "int_method", nullptr, &method), ANI_INVALID_ARGS);

    ASSERT_EQ(env->Class_FindMethod(cls, "", "ii:i", &method), ANI_NOT_FOUND);
    ASSERT_EQ(env->Class_FindMethod(cls, "\t", "ii:i", &method), ANI_NOT_FOUND);
    return ANI_TRUE;
}

ani_boolean test_Class_Find_Method_17([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("test.MyPhone", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_static_method method {};
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "get_button_names", ":C{std.core.Array}", &method), ANI_OK);
    ASSERT_NE(method, nullptr);
    return ANI_TRUE;
}

ani_boolean test_Class_Find_Method_18([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("test.MyPhone", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_static_method method {};
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "get_button_names", nullptr, &method), ANI_OK);
    ASSERT_NE(method, nullptr);
    return ANI_TRUE;
}

ani_boolean test_Class_Find_Method_19([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("test.MyPhone", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_static_method method {};
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "bla_bla_bla", nullptr, &method), ANI_NOT_FOUND);
    return ANI_TRUE;
}

ani_boolean test_Class_Find_Method_21([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("test.MyPhone", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_static_method method {};
    ASSERT_EQ(env->Class_FindStaticMethod(cls, nullptr, nullptr, &method), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_Find_Method_22([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_static_method method {};
    ASSERT_EQ(env->Class_FindStaticMethod(nullptr, "get_button_names", nullptr, &method), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_Find_Method_23([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("test.MyPhone", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_static_method method {};
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "get_button_names", nullptr, nullptr), ANI_INVALID_ARGS);

    ASSERT_EQ(env->c_api->Class_FindStaticMethod(nullptr, cls, "get_button_names", nullptr, &method),
              ANI_INVALID_ARGS);
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "", ":A{C{std.core.String}}", &method), ANI_NOT_FOUND);
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "\t", ":A{C{std.core.String}}", &method), ANI_NOT_FOUND);
    return ANI_TRUE;
}

ani_boolean test_Class_Find_Method_24([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("test.Operations", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_static_method method {};
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "sum", "ii:i", &method), ANI_OK);
    ASSERT_NE(method, nullptr);

    ani_int sum = 0;
    ASSERT_EQ(env->Class_CallStaticMethod_Int(cls, method, &sum, TEST_EXPECTED_VALUE1, TEST_EXPECTED_VALUE5), ANI_OK);
    ASSERT_EQ(sum, TEST_EXPECTED_VALUE1 + TEST_EXPECTED_VALUE5);
    return ANI_TRUE;
}

ani_boolean test_Class_Find_Method_25([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("test.ClassA", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_static_method methodA {};
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "calculateSquareArea", "ii:i", &methodA), ANI_OK);
    ASSERT_NE(methodA, nullptr);

    ani_static_method methodB {};
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "calculateSquareArea", "iii:i", &methodB), ANI_OK);
    ASSERT_NE(methodB, nullptr);

    ani_int sumA = 0;
    ani_value args[2U];
    args[0U].i = TEST_EXPECTED_VALUE1;
    args[1U].i = TEST_EXPECTED_VALUE5;
    ASSERT_EQ(env->Class_CallStaticMethod_Int_A(cls, methodA, &sumA, args), ANI_OK);
    ASSERT_EQ(sumA, TEST_EXPECTED_VALUE1 * TEST_EXPECTED_VALUE5);

    ani_int sumB = 0;
    ani_value argsB[TEST_EXPECTED_VALUE6];
    argsB[0U].i = TEST_EXPECTED_VALUE1;
    argsB[1U].i = TEST_EXPECTED_VALUE1;
    argsB[2U].i = TEST_EXPECTED_VALUE5;
    ASSERT_EQ(env->Class_CallStaticMethod_Int_A(cls, methodB, &sumB, argsB), ANI_OK);
    ASSERT_EQ(sumB, TEST_EXPECTED_VALUE1 * TEST_EXPECTED_VALUE1 * TEST_EXPECTED_VALUE5);
    return ANI_TRUE;
}

ani_boolean test_Class_Find_Method_26([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("test.ClassA", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_static_method methodB {};
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "sumB", "iii:i", &methodB), ANI_OK);
    ASSERT_NE(methodB, nullptr);

    ani_int sumB = 0;
    ani_value argsB[TEST_EXPECTED_VALUE6];
    argsB[0].i = TEST_EXPECTED_VALUE1;
    argsB[1].i = TEST_EXPECTED_VALUE1;
    argsB[2U].i = TEST_EXPECTED_VALUE5;
    ASSERT_EQ(env->Class_CallStaticMethod_Int_A(cls, methodB, &sumB, argsB), ANI_OK);
    ASSERT_EQ(sumB, TEST_EXPECTED_VALUE1 + TEST_EXPECTED_VALUE1 + TEST_EXPECTED_VALUE5);
    return ANI_TRUE;
}

ani_boolean test_Class_Find_Method_27([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("test.ClassB", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_static_method methodA {};
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "sumA", "ii:i", &methodA), ANI_OK);
    ASSERT_NE(methodA, nullptr);

    ani_int sumB = 0;
    ani_value args[2U];
    args[0].i = TEST_EXPECTED_VALUE1;
    args[1].i = TEST_EXPECTED_VALUE5;
    ASSERT_EQ(env->Class_CallStaticMethod_Int_A(cls, methodA, &sumB, args), ANI_OK);
    ASSERT_EQ(sumB, TEST_EXPECTED_VALUE1 + TEST_EXPECTED_VALUE5);
    return ANI_TRUE;
}

ani_boolean test_Class_Find_Method_28([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("test.ClassA", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_static_method methodA {};
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "calculateSquareArea", "ii:i", &methodA), ANI_OK);
    ASSERT_NE(methodA, nullptr);

    ani_int sumA = 0;
    ani_value args[2U];
    args[0].i = TEST_EXPECTED_VALUE1;
    args[1].i = TEST_EXPECTED_VALUE5;
    ASSERT_EQ(env->Class_CallStaticMethod_Int_A(cls, methodA, &sumA, args), ANI_OK);
    ASSERT_EQ(sumA, TEST_EXPECTED_VALUE1 * TEST_EXPECTED_VALUE5);
    return ANI_TRUE;
}

ani_boolean test_Class_Find_Method_29([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("test.BasicCalculator", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_static_method staticMethod {};
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "multiply", "ii:i", &staticMethod), ANI_OK);
    ASSERT_NE(staticMethod, nullptr);
    ani_int multiply = 0;
    ASSERT_EQ(
        env->Class_CallStaticMethod_Int(cls, staticMethod, &multiply, TEST_EXPECTED_VALUE1, TEST_EXPECTED_VALUE5),
        ANI_OK);
    ASSERT_EQ(multiply, TEST_EXPECTED_VALUE1 * TEST_EXPECTED_VALUE5);

    ani_class subCls {};
    ASSERT_EQ(env->FindClass("test.SubCalculator", &subCls), ANI_OK);
    ASSERT_NE(subCls, nullptr);

    ani_method constructorMethod {};
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", nullptr, &constructorMethod), ANI_OK);
    ASSERT_NE(constructorMethod, nullptr);

    ani_method addNormalMethod {};
    ASSERT_EQ(env->Class_FindMethod(subCls, "add", nullptr, &addNormalMethod), ANI_OK);
    ASSERT_NE(addNormalMethod, nullptr);

    ani_object object1 {};
    ASSERT_EQ(env->Object_New(subCls, constructorMethod, &object1, 5U, 6U), ANI_OK);
    ASSERT_NE(object1, nullptr);
    ani_int result = 0;
    ani_value args[2U];
    args[0U].i = TEST_EXPECTED_VALUE1;
    args[1U].i = TEST_EXPECTED_VALUE5;
    ASSERT_EQ(env->Object_CallMethod_Int_A(object1, addNormalMethod, &result, args), ANI_OK);
    ASSERT_EQ(result, TEST_EXPECTED_VALUE1 + TEST_EXPECTED_VALUE5);

    ani_static_method subStaticMethod {};
    ASSERT_EQ(env->Class_FindStaticMethod(subCls, "divide", nullptr, &subStaticMethod), ANI_OK);
    ASSERT_NE(subStaticMethod, nullptr);

    ani_int divideResult = 0;
    ani_value args2[2U];
    args2[0U].i = TEST_EXPECTED_VALUE5;
    args2[1U].i = TEST_EXPECTED_VALUE6;
    ASSERT_EQ(env->Class_CallStaticMethod_Int_A(cls, subStaticMethod, &divideResult, args2), ANI_OK);
    ASSERT_EQ(divideResult, TEST_EXPECTED_VALUE5 / TEST_EXPECTED_VALUE6);
    return ANI_TRUE;
}

ani_boolean test_Class_Find_Method_31([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object1)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("test.TestA003", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_method constructorMethod {};
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", nullptr, &constructorMethod), ANI_OK);
    ASSERT_NE(constructorMethod, nullptr);

    ani_method publicMethod {};
    ASSERT_EQ(env->Class_FindMethod(cls, "int_method", nullptr, &publicMethod), ANI_OK);
    ASSERT_NE(publicMethod, nullptr);

    ani_method protectedMethod {};
    ASSERT_EQ(env->Class_FindMethod(cls, "float_method", nullptr, &protectedMethod), ANI_OK);
    ASSERT_NE(protectedMethod, nullptr);

    ani_method privateMethod {};
    ASSERT_EQ(env->Class_FindMethod(cls, "bool_method", nullptr, &privateMethod), ANI_OK);
    ASSERT_NE(privateMethod, nullptr);

    ani_object object {};
    ASSERT_EQ(env->Object_New(cls, constructorMethod, &object, TEST_EXPECTED_VALUE1, TEST_EXPECTED_VALUE5), ANI_OK);
    ASSERT_NE(object, nullptr);

    ani_value args[2U];
    ani_int arg1 = TEST_EXPECTED_VALUE4;
    ani_int arg2 = TEST_EXPECTED_VALUE6;
    args[0U].i = arg1;
    args[1U].i = arg2;
    ani_int publicResult = 0;
    ASSERT_EQ(env->Object_CallMethod_Int_A(object, publicMethod, &publicResult, args), ANI_OK);
    ASSERT_EQ(publicResult, arg1 * arg2);

    ani_value args2[2U];
    ani_float arg3 = TEST_ARG5;
    ani_float arg4 = TEST_ARG6;
    args2[0U].f = arg3;
    args2[1U].f = arg4;
    ani_float protectedResult = 0.F;
    ASSERT_EQ(env->Object_CallMethod_Float_A(object, protectedMethod, &protectedResult, args2), ANI_OK);
    ASSERT_EQ(protectedResult, arg3 + arg4);

    ani_boolean privateResult = ANI_FALSE;
    ani_value args3[2U];
    args3[0U].z = ANI_TRUE;
    args3[1U].z = ANI_FALSE;
    ASSERT_EQ(env->Object_CallMethod_Boolean_A(object, privateMethod, &privateResult, args3), ANI_OK);
    ASSERT_EQ(privateResult, ANI_TRUE);
    return ANI_TRUE;
}

ani_boolean test_Class_Find_Method_32([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object1)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("test.TestA004", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_method constructorMethod {};
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", nullptr, &constructorMethod), ANI_OK);
    ASSERT_NE(constructorMethod, nullptr);

    ani_method funcAMethod {};
    ASSERT_EQ(env->Class_FindMethod(cls, "int_method", nullptr, &funcAMethod), ANI_OK);
    ASSERT_NE(funcAMethod, nullptr);

    ani_method funcBMethod {};
    ASSERT_EQ(env->Class_FindMethod(cls, "float_method", nullptr, &funcBMethod), ANI_OK);
    ASSERT_NE(funcBMethod, nullptr);

    ani_method funcCMethod {};
    ASSERT_EQ(env->Class_FindMethod(cls, "bool_method", nullptr, &funcCMethod), ANI_OK);
    ASSERT_NE(funcCMethod, nullptr);

    ani_object object {};
    ASSERT_EQ(env->Object_New(cls, constructorMethod, &object, TEST_EXPECTED_VALUE1, TEST_EXPECTED_VALUE5), ANI_OK);
    ASSERT_NE(object, nullptr);

    ani_value args[2U];
    ani_int arg1 = TEST_EXPECTED_VALUE4;
    ani_int arg2 = TEST_EXPECTED_VALUE6;
    args[0U].i = arg1;
    args[1U].i = arg2;
    ani_int funAResult = 0;
    ASSERT_EQ(env->Object_CallMethod_Int_A(object, funcAMethod, &funAResult, args), ANI_OK);
    ASSERT_EQ(funAResult, arg1 * arg2);

    ani_value args2[2U];
    ani_float arg3 = TEST_ARG5;
    ani_float arg4 = TEST_ARG6;
    args2[0U].f = arg3;
    args2[1U].f = arg4;
    ani_float funBResult = 0.F;
    ASSERT_EQ(env->Object_CallMethod_Float_A(object, funcBMethod, &funBResult, args2), ANI_OK);
    ASSERT_EQ(funBResult, arg3 + arg4);
    ani_boolean funCResult = ANI_FALSE;
    ani_value args3[2U];
    args3[0U].z = ANI_TRUE;
    args3[1U].z = ANI_FALSE;
    ASSERT_EQ(env->Object_CallMethod_Boolean_A(object, funcCMethod, &funCResult, args3), ANI_OK);
    ASSERT_EQ(funCResult, ANI_TRUE);
    return ANI_TRUE;
}

ani_boolean test_Class_Find_Method_33([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object1)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("test.TestA005", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_method constructorMethod {};
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", nullptr, &constructorMethod), ANI_OK);
    ASSERT_NE(constructorMethod, nullptr);

    ani_method method {};
    ASSERT_EQ(env->Class_FindMethod(cls, "int_method", nullptr, &method), ANI_OK);
    ASSERT_NE(method, nullptr);

    ani_object object {};
    ASSERT_EQ(env->Object_New(cls, constructorMethod, &object), ANI_OK);
    ASSERT_NE(object, nullptr);

    ani_value args[2U];
    ani_int arg1 = TEST_EXPECTED_VALUE4;
    ani_int arg2 = TEST_EXPECTED_VALUE6;
    args[0U].i = arg1;
    args[1U].i = arg2;
    ani_int result = 0;
    ASSERT_EQ(env->Object_CallMethod_Int_A(object, method, &result, args), ANI_OK);
    ASSERT_EQ(result, arg1 + arg2);
    return ANI_TRUE;
}

ani_boolean test_Class_Find_Method_34([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object1)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("test.Child", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_method constructorMethod {};
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", nullptr, &constructorMethod), ANI_OK);
    ASSERT_NE(constructorMethod, nullptr);

    ani_method method {};
    ASSERT_EQ(env->Class_FindMethod(cls, "add_method", nullptr, &method), ANI_OK);
    ASSERT_NE(method, nullptr);

    ani_object object {};
    ASSERT_EQ(env->Object_New(cls, constructorMethod, &object), ANI_OK);
    ASSERT_NE(object, nullptr);

    ani_value args[2U];
    ani_int arg1 = TEST_EXPECTED_VALUE4;
    ani_int arg2 = TEST_EXPECTED_VALUE6;
    args[0U].i = arg1;
    args[1U].i = arg2;
    ani_int result = 0;
    ASSERT_EQ(env->Object_CallMethod_Int_A(object, method, &result, args), ANI_OK);
    ASSERT_EQ(result, arg1 * arg2);
    return ANI_TRUE;
}

ani_boolean test_Class_Find_Method_35([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object1)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("test.Student", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_method constructorMethod {};
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", nullptr, &constructorMethod), ANI_OK);
    ASSERT_NE(constructorMethod, nullptr);

    ani_method method {};
    ASSERT_EQ(env->Class_FindMethod(cls, "add_method", nullptr, &method), ANI_OK);
    ASSERT_NE(method, nullptr);

    ani_object object {};
    ASSERT_EQ(env->Object_New(cls, constructorMethod, &object), ANI_OK);
    ASSERT_NE(object, nullptr);

    ani_value args[2U];
    ani_int arg1 = TEST_EXPECTED_VALUE4;
    ani_int arg2 = TEST_EXPECTED_VALUE6;
    args[0U].i = arg1;
    args[1U].i = arg2;
    ani_int result = 0;
    ASSERT_EQ(env->Object_CallMethod_Int_A(object, method, &result, args), ANI_OK);
    ASSERT_EQ(result, arg1 + arg2);
    return ANI_TRUE;
}

ani_boolean test_Class_Find_Method_36([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object1)
{
    ani_class clsB {};
    ASSERT_EQ(env->FindClass("test.TestB008", &clsB), ANI_OK);
    ASSERT_NE(clsB, nullptr);

    ani_class clsA {};
    ASSERT_EQ(env->FindClass("test.TestA008", &clsA), ANI_OK);
    ASSERT_NE(clsA, nullptr);

    ani_method constructorMethodB {};
    ASSERT_EQ(env->Class_FindMethod(clsB, "<ctor>", nullptr, &constructorMethodB), ANI_OK);
    ASSERT_NE(constructorMethodB, nullptr);

    ani_method constructorMethodA {};
    ASSERT_EQ(env->Class_FindMethod(clsA, "<ctor>", nullptr, &constructorMethodA), ANI_OK);
    ASSERT_NE(constructorMethodA, nullptr);

    ani_method method {};
    ASSERT_EQ(env->Class_FindMethod(clsB, "int_method", "C{test.TestA008}:i", &method), ANI_OK);
    ASSERT_NE(method, nullptr);

    ani_object objectB {};
    ASSERT_EQ(env->Object_New(clsB, constructorMethodB, &objectB), ANI_OK);
    ASSERT_NE(objectB, nullptr);

    ani_object objectA {};
    ASSERT_EQ(env->Object_New(clsA, constructorMethodA, &objectA), ANI_OK);
    ASSERT_NE(objectA, nullptr);

    ani_value args[1];
    args[0].r = objectA;
    ani_int result = 0;
    ASSERT_EQ(env->Object_CallMethod_Int_A(objectB, method, &result, args), ANI_OK);
    ASSERT_EQ(result, 66U);
    return ANI_TRUE;
}

ani_boolean test_Class_Find_Method_37([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object1)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("test.CombineA", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);
    ani_method method {};
    ASSERT_EQ(env->Class_FindMethod(cls, "func", "ii:i", &method), ANI_OK);
    ASSERT_NE(method, nullptr);

    ani_class clsB {};
    ASSERT_EQ(env->FindClass("test.CombineB", &clsB), ANI_OK);
    ASSERT_NE(clsB, nullptr);
    ani_method ctor {};
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", ":", &ctor), ANI_OK);

    ani_object object {};
    ASSERT_EQ(env->Object_New(clsB, ctor, &object), ANI_OK);
    ani_value args[2];  // NOLINT(modernize-avoid-c-arrays)
    args[0].i = TEST_EXPECTED_VALUE4;
    args[1].i = TEST_EXPECTED_VALUE6;

    ani_int res = 0;
    // Call the method and verify the return value.
    ASSERT_EQ(env->Object_CallMethod_Int_A(object, method, &res, args), ANI_OK);
    ASSERT_EQ(res, TEST_EXPECTED_VALUE4 - TEST_EXPECTED_VALUE6);
    return ANI_TRUE;
}

ani_boolean test_Class_Find_Method_38([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object1)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("test.AF", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);
    ani_method method {};
    ASSERT_EQ(env->Class_FindMethod(cls, "func", "ii:i", &method), ANI_OK);
    ASSERT_NE(method, nullptr);

    ani_method ctor {};
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", ":", &ctor), ANI_OK);

    ani_object object {};
    ASSERT_EQ(env->Object_New(cls, ctor, &object), ANI_OK);
    ani_value args[2];  // NOLINT(modernize-avoid-c-arrays)
    args[0].i = TEST_EXPECTED_VALUE4;
    args[1].i = TEST_EXPECTED_VALUE6;

    ani_int res = 0;
    // Call the method and verify the return value.
    ASSERT_EQ(env->Object_CallMethod_Int_A(object, method, &res, args), ANI_OK);
    ASSERT_EQ(res, TEST_EXPECTED_VALUE4 + TEST_EXPECTED_VALUE6);
    return ANI_TRUE;
}

ani_boolean test_Class_Find_Method_39([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object1)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("test.CombineC", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);
    ani_method method {};
    ASSERT_EQ(env->Class_FindMethod(cls, "func", "ii:i", &method), ANI_OK);
    ASSERT_NE(method, nullptr);

    ani_method ctor {};
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", ":", &ctor), ANI_OK);

    ani_object object {};
    ASSERT_EQ(env->Object_New(cls, ctor, &object), ANI_OK);
    ani_value args[2];  // NOLINT(modernize-avoid-c-arrays)
    args[0].i = TEST_EXPECTED_VALUE4;
    args[1].i = TEST_EXPECTED_VALUE6;

    ani_int res = 0;
    // Call the method and verify the return value.
    ASSERT_EQ(env->Object_CallMethod_Int_A(object, method, &res, args), ANI_OK);
    ASSERT_EQ(res, TEST_EXPECTED_VALUE4 - TEST_EXPECTED_VALUE6 - 1);
    return ANI_TRUE;
}

ani_boolean test_Class_Find_Method_40([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object1)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("test.nsa.nsb.A", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);
    ani_method method {};
    ASSERT_EQ(env->Class_FindMethod(cls, "func", "ii:i", &method), ANI_OK);
    ASSERT_NE(method, nullptr);

    ani_method ctor {};
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", ":", &ctor), ANI_OK);

    ani_object object {};
    ASSERT_EQ(env->Object_New(cls, ctor, &object), ANI_OK);
    ani_value args[2];  // NOLINT(modernize-avoid-c-arrays)
    args[0].i = TEST_EXPECTED_VALUE4;
    args[1].i = TEST_EXPECTED_VALUE6;

    ani_int res = 0;
    // Call the method and verify the return value.
    ASSERT_EQ(env->Object_CallMethod_Int_A(object, method, &res, args), ANI_OK);
    ASSERT_EQ(res, TEST_EXPECTED_VALUE4 + TEST_EXPECTED_VALUE6);
    return ANI_TRUE;
}

ani_boolean test_Class_Find_Method_41([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object1)
{
    ani_class baseCls {};
    ASSERT_EQ(env->FindClass("test.A", &baseCls), ANI_OK);
    ASSERT_NE(baseCls, nullptr);

    ani_method method {};
    ASSERT_EQ(env->Class_FindMethod(baseCls, "overloadedBase", nullptr, &method), ANI_AMBIGUOUS);

    ani_class cls;
    ASSERT_EQ(env->FindClass("test.B", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);
    ASSERT_EQ(env->Class_FindMethod(cls, "overloadedBase", nullptr, &method), ANI_AMBIGUOUS);
    ASSERT_EQ(env->Class_FindMethod(cls, "overloaded", nullptr, &method), ANI_AMBIGUOUS);
    return ANI_TRUE;
}

ani_boolean test_Class_Find_Method_42([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object1)
{
    ani_class baseCls {};
    ASSERT_EQ(env->FindClass("test.A", &baseCls), ANI_OK);
    ASSERT_NE(baseCls, nullptr);

    ani_static_method method {};
    ASSERT_EQ(env->Class_FindStaticMethod(baseCls, "staticOverloadedBase", nullptr, &method), ANI_AMBIGUOUS);

    ani_class cls;
    ASSERT_EQ(env->FindClass("test.B", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "staticOverloadedBase", nullptr, &method), ANI_AMBIGUOUS);
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "staticOverloaded", nullptr, &method), ANI_AMBIGUOUS);
    return ANI_TRUE;
}

ani_boolean test_Class_Find_Method_43([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object1)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("test.AllFunctions", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_method ctor {};
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", ":", &ctor), ANI_OK);
    ASSERT_NE(ctor, nullptr);

    ani_static_method staticMethod {};
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "foo", ":i", &staticMethod), ANI_OK);
    ASSERT_NE(staticMethod, nullptr);

    ani_method method {};
    ASSERT_EQ(env->Class_FindMethod(cls, "foo", ":i", &method), ANI_OK);
    ASSERT_NE(method, nullptr);

    ani_object object {};
    ASSERT_EQ(env->Object_New(cls, ctor, &object), ANI_OK);
    ASSERT_NE(object, nullptr);

    ani_int fooVal {};
    ASSERT_EQ(env->Object_CallMethod_Int(object, method, &fooVal), ANI_OK);
    ASSERT_EQ(fooVal, 43U);

    ani_int staticFooVal {};
    ASSERT_EQ(env->Class_CallStaticMethod_Int(cls, staticMethod, &staticFooVal), ANI_OK);
    ASSERT_EQ(staticFooVal, 42U);
    return ANI_TRUE;
}

ani_boolean test_Class_Find_Method_44([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object1)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("test.MixedFunctions", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_static_method staticMethod {};
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "bar", ":i", &staticMethod), ANI_NOT_FOUND);

    ani_method method {};
    ASSERT_EQ(env->Class_FindMethod(cls, "foo", ":i", &method), ANI_NOT_FOUND);
    return ANI_TRUE;
}

ani_boolean test_Class_Find_Method_45([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object1)
{
    ani_class baseCls {};
    ASSERT_EQ(env->FindClass("test.NotOverloaded", &baseCls), ANI_OK);
    ASSERT_NE(baseCls, nullptr);

    ani_static_method smethod {};
    ASSERT_EQ(env->Class_FindStaticMethod(baseCls, "notOverloaded", nullptr, &smethod), ANI_OK);

    ani_method method {};
    ASSERT_EQ(env->Class_FindMethod(baseCls, "notOverloaded", nullptr, &method), ANI_OK);
    return ANI_TRUE;
}
#endif // ARKTS_ANI_TEST_CLASSOPERATIONSFINDMETHOD_H
