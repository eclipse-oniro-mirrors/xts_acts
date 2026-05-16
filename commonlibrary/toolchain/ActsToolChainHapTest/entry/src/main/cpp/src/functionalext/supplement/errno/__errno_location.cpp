/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
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

#include <cstdio>
#include <cerrno>
#include "test.h"

// Test constant for errno value
#define TEST_ERRNO_VALUE 10

/**
 * @tc.name      : __errno_location_0100
 * @tc.desc      : Test the __errno_location method to get the errno address
 * @tc.level     : Level 0
 */
void ErrnoLocation0100(void)
{
    errno = 0;
    int result = *__errno_location();
    if (result != 0) {
        t_error("%s __errno_location get errno code is %d are not want 0\n", __func__, result);
    }
}

/**
 * @tc.name      : __errno_location_0200
 * @tc.desc      : The result returned by __errno_location when the value of errno has just been changed
 * @tc.level     : Level 1
 */
void ErrnoLocation0200(void)
{
    errno = TEST_ERRNO_VALUE;
    int result = *__errno_location();
    if (result != errno) {
        t_error("%s __errno_location get errno code is %d are not want %d\n", __func__, result, errno);
    }
    errno = 0;
}

/**
 * @tc.name      : __errno_location_0300
 * @tc.desc      : Test the address returned by __errno_location and compare it with the errno address
 * @tc.level     : Level 1
 */
void ErrnoLocation0300(void)
{
    int *result = __errno_location();
    if (result != &errno) {
        t_error("%s __errno_location get ptr is %p are not want %p\n", __func__, result, &errno);
    }
}

static int ErrnoLocationTestImpl(int argc, char *argv[])
{
    ErrnoLocation0100();
    ErrnoLocation0200();
    ErrnoLocation0300();
    return g_tStatus;
}

int ErrnoLocationTest(void)
{
    static char libcProg[] = "libc_test";
    char *libcArgv[] = { libcProg, nullptr };
    return ErrnoLocationTestImpl(1, libcArgv);
}
