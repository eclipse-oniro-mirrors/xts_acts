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
#include <unistd.h>
#include "functionalext.h"

namespace {
constexpr int K_MEMALIGN_LEN_MULTIPLIER = 8;
} // namespace

/**
 * @tc.name      : Memalign0100
 * @tc.desc      : Each parameter is valid, and align is obtained by getpagesize(), which can allocate a memory block
 *                 whose size is specified by len and whose address is a multiple of align.
 * @tc.level     : Level 0
 */
void Memalign0100(void)
{
    int align = getpagesize();
    EXPECT_NE("Memalign0100", align, -1);
    void* buff = memalign(align, 8 * align);
    EXPECT_TRUE("Memalign0100", buff != nullptr);
    free(buff);
    buff = nullptr;
}

/**
 * @tc.name      : Memalign0200
 * @tc.desc      : Each parameter is valid, and it can allocate a memory block with the size specified by
 *                 len and the address is a multiple of align
 * @tc.level     : Level 1
 */
void Memalign0200(void)
{
    int align = 16;
    void* buff = nullptr;
    buff = memalign(align, K_MEMALIGN_LEN_MULTIPLIER * align);
    EXPECT_TRUE("Memalign0200", buff != nullptr);
    free(buff);
    buff = nullptr;
}

/**
 * @tc.name      : Memalign0300
 * @tc.desc      : The align parameter is invalid, and a memory block whose size is specified
 *                 by len and whose address is a multiple of align cannot be allocated
 * @tc.level     : Level 2
 */
void Memalign0300(void)
{
    int align = getpagesize() - 1;
    EXPECT_NE("Memalign0300", align, -1);
    void* buff = memalign(align, 128);
    EXPECT_EQ("Memalign0300", buff, nullptr);
    free(buff);
    buff = nullptr;
}

/**
 * @tc.name      : Memalign0400
 * @tc.desc      : The len parameter is invalid, and a memory block whose size is specified by
 *                 len and whose address is a multiple of align cannot be allocated
 * @tc.level     : Level 2
 */
void Memalign0400(void)
{
    int align = getpagesize();
    EXPECT_NE("Memalign0400", align, -1);
    void* buff = memalign(align, SIZE_MAX - align + 1);
    EXPECT_EQ("Memalign0400", buff, nullptr);
    free(buff);
    buff = nullptr;
}

/**
 * @tc.name      : Memalign0500
 * @tc.desc      : Insufficient memory space to allocate a memory block
 *                 with a size specified by len and an address that is a multiple of align
 * @tc.level     : Level 2
 */
void Memalign0500(void)
{
    int align = (4 * sizeof(size_t)) + 1;
    void* buff = memalign(align, align * 1024);
    EXPECT_EQ("Memalign0500", buff, nullptr);
    free(buff);
    buff = nullptr;
}

static int MemalignTestImpl(int argc, char* argv[])
{
    Memalign0100();
    Memalign0200();
    Memalign0300();
    Memalign0400();
    Memalign0500();

    return T_STATUS;
}

int MemalignTest(void)
{
    static char libcProgStub[] = "libc_test";
    char* libcArgvStub[] = { libcProgStub, nullptr };
    return MemalignTestImpl(1, libcArgvStub);
}
