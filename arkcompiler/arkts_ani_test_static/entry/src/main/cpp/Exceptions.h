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

#ifndef ARKTS_ANI_TEST_EXCEPTIONS_H
#define ARKTS_ANI_TEST_EXCEPTIONS_H
#include "Common.h"
ani_int test_ExistUnhandledError([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    static constexpr const ani_size EXPECTED_SIZE = 10U;
    ani_arraybuffer arrayBuffer;
    int8_t *data = nullptr;
    auto status = env->CreateArrayBuffer(EXPECTED_SIZE, reinterpret_cast<void **>(&data), &arrayBuffer);
    ASSERT_EQ(status, ANI_OK);
    ASSERT_NE(arrayBuffer, nullptr);
    ASSERT_NE(data, nullptr);
    ani_boolean hasError = ANI_FALSE;
    ASSERT_EQ(env->ExistUnhandledError(&hasError), ANI_OK);
    ASSERT_EQ(hasError, ANI_FALSE);
    return ANI_TRUE;
}

ani_int GetFunctionFromModule(ani_env *env, ani_namespace *ns, ani_function *func, const char *functionName,
                              const char *signature)
{
    ASSERT_NE(ns, nullptr);
    ASSERT_NE(func, nullptr);

    ASSERT_EQ(env->FindNamespace("Lentry/src/main/src/ets/Exception/testing;", ns), ANI_OK);
    ASSERT_EQ(env->Namespace_FindFunction(*ns, functionName, signature, func), ANI_OK);

    return ANI_TRUE;
}

ani_function GetThrowErrorFunction(ani_env *env)
{
    ani_namespace ns = nullptr;
    ani_function func = nullptr;
    GetFunctionFromModule(env, &ns, &func, "throwError", "I:I");
    return func;
}

ani_int test_ResetError([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    auto func = GetThrowErrorFunction(env);

    ani_int errorResult = 0;
    ani_boolean result = ANI_TRUE;
    ASSERT_EQ(env->ExistUnhandledError(&result), ANI_OK);
    ASSERT_EQ(result, ANI_FALSE);
    ani_int tmpNum = 5;
    ASSERT_EQ(env->Function_Call_Int(func, &errorResult, tmpNum), ANI_PENDING_ERROR);
    ASSERT_EQ(env->ExistUnhandledError(&result), ANI_OK);
    ASSERT_EQ(result, ANI_TRUE);
    ASSERT_EQ(env->ResetError(), ANI_OK);
    ASSERT_EQ(env->ExistUnhandledError(&result), ANI_OK);
    ASSERT_EQ(result, ANI_FALSE);
    return ANI_TRUE;
}
#endif //ARKTS_ANI_TEST_EXCEPTIONS_H
