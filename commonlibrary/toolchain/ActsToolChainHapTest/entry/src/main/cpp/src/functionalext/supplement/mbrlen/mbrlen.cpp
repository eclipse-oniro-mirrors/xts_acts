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

#include <cstdio>
#include <cwchar>
#include <sys/mman.h>

#include "functionalext.h"

/**
 * @tc.name      : Mbrlen0100
 * @tc.desc      : Verify that the obtained character length is 1 byte
 * @tc.level     : Level 0
 */
void Mbrlen0100(void)
{
    char test[] = { 'm', 'u', 's', 'l' };
    const int num = sizeof(test) / sizeof(test[0]);
    size_t limitsize = sizeof(test[0]);
    for (unsigned int i = 0; i < num; i++) {
        EXPECT_EQ("Mbrlen0100", mbrlen(test + i, limitsize, nullptr), 1);
    }
}

/**
 * @tc.name      : Mbrlen0200
 * @tc.desc      : Verify that the length return value of the incoming exception is not an illegal value
 * @tc.level     : Level 2
 */
void Mbrlen0200(void)
{
    char test[] = { 'm', 'u', 's', 'l', '\0' };
    size_t index = 1;
    size_t ret = 0;
    const int num = sizeof(test) / sizeof(test[0]) - 1;
    for (unsigned int i = 0; i < num; i++) {
        ret = mbrlen(&test[i], 0, nullptr);
        EXPECT_NE("Mbrlen0200", ret, index);
    }
    if (test[num] == '\0') {
        ret = mbrlen(&test[num], 1, nullptr);
        EXPECT_EQ("Mbrlen0200", ret, CMPFLAG);
    }
}

static int MbrlenTestImpl(void)
{
    Mbrlen0100();
    Mbrlen0200();

    return T_STATUS;
}

int MbrlenTest(void)
{
    return MbrlenTestImpl();
}
