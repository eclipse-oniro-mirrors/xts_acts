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

ani_boolean test_FindClass([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls = {};
    auto status = env->FindClass("Lentry/src/main/src/ets/ClassOperations/Person;", &cls);
    ASSERT_EQ(status, ANI_OK);
    ASSERT_NE(cls, nullptr);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodBoolean([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls = {};
    auto status = env->FindClass("Lentry/src/main/src/ets/ClassOperations/Person;", &cls);
    ASSERT_EQ(status, ANI_OK);
    ASSERT_NE(cls, nullptr);
    ani_static_method method = nullptr;
    status = env->Class_FindStaticMethod(cls, "or", "ZZ:Z", &method);
    ASSERT_EQ(status, ANI_OK);
    ASSERT_NE(method, nullptr);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodInt([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls = {};
    auto status = env->FindClass("Lentry/src/main/src/ets/ClassOperations/Person;", &cls);
    ASSERT_EQ(status, ANI_OK);
    ASSERT_NE(cls, nullptr);
    ani_static_method method = nullptr;
    status = env->Class_FindStaticMethod(cls, "sum", "II:I", &method);
    ASSERT_EQ(status, ANI_OK);
    ASSERT_NE(method, nullptr);
    return ANI_TRUE;
}

ani_boolean test_Class_FindMethod([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls = {};
    auto status = env->FindClass("Lentry/src/main/src/ets/ClassOperations/Person;", &cls);
    ASSERT_EQ(status, ANI_TRUE);
    const char *name = "func";
    const char *signature = "II:I";
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
    auto status = env->FindClass("Lentry/src/main/src/ets/ClassOperations/Person;", &cls);
    ASSERT_EQ(status, ANI_OK);
    std::array methods = {
        ani_native_function{"foo", ":I", reinterpret_cast<void *>(NativeMethodsFooNative)},
    };
    status = env->Class_BindNativeMethods(cls, methods.data(), methods.size());
    ASSERT_EQ(status, ANI_OK);
    return ANI_TRUE;
}

ani_boolean test_Type_GetSuperClass([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls = nullptr;
    auto status = env->FindClass("Lentry/src/main/src/ets/ClassOperations/Son;", &cls);
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
    ASSERT_EQ(env->FindClass("Lentry/src/main/src/ets/ClassOperations/A;", &fromCls), ANI_OK);
    ASSERT_NE(fromCls, nullptr);
    ani_class toCls;
    ASSERT_EQ(env->FindClass("Lentry/src/main/src/ets/ClassOperations/I;", &toCls), ANI_OK);
    ASSERT_NE(toCls, nullptr);
    ani_boolean result;
    ASSERT_EQ(env->Type_IsAssignableFrom(fromCls, toCls, &result), ANI_OK);
    return ANI_TRUE;
}

ani_boolean test_FindModule([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_module module{};
    ASSERT_EQ(env->FindModule("Lentry/src/main/src/ets/ClassOperations;", &module), ANI_OK);
    ASSERT_NE(module, nullptr);
    return ANI_TRUE;
}

ani_boolean test_FindNamespace([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_namespace ns{};
    ASSERT_EQ(env->FindNamespace("Lentry/src/main/src/ets/ClassOperations/test001;", &ns), ANI_OK);
    ASSERT_NE(ns, nullptr);
    return ANI_TRUE;
}

ani_boolean test_FindEnum([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_enum aniEnum{};
    ASSERT_EQ(env->FindEnum("Lentry/src/main/src/ets/ClassOperations/Color;", &aniEnum), ANI_OK);
    ASSERT_NE(aniEnum, nullptr);
    return ANI_TRUE;
}

#endif // ARKTS_ANI_TEST_CLASSOPERATIONS_H
