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

#ifndef ARKTS_ANI_TEST_SCOPESUPPORT_H
#define ARKTS_ANI_TEST_SCOPESUPPORT_H
#include "Common.h"

ani_boolean test_create_local_scope([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ASSERT_NE(env, nullptr);
    ani_size capacity = 32;
    ASSERT_EQ(env->CreateLocalScope(capacity), ANI_OK);
    ASSERT_EQ(env->DestroyLocalScope(), ANI_OK);
    return ANI_TRUE;
}

ani_boolean test_create_escape_local_scope([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ASSERT_NE(env, nullptr);
    ani_size capacity = 32;
    auto status = env->CreateLocalScope(capacity);
    ASSERT_EQ(env->CreateEscapeLocalScope(capacity), ANI_OK);

    ani_string string = nullptr;
    std::string testValue = "hello";
    ASSERT_EQ(env->String_NewUTF8(testValue.c_str(), testValue.size(), &string), ANI_OK);

    ani_ref result;
    ASSERT_EQ(env->DestroyEscapeLocalScope(string, &result), ANI_OK);
    ani_size size = 0U;
    ASSERT_EQ(env->String_GetUTF8Size(static_cast<ani_string>(result), &size), ANI_OK);
    ASSERT_EQ(size, testValue.size());
    status = env->DestroyLocalScope();
    return ANI_TRUE;
}
#endif // ARKTS_ANI_TEST_SCOPESUPPORT_H
