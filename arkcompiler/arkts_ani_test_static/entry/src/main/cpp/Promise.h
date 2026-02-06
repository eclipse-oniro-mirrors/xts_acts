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

#ifndef ARKTS_ANI_TEST_PROMISE_H
#define ARKTS_ANI_TEST_PROMISE_H
#include "Common.h"

ani_int test_Promise_New([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object promise {};
    ani_resolver resolver {};

    ASSERT_EQ(env->Promise_New(&resolver, &promise), ANI_OK);
    ASSERT_NE(promise, nullptr);
    return ANI_TRUE;
}

ani_int test_PromiseResolver_Resolve([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object promise {};
    ani_resolver resolver {};

    ASSERT_EQ(env->Promise_New(&resolver, &promise), ANI_OK);

    std::string resolved = "resolved";
    ani_string resolution = nullptr;
    ASSERT_EQ(env->String_NewUTF8(resolved.c_str(), resolved.size(), &resolution), ANI_OK);

    ASSERT_EQ(env->PromiseResolver_Resolve(resolver, resolution), ANI_OK);
    return ANI_TRUE;
}

ani_int test_PromiseResolver_Reject([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object promise {};
    ani_resolver resolver {};

    ASSERT_EQ(env->Promise_New(&resolver, &promise), ANI_OK);

    std::string rejected = "rejected";
    ani_string rejection = nullptr;
    ASSERT_EQ(env->String_NewUTF8(rejected.c_str(), rejected.size(), &rejection), ANI_OK);

    ASSERT_EQ(env->PromiseResolver_Reject(resolver, reinterpret_cast<ani_error>(rejection)), ANI_OK);
    return ANI_TRUE;
}

#endif // ARKTS_ANI_TEST_PROMISE_H
