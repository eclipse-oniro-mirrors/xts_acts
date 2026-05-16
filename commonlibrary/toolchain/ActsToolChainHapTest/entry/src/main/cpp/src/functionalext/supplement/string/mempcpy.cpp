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

#define TEST_BUFFER_SIZE 128
#define TEST_DATA_LEN 8

/**
 * @tc.name      : Mempcpy0100
 * @tc.desc      : Verify strcasecmp process success. Copies the string into the array dest.
 * @tc.level     : Level 0
 */
void Mempcpy0100(void)
{
    const char src[TEST_BUFFER_SIZE] = "Mempcpy0100";
    char dest[TEST_BUFFER_SIZE] = "";
    void* rev = mempcpy(dest, src, strlen(src));
    EXPECT_STREQ("Mempcpy0100", dest, "Mempcpy0100");
}

/**
 * @tc.name      : Mempcpy0200
 * @tc.desc      : Verify strcasecmp process success. Copies the 8 consecutive characters starting with the 8th
 *                 character in src into d.
 * @tc.level     : Level 0
 */
void Mempcpy0200(void)
{
    const char src[TEST_BUFFER_SIZE] = "mempcpy_0200test";
    char dest[TEST_BUFFER_SIZE] = "";
    void* rev = mempcpy(dest, src + TEST_DATA_LEN, strlen(src + TEST_DATA_LEN));
    EXPECT_STREQ("Mempcpy0200", dest, "0200test");
}

/**
 * @tc.name      : Mempcpy0300
 * @tc.desc      : Verify strcasecmp process success. Overwrite the original data.
 * @tc.level     : Level 0
 */
void Mempcpy0300(void)
{
    const char src[TEST_BUFFER_SIZE] = "Mempcpy0300";
    char dest[TEST_BUFFER_SIZE] = "****";
    void* rev = mempcpy(dest, src, strlen(src));
    EXPECT_STREQ("Mempcpy0300", dest, "Mempcpy0300");
}

/**
 * @tc.name      : Mempcpy0400
 * @tc.desc      : Verify strcasecmp process fail. The length of the copied string is 0.
 * @tc.level     : Level 2
 */
void Mempcpy0400(void)
{
    const char src[TEST_BUFFER_SIZE] = "Mempcpy0400";
    char dest[TEST_BUFFER_SIZE] = "";
    void* rev = mempcpy(dest, src, 0);
    EXPECT_STREQ("Mempcpy0400", dest, "");
}

static int MempcpyTestImpl(void)
{
    Mempcpy0100();
    Mempcpy0200();
    Mempcpy0300();
    Mempcpy0400();
    return T_STATUS;
}

int MempcpyTest(void)
{
    return MempcpyTestImpl();
}
