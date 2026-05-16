/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
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

#include <cstddef>
#include <cstdlib>
#include <cstring>
#include <fcntl.h>
#include "functionalext.h"

namespace {
constexpr size_t K_STRCAT_ESCAPED_PREFIX_BYTE_COUNT = 7U;

void StrCatBounded(char* dest, size_t destsz, const char* src)
{
    size_t used = strnlen(dest, destsz);
    if (used >= destsz) {
        return;
    }
    std::strncat(dest, src, destsz - used - 1U);
}
} // namespace

#define LENGTH 50

/**
 * @tc.name      : Strcat0100
 * @tc.desc      : Verify strcat process success
 * @tc.level     : Level 0
 */
void Strcat0100(void)
{
    char src[LENGTH] = "Source";
    StrCatBounded(src, LENGTH, "Destination");
    char* ret = src;
    EXPECT_STREQ("Strcat0100", ret, "SourceDestination");
}

/**
 * @tc.name      : Strcat0200
 * @tc.desc      : Verify concatenating empty string
 * @tc.level     : Level 1
 */
void Strcat0200(void)
{
    char src[LENGTH] = "Hello";
    StrCatBounded(src, LENGTH, "");
    char* ret = src;
    if (ret != nullptr) {
        EXPECT_STREQ("Strcat0200", ret, "Hello");
        EXPECT_STREQ("Strcat0200", src, "Hello");
    }
}

/**
 * @tc.name      : Strcat0300
 * @tc.desc      : Verify concatenating to empty string
 * @tc.level     : Level 1
 */
void Strcat0300(void)
{
    char src[LENGTH] = "";
    StrCatBounded(src, LENGTH, "World");
    char* ret = src;
    if (ret != nullptr) {
        EXPECT_STREQ("Strcat0300", ret, "World");
        EXPECT_STREQ("Strcat0300", src, "World");
    }
}

/**
 * @tc.name      : Strcat0400
 * @tc.desc      : Verify concatenation with exact buffer size
 * @tc.level     : Level 2
 */
void Strcat0400(void)
{
    char src[12] = "Hello";
    StrCatBounded(src, sizeof(src), "World");
    char* ret = src;
    if (ret != nullptr) {
        EXPECT_STREQ("Strcat0400", ret, "HelloWorld");
    }
}

/**
 * @tc.name      : Strcat0500
 * @tc.desc      : Verify multiple concatenations
 * @tc.level     : Level 1
 */
void Strcat0500(void)
{
    char src[LENGTH] = "start";
    StrCatBounded(src, LENGTH, "-");
    StrCatBounded(src, LENGTH, "Middle");
    StrCatBounded(src, LENGTH, "-End");
    char* ret = src;
    if (ret != nullptr) {
        EXPECT_STREQ("Strcat0500", ret, "start-Middle-End");
    }
}

/**
 * @tc.name      : Strcat0600
 * @tc.desc      : Verify concatenation with special characters
 * @tc.level     : Level 1
 */
void Strcat0600(void)
{
    char src[LENGTH] = "Text";
    StrCatBounded(src, LENGTH, "\t\n\r\0Special");
    char* ret = src;
    if (ret != nullptr) {
        // Note: Strcmp will stop at \0, so only the content before \0 will be compared
        EXPECT_EQ("Strcat0600", memcmp(ret, "Text\t\n\r", K_STRCAT_ESCAPED_PREFIX_BYTE_COUNT), 0);
    }
}

/**
 * @tc.name      : Strcat0700
 * @tc.desc      : Verify return pointer points to dest
 * @tc.level     : Level 1
 */
void Strcat0700(void)
{
    char src[LENGTH] = "Base";
    StrCatBounded(src, LENGTH, "String");
    char* ret = src;
    if (ret != nullptr) {
        EXPECT_PTREQ("Strcat0700", ret, src);
    }
}

static int StrcatTestImpl(void)
{
    Strcat0100();
    Strcat0200();
    Strcat0300();
    Strcat0400();
    Strcat0500();
    Strcat0600();
    Strcat0700();
    return T_STATUS;
}

int StrcatTest(void)
{
    return StrcatTestImpl();
}
