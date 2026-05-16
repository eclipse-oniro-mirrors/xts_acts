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

#include <sys/fsuid.h>

#include "test.h"

const gid_t FSUID = 1;
const gid_t INVALID_FSUID = -1;

/**
 * @tc.name      : Setfsuid0100
 * @tc.desc      : set user identity used for filesystem checks
 * @tc.level     : Level 0
 */
void Setfsuid0100(void)
{
    int result = setfsuid(FSUID);
    if (result < 0) {
        t_error("%s failed: result = %d\n", __func__, result);
    }

    result = setfsuid(result);
    if (result != FSUID) {
        t_error("%s failed: result = %d\n", __func__, result);
    }
}

/**
 * @tc.name      : Setfsuid0200
 * @tc.desc      : set aninvalid user identity used for filesystem checks
 * @tc.level     : Level 2
 */
void Setfsuid0200(void)
{
    int result = setfsuid(INVALID_FSUID);
    if (result < 0) {
        t_error("%s failed: result = %d\n", __func__, result);
    }

    result = setfsuid(result);
    if (result == FSUID) {
        t_error("%s failed: result = %d\n", __func__, result);
    }
}

static int SetfsuidTestImpl(int argc, char* argv[])
{
    (void)argc;
    (void)argv;
    return T_STATUS;
}

int SetfsuidTest(void)
{
    static char libcProgStub[] = "libc_test";
    char* libcArgvStub[] = { libcProgStub, nullptr };
    return SetfsuidTestImpl(1, libcArgvStub);
}
