/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
#include <cstring>
#include <ostream>

#include "jsvm.h"
#include "jsvm_types.h"
#include "jsvm_utils.h"
#include "jsvmtest.h"
#include "test_utils.h"

TEST(test_script_string_latin1)
{
    char src[] = "a = 100; a = a + 1";
    JSVM_Value str;
    bool copied = false;
    JSVMTEST_CALL(OH_JSVM_CreateExternalStringLatin1(env, src, strlen(src), nullptr, nullptr, &str, &copied));
    auto result = jsvm::Run(jsvm::Compile(str));
    CHECK(jsvm::ToNumber(result) == 101);
    CHECK(copied == false);
}

// would probably success but is not well defined
TEST(test_script_string_latin1_modified)
{
    char src[] = "a = 100; a = a + 1";
    JSVM_Value str;
    bool copied = false;
    JSVMTEST_CALL(OH_JSVM_CreateExternalStringLatin1(env, src, strlen(src), nullptr, nullptr, &str, &copied));
    src[4] = '2';
    auto result = jsvm::Run(jsvm::Compile(str));
    CHECK(jsvm::ToNumber(result) == 201);
    CHECK(copied == false);
}

TEST(test_script_string_latin1_chinese)
{
    char src[] = "a = '一'; a = a + '二'";
    JSVM_Value str;
    bool copied = false;
    JSVMTEST_CALL(OH_JSVM_CreateExternalStringLatin1(env, src, strlen(src), nullptr, nullptr, &str, &copied));
    auto result = jsvm::Run(jsvm::Compile(str));
    CHECK(jsvm::ToString(result) != "一二");
    CHECK(copied == false);
}

static void LocalFinalize(JSVM_Env env, void *finalizeData, void *finalizeHint)
{
    const int hint = 4;
    CHECK(*static_cast<int *>(finalizeHint) == hint);
    delete static_cast<int *>(finalizeHint);
}

TEST(test_string_callback)
{
    char src[] = "a = 100; a = a + 1";
    JSVM_Value str;
    bool copied = false;
    auto hint = new int(4);
    {
        JSVM_HandleScope scope;
        JSVMTEST_CALL(OH_JSVM_CreateExternalStringLatin1(env, src, strlen(src), LocalFinalize, hint, &str, &copied));
        auto result = jsvm::Run(jsvm::Compile(str));
        CHECK(jsvm::ToNumber(result) == 101);
    }
    CHECK(copied == false);
}

TEST(test_script_string_utf16)
{
    char16_t src[] = u"a = 'hello'; a = a + ' world'";
    JSVM_Value str;
    bool copied = false;
    JSVMTEST_CALL(OH_JSVM_CreateExternalStringUtf16(env, src, std::char_traits<char16_t>::length(src), nullptr, nullptr,
                                                    &str, &copied));
    auto result = jsvm::Run(jsvm::Compile(str));
    CHECK(jsvm::ToString(result) == "hello world");
    CHECK(copied == false);
}

TEST(test_script_string_utf16_chinese)
{
    char16_t src[] = u"a = '一'; a = a + '二'";
    JSVM_Value str;
    bool copied = false;
    JSVMTEST_CALL(OH_JSVM_CreateExternalStringUtf16(env, src, std::char_traits<char16_t>::length(src), nullptr, nullptr,
                                                    &str, &copied));
    auto result = jsvm::Run(jsvm::Compile(str));
    CHECK(jsvm::ToString(result) == "一二");
    CHECK(copied == false);
}