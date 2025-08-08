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

#ifndef ARKTS_ANI_TEST_MODULESUPPORT_H
#define ARKTS_ANI_TEST_MODULESUPPORT_H
#include "Common.h"

ani_int test_Module_FindNamespace([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_module module{};
    ASSERT_EQ(env->FindModule("Lentry/src/main/src/ets/ModuleSupport;", &module), ANI_OK);
    ASSERT_NE(module, nullptr);
    ani_namespace ns{};
    ASSERT_EQ(env->Module_FindNamespace(module, "LAnynsTwo;", &ns), ANI_OK);
    ASSERT_NE(ns, nullptr);
    return ANI_TRUE;
}

ani_int test_Module_FindClass([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls{};
    ani_module module{};
    ASSERT_EQ(env->FindModule("Lentry/src/main/src/ets/ModuleSupport;", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindClass(module, "LFooTwo;", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);
    return ANI_TRUE;
}

ani_int test_Module_FindEnum([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_module module = nullptr;
    ASSERT_EQ(env->FindModule("Lentry/src/main/src/ets/ModuleSupport;", &module), ANI_OK);
    ani_enum enm = nullptr;
    ASSERT_EQ(env->Module_FindEnum(module, "ETWO", &enm), ANI_OK);
    ASSERT_NE(enm, nullptr);
    return ANI_TRUE;
}

ani_int test_Module_FindFunction([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_module module{};
    ASSERT_EQ(env->FindModule("Lentry/src/main/src/ets/ModuleSupport;", &module), ANI_OK);
    ani_function fn{};
    ASSERT_EQ(env->Module_FindFunction(module, "sumTwo", "II:I", &fn), ANI_OK);
    ASSERT_NE(fn, nullptr);
    return ANI_TRUE;
}

ani_int test_Module_FindVariable([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_module module{};
    ASSERT_EQ(env->FindModule("Lentry/src/main/src/ets/ModuleSupport;", &module), ANI_OK);
    ani_variable variable{};
    ASSERT_EQ(env->Module_FindVariable(module, "moduleTwo", &variable), ANI_OK);
    ASSERT_NE(variable, nullptr);
    return ANI_TRUE;
}
#endif // ARKTS_ANI_TEST_MODULESUPPORT_H
