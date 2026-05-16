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
 * @tc.name      : Mlock0100
 * @tc.desc      : Assert whether locking 4k memory is successful, release resources after use
 * @tc.level     : Level 0
 */
void Mlock0100(void)
{
    size_t memsize = 4096;
    char* memory = (char*)malloc(memsize);
    if (memory == nullptr) {
        EXPECT_PTRNE("Mlock0100", memory, nullptr);
        return;
    }
    std::fill_n(memory, memsize, '\0');
    int result = mlock(memory, memsize);
    EXPECT_NE("Mlock0100", result, ERREXPECT);

    munlock(memory, memsize);
    free(memory);
    memory = nullptr;
}

static int MlockTestImpl(void)
{
    Mlock0100();

    return T_STATUS;
}

int MlockTest(void)
{
    return MlockTestImpl();
}
