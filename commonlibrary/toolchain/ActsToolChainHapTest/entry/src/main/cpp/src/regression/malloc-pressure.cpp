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

#include <ctime>
#include <malloc.h>
#include "libc_test_shim.h"
#define SIZE_ALIGN (4 * sizeof(size_t))
#define THRESHOLD (0x1c00 * SIZE_ALIGN)
#define ITER_TIME 20

int MallocPressureTest()
{
    int status = SUCCESS_CODE;

    struct timespec ts[2];

    clock_gettime(CLOCK_REALTIME, &ts[0]);
    for (int i = 0; i < ITER_TIME; ++i) {
        for (size_t size = 0; size < THRESHOLD; size += SIZE_ALIGN + 1) {
            void* ptr = malloc(size);
            if (!ptr) {
                LibcTestError(&status, "Malloc failed for size %u\n", size);
                return -1;
            }
            free(ptr);
        }
    }

    return status;
}
