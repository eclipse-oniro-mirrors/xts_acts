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

#include <malloc.h>
#include "functionalext.h"

#define TEST_MALLOC_SIZE 256

/**
 * @tc.name      : MallocUsableSize0100
 * @tc.desc      : Obtain size of block of memory allocated from heap
 * @tc.level     : Level 0
 */
void MallocUsableSize0100(void)
{
    void* p = malloc(TEST_MALLOC_SIZE);
    EXPECT_PTRNE("MallocUsableSize0100", p, nullptr);
    if (!p) {
        return;
    }
    size_t ret = malloc_usable_size(p);
    EXPECT_GTE("MallocUsableSize0100", ret, TEST_MALLOC_SIZE);
    free(p);
}

/**
 * @tc.name      : MallocUsableSize0200
 * @tc.desc      : The parameter is nullptr, get the memory size
 * @tc.level     : Level 2
 */
void MallocUsableSize0200(void)
{
    size_t ret = malloc_usable_size(nullptr);
    EXPECT_EQ("MallocUsableSize0200", ret, CMPFLAG);
}

static int MallocUsableSizeTestImpl(void)
{
    MallocUsableSize0100();
    MallocUsableSize0200();
    return T_STATUS;
}

int MallocUsableSizeTest(void)
{
    return MallocUsableSizeTestImpl();
}
