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

#ifndef ARKTS_ANI_TEST_NAMESPACESUPPORT_H
#define ARKTS_ANI_TEST_NAMESPACESUPPORT_H
#include "Common.h"

inline ani_int Sum([[maybe_unused]] ani_env *env, ani_int a, ani_int b) { return a + b; }

ani_int test_Namespace_FindFunction([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_namespace ns{};
    ASSERT_EQ(env->FindNamespace("entry.src.main.src.ets.NameSpaceSupport.ops", &ns), ANI_OK);
    ASSERT_NE(ns, nullptr);

    ani_function fn{};
    ASSERT_EQ(env->Namespace_FindFunction(ns, "int_method", "ii:i", &fn), ANI_OK);
    ASSERT_NE(fn, nullptr);
    return ANI_TRUE;
}

ani_int test_Namespace_FindFunction_01([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_namespace ns{};
    ASSERT_EQ(env_->FindNamespace("entry.src.main.src.ets.NameSpaceSupport.Fnns", &ns), ANI_OK);
    ASSERT_NE(ns, nullptr);

    ani_function fn {};
    ASSERT_EQ(env_->Namespace_FindFunction(ns, "getInitialIntValue", ":i", &fn), ANI_OK);
    ASSERT_NE(fn, nullptr);

    const int32_t loopCount = 3;
    for (int32_t i = 0; i < loopCount; i++) {
        ASSERT_EQ(env_->Namespace_FindFunction(ns, "getInitialIntValue", ":i", &fn), ANI_OK);
        ASSERT_NE(fn, nullptr);
    }

    ASSERT_EQ(env_->Namespace_FindFunction(ns, "getInitialStringValue", ":C{std.core.String}", &fn), ANI_OK);
    ASSERT_NE(fn, nullptr);

    ASSERT_EQ(env_->Namespace_FindFunction(ns, "getInitialDoubleValue", ":d", &fn), ANI_OK);
    ASSERT_NE(fn, nullptr);

    ASSERT_EQ(env_->Namespace_FindFunction(ns, "getInitialIntValue", ":i", &fn), ANI_OK);
    ASSERT_NE(fn, nullptr);
    return ANI_TRUE;
}

ani_int test_Namespace_FindFunction_02([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_namespace ns {};
    ASSERT_EQ(env_->FindNamespace("entry.src.main.src.ets.NameSpaceSupport.Fnns", &ns), ANI_OK);
    ASSERT_NE(ns, nullptr);

    ani_function fn1 {};
    ASSERT_EQ(env_->Namespace_FindFunction(ns, "getInitialIntValue", ":i", &fn1), ANI_OK);
    ASSERT_NE(fn1, nullptr);

    ani_function fn2 {};
    ASSERT_EQ(env_->Namespace_FindFunction(ns, "getInitialStringValue", ":C{std.core.String}", &fn2), ANI_OK);
    ASSERT_NE(fn2, nullptr);

    ani_function fn3 {};
    ASSERT_EQ(env_->Namespace_FindFunction(ns, "getInitialDoubleValue", ":d", &fn3), ANI_OK);
    ASSERT_NE(fn3, nullptr);
    return ANI_TRUE;
}

ani_int test_Namespace_FindFunction_03([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_namespace ns {};
    ASSERT_EQ(env_->FindNamespace("entry.src.main.src.ets.NameSpaceSupport.Fnns", &ns), ANI_OK);
    ASSERT_NE(ns, nullptr);

    ani_class cls {};
    ASSERT_EQ(env_->FindClass("entry.src.main.src.ets.NameSpaceSupport.Fnns.A", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_method result {};
    ani_function fn {};
    ASSERT_EQ(env_->Class_FindMethod(cls, "<ctor>", ":", &result), ANI_OK);
    ASSERT_NE(result, nullptr);

    ASSERT_EQ(env_->Namespace_FindFunction(ns, "c", "i:C{std.core.Promise}", &fn), ANI_OK);
    ASSERT_NE(fn, nullptr);
    return ANI_TRUE;
}

ani_int test_Namespace_FindFunction_04([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_namespace ns {};
    ASSERT_EQ(env_->FindNamespace("entry.src.main.src.ets.NameSpaceSupport.TestA", &ns), ANI_OK);
    ASSERT_NE(ns, nullptr);

    ASSERT_EQ(env_->FindNamespace("entry.src.main.src.ets.NameSpaceSupport.TestA.A", &ns), ANI_OK);
    ASSERT_NE(ns, nullptr);

    ani_function fn {};
    ASSERT_EQ(env_->Namespace_FindFunction(ns, "b", ":i", &fn), ANI_OK);
    ASSERT_NE(fn, nullptr);
    return ANI_TRUE;
}

ani_int test_Namespace_FindFunction_05([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_namespace ns {};
    ASSERT_EQ(env_->FindNamespace("entry.src.main.src.ets.NameSpaceSupport.TestA", &ns), ANI_OK);
    ASSERT_NE(ns, nullptr);

    ASSERT_EQ(env_->FindNamespace("entry.src.main.src.ets.NameSpaceSupport.TestA.A", &ns), ANI_OK);
    ASSERT_NE(ns, nullptr);

    ani_function fn {};
    ASSERT_EQ(env_->c_api->Namespace_FindFunction(nullptr, ns, "b", ":i", &fn), ANI_INVALID_ARGS);

    ASSERT_EQ(env_->Namespace_FindFunction(nullptr, "b", ":i", &fn), ANI_INVALID_ARGS);

    ASSERT_EQ(env_->Namespace_FindFunction(ns, nullptr, ":i", &fn), ANI_INVALID_ARGS);

    ASSERT_EQ(env_->Namespace_FindFunction(ns, "", ":i", &fn), ANI_NOT_FOUND);

    ASSERT_EQ(env_->Namespace_FindFunction(ns, "bA", ":i", &fn), ANI_NOT_FOUND);

    ASSERT_EQ(env_->Namespace_FindFunction(ns, "b", nullptr, &fn), ANI_OK);

    ASSERT_EQ(env_->Namespace_FindFunction(ns, "b", "", &fn), ANI_INVALID_DESCRIPTOR);

    ASSERT_EQ(env_->Namespace_FindFunction(ns, "b", "d:ii", &fn), ANI_INVALID_DESCRIPTOR);

    ASSERT_EQ(env_->Namespace_FindFunction(ns, "b", "d:ii", nullptr), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Namespace_FindFunction_06([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_namespace ns {};
    ASSERT_EQ(env_->FindNamespace("entry.src.main.src.ets.NameSpaceSupport.Fnns", &ns), ANI_OK);
    ASSERT_NE(ns, nullptr);

    ani_function fn {};
    ASSERT_EQ(env_->Namespace_FindFunction(ns, "overloaded", nullptr, &fn), ANI_AMBIGUOUS);
    return ANI_TRUE;
}

ani_int test_Namespace_FindFunction_07([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_namespace ns {};
    ASSERT_EQ(env_->FindNamespace("entry.src.main.src.ets.NameSpaceSupport.Fnns", &ns), ANI_OK);

    ani_function fn {};
    ASSERT_EQ(env_->Namespace_FindFunction(ns, "getInitialIntValue", ":i", &fn), ANI_OK);
    return ANI_TRUE;
}

ani_int test_Namespace_FindVariable([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_namespace ns {};
    ASSERT_EQ(env_->FindNamespace("entry.src.main.src.ets.NameSpaceSupport.anyns", &ns), ANI_OK);
    ASSERT_NE(ns, nullptr);

    ani_variable variable {};
    ASSERT_EQ(env_->Namespace_FindVariable(ns, "x", &variable), ANI_OK);
    ASSERT_NE(variable, nullptr);
    return ANI_TRUE;
}

ani_int test_Namespace_FindVariable_01([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_namespace ns {};
    ASSERT_EQ(env_->FindNamespace("entry.src.main.src.ets.NameSpaceSupport.anyns", &ns), ANI_OK);
    ASSERT_NE(ns, nullptr);

    ani_variable variable {};
    ASSERT_EQ(env_->c_api->Namespace_FindVariable(nullptr, ns, "x", &variable), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Namespace_FindVariable_02([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_namespace ns {};
    ASSERT_EQ(env_->FindNamespace("entry.src.main.src.ets.NameSpaceSupport.anyns", &ns), ANI_OK);
    ASSERT_NE(ns, nullptr);

    ani_variable variable {};
    ASSERT_EQ(env_->Namespace_FindVariable(ns, "s", &variable), ANI_OK);
    ASSERT_NE(variable, nullptr);
    return ANI_TRUE;
}

ani_int test_Namespace_FindVariable_03([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_namespace ns {};
    ASSERT_EQ(env_->FindNamespace("entry.src.main.src.ets.NameSpaceSupport.anyns", &ns), ANI_OK);
    ASSERT_NE(ns, nullptr);

    ani_variable variable {};
    ASSERT_EQ(env_->c_api->Namespace_FindVariable(nullptr, ns, "s", &variable), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Namespace_FindVariable_04([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_variable variable {};
    ASSERT_EQ(env_->Namespace_FindVariable(nullptr, "s", &variable), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Namespace_FindVariable_05([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_namespace ns {};
    ASSERT_EQ(env_->FindNamespace("entry.src.main.src.ets.NameSpaceSupport.anyns", &ns), ANI_OK);
    ASSERT_NE(ns, nullptr);

    ani_variable variable {};
    ASSERT_EQ(env_->Namespace_FindVariable(ns, nullptr, &variable), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Namespace_FindVariable_06([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_namespace ns {};
    ASSERT_EQ(env_->FindNamespace("entry.src.main.src.ets.NameSpaceSupport.anyns", &ns), ANI_OK);
    ASSERT_NE(ns, nullptr);

    ani_variable variable {};
    ASSERT_EQ(env_->Namespace_FindVariable(ns, "", &variable), ANI_NOT_FOUND);
    return ANI_TRUE;
}

ani_int test_Namespace_FindVariable_07([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_namespace ns {};
    ASSERT_EQ(env_->FindNamespace("entry.src.main.src.ets.NameSpaceSupport.anyns", &ns), ANI_OK);
    ASSERT_NE(ns, nullptr);

    ani_variable variable {};
    ASSERT_EQ(env_->Namespace_FindVariable(ns, "sss", &variable), ANI_NOT_FOUND);
    return ANI_TRUE;
}

ani_int test_Namespace_FindVariable_08([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_namespace ns {};
    ASSERT_EQ(env_->FindNamespace("entry.src.main.src.ets.NameSpaceSupport.anyns", &ns), ANI_OK);
    ASSERT_NE(ns, nullptr);

    ani_variable variable {};
    ASSERT_EQ(env_->Namespace_FindVariable(ns, "??emoji????", &variable), ANI_NOT_FOUND);
    return ANI_TRUE;
}

ani_int test_Namespace_FindVariable_09([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_namespace ns {};
    ASSERT_EQ(env_->FindNamespace("entry.src.main.src.ets.NameSpaceSupport.anyns", &ns), ANI_OK);
    ASSERT_NE(ns, nullptr);

    ASSERT_EQ(env_->Namespace_FindVariable(ns, "s", nullptr), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Namespace_FindVariable_10([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_namespace ns {};
    ASSERT_EQ(env_->FindNamespace("entry.src.main.src.ets.NameSpaceSupport.anyns", &ns), ANI_OK);

    ani_variable variable {};
    ASSERT_EQ(env_->Namespace_FindVariable(ns, "x", &variable), ANI_OK);
    return ANI_TRUE;
}

ani_int test_Namespace_Combinatorial([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_class result {};
    ASSERT_EQ(env_->FindClass("entry.src.main.src.ets.NameSpaceSupport.combinatorial.Cls", &result), ANI_OK);
    ASSERT_NE(result, nullptr);

    ASSERT_EQ(env_->FindClass("entry.src.main.src.ets.NameSpaceSupport.combinatorial.ClsA", &result), ANI_OK);
    ASSERT_NE(result, nullptr);

    ASSERT_EQ(env_->FindClass("entry.src.main.src.ets.NameSpaceSupport.combinatorial.ClsB", &result), ANI_OK);
    ASSERT_NE(result, nullptr);
    return ANI_TRUE;
}

ani_int test_Namespace_Combinatorial_01([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_enum result {};
    ASSERT_EQ(env_->FindEnum("entry.src.main.src.ets.NameSpaceSupport.combinatorial.Color", &result), ANI_OK);
    ASSERT_NE(result, nullptr);

    ASSERT_EQ(env_->FindEnum("entry.src.main.src.ets.NameSpaceSupport.combinatorial.ColorA", &result), ANI_OK);
    ASSERT_NE(result, nullptr);

    ASSERT_EQ(env_->FindEnum("entry.src.main.src.ets.NameSpaceSupport.combinatorial.ColorB", &result), ANI_OK);
    ASSERT_NE(result, nullptr);
    return ANI_TRUE;
}

ani_int test_Namespace_Combinatorial_02([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_enum result {};
    ASSERT_EQ(env_->FindEnum("entry.src.main.src.ets.NameSpaceSupport.combinatorialA.Color", &result), ANI_OK);
    ASSERT_NE(result, nullptr);

    ASSERT_EQ(env_->FindEnum("entry.src.main.src.ets.NameSpaceSupport.combinatorialA.ColorA", &result), ANI_OK);
    ASSERT_NE(result, nullptr);

    ASSERT_EQ(env_->FindEnum("entry.src.main.src.ets.NameSpaceSupport.combinatorialA.ColorB", &result), ANI_OK);
    ASSERT_NE(result, nullptr);
    return ANI_TRUE;
}

ani_int test_Namespace_Combinatorial_03([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_namespace ns {};
    ASSERT_EQ(env_->FindNamespace("entry.src.main.src.ets.NameSpaceSupport.combinatorialA", &ns), ANI_OK);
    ASSERT_NE(ns, nullptr);

    ani_function result {};
    ASSERT_EQ(env_->Namespace_FindFunction(ns, "fun", ":i", &result), ANI_OK);
    ASSERT_NE(result, nullptr);

    ani_enum result1 {};
    ASSERT_EQ(env_->FindEnum("entry.src.main.src.ets.NameSpaceSupport.combinatorialA.ColorA", &result1), ANI_OK);
    ASSERT_NE(result1, nullptr);

    ASSERT_EQ(env_->FindEnum("entry.src.main.src.ets.NameSpaceSupport.combinatorialA.ColorB", &result1), ANI_OK);
    ASSERT_NE(result1, nullptr);
    return ANI_TRUE;
}

ani_int test_Namespace_Combinatorial_04([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_namespace ns {};
    ASSERT_EQ(env_->FindNamespace("entry.src.main.src.ets.NameSpaceSupport.combinatorialB", &ns), ANI_OK);
    ASSERT_NE(ns, nullptr);

    ani_function result {};
    ASSERT_EQ(env_->Namespace_FindFunction(ns, "funA", ":i", &result), ANI_OK);
    ASSERT_NE(result, nullptr);

    ani_enum result1 {};
    ASSERT_EQ(env_->FindEnum("entry.src.main.src.ets.NameSpaceSupport.combinatorialB.ColorB", &result1), ANI_OK);
    ASSERT_NE(result1, nullptr);

    ani_class result2 {};
    ASSERT_EQ(env_->FindClass("entry.src.main.src.ets.NameSpaceSupport.combinatorialB.ClsB", &result2), ANI_OK);
    ASSERT_NE(result2, nullptr);
    return ANI_TRUE;
}

ani_int test_Namespace_Combinatorial_05([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_namespace ns {};
    ASSERT_EQ(env_->FindNamespace("entry.src.main.src.ets.NameSpaceSupport.combinatorialB", &ns), ANI_OK);
    ASSERT_NE(ns, nullptr);

    ani_function result {};
    ASSERT_EQ(env_->Namespace_FindFunction(ns, "funC", ":i", &result), ANI_NOT_FOUND);

    ani_enum result1 {};
    ASSERT_EQ(env_->FindEnum("entry.src.main.src.ets.NameSpaceSupport.EnuC", &result1), ANI_NOT_FOUND);

    ani_class result2 {};
    ASSERT_EQ(env_->FindClass("entry.src.main.src.ets.NameSpaceSupport.ClsC", &result2), ANI_NOT_FOUND);
    return ANI_TRUE;
}

ani_int test_Namespace_Combinatorial_06([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_namespace ns {};
    ASSERT_EQ(env_->FindNamespace("entry.src.main.src.ets.NameSpaceSupport.combinatorial", &ns), ANI_OK);
    ASSERT_NE(ns, nullptr);

    ani_namespace result {};
    ASSERT_EQ(env_->FindNamespace("entry.src.main.src.ets.NameSpaceSupport.combinatorial.sub", &result), ANI_OK);
    ASSERT_NE(result, nullptr);

    ani_function result1 {};
    ASSERT_EQ(env_->Namespace_FindFunction(ns, "fun", ":i", &result1), ANI_OK);
    ASSERT_NE(result1, nullptr);

    ani_enum result2 {};
    ASSERT_EQ(env_->FindEnum("entry.src.main.src.ets.NameSpaceSupport.combinatorial.Color", &result2), ANI_OK);
    ASSERT_NE(result2, nullptr);

    ani_class result3 {};
    ASSERT_EQ(env_->FindClass("entry.src.main.src.ets.NameSpaceSupport.combinatorial.Cls", &result3), ANI_OK);
    ASSERT_NE(result3, nullptr);
    return ANI_TRUE;
}

ani_int test_Namespace_Combinatorial_07([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_namespace ns {};
    ASSERT_EQ(env_->FindNamespace("entry.src.main.src.ets.NameSpaceSupport.combinatorialC", &ns), ANI_OK);
    ASSERT_NE(ns, nullptr);

    ani_namespace tmp {};
    ASSERT_EQ(env_->FindNamespace("entry.src.main.src.ets.NameSpaceSupport.combinatorialC.subA", &tmp), ANI_OK);
    ASSERT_NE(tmp, nullptr);

    ani_class result {};
    ASSERT_EQ(env_->FindClass("entry.src.main.src.ets.NameSpaceSupport.combinatorialC.subA.ClsA", &result), ANI_OK);
    ASSERT_NE(result, nullptr);

    ASSERT_EQ(env_->FindNamespace("entry.src.main.src.ets.NameSpaceSupport.combinatorialC.subB", &ns), ANI_OK);
    ASSERT_NE(ns, nullptr);

    ASSERT_EQ(env_->FindNamespace("entry.src.main.src.ets.NameSpaceSupport.combinatorialC.subB", &ns), ANI_OK);
    ASSERT_NE(ns, nullptr);
    
    ani_enum result1 {};
    ASSERT_EQ(env_->FindEnum("entry.src.main.src.ets.NameSpaceSupport.combinatorialC.subB.ColorA", &result1), ANI_OK);
    ASSERT_NE(result1, nullptr);

    ani_function result2 {};
    ASSERT_EQ(env_->Namespace_FindFunction(ns, "fun", ":i", &result2), ANI_OK);
    ASSERT_NE(result2, nullptr);
    return ANI_TRUE;
}

ani_int test_Namespace_Combinatorial_08([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_namespace ns {};
    ASSERT_EQ(env_->FindNamespace("entry.src.main.src.ets.NameSpaceSupport.combinatorialC", &ns), ANI_OK);
    ASSERT_NE(ns, nullptr);

    ani_namespace tmp {};
    ASSERT_EQ(env_->FindNamespace("entry.src.main.src.ets.NameSpaceSupport.combinatorialC.subc", &tmp), ANI_NOT_FOUND);

    ani_class result {};
    ASSERT_EQ(env_->FindClass("entry.src.main.src.ets.NameSpaceSupport.combinatorialC.ClsC", &result), ANI_NOT_FOUND);

    ani_enum result1 {};
    ASSERT_EQ(env_->FindEnum("entry.src.main.src.ets.NameSpaceSupport.combinatorialC.EnuE", &result1), ANI_NOT_FOUND);

    ani_function result2 {};
    ASSERT_EQ(env_->Namespace_FindFunction(ns, "funC", ":i", &result2), ANI_NOT_FOUND);
    return ANI_TRUE;
}

ani_int test_Namespace_Combinatorial_09([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_namespace ns {};

    ASSERT_EQ(env_->FindNamespace("entry.src.main.src.ets.NameSpaceSupport.combinatorialD", &ns), ANI_OK);
    ASSERT_NE(ns, nullptr);

    ani_namespace tmp {};
    ASSERT_EQ(env_->FindNamespace("entry.src.main.src.ets.NameSpaceSupport.combinatorialD.subA", &tmp), ANI_OK);
    ASSERT_NE(tmp, nullptr);

    ani_class result {};
    ASSERT_EQ(env_->FindClass("entry.src.main.src.ets.NameSpaceSupport.combinatorialD.ClsA", &result), ANI_OK);
    ASSERT_NE(result, nullptr);

    ani_enum result1 {};
    ASSERT_EQ(env_->FindEnum("entry.src.main.src.ets.NameSpaceSupport.combinatorialD.ColorA", &result1), ANI_OK);
    ASSERT_NE(result1, nullptr);

    ani_function result2 {};
    ASSERT_EQ(env_->Namespace_FindFunction(ns, "fun", ":i", &result2), ANI_OK);
    ASSERT_NE(result2, nullptr);

    ani_namespace tmp1 {};
    ASSERT_EQ(env_->FindNamespace(nullptr, &tmp1), ANI_INVALID_ARGS);

    ani_class result3 {};
    ASSERT_EQ(env_->FindClass(nullptr, &result3), ANI_INVALID_ARGS);

    ani_enum result4 {};
    ASSERT_EQ(env_->FindEnum(nullptr, &result4), ANI_INVALID_ARGS);

    ani_function result5 {};
    ASSERT_EQ(env_->Namespace_FindFunction(nullptr, "fun", ":i", &result5), ANI_INVALID_ARGS);

    return ANI_TRUE;
}
#endif // ARKTS_ANI_TEST_NAMESPACESUPPORT_H
