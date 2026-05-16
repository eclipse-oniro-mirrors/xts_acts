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

// commit: 59666802fba592a59f2f4ea4dcb053287fd55826 2011-02-15
// pthread_create should return EAGAIN on failure
#include <cerrno>
#include <cstdlib>
#include <cstring>
#include <pthread.h>
#include "libc_common_memfill.h"
#include "libc_test_shim.h"
static void* Start(void* arg)
{
    return SUCCESS_CODE;
}

int PthreadCreateOomTest()
{
    int status = SUCCESS_CODE;

    pthread_t td;
    int r;
    int arg;

    if (T_MEMFILL() < 0) {
        LibcTestError(&status, "memfill failed\n");
    }
    r = pthread_create(&td, nullptr, Start, &arg);
    if (r == 0) {
        LibcTestError(&status, "pthread_create succeeded\n");
    } else if (r != EAGAIN) {
        LibcTestError(&status, "pthread_create should fail with EAGAIN but failed with %d (%s)\n", r, strerror(r));
    }

    _Exit(status);
    return status;
}
