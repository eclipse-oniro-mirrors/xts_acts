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

ani_int test_Object_New([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls = {};
    ani_object obj = {};
    ASSERT_EQ(GetClsData(env, &obj, &cls), ANI_TRUE);

    ani_method ctor {};
    ani_object objResult {};
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", ":V", &ctor), ANI_OK);
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
    ASSERT_EQ(env->FindEnum("Lentry/src/main/src/ets/ObjectOperations/ToFind;", &aniEnum), ANI_OK);
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

ani_int test_Array_New_Ref([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls = nullptr;
    ASSERT_EQ(env->FindClass("Lstd/core/String;", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_array_ref array = nullptr;
    ASSERT_EQ(env->Array_New_Ref(cls, LENGTH_5, nullptr, nullptr), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_New_A([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_int weight = 200;
    const char m[] = "Pure P60";
    ani_class cls {};
    ASSERT_EQ(env->FindClass("Lentry/src/main/src/ets/ObjectOperations/MobilePhone;", &cls), ANI_OK);
    ani_method ctor {};
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", "Lstd/core/String;I:V", &ctor), ANI_OK);
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
    auto moduleDescriptor = "L" + moduleName + ";";
    CallEtsFunctionImplV(env, &result, moduleDescriptor, fnName, std::forward<Args>(args)...);
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
    ASSERT_EQ(env->FindClass("Lentry/src/main/src/ets/ObjectOperations/Test;", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_method ctor {};
    const char *tmpName = "ILstd/core/String;Lentry/src/main/src/ets/ObjectOperations/Animal;:V";
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", tmpName, &ctor), ANI_OK);
    ASSERT_NE(ctor, nullptr);

    ani_string tag {};
    ASSERT_EQ(GetTestString(env, &tag), ANI_TRUE);
    auto animalRef = CallEtsFunctionV<ani_ref>(env, "entry/src/main/src/ets/ObjectOperations", "newAnimalObject");

    ani_object tmpObj {};
    ani_int value1 = 200;
    ASSERT_EQ(TestFuncV(env, cls, ctor, &tmpObj, value1, tag, animalRef), ANI_OK);
    return ANI_TRUE;
}

ani_int test_Reference_IsNullishValue([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    auto ref = CallEtsFunctionV<ani_ref>(env, "entry/src/main/src/ets/ObjectOperations", "getNull");
    ani_boolean isUndefined = ANI_FALSE;
    ASSERT_EQ(env->Reference_IsNullishValue(ref, &isUndefined), ANI_OK);
    ASSERT_EQ(isUndefined, ANI_TRUE);
    return ANI_TRUE;
}

#endif //ARKTS_ANI_TEST_OBJECTOPERATIONS_H
