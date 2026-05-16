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

const gid_t FSGID = 1;
const gid_t INVALID_FSGID = -1;

/**
 * @tc.name      : Setfsgid0100
 * @tc.desc      : set group identity used for filesystem checks
 * @tc.level     : Level 0
 */
void Setfsgid0100(void)
{
    int result = setfsgid(FSGID);
    if (result < 0) {
        t_error("%s failed: result = %d\n", __func__, result);
    }

    result = setfsgid(result);
    if (result != FSGID) {
        t_error("%s failed: result = %d\n", __func__, result);
    }
}

/**
 * @tc.name      : Setfsgid0200
 * @tc.desc      : set an invalid group identity used for filesystem checks
 * @tc.level     : Level 2
 */
void Setfsgid0200(void)
{
    int result = setfsgid(INVALID_FSGID);
    if (result < 0) {
        t_error("%s failed: result = %d\n", __func__, result);
    }

    result = setfsgid(result);
    if (result == FSGID) {
        t_error("%s failed: result = %d\n", __func__, result);
    }
}

static int SetfsgidTestImpl(int argc, char* argv[])
{
    (void)argc;
    (void)argv;
    return T_STATUS;
}

int SetfsgidTest(void)
{
    static char libcProgStub[] = "libc_test";
    char* libcArgvStub[] = { libcProgStub, nullptr };
    return SetfsgidTestImpl(1, libcArgvStub);
}
