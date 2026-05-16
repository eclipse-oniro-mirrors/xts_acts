/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include <cerrno>
#include <cstdlib>
#include <unistd.h>
#include "test.h"

/**
 * @tc.name      : Sbrk0100
 * @tc.desc      : Find the current location of the program break
 * @tc.level     : Level 0
 */
void Sbrk0100(void)
{
    errno = 0;
    // 修复：添加 (int*) 强转
    int *p = static_cast<int *>(sbrk(0));
    if (p == reinterpret_cast<void *>(-1)) {
        t_error("%s sbrk failed\n", __func__);
    }
    if (errno == ENOMEM) {
        t_error("%s errno is %d\n", __func__, errno);
    }
}

/**
 * @tc.name      : Sbrk0200
 * @tc.desc      : Exception return value test when parameter is 1
 * @tc.level     : Level 2
 */
void Sbrk0200(void)
{
    errno = 0;
    // 修复：添加 (int*) 强转
    int *p = static_cast<int *>(sbrk(1));
    if (p != reinterpret_cast<void *>(-1)) {
        t_error("%s sbrk failed\n", __func__);
    }
    if (errno != ENOMEM) {
        t_error("%s errno is %d\n", __func__, errno);
    }
}

static int SbrkTestImpl(int argc, char *argv[])
{
    Sbrk0100();
    Sbrk0200();
    return T_STATUS;
}

int SbrkTest(void)
{
    static char libcProg[] = "libc_test";
    char *libcArgv[] = { libcProg, nullptr };
    return SbrkTestImpl(1, libcArgv);
}