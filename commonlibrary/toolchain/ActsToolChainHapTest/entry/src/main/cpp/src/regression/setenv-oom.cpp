/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
#include <cstring>
#include <sys/resource.h>
#include "libc_common_memfill.h"
#include "libc_test_shim.h"
int SetenvOomTest()
{
    int status = SUCCESS_CODE;

    char buf[10000];

    if (T_MEMFILL() < 0) {
        LibcTestError(&status, "memfill failed\n");
    }

    memset(buf, 'x', sizeof buf);
    buf[sizeof buf - 1] = 0;

    errno = 0;
    if (setenv("TESTVAR", buf, 1) != -1) {
        return status;
    }
    if (errno != ENOMEM) {
        LibcTestError(&status, "expected ENOMEM, got %s\n", strerror(errno));
    }

    _Exit(status);
    return status;
}

int SetenvOomTestCompat()
{
    return SetenvOomTest();
}
