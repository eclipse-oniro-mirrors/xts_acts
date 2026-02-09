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

#ifndef ARKTS_ANI_TEST_CALLINGINSTANCEMETHODS_H
#define ARKTS_ANI_TEST_CALLINGINSTANCEMETHODS_H
#include "Common.h"
#include <cstdarg>

const char *CALLINSTMETH_CLASS_NAME = "entry.src.main.src.ets.CallingInstanceMethods.Test";
const char *CALLINSTMETH_MOD_NAME = "entry.src.main.src.ets.CallingInstanceMethods";

ani_boolean GetMethodAndObject([[maybe_unused]] ani_env *env, const char *methodName,
                               const char *signature, ani_object *object, ani_method *method)
{
    ani_class cls{};
    const char *className = CALLINSTMETH_CLASS_NAME;
    if (env->FindClass(className, &cls) != ANI_OK) {
        OH_LOG_INFO(LOG_APP, " FindClass Failed");
        return ANI_FALSE;
    }
    if (cls == nullptr) {
        OH_LOG_INFO(LOG_APP, " FindClass cls is nullptr");
        return ANI_FALSE;
    }
    ani_static_method newMethod;
    if (env->Class_FindStaticMethod(cls, "new_Test", nullptr, &newMethod) != ANI_OK) {
        OH_LOG_INFO(LOG_APP, " Class_FindStaticMethod Failed");
        return ANI_FALSE;
    }
    ani_ref ref;
    if (env->Class_CallStaticMethod_Ref(cls, newMethod, &ref) != ANI_OK) {
        OH_LOG_INFO(LOG_APP, " Class_CallStaticMethod_Ref Failed");
        return ANI_FALSE;
    }
    *object = static_cast<ani_object>(ref);
    ASSERT_EQ(env->Class_FindMethod(cls, methodName, signature, method), ANI_OK);
    ASSERT_NE(method, nullptr);
    return ANI_TRUE;
}

ani_int callinstmethSum([[maybe_unused]] ani_env *env, ani_int a, ani_int b) { return a + b; }

ani_int callinstmethSumB([[maybe_unused]] ani_env *env, ani_int a, ani_int b) { return a + b; }

