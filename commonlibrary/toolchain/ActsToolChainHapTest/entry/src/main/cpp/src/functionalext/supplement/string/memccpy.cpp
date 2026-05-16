/**
 * Copyright (c) 2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include <algorithm>
#include <cstring>
#include "functionalext.h"

#define TEST_BUFFER_SIZE 128
#define TEST_DATA_LEN 2

namespace {
constexpr size_t K_BINARY_PAYLOAD_BYTES = 5U;
constexpr size_t K_COPY_LITERAL_PREFIX_LEN = 4U;
} // namespace

/**
 * @tc.name      : Memccpy0100
 * @tc.desc      : Copies a string until spaces or data is greater than the specified length
 * @tc.level     : Level 0
 */
void Memccpy0100(void)
{
    const char src[TEST_BUFFER_SIZE] = "musl test";
    char dest[TEST_BUFFER_SIZE] = "";
    int i;
    void* rev = memccpy(dest, src, ' ', TEST_DATA_LEN);
    EXPECT_PTREQ("Memccpy0100", rev, nullptr);
    EXPECT_EQ("Memccpy0100", strlen(dest), TEST_DATA_LEN);
    for (i = 0; i < TEST_DATA_LEN; i++) {
        EXPECT_EQ("Memccpy0100", dest[i], src[i]);
    }

    std::fill_n(dest, sizeof(dest), '\0');
    rev = memccpy(dest, src, ' ', sizeof(src));
    EXPECT_PTRNE("Memccpy0100", rev, nullptr);
    EXPECT_EQ("Memccpy0100", strlen(dest), strlen("musl "));
    for (i = 0; i < strlen("musl "); i++) {
        EXPECT_EQ("Memccpy0100", dest[i], src[i]);
    }
}

/**
 * @tc.name      : Memccpy0200
 * @tc.desc      : Use a character not contained in the original string as the end position
 *                 for processing the copied string
 * @tc.level     : Level 0
 */
void Memccpy0200(void)
{
    const char src[TEST_BUFFER_SIZE] = "musl test";
    char dest[TEST_BUFFER_SIZE] = "";
    int i;
    void* rev = memccpy(dest, src, 'A', strlen(src));
    EXPECT_PTREQ("Memccpy0200", rev, nullptr);
    EXPECT_STREQ("Memccpy0200", dest, src);
}

/**
 * @tc.name      : Memccpy0300
 * @tc.desc      : The length of the copied string is 0
 * @tc.level     : Level 2
 */
void Memccpy0300(void)
{
    const char src[TEST_BUFFER_SIZE] = "musl test";
    char dest[TEST_BUFFER_SIZE] = "";
    int i;
    void* rev = memccpy(dest, src, ' ', 0);
    EXPECT_PTREQ("Memccpy0300", rev, nullptr);
    EXPECT_EQ("Memccpy0300", strlen(dest), 0);
}

/**
 * @tc.name      : Memccpy0400
 * @tc.desc      : Verify memccpy stops at first occurrence of specified character
 * @tc.level     : Level 1
 */
void Memccpy0400(void)
{
    const char src[] = "multiple|delimited|values";
    char dest[32] = { 0 };
    void* result = memccpy(dest, src, '|', sizeof(src));

    EXPECT_PTRNE("Memccpy0400", result, nullptr);
    if (result != nullptr) {
        EXPECT_STREQ("Memccpy0400", dest, "multiple|");
        EXPECT_EQ("Memccpy0400", (char*)result - dest, strlen("multiple") + 1);
    }
}

/**
 * @tc.name      : Memccpy0500
 * @tc.desc      : Verify memccpy handles binary data with null bytes
 * @tc.level     : Level 2
 */
void Memccpy0500(void)
{
    const char src[] = { 'a', 'b', '\0', 'c', 'd' };
    char dest[5] = { 0 };
    void* result = memccpy(dest, src, 'd', sizeof(src));

    EXPECT_PTRNE("Memccpy0500", result, nullptr);
    if (result != nullptr) {
        EXPECT_EQ("Memccpy0500", memcmp(dest, src, K_BINARY_PAYLOAD_BYTES), 0);
        EXPECT_EQ("Memccpy0500", (char*)result - dest, K_BINARY_PAYLOAD_BYTES);
    }
}

/**
 * @tc.name      : Memccpy0600
 * @tc.desc      : Verify memccpy copies full length when stop char not found
 * @tc.level     : Level 1
 */
void Memccpy0600(void)
{
    const char src[] = "no_stop_char_here";
    char dest[32] = { 0 };
    void* result = memccpy(dest, src, 'X', strlen(src));

    EXPECT_PTREQ("Memccpy0600", result, nullptr);
    EXPECT_STREQ("Memccpy0600", dest, src);
}

/**
 * @tc.name      : Memccpy0700
 * @tc.desc      : Verify memccpy with stop character at last position
 * @tc.level     : Level 1
 */
void Memccpy0700(void)
{
    const char src[] = "stop_at_end$";
    char dest[32] = { 0 };
    void* result = memccpy(dest, src, '$', strlen(src));

    EXPECT_PTRNE("Memccpy0700", result, nullptr);
    if (result != nullptr) {
        EXPECT_STREQ("Memccpy0700", dest, src);
        EXPECT_EQ("Memccpy0700", (char*)result - dest, strlen(src));
    }
}

/**
 * @tc.name      : Memccpy0900
 * @tc.desc      : Verify memccpy with maximum copy length before stop char
 * @tc.level     : Level 2
 */
void Memccpy0800(void)
{
    const char src[] = "copy|this";
    char dest[32] = { 0 };
    void* result = memccpy(dest, src, '|', K_COPY_LITERAL_PREFIX_LEN); // Should stop at length before seeing '|'

    EXPECT_PTREQ("Memccpy0800", result, nullptr);
    EXPECT_EQ("Memccpy0800", memcmp(dest, "copy", K_COPY_LITERAL_PREFIX_LEN), 0);
}

/**
 * @tc.name      : Memccpy0900
 * @tc.desc      : Verify memccpy with stop character being the first byte
 * @tc.level     : Level 1
 */
void Memccpy0900(void)
{
    const char src[] = "*start*with*star";
    char dest[32] = { 0 };
    void* result = memccpy(dest, src, '*', strlen(src));

    if (result != nullptr) {
        EXPECT_PTREQ("Memccpy0900", result, dest + 1);
        EXPECT_EQ("Memccpy0900", dest[0], '*');
    }
}

static int MemccpyTestImpl(void)
{
    Memccpy0100();
    Memccpy0200();
    Memccpy0300();
    Memccpy0400();
    Memccpy0500();
    Memccpy0600();
    Memccpy0700();
    Memccpy0800();
    Memccpy0900();
    return T_STATUS;
}

int MemccpyTest(void)
{
    return MemccpyTestImpl();
}
