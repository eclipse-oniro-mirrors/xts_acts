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

#include <cstring>
#include "functionalext.h"

// Test constants for memmem operations
#define PARTIAL_MATCH_LENGTH 3
#define BINARY_DATA_OFFSET 2
#define NEEDLE_LENGTH 2
#define MUSL_OFFSET 5

/**
 * @tc.name      : memmem_0100
 * @tc.desc      : Normal value test, assert whether the address value of the return value is
 *                 the created buffer address
 * @tc.level     : Level 0
 */
void Memmem0100(void)
{
    const char buffer[] = "musl test";
    const char cmp[] = "musl";
    char *ptr = nullptr;

    for (int i = 0; i < sizeof(cmp) / sizeof(cmp[0]); i++) {
        ptr = (char *)memmem(buffer, sizeof(buffer), cmp, i);
        if (ptr == nullptr) {
            EXPECT_PTRNE("memmem_0100", ptr, nullptr);
            return;
        }
        EXPECT_PTREQ("memmem_0100", ptr, buffer);
    }
}

/**
 * @tc.name      : memmem_0200
 * @tc.desc      : Assert whether the returned value of an invalid parameter is null
 * @tc.level     : Level 2
 */
void Memmem0200(void)
{
    const char buffer[] = "musl test";
    size_t buflen = sizeof(buffer) / sizeof(buffer[0]);
    size_t errlen = buflen + 1;
    char *ptr = nullptr;

    ptr = (char *)memmem(buffer, sizeof(buffer), "musl", errlen);
    EXPECT_PTREQ("memmem_0200", ptr, nullptr);

    ptr = (char *)memmem(buffer, sizeof(buffer), "muls", PARTIAL_MATCH_LENGTH);
    EXPECT_PTREQ("memmem_0200", ptr, nullptr);
}

/**
 * @tc.name      : memmem_0300
 * @tc.desc      : Verify memmem returns nullptr when substring not found
 * @tc.level     : Level 1
 */
void Memmem0300(void)
{
    const char buffer[] = "test musl";
    const char needle[] = "notfound";
    char *ptr = (char *)memmem(buffer, sizeof(buffer), needle, sizeof(needle)-1);
    EXPECT_PTREQ("memmem_0300", ptr, nullptr);
}

/**
 * @tc.name      : memmem_0400
 * @tc.desc      : Verify memmem handles empty needle correctly
 * @tc.level     : Level 1
 */
void Memmem0400(void)
{
    const char buffer[] = "test musl";
    const char needle[] = "";
    char *ptr = (char *)memmem(buffer, sizeof(buffer), needle, 0);
    EXPECT_PTREQ("memmem_0400", ptr, buffer);
}

/**
 * @tc.name      : memmem_0500
 * @tc.desc      : Verify memmem handles binary data correctly
 * @tc.level     : Level 2
 */
void Memmem0500(void)
{
    const unsigned char buffer[] = {0x01, 0x02, 0x03, 0x04, 0x05};
    const unsigned char needle[] = {0x03, 0x04};
    char *ptr = (char *)memmem(buffer, sizeof(buffer), needle, sizeof(needle));
    EXPECT_PTREQ("memmem_0500", ptr, (char *)buffer + BINARY_DATA_OFFSET);
}

/**
 * @tc.name      : memmem_0600
 * @tc.desc      : Verify memmem returns nullptr when needle larger than haystack
 * @tc.level     : Level 2
 */
void Memmem0600(void)
{
    const char buffer[] = "test";
    const char needle[] = "test string";
    char *ptr = (char *)memmem(buffer, sizeof(buffer)-1, needle, sizeof(needle)-1);
    EXPECT_PTREQ("memmem_0600", ptr, nullptr);
}

/**
 * @tc.name      : memmem_0700
 * @tc.desc      : Verify memmem finds partial matches correctly
 * @tc.level     : Level 2
 */
void Memmem0700(void)
{
    const char buffer[] = "test musl";
    const char needle[] = "musx";
    char *ptr = (char *)memmem(buffer, sizeof(buffer), needle, PARTIAL_MATCH_LENGTH); // Only compare first 3 chars
    EXPECT_PTREQ("memmem_0700", ptr, buffer + MUSL_OFFSET);
}

/**
 * @tc.name      : memmem_0800
 * @tc.desc      : Verify memmem handles zero-length haystack correctly
 * @tc.level     : Level 2
 */
void Memmem0800(void)
{
    const char buffer[] = "";
    const char needle[] = "test";
    char *ptr = (char *)memmem(buffer, 0, needle, sizeof(needle)-1);
    EXPECT_PTREQ("memmem_0800", ptr, nullptr);
}

static int MemmemTestImpl(void)
{
    Memmem0100();
    Memmem0200();
    Memmem0300();
    Memmem0400();
    Memmem0500();
    Memmem0600();
    Memmem0700();
    Memmem0800();

    return g_tStatus;
}

int MemmemTest(void)
{
    return MemmemTestImpl();
}
