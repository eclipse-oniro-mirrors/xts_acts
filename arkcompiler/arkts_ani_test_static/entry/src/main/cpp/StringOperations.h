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

#ifndef ARKTS_ANI_TEST_STRING_OPERATIONS_H
#define ARKTS_ANI_TEST_STRING_OPERATIONS_H
#include "Common.h"

ani_boolean test_String_UTF8([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ASSERT_NE(env, nullptr);
    std::string value = "hello world";
    ani_string string = nullptr;
    auto status = env->String_NewUTF8(value.c_str(), value.size(), &string);
    ASSERT_EQ(status, ANI_OK);
    ASSERT_NE(string, nullptr);
    ani_size size = 0;
    status = env->String_GetUTF8Size(string, &size);
    ASSERT_EQ(status, ANI_OK);
    ASSERT_EQ(size, value.size());
    const ani_size bufferSize = 128;
    char utf8Buffer[bufferSize] = "";
    ani_size result = 0;
    status = env->String_GetUTF8(string, utf8Buffer, bufferSize, &result);
    ASSERT_EQ(size, result);
    ASSERT_EQ(status, ANI_OK);

    ani_size substrOffset = 6;
    ani_size substrSize = 5;
    status = env->String_GetUTF8SubString(string, substrOffset, substrSize, utf8Buffer, bufferSize, &result);
    ASSERT_EQ(status, ANI_OK);
    return ANI_TRUE;
}

ani_boolean test_String_UTF16([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ASSERT_NE(env, nullptr);
    uint16_t value[] = {1, 2, 3, 4, 5};
    auto valueSize = sizeof(value) / sizeof(value[0]) - 1;
    ani_string string = nullptr;
    auto status = env->String_NewUTF16(value, valueSize, &string);
    ASSERT_EQ(status, ANI_OK);
    ASSERT_NE(string, nullptr);
    ani_size size = 0;
    status = env->String_GetUTF16Size(string, &size);
    ASSERT_EQ(status, ANI_OK);
    ASSERT_EQ(size, valueSize);
    const ani_size bufferSize = 32;
    uint16_t utf16Buffer[bufferSize];
    ani_size result = 0;
    status = env->String_GetUTF16(string, utf16Buffer, bufferSize, &result);
    ASSERT_EQ(size, result);
    ASSERT_EQ(status, ANI_OK);

    ani_size substrOffset = 1;
    ani_size substrSize = 2;
    status = env->String_GetUTF16SubString(string, substrOffset, substrSize, utf16Buffer, bufferSize, &result);
    ASSERT_EQ(status, ANI_OK);
    return ANI_TRUE;
}
#endif // ARKTS_ANI_TEST_STRING_OPERATIONS_H
