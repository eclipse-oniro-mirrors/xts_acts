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

// malloc should set errno on oom
#include <cerrno>
#include <cstdlib>
#include <cstring>
#include "libc_common_memfill.h"
#include "libc_test_shim.h"

constexpr size_t MALLOC_OOM_SIZE = 50000;

int MallocOomTest()
{
    int status = SUCCESS_CODE;

    if (T_MEMFILL() < 0) {
        LibcTestError(&status, "memfill failed\n");
    }

    errno = 0;
    if (malloc(MALLOC_OOM_SIZE)) {
        LibcTestError(&status, "malloc was successful\n");
    }
    if (errno != ENOMEM) {
        LibcTestError(&status, "expected ENOMEM, got %s\n", strerror(errno));
    }

    _Exit(status);
    return status;
}

int MallocOomTestCompat()
{
    return MallocOomTest();
}
