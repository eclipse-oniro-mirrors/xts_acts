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

#define TEST_AT_FDCWD (-100)
#define TEST_ERROR_AT_FDCWD 100

/**
 * @tc.name      : memrchr_0100
 * @tc.desc      : Search for a character in the specified memory block
 * @tc.level     : Level 0
 */
void Memrchr0100(void)
{
    const char *src = "this is memrchr_0100 test.";

    char *ret = (char *)memrchr(src, 'r', strlen(src));
    EXPECT_PTRNE("memrchr_0100", ret, nullptr);
    EXPECT_STREQ("memrchr_0100", ret, "r_0100 test.");

    ret = (char *)memrchr(src, 'r', strlen("memrchr_0100 test."));
    EXPECT_PTRNE("memrchr_0100", ret, nullptr);
    EXPECT_STREQ("memrchr_0100", ret, "r_0100 test.");

    ret = (char *)memrchr(src, 'w', strlen(src));
    EXPECT_PTREQ("memrchr_0100", ret, nullptr);
}

/**
 * @tc.name      : memrchr_0200
 * @tc.desc      : Provide an exception parameter to search for characters in the specified memory block
 * @tc.level     : Level 2
 */
void Memrchr0200(void)
{
    const char *src = "this is memrchr_0200 test.";
    char *ret = (char *)memrchr(src, 'r', 0);
    EXPECT_PTREQ("memrchr_0200", ret, nullptr);
}

static int MemrchrTestImpl(void)
{
    Memrchr0100();
    Memrchr0200();
    return g_tStatus;
}

int MemrchrTest(void)
{
    return MemrchrTestImpl();
}