ani_boolean GetMethod([[maybe_unused]] ani_env *env, const char *className, const char *methodName,
                      const char *signature, ani_method *method)
{
    ani_class cls{};
    ASSERT_EQ(env->FindClass(className, &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ASSERT_EQ(env->Class_FindMethod(cls, methodName, signature, method), ANI_OK);
    ASSERT_NE(method, nullptr);

    return ANI_TRUE;
}

ani_boolean GetFunction([[maybe_unused]] ani_env *env, const char *moduleName, const char *functionName,
                        const char *signature, ani_function *function)
{
    ani_module mod{};
    ASSERT_EQ(env->FindModule(moduleName, &mod), ANI_OK);
    ASSERT_NE(mod, nullptr);
    ani_function fn{};
    ASSERT_EQ(env->Module_FindFunction(mod, functionName, signature, &fn), ANI_OK);
    ASSERT_NE(fn, nullptr);
    *function = fn;
    return ANI_TRUE;
}

ani_boolean CheckANIStr(ani_env *env, const ani_string &str, const std::string &expected)
{
    const ani_size utfBufferSize = 20;
    std::array<char, utfBufferSize> utfBuffer = {0};
    ani_size resultSize;
    const ani_size offset = 0;
    ASSERT_EQ(
        env->String_GetUTF8SubString(str, offset, expected.size(), utfBuffer.data(), utfBuffer.size(), &resultSize),
        ANI_OK);
    ASSERT_EQ(utfBuffer.data(), expected.c_str());
    return ANI_TRUE;
}

ani_boolean test_Object_CallMethod_Double([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object obj{};
    ani_method method{};
    ASSERT_EQ(GetMethodAndObject(env, "doubleMethod", "dd:d", &obj, &method), ANI_TRUE);
    ani_double sum = 0.0F;
    ani_double arg1 = 2.0F;
    ani_double arg2 = 3.0F;
    ASSERT_EQ(env->Object_CallMethod_Double(obj, method, &sum, arg1, arg2), ANI_OK);
    ASSERT_EQ(sum, arg1 + arg2);
    return ANI_TRUE;
}

ani_boolean test_Object_CallMethod_Double_A([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object obj{};
    ani_method method{};
    GetMethodAndObject(env, "doubleMethod", "dd:d", &obj, &method);
    ani_value args[2U] = {};
    ani_double arg1 = 2.0F;
    ani_double arg2 = 3.0F;
    args[0U].d = arg1;
    args[1U].d = arg2;
    ani_double result = 0.0F;
    ASSERT_EQ(env->Object_CallMethod_Double_A(obj, method, &result, args), ANI_OK);
    ASSERT_EQ(result, arg1 + arg2);
    return ANI_TRUE;
}

ani_boolean TestObjectCallMethodDoubleV([[maybe_unused]] ani_env *env, ani_object object, ani_method method,
                                        ani_double *value, ...)
{
    va_list args{};
    va_start(args, value);
    ASSERT_EQ(env->Object_CallMethod_Double_V(object, method, value, args), ANI_OK);
    va_end(args);
    return ANI_TRUE;
}

ani_boolean test_Object_CallMethod_Double_V([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object obj{};
    ani_method method{};
    GetMethodAndObject(env, "doubleMethod", "dd:d", &obj, &method);
    ani_double result = 0.0F;
    ani_double arg1 = 2.0F;
    ani_double arg2 = 3.0F;
    TestObjectCallMethodDoubleV(env, obj, method, &result, arg1, arg2);
    ASSERT_EQ(result, arg1 + arg2);
    return ANI_TRUE;
}

ani_boolean test_Object_CallMethod_Int([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object obj{};
    ani_method method{};
    GetMethodAndObject(env, "intMethod", "ii:i", &obj, &method);
    ani_int sum = 0U;
    ani_int arg1 = 2U;
    ani_int arg2 = 3U;
    ASSERT_EQ(env->Object_CallMethod_Int(obj, method, &sum, arg1, arg2), ANI_OK);
    ASSERT_EQ(sum, arg1 + arg2);
    return ANI_TRUE;
}

ani_boolean test_Object_CallMethod_Int_A([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object obj{};
    ani_method method{};
    GetMethodAndObject(env, "intMethod", "ii:i", &obj, &method);
    ani_value args[2U];
    ani_int arg1 = 2U;
    ani_int arg2 = 3U;
    args[0U].i = arg1;
    args[1U].i = arg2;
    ani_int result = 0U;
    ASSERT_EQ(env->Object_CallMethod_Int_A(obj, method, &result, args), ANI_OK);
    ASSERT_EQ(result, arg1 + arg2);
    return ANI_TRUE;
}

ani_boolean TestObjectCallMethodIntV([[maybe_unused]] ani_env *env, ani_object object, ani_method method,
                                     ani_int *value, ...)
{
    va_list args{};
    va_start(args, value);
    ASSERT_EQ(env->Object_CallMethod_Int_V(object, method, value, args), ANI_OK);
    va_end(args);
    return ANI_TRUE;
}

ani_boolean test_Object_CallMethod_Int_V([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object obj{};
    ani_method method{};
    GetMethodAndObject(env, "intMethod", "ii:i", &obj, &method);
    ani_int result = 0U;
    ani_int arg1 = 2U;
    ani_int arg2 = 3U;
    TestObjectCallMethodIntV(env, obj, method, &result, arg1, arg2);
    ASSERT_EQ(result, arg1 + arg2);
    return ANI_TRUE;
}

ani_boolean test_Object_CallMethod_Boolean([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object obj{};
    ani_method method{};
    GetMethodAndObject(env, "booleanMethod", "ii:z", &obj, &method);
    ani_boolean res = ANI_FALSE;
    ani_int arg1 = 5U;
    ani_int arg2 = 6U;
    ASSERT_EQ(env->Object_CallMethod_Boolean(obj, method, &res, arg1, arg2), ANI_OK);
    ASSERT_EQ(res, ANI_TRUE);
    return ANI_TRUE;
}

ani_boolean test_Object_CallMethod_Boolean_A([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object obj{};
    ani_method method{};
    GetMethodAndObject(env, "booleanMethod", "ii:z", &obj, &method);
    ani_value args[2];
    ani_int arg1 = 5U;
    ani_int arg2 = 6U;
    args[0].i = arg1;
    args[1].i = arg2;
    ani_boolean res = ANI_FALSE;
    ASSERT_EQ(env->Object_CallMethod_Boolean_A(obj, method, &res, args), ANI_OK);
    ASSERT_EQ(res, ANI_TRUE);
    return ANI_TRUE;
}

ani_boolean TestObjectCallMethodBooleanV([[maybe_unused]] ani_env *env, ani_object object, ani_method method,
                                         ani_boolean *value, ...)
{
    va_list args{};
    va_start(args, value);
    ASSERT_EQ(env->Object_CallMethod_Boolean_V(object, method, value, args), ANI_OK);
    va_end(args);
    return ANI_TRUE;
}

ani_boolean test_Object_CallMethod_Boolean_V([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object obj{};
    ani_method method{};
    GetMethodAndObject(env, "booleanMethod", "ii:z", &obj, &method);
    ani_int arg1 = 5U;
    ani_int arg2 = 6U;
    ani_boolean res = ANI_FALSE;
    TestObjectCallMethodBooleanV(env, obj, method, &res, arg1, arg2);
    ASSERT_EQ(res, ANI_TRUE);
    return ANI_TRUE;
}

ani_boolean test_Object_CallMethod_Void([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object obj{};
    ani_method method{};
    GetMethodAndObject(env, "voidMethod", "ii:", &obj, &method);
    ani_method checkMethod{};
    GetMethod(env, CALLINSTMETH_CLASS_NAME, "getCount", ":i", &checkMethod);
    ani_int a = 6U;
    ani_int b = 7U;
    ani_int sum = 0U;
    ASSERT_EQ(env->Object_CallMethod_Void(obj, method, a, b), ANI_OK);
    ASSERT_EQ(env->Object_CallMethod_Int(obj, checkMethod, &sum), ANI_OK);
    ASSERT_EQ(sum, a + b);
    return ANI_TRUE;
}

ani_boolean test_Object_CallMethod_Void_A([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object obj{};
    ani_method method{};
    GetMethodAndObject(env, "voidMethod", "ii:", &obj, &method);
    ani_method checkMethod{};
    GetMethod(env, CALLINSTMETH_CLASS_NAME, "getCount", ":i", &checkMethod);
    ani_value args[2];
    ani_int arg1 = 2U;
    ani_int arg2 = 3U;
    args[0].i = arg1;
    args[1].i = arg2;
    ani_int sum = 0U;
    ASSERT_EQ(env->Object_CallMethod_Void_A(obj, method, args), ANI_OK);
    ASSERT_EQ(env->Object_CallMethod_Int(obj, checkMethod, &sum), ANI_OK);
    ASSERT_EQ(sum, arg1 + arg2);
    return ANI_TRUE;
}

ani_boolean TestObjectCallMethodVoidV([[maybe_unused]] ani_env *env, ani_object object, ani_method method, ...)
{
    va_list args{};
    va_start(args, method);
    ASSERT_EQ(env->Object_CallMethod_Void_V(object, method, args), ANI_OK);
    va_end(args);
    return ANI_TRUE;
}

ani_boolean test_Object_CallMethod_Void_V([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object obj{};
    ani_method method{};
    GetMethodAndObject(env, "voidMethod", "ii:", &obj, &method);
    ani_method checkMethod{};
    GetMethod(env, CALLINSTMETH_CLASS_NAME, "getCount", ":i", &checkMethod);
    ani_int arg1 = 6U;
    ani_int arg2 = 7U;
    ani_int sum = 0U;
    TestObjectCallMethodVoidV(env, obj, method, arg1, arg2);
    ASSERT_EQ(env->Object_CallMethod_Int(obj, checkMethod, &sum), ANI_OK);
    ASSERT_EQ(sum, arg1 + arg2);
    return ANI_TRUE;
}

ani_boolean test_Object_CallMethod_Long([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object obj{};
    ani_method method{};
    GetMethodAndObject(env, "longMethod", "ll:l", &obj, &method);
    ani_long sum = 0U;
    ani_long arg1 = 2U;
    ani_long arg2 = 3U;
    ASSERT_EQ(env->Object_CallMethod_Long(obj, method, &sum, arg1, arg2), ANI_OK);
    ASSERT_EQ(sum, arg1 + arg2);
    return ANI_TRUE;
}

ani_boolean test_Object_CallMethod_Long_A([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object obj{};
    ani_method method{};
    GetMethodAndObject(env, "longMethod", "ll:l", &obj, &method);
    ani_value args[2U];
    ani_long arg1 = 2U;
    ani_long arg2 = 3U;
    args[0U].l = arg1;
    args[1U].l = arg2;
    ani_long sum = 0U;
    ASSERT_EQ(env->Object_CallMethod_Long_A(obj, method, &sum, args), ANI_OK);
    ASSERT_EQ(sum, arg1 + arg2);
    return ANI_TRUE;
}

ani_boolean TestObjectCallMethodLongV([[maybe_unused]] ani_env *env, ani_object object, ani_method method,
                                      ani_long *value, ...)
{
    va_list args{};
    va_start(args, value);
    ASSERT_EQ(env->Object_CallMethod_Long_V(object, method, value, args), ANI_OK);
    va_end(args);
    return ANI_TRUE;
}

ani_boolean test_Object_CallMethod_Long_V([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object obj{};
    ani_method method{};
    GetMethodAndObject(env, "longMethod", "ll:l", &obj, &method);
    ani_long arg1 = 2U;
    ani_long arg2 = 3U;
    ani_long sum = 0U;
    TestObjectCallMethodLongV(env, obj, method, &sum, arg1, arg2);
    ASSERT_EQ(sum, arg1 + arg2);
    return ANI_TRUE;
}

ani_boolean test_FunctionalObject_Call([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_function fn{};
    GetFunction(env, CALLINSTMETH_MOD_NAME, "GetFnObj", nullptr, &fn);
    ani_ref resultRef{};
    ASSERT_EQ(env->Function_Call_Ref(fn, &resultRef), ANI_OK);
    ani_fn_object fnObj = reinterpret_cast<ani_fn_object>(resultRef);
    const std::string str = "test";
    ani_string arg1 = {};
    ASSERT_EQ(env->String_NewUTF8(str.c_str(), str.size(), &arg1), ANI_OK);
    std::vector<ani_ref> args = {static_cast<ani_ref>(arg1)};
    ani_ref result;
    ASSERT_EQ(env->FunctionalObject_Call(fnObj, args.size(), args.data(), &result), ANI_OK);
    CheckANIStr(env, static_cast<ani_string>(result), str);
    return ANI_TRUE;
}

ani_boolean test_Module_BindNativeFunctions([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_module module{};
    ASSERT_EQ(env->FindModule(CALLINSTMETH_MOD_NAME, &module), ANI_OK);
    ASSERT_NE(module, nullptr);
    std::array functions = {
        ani_native_function{"sum", "ii:i", reinterpret_cast<void *>(callinstmethSum)},
    };
    ASSERT_EQ(env->Module_BindNativeFunctions(module, functions.data(), functions.size()), ANI_OK);
    ani_function fn{};
    GetFunction(env, CALLINSTMETH_MOD_NAME, "checkSum", ":z", &fn);
    ani_boolean result = ANI_FALSE;
    ASSERT_EQ(env->Function_Call_Boolean(fn, &result), ANI_OK);
    ASSERT_EQ(result, ANI_TRUE);
    return ANI_TRUE;
}

ani_boolean test_Namespace_BindNativeFunctions([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_namespace nsA{};
    ani_function fn{};
    const std::string nsName = std::string(CALLINSTMETH_MOD_NAME) + ".A";
    ASSERT_EQ(env->FindNamespace(nsName.c_str(), &nsA), ANI_OK);
    ASSERT_NE(nsA, nullptr);
    ASSERT_EQ(env->Namespace_FindFunction(nsA, "checkSumB", ":z", &fn), ANI_OK);
    ASSERT_NE(fn, nullptr);
    std::array functions = {
        ani_native_function{"sumB", "ii:i", reinterpret_cast<void *>(callinstmethSumB)},
    };
    ASSERT_EQ(env->Namespace_BindNativeFunctions(nsA, functions.data(), functions.size()), ANI_OK);
    ani_boolean value = ANI_FALSE;
    ASSERT_EQ(env->Function_Call_Boolean(fn, &value), ANI_OK);
    ASSERT_EQ(value, ANI_TRUE);
    return ANI_TRUE;
}

ani_boolean test_Function_Call_Boolean([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_function fn{};
    ASSERT_EQ(GetFunction(env, CALLINSTMETH_MOD_NAME, "booleanModuleFunction", "i:z", &fn), ANI_TRUE);
    ani_boolean value = ANI_FALSE;
    ani_int arg1 = 2;
    ASSERT_EQ(env->Function_Call_Boolean(fn, &value, arg1), ANI_OK);
    ASSERT_EQ(value, ANI_TRUE);
    return ANI_TRUE;
}

ani_boolean test_Function_Call_Boolean_A([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_function fn{};
    GetFunction(env, CALLINSTMETH_MOD_NAME, "booleanModuleFunction", "i:z", &fn);
    ani_value args[1U];
    ani_int arg1 = 2;
    args[0U].i = arg1;
    ani_boolean value = ANI_FALSE;
    ASSERT_EQ(env->Function_Call_Boolean_A(fn, &value, args), ANI_OK);
    ASSERT_EQ(value, ANI_TRUE);
    return ANI_TRUE;
}

ani_boolean TestFunctionCallBooleanV([[maybe_unused]] ani_env *env, ani_function fn, ani_boolean *value, ...)
{
    va_list args{};
    va_start(args, value);
    ASSERT_EQ(env->Function_Call_Boolean_V(fn, value, args), ANI_OK);
    va_end(args);
    return ANI_TRUE;
}

ani_boolean test_Function_Call_Boolean_V([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_function fn{};
    GetFunction(env, CALLINSTMETH_MOD_NAME, "booleanModuleFunction", "i:z", &fn);
    ani_boolean value = ANI_FALSE;
    ani_int arg1 = 2;
    TestFunctionCallBooleanV(env, fn, &value, arg1);
    ASSERT_EQ(value, ANI_TRUE);
    return ANI_TRUE;
}

ani_boolean test_Function_Call_Char([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_function fn{};
    GetFunction(env, CALLINSTMETH_MOD_NAME, "charModuleFunction", "cc:c", &fn);
    ani_char arg1 = 'C';
    ani_char arg2 = 'A';
    ani_char value = '0';
    ASSERT_EQ(env->Function_Call_Char(fn, &value, arg1, arg2), ANI_OK);
    ASSERT_EQ(value, arg1);
    return ANI_TRUE;
}

ani_boolean test_Function_Call_Char_A([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_function fn{};
    GetFunction(env, CALLINSTMETH_MOD_NAME, "charModuleFunction", "cc:c", &fn);
    ani_value args[2U];
    ani_char arg1 = 'C';
    ani_char arg2 = 'A';
    args[0U].c = arg1;
    args[1U].c = arg2;
    ani_char value = '0';
    ASSERT_EQ(env->Function_Call_Char_A(fn, &value, args), ANI_OK);
    ASSERT_EQ(value, arg1);
    return ANI_TRUE;
}

ani_boolean TestFunctionCallCharV([[maybe_unused]] ani_env *env, ani_function fn, ani_char *value, ...)
{
    va_list args{};
    va_start(args, value);
    ASSERT_EQ(env->Function_Call_Char_V(fn, value, args), ANI_OK);
    va_end(args);
    return ANI_TRUE;
}

ani_boolean test_Function_Call_Char_V([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_function fn{};
    GetFunction(env, CALLINSTMETH_MOD_NAME, "charModuleFunction", "cc:c", &fn);
    ani_char arg1 = 'C';
    ani_char arg2 = 'A';
    ani_char value = '0';
    TestFunctionCallCharV(env, fn, &value, arg1, arg2);
    ASSERT_EQ(value, arg1);
    return ANI_TRUE;
}

ani_boolean test_Function_Call_Byte([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_function fn{};
    GetFunction(env, CALLINSTMETH_MOD_NAME, "byteModuleFunction", "bb:b", &fn);
    ani_byte arg1 = 1U;
    ani_byte arg2 = 2U;
    ani_byte value{};
    ASSERT_EQ(env->Function_Call_Byte(fn, &value, arg1, arg2), ANI_OK);
    ASSERT_EQ(value, arg1 + arg2);
    return ANI_TRUE;
}

ani_boolean test_Function_Call_Byte_A([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_function fn{};
    GetFunction(env, CALLINSTMETH_MOD_NAME, "byteModuleFunction", "bb:b", &fn);
    ani_value args[2U];
    ani_byte arg1 = 1U;
    ani_byte arg2 = 2U;
    args[0U].b = arg1;
    args[1U].b = arg2;
    ani_byte value{};
    ASSERT_EQ(env->Function_Call_Byte_A(fn, &value, args), ANI_OK);
    ASSERT_EQ(value, arg1 + arg2);
    return ANI_TRUE;
}

ani_boolean TestFunctionCallByteV([[maybe_unused]] ani_env *env, ani_function fn, ani_byte *value, ...)
{
    va_list args{};
    va_start(args, value);
    ASSERT_EQ(env->Function_Call_Byte_V(fn, value, args), ANI_OK);
    va_end(args);
    return ANI_TRUE;
}

ani_boolean test_Function_Call_Byte_V([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_function fn{};
    GetFunction(env, CALLINSTMETH_MOD_NAME, "byteModuleFunction", "bb:b", &fn);
    ani_byte arg1 = 1U;
    ani_byte arg2 = 2U;
    ani_byte value{};
    TestFunctionCallByteV(env, fn, &value, arg1, arg2);
    ASSERT_EQ(value, arg1 + arg2);
    return ANI_TRUE;
}

ani_boolean test_Function_Call_Short([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_function fn{};
    GetFunction(env, CALLINSTMETH_MOD_NAME, "shortModuleFunction", "ss:s", &fn);
    ani_short arg1 = 5;
    ani_short arg2 = 6;
    ani_short value{};
    ASSERT_EQ(env->Function_Call_Short(fn, &value, arg1, arg2), ANI_OK);
    ASSERT_EQ(value, arg1 + arg2);
    return ANI_TRUE;
}

ani_boolean test_Function_Call_Short_A([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_function fn{};
    GetFunction(env, CALLINSTMETH_MOD_NAME, "shortModuleFunction", "ss:s", &fn);
    ani_value args[2U];
    ani_short arg1 = 5;
    ani_short arg2 = 6;
    args[0U].s = arg1;
    args[1U].s = arg2;
    ani_short value{};
    ASSERT_EQ(env->Function_Call_Short_A(fn, &value, args), ANI_OK);
    ASSERT_EQ(value, arg1 + arg2);
    return ANI_TRUE;
}

ani_boolean TestFunctionCallShortV([[maybe_unused]] ani_env *env, ani_function fn, ani_short *value, ...)
{
    va_list args{};
    va_start(args, value);
    ASSERT_EQ(env->Function_Call_Short_V(fn, value, args), ANI_OK);
    va_end(args);
    return ANI_TRUE;
}

ani_boolean test_Function_Call_Short_V([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_function fn{};
    GetFunction(env, CALLINSTMETH_MOD_NAME, "shortModuleFunction", "ss:s", &fn);
    ani_short arg1 = 5;
    ani_short arg2 = 6;
    ani_short value{};
    TestFunctionCallShortV(env, fn, &value, arg1, arg2);
    ASSERT_EQ(value, arg1 + arg2);
    return ANI_TRUE;
}

ani_boolean test_Function_Call_Int([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_function fn{};
    GetFunction(env, CALLINSTMETH_MOD_NAME, "intModuleFunction", "ii:i", &fn);
    ani_int arg1 = 5;
    ani_int arg2 = 6;
    ani_int value = 0;
    ASSERT_EQ(env->Function_Call_Int(fn, &value, arg1, arg2), ANI_OK);
    ASSERT_EQ(value, arg1 + arg2);
    return ANI_TRUE;
}

ani_boolean test_Function_Call_Int_A([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_function fn{};
    GetFunction(env, CALLINSTMETH_MOD_NAME, "intModuleFunction", "ii:i", &fn);
    ani_value args[2U];
    ani_int arg1 = 5;
    ani_int arg2 = 6;
    args[0U].i = arg1;
    args[1U].i = arg2;
    ani_int value = 0;
    ASSERT_EQ(env->Function_Call_Int_A(fn, &value, args), ANI_OK);
    ASSERT_EQ(value, arg1 + arg2);
    return ANI_TRUE;
}

ani_boolean TestFunctionCallIntV([[maybe_unused]] ani_env *env, ani_function fn, ani_int *value, ...)
{
    va_list args{};
    va_start(args, value);
    ASSERT_EQ(env->Function_Call_Int_V(fn, value, args), ANI_OK);
    va_end(args);
    return ANI_TRUE;
}

ani_boolean test_Function_Call_Int_V([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_function fn{};
    GetFunction(env, CALLINSTMETH_MOD_NAME, "intModuleFunction", "ii:i", &fn);
    ani_int arg1 = 5;
    ani_int arg2 = 6;
    ani_int value = 0;
    TestFunctionCallIntV(env, fn, &value, arg1, arg2);
    ASSERT_EQ(value, arg1 + arg2);
    return ANI_TRUE;
}

ani_boolean test_Function_Call_Long([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_function fn{};
    GetFunction(env, CALLINSTMETH_MOD_NAME, "longModuleFunction", "ll:l", &fn);
    ani_long arg1 = 100;
    ani_long arg2 = 200;
    ani_long value{};
    ASSERT_EQ(env->Function_Call_Long(fn, &value, arg1, arg2), ANI_OK);
    ASSERT_EQ(value, arg1 + arg2);
    return ANI_TRUE;
}

ani_boolean test_Function_Call_Long_A([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_function fn{};
    GetFunction(env, CALLINSTMETH_MOD_NAME, "longModuleFunction", "ll:l", &fn);
    ani_value args[2U];
    ani_long arg1 = 100;
    ani_long arg2 = 200;
    args[0U].l = arg1;
    args[1U].l = arg2;
    ani_long value{};
    ASSERT_EQ(env->Function_Call_Long_A(fn, &value, args), ANI_OK);
    ASSERT_EQ(value, arg1 + arg2);
    return ANI_TRUE;
}

ani_boolean TestFunctionCallLongV([[maybe_unused]] ani_env *env, ani_function fn, ani_long *value, ...)
{
    va_list args{};
    va_start(args, value);
    ASSERT_EQ(env->Function_Call_Long_V(fn, value, args), ANI_OK);
    va_end(args);
    return ANI_TRUE;
}

ani_boolean test_Function_Call_Long_V([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_function fn{};
    GetFunction(env, CALLINSTMETH_MOD_NAME, "longModuleFunction", "ll:l", &fn);
    ani_long arg1 = 100;
    ani_long arg2 = 200;
    ani_long value{};
    TestFunctionCallLongV(env, fn, &value, arg1, arg2);
    ASSERT_EQ(value, arg1 + arg2);
    return ANI_TRUE;
}

ani_boolean test_Function_Call_Float([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_function fn{};
    GetFunction(env, CALLINSTMETH_MOD_NAME, "floatModuleFunction", "ff:f", &fn);
    ani_float arg1 = 1.5F;
    ani_float arg2 = 2.5F;
    ani_float value = 0.0;
    ASSERT_EQ(env->Function_Call_Float(fn, &value, arg1, arg2), ANI_OK);
    ASSERT_EQ(value, arg1 + arg2);
    return ANI_TRUE;
}

ani_boolean test_Function_Call_Float_A([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_function fn{};
    GetFunction(env, CALLINSTMETH_MOD_NAME, "floatModuleFunction", "ff:f", &fn);
    ani_value args[2U];
    ani_float arg1 = 1.5F;
    ani_float arg2 = 2.5F;
    args[0U].f = arg1;
    args[1U].f = arg2;
    ani_float value = 0.0;
    ASSERT_EQ(env->Function_Call_Float_A(fn, &value, args), ANI_OK);
    ASSERT_EQ(value, arg1 + arg2);
    return ANI_TRUE;
}

ani_boolean TestFunctionCallFloatV([[maybe_unused]] ani_env *env, ani_function fn, ani_float *value, ...)
{
    va_list args{};
    va_start(args, value);
    ASSERT_EQ(env->Function_Call_Float_V(fn, value, args), ANI_OK);
    va_end(args);
    return ANI_TRUE;
}

ani_boolean test_Function_Call_Float_V([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_function fn{};
    GetFunction(env, CALLINSTMETH_MOD_NAME, "floatModuleFunction", "ff:f", &fn);
    ani_float arg1 = 1.5F;
    ani_float arg2 = 2.5F;
    ani_float value = 0.0;
    TestFunctionCallFloatV(env, fn, &value, arg1, arg2);
    ASSERT_EQ(value, arg1 + arg2);
    return ANI_TRUE;
}

ani_boolean test_Function_Call_Double([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_function fn{};
    GetFunction(env, CALLINSTMETH_MOD_NAME, "doubleModuleFunction", "dd:d", &fn);
    ani_double arg1 = 1.5;
    ani_double arg2 = 2.5;
    ani_double value = 0.0;
    ASSERT_EQ(env->Function_Call_Double(fn, &value, arg1, arg2), ANI_OK);
    ASSERT_EQ(value, arg1 + arg2);
    return ANI_TRUE;
}

ani_boolean test_Function_Call_Double_A([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_function fn{};
    GetFunction(env, CALLINSTMETH_MOD_NAME, "doubleModuleFunction", "dd:d", &fn);
    ani_value args[2U];
    ani_double arg1 = 1.5;
    ani_double arg2 = 2.5;
    args[0U].d = arg1;
    args[1U].d = arg2;
    ani_double value = 0.0;
    ASSERT_EQ(env->Function_Call_Double_A(fn, &value, args), ANI_OK);
    ASSERT_EQ(value, arg1 + arg2);
    return ANI_TRUE;
}

ani_boolean TestFunctionCallDoubleV([[maybe_unused]] ani_env *env, ani_function fn, ani_double *value, ...)
{
    va_list args{};
    va_start(args, value);
    ASSERT_EQ(env->Function_Call_Double_V(fn, value, args), ANI_OK);
    va_end(args);
    return ANI_TRUE;
}

ani_boolean test_Function_Call_Double_V([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_function fn{};
    GetFunction(env, CALLINSTMETH_MOD_NAME, "doubleModuleFunction", "dd:d", &fn);
    ani_double arg1 = 1.5;
    ani_double arg2 = 2.5;
    ani_double value = 0.0;
    TestFunctionCallDoubleV(env, fn, &value, arg1, arg2);
    ASSERT_EQ(value, arg1 + arg2);
    return ANI_TRUE;
}

ani_boolean test_Function_Call_Ref([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_function fn{};
    GetFunction(env, CALLINSTMETH_MOD_NAME, "refModuleFunction", "ii:C{std.core.String}", &fn);
    ani_int arg1 = 1;
    ani_int arg2 = 2;
    ani_ref value{};
    std::string result{};
    ASSERT_EQ(env->Function_Call_Ref(fn, &value, arg1, arg2), ANI_OK);
    GetStdString(env, static_cast<ani_string>(value), result);
    std::string checkStr = "Inequality";
    ASSERT_EQ(result, checkStr);
    return ANI_TRUE;
}

ani_boolean test_Function_Call_Ref_A([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_function fn{};
    GetFunction(env, CALLINSTMETH_MOD_NAME, "refModuleFunction", "ii:C{std.core.String}", &fn);
    ani_value args[2U];
    ani_int arg1 = 1;
    ani_int arg2 = 2;
    args[0U].i = arg1;
    args[1U].i = arg2;
    ani_ref value{};
    std::string result{};
    ASSERT_EQ(env->Function_Call_Ref_A(fn, &value, args), ANI_OK);
    GetStdString(env, static_cast<ani_string>(value), result);
    std::string checkStr = "Inequality";
    ASSERT_EQ(result, checkStr);
    return ANI_TRUE;
}

ani_boolean TestFunctionCallRefV([[maybe_unused]] ani_env *env, ani_function fn, ani_ref *value, ...)
{
    va_list args{};
    va_start(args, value);
    ASSERT_EQ(env->Function_Call_Ref_V(fn, value, args), ANI_OK);
    va_end(args);
    return ANI_TRUE;
}

ani_boolean test_Function_Call_Ref_V([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_function fn{};
    GetFunction(env, CALLINSTMETH_MOD_NAME, "refModuleFunction", "ii:C{std.core.String}", &fn);
    ani_int arg1 = 1;
    ani_int arg2 = 2;
    ani_ref value{};
    std::string result{};
    TestFunctionCallRefV(env, fn, &value, arg1, arg2);
    GetStdString(env, static_cast<ani_string>(value), result);
    std::string checkStr = "Inequality";
    ASSERT_EQ(result, checkStr);
    return ANI_TRUE;
}

ani_boolean test_Function_Call_Void([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_function fn{};
    GetFunction(env, CALLINSTMETH_MOD_NAME, "voidModuleFunction", "ii:", &fn);
    ani_function checkFn{};
    GetFunction(env, CALLINSTMETH_MOD_NAME, "getIntExport", ":i", &checkFn);
    ani_int arg1 = 5;
    ani_int arg2 = 6;
    ani_int sum = 0;
    ASSERT_EQ(env->Function_Call_Void(fn, arg1, arg2), ANI_OK);
    ASSERT_EQ(env->Function_Call_Int(checkFn, &sum), ANI_OK);
    ASSERT_EQ(sum, arg1 + arg2);
    return ANI_TRUE;
}

ani_boolean test_Function_Call_Void_A([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_function fn{};
    GetFunction(env, CALLINSTMETH_MOD_NAME, "voidModuleFunction", "ii:", &fn);
    ani_function checkFn{};
    GetFunction(env, CALLINSTMETH_MOD_NAME, "getIntExport", ":i", &checkFn);
    ani_value args[2U];
    ani_int arg1 = 5;
    ani_int arg2 = 6;
    args[0U].i = arg1;
    args[1U].i = arg2;
    ani_int sum = 0;
    ASSERT_EQ(env->Function_Call_Void_A(fn, args), ANI_OK);
    ASSERT_EQ(env->Function_Call_Int(checkFn, &sum), ANI_OK);
    ASSERT_EQ(sum, arg1 + arg2);
    return ANI_TRUE;
}

ani_boolean TestFunctionCallVoidV([[maybe_unused]] ani_env *env, ani_function fn, ...)
{
    va_list args{};
    va_start(args, fn);
    ASSERT_EQ(env->Function_Call_Void_V(fn, args), ANI_OK);
    va_end(args);
    return ANI_TRUE;
}

ani_boolean test_Function_Call_Void_V([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_function fn{};
    GetFunction(env, CALLINSTMETH_MOD_NAME, "voidModuleFunction", "ii:", &fn);
    ani_function checkFn{};
    GetFunction(env, CALLINSTMETH_MOD_NAME, "getIntExport", ":i", &checkFn);
    ani_int arg1 = 5;
    ani_int arg2 = 6;
    ani_int sum = 0;
    TestFunctionCallVoidV(env, fn, arg1, arg2);
    ASSERT_EQ(env->Function_Call_Int(checkFn, &sum), ANI_OK);
    ASSERT_EQ(sum, arg1 + arg2);
    return ANI_TRUE;
}

ani_boolean test_Object_CallMethod_Char([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object obj{};
    ani_method method{};
    GetMethodAndObject(env, "charMethod", "cc:c", &obj, &method);
    ani_char result = '0';
    ani_char arg1 = 'a';
    ani_char arg2 = 'b';
    ASSERT_EQ(env->Object_CallMethod_Char(obj, method, &result, arg1, arg2), ANI_OK);
    ASSERT_EQ(result, arg2);
    return ANI_TRUE;
}

ani_boolean test_Object_CallMethod_Char_A([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object obj{};
    ani_method method{};
    GetMethodAndObject(env, "charMethod", "cc:c", &obj, &method);
    ani_value args[2U];
    ani_char arg1 = 'a';
    ani_char arg2 = 'b';
    args[0U].c = arg1;
    args[1U].c = arg2;
    ani_char result = '0';
    ASSERT_EQ(env->Object_CallMethod_Char_A(obj, method, &result, args), ANI_OK);
    ASSERT_EQ(result, arg2);
    return ANI_TRUE;
}

ani_boolean TestObjectCallMethodCharV([[maybe_unused]] ani_env *env, ani_object object, ani_method method,
                                      ani_char *value, ...)
{
    va_list args{};
    va_start(args, value);
    ASSERT_EQ(env->Object_CallMethod_Char_V(object, method, value, args), ANI_OK);
    va_end(args);
    return ANI_TRUE;
}

ani_boolean test_Object_CallMethod_Char_V([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object obj{};
    ani_method method{};
    GetMethodAndObject(env, "charMethod", "cc:c", &obj, &method);
    ani_char result = '0';
    ani_char arg1 = 'a';
    ani_char arg2 = 'b';
    TestObjectCallMethodCharV(env, obj, method, &result, arg1, arg2);
    ASSERT_EQ(result, arg2);
    return ANI_TRUE;
}

ani_boolean test_Object_CallMethod_Byte([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object obj{};
    ani_method method{};
    GetMethodAndObject(env, "byteMethod", "bb:b", &obj, &method);
    ani_byte sum = 0U;
    ani_byte arg1 = 2U;
    ani_byte arg2 = 3U;
    ASSERT_EQ(env->Object_CallMethod_Byte(obj, method, &sum, arg1, arg2), ANI_OK);
    ASSERT_EQ(sum, arg2);
    return ANI_TRUE;
}

ani_boolean test_Object_CallMethod_Byte_A([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object obj{};
    ani_method method{};
    GetMethodAndObject(env, "byteMethod", "bb:b", &obj, &method);
    ani_byte result = 0U;
    ani_value args[2U] = {};
    ani_byte arg1 = 4U;
    ani_byte arg2 = 2U;
    args[0U].b = arg1;
    args[1U].b = arg2;
    ASSERT_EQ(env->Object_CallMethod_Byte_A(obj, method, &result, args), ANI_OK);
    ASSERT_EQ(result, arg1);
    return ANI_TRUE;
}

ani_boolean TestObjectCallMethodByteV([[maybe_unused]] ani_env *env, ani_object object, ani_method method,
                                      ani_byte *value, ...)
{
    va_list args{};
    va_start(args, value);
    ASSERT_EQ(env->Object_CallMethod_Byte_V(object, method, value, args), ANI_OK);
    va_end(args);
    return ANI_TRUE;
}

ani_boolean test_Object_CallMethod_Byte_V([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object obj{};
    ani_method method{};
    GetMethodAndObject(env, "byteMethod", "bb:b", &obj, &method);
    ani_byte sum = 0U;
    ani_byte arg1 = 2U;
    ani_byte arg2 = 3U;
    TestObjectCallMethodByteV(env, obj, method, &sum, arg1, arg2);
    ASSERT_EQ(sum, arg2);
    return ANI_TRUE;
}

ani_boolean test_Object_CallMethod_Short([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object obj{};
    ani_method method{};
    GetMethodAndObject(env, "shortMethod", "ss:s", &obj, &method);
    ani_short sum = 0U;
    ani_short arg1 = 2U;
    ani_short arg2 = 3U;
    ASSERT_EQ(env->Object_CallMethod_Short(obj, method, &sum, arg1, arg2), ANI_OK);
    ASSERT_EQ(sum, arg2);
    return ANI_TRUE;
}

ani_boolean test_Object_CallMethod_Short_A([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object obj{};
    ani_method method{};
    GetMethodAndObject(env, "shortMethod", "ss:s", &obj, &method);
    ani_value args[2U];
    ani_short arg1 = 2U;
    ani_short arg2 = 3U;
    args[0U].s = arg1;
    args[1U].s = arg2;
    ani_short sum = 0U;
    ASSERT_EQ(env->Object_CallMethod_Short_A(obj, method, &sum, args), ANI_OK);
    ASSERT_EQ(sum, arg2);
    return ANI_TRUE;
}

ani_boolean TestObjectCallMethodShortV([[maybe_unused]] ani_env *env, ani_object object, ani_method method,
                                       ani_short *value, ...)
{
    va_list args{};
    va_start(args, value);
    ASSERT_EQ(env->Object_CallMethod_Short_V(object, method, value, args), ANI_OK);
    va_end(args);
    return ANI_TRUE;
}

ani_boolean test_Object_CallMethod_Short_V([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object obj{};
    ani_method method{};
    GetMethodAndObject(env, "shortMethod", "ss:s", &obj, &method);
    ani_short sum = 0U;
    ani_short arg1 = 2U;
    ani_short arg2 = 3U;
    TestObjectCallMethodShortV(env, obj, method, &sum, arg1, arg2);
    ASSERT_EQ(sum, arg2);
    return ANI_TRUE;
}

ani_boolean test_Object_CallMethod_Float([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object obj{};
    ani_method method{};
    GetMethodAndObject(env, "floatMethod", "ff:f", &obj, &method);
    ani_float sum = 0.0F;
    ani_float arg1 = 2.0F;
    ani_float arg2 = 3.0F;
    ASSERT_EQ(env->Object_CallMethod_Float(obj, method, &sum, arg1, arg2), ANI_OK);
    ASSERT_EQ(sum, arg1 + arg2);
    return ANI_TRUE;
}

ani_boolean test_Object_CallMethod_Float_A([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object obj{};
    ani_method method{};
    GetMethodAndObject(env, "floatMethod", "ff:f", &obj, &method);
    ani_value args[2U];
    ani_float arg1 = 2.0F;
    ani_float arg2 = 3.0F;
    args[0U].f = arg1;
    args[1U].f = arg2;
    ani_float sum = 0.0F;
    ASSERT_EQ(env->Object_CallMethod_Float_A(obj, method, &sum, args), ANI_OK);
    ASSERT_EQ(sum, arg1 + arg2);
    return ANI_TRUE;
}

ani_boolean TestObjectCallMethodFloatV([[maybe_unused]] ani_env *env, ani_object object, ani_method method,
                                       ani_float *value, ...)
{
    va_list args{};
    va_start(args, value);
    ASSERT_EQ(env->Object_CallMethod_Float_V(object, method, value, args), ANI_OK);
    va_end(args);
    return ANI_TRUE;
}

ani_boolean test_Object_CallMethod_Float_V([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object obj{};
    ani_method method{};
    GetMethodAndObject(env, "floatMethod", "ff:f", &obj, &method);
    ani_float sum = 0.0F;
    ani_float arg1 = 2.0F;
    ani_float arg2 = 3.0F;
    TestObjectCallMethodFloatV(env, obj, method, &sum, arg1, arg2);
    ASSERT_EQ(sum, arg1 + arg2);
    return ANI_TRUE;
}

ani_boolean test_Object_CallMethod_Ref([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object obj{};
    ani_method method{};
    GetMethodAndObject(env, "stringMethod", "ii:C{std.core.String}", &obj, &method);
    ani_int arg1 = 2U;
    ani_int arg2 = 3U;
    std::string str{};
    ani_ref result{};
    ASSERT_EQ(env->Object_CallMethod_Ref(obj, method, &result, arg1, arg2), ANI_OK);
    ASSERT_NE(result, nullptr);
    GetStdString(env, static_cast<ani_string>(result), str);
    std::string checkStr = "nihao";
    ASSERT_EQ(str, checkStr);
    return ANI_TRUE;
}

ani_boolean test_Object_CallMethod_Ref_A([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object obj{};
    ani_method method{};
    GetMethodAndObject(env, "stringMethod", "ii:C{std.core.String}", &obj, &method);
    ani_value args[2U];
    ani_int arg1 = 2U;
    ani_int arg2 = 3U;
    args[0U].i = arg1;
    args[1U].i = arg2;
    std::string str{};
    ani_ref result{};
    ASSERT_EQ(env->Object_CallMethod_Ref_A(obj, method, &result, args), ANI_OK);
    ASSERT_NE(result, nullptr);
    GetStdString(env, static_cast<ani_string>(result), str);
    std::string checkStr = "nihao";
    ASSERT_EQ(str, checkStr);
    return ANI_TRUE;
}

ani_boolean TestObjectCallMethodRefV([[maybe_unused]] ani_env *env, ani_object object, ani_method method,
                                     ani_ref *value, ...)
{
    va_list args{};
    va_start(args, value);
    ASSERT_EQ(env->Object_CallMethod_Ref_V(object, method, value, args), ANI_OK);
    va_end(args);
    return ANI_TRUE;
}

ani_boolean test_Object_CallMethod_Ref_V([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object obj{};
    ani_method method{};
    GetMethodAndObject(env, "stringMethod", "ii:C{std.core.String}", &obj, &method);
    ani_int arg1 = 2U;
    ani_int arg2 = 3U;
    std::string str{};
    ani_ref result{};
    TestObjectCallMethodRefV(env, obj, method, &result, arg1, arg2);
    ASSERT_NE(result, nullptr);
    GetStdString(env, static_cast<ani_string>(result), str);
    std::string checkStr = "nihao";
    ASSERT_EQ(str, checkStr);
    return ANI_TRUE;
}

ani_boolean test_Object_CallMethodByName_Boolean([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object obj{};
    ani_method method{};
    ASSERT_EQ(GetMethodAndObject(env, "booleanByNameMethod", "ii:z", &obj, &method), ANI_TRUE);
    ani_int arg1 = 5U;
    ani_int arg2 = 6U;
    ani_boolean res = ANI_FALSE;
    ASSERT_EQ(env->Object_CallMethodByName_Boolean(obj, "booleanByNameMethod", "ii:z", &res, arg1, arg2), ANI_OK);
    ASSERT_EQ(res, ANI_TRUE);
    return ANI_TRUE;
}

ani_boolean test_Object_CallMethodByName_Boolean_A([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object obj{};
    ani_method method{};
    ASSERT_EQ(GetMethodAndObject(env, "booleanByNameMethod", "ii:z", &obj, &method), ANI_TRUE);
    ani_value args[2U];
    args[0U].i = 5U;
    args[1U].i = 6U;
    ani_boolean res = ANI_FALSE;
    ASSERT_EQ(env->Object_CallMethodByName_Boolean_A(obj, "booleanByNameMethod", "ii:z", &res, args), ANI_OK);
    ASSERT_EQ(res, ANI_TRUE);
    return ANI_TRUE;
}

ani_boolean TestObjectCallMethodByNameBooleanV([[maybe_unused]] ani_env *env, ani_object object, const char *methodName,
                                               const char *signature, ani_boolean *value, ...)
{
    ani_object obj{};
    ani_method method{};
    ASSERT_EQ(GetMethodAndObject(env, "booleanByNameMethod", "ii:z", &obj, &method), ANI_TRUE);
    va_list args{};
    va_start(args, value);
    ASSERT_EQ(env->Object_CallMethodByName_Boolean_V(obj, methodName, signature, value, args), ANI_OK);
    va_end(args);
    return ANI_TRUE;
}

ani_boolean test_Object_CallMethodByName_Boolean_V([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object obj{};
    ani_method method{};
    ASSERT_EQ(GetMethodAndObject(env, "booleanByNameMethod", "ii:z", &obj, &method), ANI_TRUE);
    ani_int arg1 = 5U;
    ani_int arg2 = 6U;
    ani_boolean res = ANI_FALSE;
    TestObjectCallMethodByNameBooleanV(env, obj, "booleanByNameMethod", "ii:z", &res, arg1, arg2);
    ASSERT_EQ(res, ANI_TRUE);
    return ANI_TRUE;
}

ani_boolean test_Object_CallMethodByName_Char([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object obj{};
    ani_method method{};
    ASSERT_EQ(GetMethodAndObject(env, "charByNameMethod", "cc:c", &obj, &method), ANI_TRUE);
    ani_char res = '0';
    ani_int arg1 = 'C';
    ani_int arg2 = 'A';
    ASSERT_EQ(env->Object_CallMethodByName_Char(obj, "charByNameMethod", "cc:c", &res, arg1, arg2), ANI_OK);
    ASSERT_EQ(res, arg1);
    return ANI_TRUE;
}

ani_boolean test_Object_CallMethodByName_Char_A([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object obj{};
    ani_method method{};
    ASSERT_EQ(GetMethodAndObject(env, "charByNameMethod", "cc:c", &obj, &method), ANI_TRUE);
    ani_value args[2U];
    ani_int arg1 = 'C';
    ani_int arg2 = 'A';
    args[0U].c = arg2;
    args[1U].c = arg1;
    ani_char res = '0';
    ASSERT_EQ(env->Object_CallMethodByName_Char_A(obj, "charByNameMethod", "cc:c", &res, args), ANI_OK);
    ASSERT_EQ(res, arg1);
    return ANI_TRUE;
}

ani_boolean TestObjectCallMethodByNameCharV([[maybe_unused]] ani_env *env, ani_object object, const char *methodName,
                                            const char *signature, ani_char *value, ...)
{
    ani_object obj{};
    ani_method method{};
    ASSERT_EQ(GetMethodAndObject(env, "charByNameMethod", "cc:c", &obj, &method), ANI_TRUE);
    va_list args{};
    va_start(args, value);
    ASSERT_EQ(env->Object_CallMethodByName_Char_V(obj, methodName, signature, value, args), ANI_OK);
    va_end(args);
    return ANI_TRUE;
}

ani_boolean test_Object_CallMethodByName_Char_V([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_char res = '0';
    ani_int arg1 = 'C';
    ani_int arg2 = 'A';
    TestObjectCallMethodByNameCharV(env, object, "charByNameMethod", "cc:c", &res, arg1, arg2);
    ASSERT_EQ(res, arg1);
    return ANI_TRUE;
}

ani_boolean test_Object_CallMethodByName_Byte([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object obj{};
    ani_method method{};
    ASSERT_EQ(GetMethodAndObject(env, "byteByNameMethod", "bb:b", &obj, &method), ANI_TRUE);
    ani_byte res{};
    ani_byte arg1 = 5U;
    ani_byte arg2 = 6U;
    ASSERT_EQ(env->Object_CallMethodByName_Byte(obj, "byteByNameMethod", "bb:b", &res, arg1, arg2), ANI_OK);
    ASSERT_EQ(res, arg1 + arg2);
    return ANI_TRUE;
}

ani_boolean test_Object_CallMethodByName_Byte_A([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object obj{};
    ani_method method{};
    ASSERT_EQ(GetMethodAndObject(env, "byteByNameMethod", "bb:b", &obj, &method), ANI_TRUE);
    ani_value args[2U];
    ani_byte arg1 = 5U;
    ani_byte arg2 = 6U;
    args[0U].b = arg1;
    args[1U].b = arg2;
    ani_byte res{};
    ASSERT_EQ(env->Object_CallMethodByName_Byte_A(obj, "byteByNameMethod", "bb:b", &res, args), ANI_OK);
    ASSERT_EQ(res, arg1 + arg2);
    return ANI_TRUE;
}

ani_boolean TestObjectCallMethodByNameByteV([[maybe_unused]] ani_env *env, ani_object object, const char *methodName,
                                            const char *signature, ani_byte *value, ...)
{
    va_list args{};
    va_start(args, value);
    ASSERT_EQ(env->Object_CallMethodByName_Byte_V(object, methodName, signature, value, args), ANI_OK);
    va_end(args);
    return ANI_TRUE;
}

ani_boolean test_Object_CallMethodByName_Byte_V([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object obj{};
    ani_method method{};
    ASSERT_EQ(GetMethodAndObject(env, "byteByNameMethod", "bb:b", &obj, &method), ANI_TRUE);
    ani_byte res{};
    ani_byte arg1 = 5U;
    ani_byte arg2 = 6U;
    TestObjectCallMethodByNameByteV(env, obj, "byteByNameMethod", "bb:b", &res, arg1, arg2);
    ASSERT_EQ(res, arg1 + arg2);
    return ANI_TRUE;
}

ani_boolean test_Object_CallMethodByName_Short([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object obj{};
    ani_method method{};
    ASSERT_EQ(GetMethodAndObject(env, "shortByNameMethod", "ss:s", &obj, &method), ANI_TRUE);
    ani_short arg1 = 5U;
    ani_short arg2 = 6U;
    ani_short res{};
    ASSERT_EQ(env->Object_CallMethodByName_Short(obj, "shortByNameMethod", "ss:s", &res, arg1, arg2), ANI_OK);
    ASSERT_EQ(res, arg1 + arg2);
    return ANI_TRUE;
}

ani_boolean test_Object_CallMethodByName_Short_A([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object obj{};
    ani_method method{};
    ASSERT_EQ(GetMethodAndObject(env, "shortByNameMethod", "ss:s", &obj, &method), ANI_TRUE);
    ani_value args[2U];
    ani_short arg1 = 5U;
    ani_short arg2 = 6U;
    args[0U].s = arg1;
    args[1U].s = arg2;
    ani_short res{};
    ASSERT_EQ(env->Object_CallMethodByName_Short_A(obj, "shortByNameMethod", "ss:s", &res, args), ANI_OK);
    ASSERT_EQ(res, arg1 + arg2);
    return ANI_TRUE;
}

ani_boolean TestObjectCallMethodByNameShortV([[maybe_unused]] ani_env *env, ani_object object, const char *methodName,
                                             const char *signature, ani_short *value, ...)
{
    va_list args{};
    va_start(args, value);
    ASSERT_EQ(env->Object_CallMethodByName_Short_V(object, methodName, signature, value, args), ANI_OK);
    va_end(args);
    return ANI_TRUE;
}

ani_boolean test_Object_CallMethodByName_Short_V([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object obj{};
    ani_method method{};
    ASSERT_EQ(GetMethodAndObject(env, "shortByNameMethod", "ss:s", &obj, &method), ANI_TRUE);
    ani_short arg1 = 5U;
    ani_short arg2 = 6U;
    ani_short res{};
    TestObjectCallMethodByNameShortV(env, obj, "shortByNameMethod", "ss:s", &res, arg1, arg2);
    ASSERT_EQ(res, arg1 + arg2);
    return ANI_TRUE;
}

ani_boolean test_Object_CallMethodByName_Int([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object obj{};
    ani_method method{};
    ASSERT_EQ(GetMethodAndObject(env, "intByNameMethod", "ii:i", &obj, &method), ANI_TRUE);
    ani_int arg1 = 5U;
    ani_int arg2 = 6U;
    ani_int res = 0;
    ASSERT_EQ(env->Object_CallMethodByName_Int(obj, "intByNameMethod", "ii:i", &res, arg1, arg2), ANI_OK);
    ASSERT_EQ(res, arg1 + arg2);
    return ANI_TRUE;
}

ani_boolean test_Object_CallMethodByName_Int_A([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object obj{};
    ani_method method{};
    ASSERT_EQ(GetMethodAndObject(env, "intByNameMethod", "ii:i", &obj, &method), ANI_TRUE);
    ani_value args[2U];
    ani_int arg1 = 5U;
    ani_int arg2 = 6U;
    args[0U].i = arg1;
    args[1U].i = arg2;
    ani_int res = 0;
    ASSERT_EQ(env->Object_CallMethodByName_Int_A(obj, "intByNameMethod", "ii:i", &res, args), ANI_OK);
    ASSERT_EQ(res, arg1 + arg2);
    return ANI_TRUE;
}

ani_boolean TestObjectCallMethodByNameIntV([[maybe_unused]] ani_env *env, ani_object object, const char *methodName,
                                           const char *signature, ani_int *value, ...)
{
    va_list args{};
    va_start(args, value);
    ASSERT_EQ(env->Object_CallMethodByName_Int_V(object, methodName, signature, value, args), ANI_OK);
    va_end(args);
    return ANI_TRUE;
}

ani_boolean test_Object_CallMethodByName_Int_V([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object obj{};
    ani_method method{};
    ASSERT_EQ(GetMethodAndObject(env, "intByNameMethod", "ii:i", &obj, &method), ANI_TRUE);
    ani_int arg1 = 5U;
    ani_int arg2 = 6U;
    ani_int res = 0;
    TestObjectCallMethodByNameIntV(env, obj, "intByNameMethod", "ii:i", &res, arg1, arg2);
    ASSERT_EQ(res, arg1 + arg2);
    return ANI_TRUE;
}

ani_boolean test_Object_CallMethodByName_Long([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object obj{};
    ani_method method{};
    ASSERT_EQ(GetMethodAndObject(env, "longMethod", "ll:l", &obj, &method), ANI_TRUE);
    ani_long arg1 = 5000;
    ani_long arg2 = 6000;
    ani_long sum{};
    ASSERT_EQ(env->Object_CallMethodByName_Long(obj, "longMethod", "ll:l", &sum, arg1, arg2), ANI_OK);
    ASSERT_EQ(sum, arg1 + arg2);
    return ANI_TRUE;
}

ani_boolean test_Object_CallMethodByName_Long_A([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object obj{};
    ani_method method{};
    ASSERT_EQ(GetMethodAndObject(env, "longMethod", "ll:l", &obj, &method), ANI_TRUE);
    ani_value args[2U];
    ani_long arg1 = 5000;
    ani_long arg2 = 6000;
    args[0U].l = arg1;
    args[1U].l = arg2;
    ani_long sum{};
    ASSERT_EQ(env->Object_CallMethodByName_Long_A(obj, "longMethod", "ll:l", &sum, args), ANI_OK);
    ASSERT_EQ(sum, arg1 + arg2);
    return ANI_TRUE;
}

ani_boolean TestObjectCallMethodByNameLongV([[maybe_unused]] ani_env *env, ani_object object, const char *methodName,
                                            const char *signature, ani_long *value, ...)
{
    va_list args{};
    va_start(args, value);
    ASSERT_EQ(env->Object_CallMethodByName_Long_V(object, methodName, signature, value, args), ANI_OK);
    va_end(args);
    return ANI_TRUE;
}

ani_boolean test_Object_CallMethodByName_Long_V([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object obj{};
    ani_method method{};
    ASSERT_EQ(GetMethodAndObject(env, "longMethod", "ll:l", &obj, &method), ANI_TRUE);
    ani_long arg1 = 5000;
    ani_long arg2 = 6000;
    ani_long sum{};
    TestObjectCallMethodByNameLongV(env, obj, "longMethod", "ll:l", &sum, arg1, arg2);
    ASSERT_EQ(sum, arg1 + arg2);
    return ANI_TRUE;
}

ani_boolean test_Object_CallMethodByName_Float([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object obj{};
    ani_method method{};
    ASSERT_EQ(GetMethodAndObject(env, "floatMethod", "ff:f", &obj, &method), ANI_TRUE);
    ani_float arg1 = 2.0F;
    ani_float arg2 = 3.0F;
    ani_float sum = 0.0F;
    ASSERT_EQ(env->Object_CallMethodByName_Float(obj, "floatMethod", "ff:f", &sum, arg1, arg2), ANI_OK);
    ASSERT_EQ(sum, arg1 + arg2);
    return ANI_TRUE;
}

ani_boolean test_Object_CallMethodByName_Float_A([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object obj{};
    ani_method method{};
    ASSERT_EQ(GetMethodAndObject(env, "floatMethod", "ff:f", &obj, &method), ANI_TRUE);
    ani_value args[2U];
    ani_float arg1 = 2.0F;
    ani_float arg2 = 3.0F;
    args[0U].f = arg1;
    args[1U].f = arg2;
    ani_float sum = 0.0F;
    ASSERT_EQ(env->Object_CallMethodByName_Float_A(obj, "floatMethod", "ff:f", &sum, args), ANI_OK);
    ASSERT_EQ(sum, arg1 + arg2);
    return ANI_TRUE;
}

ani_boolean TestObjectCallMethodByNameFloatV([[maybe_unused]] ani_env *env, ani_object object, const char *methodName,
                                             const char *signature, ani_float *value, ...)
{
    va_list args{};
    va_start(args, value);
    ASSERT_EQ(env->Object_CallMethodByName_Float_V(object, methodName, signature, value, args), ANI_OK);
    va_end(args);
    return ANI_TRUE;
}

ani_boolean test_Object_CallMethodByName_Float_V([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object obj{};
    ani_method method{};
    ASSERT_EQ(GetMethodAndObject(env, "floatMethod", "ff:f", &obj, &method), ANI_TRUE);
    ani_float arg1 = 2.0F;
    ani_float arg2 = 3.0F;
    ani_float sum = 0.0F;
    TestObjectCallMethodByNameFloatV(env, obj, "floatMethod", "ff:f", &sum, arg1, arg2);
    ASSERT_EQ(sum, arg1 + arg2);
    return ANI_TRUE;
}

ani_boolean test_Object_CallMethodByName_Double([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object obj{};
    ani_method method{};
    ASSERT_EQ(GetMethodAndObject(env, "doubleMethod", "dd:d", &obj, &method), ANI_TRUE);
    ani_double arg1 = 2.0;
    ani_double arg2 = 3.0;
    ani_double sum = 0.0;
    ASSERT_EQ(env->Object_CallMethodByName_Double(obj, "doubleMethod", "dd:d", &sum, arg1, arg2), ANI_OK);
    ASSERT_EQ(sum, arg1 + arg2);
    return ANI_TRUE;
}

ani_boolean test_Object_CallMethodByName_Double_A([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object obj{};
    ani_method method{};
    ASSERT_EQ(GetMethodAndObject(env, "doubleMethod", "dd:d", &obj, &method), ANI_TRUE);
    ani_value args[2U];
    ani_double arg1 = 2.0;
    ani_double arg2 = 3.0;
    args[0U].d = arg1;
    args[1U].d = arg2;
    ani_double sum = 0.0;
    ASSERT_EQ(env->Object_CallMethodByName_Double_A(obj, "doubleMethod", "dd:d", &sum, args), ANI_OK);
    ASSERT_EQ(sum, arg1 + arg2);
    return ANI_TRUE;
}

ani_boolean TestObjectCallMethodByNameDoubleV([[maybe_unused]] ani_env *env, ani_object object, const char *methodName,
                                              const char *signature, ani_double *value, ...)
{
    va_list args{};
    va_start(args, value);
    ASSERT_EQ(env->Object_CallMethodByName_Double_V(object, methodName, signature, value, args), ANI_OK);
    va_end(args);
    return ANI_TRUE;
}

ani_boolean test_Object_CallMethodByName_Double_V([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object obj{};
    ani_method method{};
    ASSERT_EQ(GetMethodAndObject(env, "doubleMethod", "dd:d", &obj, &method), ANI_TRUE);
    ani_double arg1 = 2.0;
    ani_double arg2 = 3.0;
    ani_double sum = 0.0;
    TestObjectCallMethodByNameDoubleV(env, obj, "doubleMethod", "dd:d", &sum, arg1, arg2);
    ASSERT_EQ(sum, arg1 + arg2);
    return ANI_TRUE;
}

ani_boolean test_Object_CallMethodByName_Ref([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object obj{};
    ani_method method{};
    auto res = GetMethodAndObject(env, "stringMethod", "ii:C{std.core.String}", &obj, &method);
    ASSERT_EQ(res, ANI_TRUE);
    std::string str{};
    ani_ref result{};
    ani_int arg1 = 5;
    ani_int arg2 = 6;
    ASSERT_EQ(env->Object_CallMethodByName_Ref(obj, "stringMethod", "ii:C{std.core.String}", &result, arg1, arg2),
              ANI_OK);
    ASSERT_NE(result, nullptr);
    GetStdString(env, static_cast<ani_string>(result), str);
    std::string checkStr = "nihao";
    ASSERT_EQ(str, checkStr);

    return ANI_TRUE;
}

ani_boolean test_Object_CallMethodByName_Ref_A([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object obj{};
    ani_method method{};
    auto res = GetMethodAndObject(env, "stringMethod", "ii:C{std.core.String}", &obj, &method);
    ASSERT_EQ(res, ANI_TRUE);
    std::string str{};
    ani_ref result{};
    ani_int arg1 = 5;
    ani_int arg2 = 6;
    ani_value args[2U];
    args[0U].i = arg1;
    args[1U].i = arg2;
    ASSERT_EQ(env->Object_CallMethodByName_Ref_A(obj, "stringMethod", "ii:C{std.core.String}", &result, args), ANI_OK);
    ASSERT_NE(result, nullptr);
    GetStdString(env, static_cast<ani_string>(result), str);
    std::string checkStr = "nihao";
    ASSERT_EQ(str, checkStr);
    return ANI_TRUE;
}

ani_boolean TestObjectCallMethodByNameRefV([[maybe_unused]] ani_env *env, ani_object object, const char *methodName,
                                           const char *signature, ani_ref *value, ...)
{
    va_list args{};
    va_start(args, value);
    ASSERT_EQ(env->Object_CallMethodByName_Ref_V(object, methodName, signature, value, args), ANI_OK);
    va_end(args);
    return ANI_TRUE;
}

ani_boolean test_Object_CallMethodByName_Ref_V([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object obj{};
    ani_method method{};
    auto res = GetMethodAndObject(env, "stringMethod", "ii:C{std.core.String}", &obj, &method);
    ASSERT_EQ(res, ANI_TRUE);
    std::string str{};
    ani_ref result{};
    ani_int arg1 = 5;
    ani_int arg2 = 6;
    TestObjectCallMethodByNameRefV(env, obj, "stringMethod", "ii:C{std.core.String}", &result, arg1, arg2);
    ASSERT_NE(result, nullptr);
    GetStdString(env, static_cast<ani_string>(result), str);
    std::string checkStr = "nihao";
    ASSERT_EQ(str, checkStr);
    return ANI_TRUE;
}

ani_boolean test_Object_CallMethodByName_Void([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object obj{};
    ani_method method{};
    ASSERT_EQ(GetMethodAndObject(env, "voidMethod", "ii:", &obj, &method), ANI_TRUE);
    ani_method checkMethod{};
    GetMethod(env, CALLINSTMETH_CLASS_NAME, "getCount", ":i", &checkMethod);
    ani_int arg1 = 6U;
    ani_int arg2 = 7U;
    ani_int sum = 0U;
    ASSERT_EQ(env->Object_CallMethodByName_Void(obj, "voidMethod", "ii:", arg1, arg2), ANI_OK);
    ASSERT_EQ(env->Object_CallMethod_Int(obj, checkMethod, &sum), ANI_OK);
    ASSERT_EQ(sum, arg1 + arg2);
    return ANI_TRUE;
}

ani_boolean test_Object_CallMethodByName_Void_A([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object obj{};
    ani_method method{};
    ASSERT_EQ(GetMethodAndObject(env, "voidMethod", "ii:", &obj, &method), ANI_TRUE);
    ani_method checkMethod{};
    GetMethod(env, CALLINSTMETH_CLASS_NAME, "getCount", ":i", &checkMethod);
    ani_value args[2];
    ani_int arg1 = 6U;
    ani_int arg2 = 7U;
    args[0].i = arg1;
    args[1].i = arg2;
    ani_int sum = 0U;
    ASSERT_EQ(env->Object_CallMethodByName_Void_A(obj, "voidMethod", "ii:", args), ANI_OK);
    ASSERT_EQ(env->Object_CallMethod_Int(obj, checkMethod, &sum), ANI_OK);
    ASSERT_EQ(sum, arg1 + arg2);
    return ANI_TRUE;
}

ani_boolean TestObjectCallMethodByNameVoidV([[maybe_unused]] ani_env *env, ani_object object, const char *methodName,
                                            const char *signature, ...)
{
    va_list args{};
    va_start(args, signature);
    ASSERT_EQ(env->Object_CallMethodByName_Void_V(object, methodName, signature, args), ANI_OK);
    va_end(args);
    return ANI_TRUE;
}

ani_boolean test_Object_CallMethodByName_Void_V([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object obj{};
    ani_method method{};
    ASSERT_EQ(GetMethodAndObject(env, "voidMethod", "ii:", &obj, &method), ANI_TRUE);
    ani_method checkMethod{};
    GetMethod(env, CALLINSTMETH_CLASS_NAME, "getCount", ":i", &checkMethod);
    ani_int arg1 = 6U;
    ani_int arg2 = 7U;
    ani_int sum = 0U;
    TestObjectCallMethodByNameVoidV(env, obj, "voidMethod", "ii:", arg1, arg2);
    ASSERT_EQ(env->Object_CallMethod_Int(obj, checkMethod, &sum), ANI_OK);
    ASSERT_EQ(sum, arg1 + arg2);
    return ANI_TRUE;
}

ani_boolean test_Class_CallStaticMethod_Char([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls{};
    ASSERT_EQ(env->FindClass(CALLINSTMETH_CLASS_NAME, &cls), ANI_OK);
    ani_static_method method{};
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "staticCharMethod", "cc:c", &method), ANI_OK);
    ani_char result = '0';
    ani_char arg1 = 'a';
    ani_char arg2 = 'b';
    ASSERT_EQ(env->Class_CallStaticMethod_Char(cls, method, &result, arg1, arg2), ANI_OK);
    ASSERT_EQ(result, arg2);
    return ANI_TRUE;
}

ani_boolean test_Class_CallStaticMethod_Char_A([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls{};
    ASSERT_EQ(env->FindClass(CALLINSTMETH_CLASS_NAME, &cls), ANI_OK);
    ani_static_method method{};
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "staticCharMethod", "cc:c", &method), ANI_OK);
    ani_value args[2U];
    ani_char arg1 = 'a';
    ani_char arg2 = 'b';
    args[0U].c = arg1;
    args[1U].c = arg2;
    ani_char result = '0';
    ASSERT_EQ(env->Class_CallStaticMethod_Char_A(cls, method, &result, args), ANI_OK);
    ASSERT_EQ(result, arg2);
    return ANI_TRUE;
}

ani_boolean TestClassCallStaticMethodCharV([[maybe_unused]] ani_env *env, ani_class cls, ani_static_method method,
                                           ani_char *value, ...)
{
    va_list args{};
    va_start(args, value);
    ASSERT_EQ(env->Class_CallStaticMethod_Char_V(cls, method, value, args), ANI_OK);
    va_end(args);
    return ANI_TRUE;
}

ani_boolean test_Class_CallStaticMethod_Char_V([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls{};
    ASSERT_EQ(env->FindClass(CALLINSTMETH_CLASS_NAME, &cls), ANI_OK);
    ani_static_method method{};
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "staticCharMethod", "cc:c", &method), ANI_OK);
    ani_char result = '0';
    ani_char arg1 = 'a';
    ani_char arg2 = 'b';
    TestClassCallStaticMethodCharV(env, cls, method, &result, arg1, arg2);
    ASSERT_EQ(result, arg2);
    return ANI_TRUE;
}

ani_boolean test_Class_CallStaticMethod_Byte([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls{};
    ASSERT_EQ(env->FindClass(CALLINSTMETH_CLASS_NAME, &cls), ANI_OK);
    ani_static_method method{};
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "staticByteMethod", "bb:b", &method), ANI_OK);
    ani_byte sum = 0U;
    ani_byte arg1 = 2U;
    ani_byte arg2 = 3U;
    ASSERT_EQ(env->Class_CallStaticMethod_Byte(cls, method, &sum, arg1, arg2), ANI_OK);
    ASSERT_EQ(sum, arg2);
    return ANI_TRUE;
}

ani_boolean test_Class_CallStaticMethod_Byte_A([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls{};
    ASSERT_EQ(env->FindClass(CALLINSTMETH_CLASS_NAME, &cls), ANI_OK);
    ani_static_method method{};
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "staticByteMethod", "bb:b", &method), ANI_OK);
    ani_byte result = 0U;
    ani_value args[2U] = {};
    ani_byte arg1 = 4U;
    ani_byte arg2 = 2U;
    args[0U].b = arg1;
    args[1U].b = arg2;
    ASSERT_EQ(env->Class_CallStaticMethod_Byte_A(cls, method, &result, args), ANI_OK);
    ASSERT_EQ(result, arg1);
    return ANI_TRUE;
}

ani_boolean TestClassCallStaticMethodByteV([[maybe_unused]] ani_env *env, ani_class object, ani_static_method method,
                                           ani_byte *value, ...)
{
    va_list args{};
    va_start(args, value);
    ASSERT_EQ(env->Class_CallStaticMethod_Byte_V(object, method, value, args), ANI_OK);
    va_end(args);
    return ANI_TRUE;
}

ani_boolean test_Class_CallStaticMethod_Byte_V([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls{};
    ASSERT_EQ(env->FindClass(CALLINSTMETH_CLASS_NAME, &cls), ANI_OK);
    ani_static_method method{};
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "staticByteMethod", "bb:b", &method), ANI_OK);
    ani_byte sum = 0U;
    ani_byte arg1 = 2U;
    ani_byte arg2 = 3U;
    TestClassCallStaticMethodByteV(env, cls, method, &sum, arg1, arg2);
    ASSERT_EQ(sum, arg2);
    return ANI_TRUE;
}

#endif // ARKTS_ANI_TEST_CALLINGINSTANCEMETHODS_H