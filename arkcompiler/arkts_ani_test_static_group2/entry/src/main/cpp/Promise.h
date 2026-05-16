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

ani_int test_Promise_New_01([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object promise {};
    ani_resolver resolver {};

    ASSERT_EQ(env->c_api->Promise_New(nullptr, &resolver, &promise), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Promise_New_02([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object promise {};

    ASSERT_EQ(env->Promise_New(nullptr, &promise), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Promise_New_03([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_resolver resolver {};

    ASSERT_EQ(env->Promise_New(&resolver, nullptr), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Promise_New_04([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object promise {};
    ani_resolver resolver {};
    const int32_t loopCount = 3;
    for (int32_t i = 0; i < loopCount; i++) {
        ASSERT_EQ(env->Promise_New(&resolver, &promise), ANI_OK);
        ASSERT_NE(promise, nullptr);
    }
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

ani_int test_PromiseResolver_Resolve_01([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_object promise {};
    ani_resolver resolver {};

    ASSERT_EQ(env_->Promise_New(&resolver, &promise), ANI_OK);

    std::string resolved = "resolved";
    ani_string resolution = nullptr;
    ASSERT_EQ(env_->String_NewUTF8(resolved.c_str(), resolved.size(), &resolution), ANI_OK);

    ASSERT_EQ(env_->c_api->PromiseResolver_Resolve(nullptr, resolver, resolution), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_PromiseResolver_Resolve_02([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_object promise {};
    ani_resolver resolver {};

    ASSERT_EQ(env_->Promise_New(&resolver, &promise), ANI_OK);

    std::string resolved = "resolved";
    ani_string resolution = nullptr;
    ASSERT_EQ(env_->String_NewUTF8(resolved.c_str(), resolved.size(), &resolution), ANI_OK);

    ASSERT_EQ(env_->PromiseResolver_Resolve(nullptr, resolution), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_PromiseResolver_Reject([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_error error {};
    ASSERT_EQ(env->PromiseResolver_Reject(nullptr, error), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_PromiseResolver_Reject_01([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_resolver resolver {};
    ani_error error {};
    ASSERT_EQ(env->c_api->PromiseResolver_Reject(nullptr, resolver, error), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_PromiseResolver_Reject_02([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_object promise {};
    ani_resolver resolver {};

    ASSERT_EQ(env_->Promise_New(&resolver, &promise), ANI_OK);

    ani_class errorClass {};
    ASSERT_EQ(env_->FindClass("escompat.Error", &errorClass), ANI_OK);

    ani_method constructor {};
    ASSERT_EQ(env_->Class_FindMethod(errorClass, "<ctor>", "C{std.core.String}:", &constructor), ANI_OK);

    std::string rejected = "rejected";
    ani_string rejection {};
    ASSERT_EQ(env_->String_NewUTF8(rejected.c_str(), rejected.size(), &rejection), ANI_OK);

    ani_object errorObject {};
    // NOLINTNEXTLINE(cppcoreguidelines-pro-type-vararg)
    ASSERT_EQ(env_->Object_New(errorClass, constructor, &errorObject, rejection), ANI_OK);

    auto err = static_cast<ani_error>(errorObject);

    ASSERT_EQ(env_->PromiseResolver_Reject(resolver, err), ANI_OK);

    return ANI_TRUE;
}

#endif // ARKTS_ANI_TEST_PROMISE_H
