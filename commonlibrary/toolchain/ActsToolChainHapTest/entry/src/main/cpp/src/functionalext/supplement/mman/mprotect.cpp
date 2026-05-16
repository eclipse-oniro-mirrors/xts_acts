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

#include <cstdint>
#include <cstdlib>
#include <sys/mman.h>
#include "functionalext.h"

const int SUCCESS = 0;
const int FAILED = -1;

/**
 * @tc.name      : Mprotect0100
 * @tc.desc      : The port parameter is PROT_READ,which can set the protection attribute of memory area.
 * @tc.level     : Level 0
 */
void Mprotect0100(void)
{
    size_t align = getpagesize();
    void* buffer = memalign(align, 8 * align);
    int ret = mprotect(buffer, getpagesize(), PROT_READ);
    EXPECT_EQ("Mprotect0100", ret, SUCCESS);
    free(buffer);
}

/**
 * @tc.name      : Mprotect0200
 * @tc.desc      : The port parameter is PROT_WRITE,which can set the protection attribute of memory area.
 * @tc.level     : Level 0
 */
void Mprotect0200(void)
{
    size_t align = getpagesize();
    void* buffer = memalign(align, 8 * align);
    int ret = mprotect(buffer, getpagesize(), PROT_WRITE);
    EXPECT_EQ("Mprotect0200", ret, SUCCESS);
    free(buffer);
}

/**
 * @tc.name      : Mprotect0300
 * @tc.desc      : The port parameter is PROT_EXEC,which can set the protection attribute of memory area.
 * @tc.level     : Level 0
 */
void Mprotect0300(void)
{
    size_t align = getpagesize();
    void* buffer = memalign(align, 8 * align);
    int ret = mprotect(buffer, getpagesize(), PROT_EXEC);
    EXPECT_EQ("Mprotect0300", ret, SUCCESS);
    free(buffer);
}

/**
 * @tc.name      : Mprotect0400
 * @tc.desc      : The port parameter is PROT_NONE,which can set the protection attribute of memory area.
 * @tc.level     : Level 0
 */
void Mprotect0400(void)
{
    size_t align = getpagesize();
    void* buffer = memalign(align, 8 * align);
    int ret = mprotect(buffer, getpagesize(), PROT_NONE);
    EXPECT_EQ("Mprotect0400", ret, SUCCESS);
    free(buffer);
}

/**
 * @tc.name      : Mprotect0500
 * @tc.desc      : The port parameter is PROT_READ|PROT_WRITE,which can set the protection attribute of memory area.
 * @tc.level     : Level 1
 */
void Mprotect0500(void)
{
    size_t align = getpagesize();
    void* buffer = memalign(align, 8 * align);
    int ret = mprotect(buffer, getpagesize(), PROT_READ | PROT_WRITE);
    EXPECT_EQ("Mprotect0500", ret, SUCCESS);
    free(buffer);
}

/**
 * @tc.name      : Mprotect0600
 * @tc.desc      : The start parameter is not an integer multiple of the page,
 *                 and the protection attribute of the memory area cannot be set.
 * @tc.level     : Level 2
 */
void Mprotect0600(void)
{
    int ret = mprotect(reinterpret_cast<void*>(static_cast<uintptr_t>(0x0001)), getpagesize(), PROT_READ);
    EXPECT_EQ("Mprotect0600", ret, FAILED);
}

static int MprotectTestImpl(int argc, char* argv[])
{
    Mprotect0100();
    Mprotect0200();
    Mprotect0300();
    Mprotect0400();
    Mprotect0500();
    Mprotect0600();

    return T_STATUS;
}

int MprotectTest(void)
{
    static char libcProgStub[] = "libc_test";
    char* libcArgvStub[] = { libcProgStub, nullptr };
    return MprotectTestImpl(1, libcArgvStub);
}
