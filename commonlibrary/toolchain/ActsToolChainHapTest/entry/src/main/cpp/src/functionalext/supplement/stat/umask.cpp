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
#include <sys/stat.h>

#include "test.h"

/**
 * @tc.name      : Umask0100
 * @tc.desc      : set file mode creation mask
 * @tc.level     : Level 0
 */
void Umask0100(void)
{
    mode_t mode = S_IRWXU | S_IRWXG | S_IRWXO;
    mode_t result = umask(mode);

    result = umask(result);
    if (result != mode) {
        t_error("%s failed: result = %o\n", __func__, result);
    }
}

/**
 * @tc.name      : Umask0200
 * @tc.desc      : set an invalid file mode creation mask
 * @tc.level     : Level 2
 */
void Umask0200(void)
{
    mode_t mode = -1;
    mode_t result = umask(mode);

    result = umask(result);
    if (result == mode) {
        t_error("%s failed: result = %o\n", __func__, result);
    }
}

static int UmaskTestImpl(int argc, char* argv[])
{
    Umask0100();
    Umask0200();

    return T_STATUS;
}

int UmaskTest(void)
{
    static char libcProgStub[] = "libc_test";
    char* libcArgvStub[] = { libcProgStub, nullptr };
    return UmaskTestImpl(1, libcArgvStub);
}
