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

/**
 * @tc.name      : Mlock20100
 * @tc.desc      : Lock 4k memory, release memory after unlocking
 * @tc.level     : Level 0
 */
void Mlock20100(void)
{
    size_t memsize = 4096;
    char* memory = (char*)malloc(memsize);
    if (memory == nullptr) {
        EXPECT_PTRNE("Mlock20100", memory, nullptr);
        return;
    }
    std::fill_n(memory, memsize, '\0');
    int ret = mlock2(memory, memsize, CMPFLAG);
    EXPECT_EQ("Mlock20100", ret, CMPFLAG);

    munlock(memory, memsize);
    free(memory);
    memory = nullptr;
}

/**
 * @tc.name      : Mlock20200
 * @tc.desc      : Lock 1k memory and mark all 4k memory size, release memory after unlocking
 * @tc.level     : Level 0
 */
void Mlock20200(void)
{
    size_t memsize = 4096;
    size_t memchip = 1024;
    char* memory = (char*)malloc(memsize);
    if (memory == nullptr) {
        EXPECT_PTRNE("Mlock20200", memory, nullptr);
        return;
    }
    std::fill_n(memory, memsize, '\0');
    int ret = mlock2(memory, memchip, MLOCK_ONFAULT);
    EXPECT_EQ("Mlock20200", ret, CMPFLAG);

    munlock(memory, memsize);
    free(memory);
    memory = nullptr;
}

static int Mlock2TestImpl(void)
{
    Mlock20100();
    Mlock20200();
    return T_STATUS;
}

int Mlock2Test(void)
{
    return Mlock2TestImpl();
}
