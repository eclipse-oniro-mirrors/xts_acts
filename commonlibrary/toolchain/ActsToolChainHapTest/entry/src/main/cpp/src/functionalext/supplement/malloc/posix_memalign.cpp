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

#include <cerrno>
#include <cstdlib>
#include "functionalext.h"

#define TEST_MEMALIGN_ALIGN 16

/**
 * @tc.name      : PosixMemalign0100
 * @tc.desc      : Allocate memory blocks with 16-byte alignment
 * @tc.level     : Level 0
 */
void PosixMemalign0100(void)
{
    size_t block[] = { 1, 4, 8, 256, 1024, 65000, 128000, 256000, 1000000 };
    int count = sizeof(block) / sizeof(size_t);
    int i = 0;
    for (i = 0; i < count; i++) {
        void* memory = nullptr;
        int rev = posix_memalign(&memory, TEST_MEMALIGN_ALIGN, block[i]);
        EXPECT_EQ("PosixMemalign0100", rev, 0);
        EXPECT_TRUE("PosixMemalign0100", memory != nullptr);
        if (memory) {
            free(memory);
        }
    }
}

/**
 * @tc.name      : PosixMemalign0200
 * @tc.desc      : Synchronize a file with a memory map
 * @tc.level     : Level 2
 */
void PosixMemalign0200(void)
{
    void* memory = nullptr;
    int rev = posix_memalign(&memory, 1, 1);
    EXPECT_EQ("PosixMemalign0200", rev, EINVAL);
    if (memory) {
        free(memory);
    }
}

static int PosixMemalignTestImpl(void)
{
    PosixMemalign0100();
    PosixMemalign0200();
    return T_STATUS;
}

int PosixMemalignTest(void)
{
    return PosixMemalignTestImpl();
}
