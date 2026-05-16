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

#include <cstdio>
#include <cstring>
#include "test.h"

/**
 * @tc.name      : Sysconf0100
 * @tc.desc      : The maximum number of processes running concurrently by the test user
 * @tc.level     : Level 0
 */
void Sysconf0100(void)
{
    long result = sysconf(_SC_CHILD_MAX);
    if (result == 0) {
        t_error("%s sysconf want get result is not zero", __func__);
    }
}

/**
 * @tc.name      : Sysconf0200
 * @tc.desc      : Get the maximum number of open files for a process
 * @tc.level     : Level 0
 */
void Sysconf0200(void)
{
    long result = sysconf(_SC_OPEN_MAX);
    if (result == 0) {
        t_error("%s sysconf want get result is not zero", __func__);
    }
}
static int SysconfTestImpl(int argc, char* argv[])
{
    Sysconf0100();
    Sysconf0200();
    return T_STATUS;
}

int SysconfTest(void)
{
    static char libcProgStub[] = "libc_test";
    char* libcArgvStub[] = { libcProgStub, nullptr };
    return SysconfTestImpl(1, libcArgvStub);
}
