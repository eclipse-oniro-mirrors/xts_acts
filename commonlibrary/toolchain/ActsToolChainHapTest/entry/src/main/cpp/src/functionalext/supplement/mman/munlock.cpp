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
#include <cstdlib>
#include <sys/mman.h>
#include "functionalext.h"

#define TEST_SIZE 4096

/**
 * @tc.name      : Munlock0100
 * @tc.desc      : Unlock locked memory block
 * @tc.level     : Level 0
 */
void Munlock0100(void)
{
    char* memory = (char*)malloc(TEST_SIZE);
    if (memory == nullptr) {
        EXPECT_PTRNE("Munlock0100", memory, nullptr);
        return;
    }

    std::fill_n(memory, TEST_SIZE, '\0');
    int ret = mlock(memory, TEST_SIZE);
    EXPECT_NE("Munlock0100", ret, ERREXPECT);

    ret = munlock(memory, TEST_SIZE);
    EXPECT_EQ("Munlock0100", ret, CMPFLAG);
    free(memory);
    memory = nullptr;
}

static int MunlockTestImpl(void)
{
    Munlock0100();
    return T_STATUS;
}

int MunlockTest(void)
{
    return MunlockTestImpl();
}
