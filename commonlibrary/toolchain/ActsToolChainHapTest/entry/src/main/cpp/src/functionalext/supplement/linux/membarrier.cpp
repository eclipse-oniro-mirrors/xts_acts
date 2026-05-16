/*
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

#include <dlfcn.h>
#include <sys/membarrier.h>
#include "functionalext.h"

/**
 * @tc.name      : membarrier_0100
 * @tc.desc      : Verify memory masking
 *                 (all parameters are valid, CMD is not equal to MEMBARRIER_CMD_PRIVATE_EXPEDITED)
 * @tc.level     : Level 0
 */
void Membarrier0100(void)
{
    typedef int (*MembarrierFunc)(int, int);
    MembarrierFunc membarrier = (MembarrierFunc)dlsym(RTLD_DEFAULT, "membarrier");
    if (!membarrier) {
        EXPECT_PTRNE("Membarrier0100", membarrier, nullptr);
        return;
    }

    int result = membarrier(MEMBARRIER_CMD_REGISTER_PRIVATE_EXPEDITED, 0);
    EXPECT_EQ("Membarrier0100", result, 0);
}

/**
 * @tc.name      : membarrier_0200
 * @tc.desc      : Verify memory masking (valid with CMD equal to MEMBARRIER_CMD_PRIVATE_EXPEDITED)
 * @tc.level     : Level 1
 */
void Membarrier0200(void)
{
    typedef int (*MembarrierFunc)(int, int);
    MembarrierFunc membarrier = (MembarrierFunc)dlsym(RTLD_DEFAULT, "membarrier");
    if (!membarrier) {
        EXPECT_PTRNE("Membarrier0200", membarrier, nullptr);
        return;
    }

    int result = membarrier(MEMBARRIER_CMD_PRIVATE_EXPEDITED, 0);
    EXPECT_EQ("Membarrier0200", result, 0);
}

/**
 * @tc.name      : membarrier_0300
 * @tc.desc      : Verify that memory masking is not possible (CMD argument is invalid)
 * @tc.level     : Level 2
 */
void Membarrier0300(void)
{
    typedef int (*MembarrierFunc)(int, int);
    MembarrierFunc membarrier = (MembarrierFunc)dlsym(RTLD_DEFAULT, "membarrier");
    if (!membarrier) {
        EXPECT_PTRNE("Membarrier0300", membarrier, nullptr);
        return;
    }

    int result = membarrier(-1, 0);
    EXPECT_EQ("Membarrier0300", result, -1);
}

static int MembarrierTestImpl(int argc, char* argv[])
{
    Membarrier0100();
    Membarrier0200();
    Membarrier0300();
    return T_STATUS;
}

int MembarrierTest(void)
{
    static char libcProg[] = "libc_test";
    char* libcArgv[] = { libcProg, nullptr };
    return MembarrierTestImpl(1, libcArgv);
}
