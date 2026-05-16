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

// commit: 26031da0f83a2a3ed52190077931ee6c18dfd689 2011-02-20
// malloc(0) should return unique pointers
// (often expected and gnulib replaces malloc if malloc(0) returns 0)
#include <cstdlib>
#include "libc_test_shim.h"
int Malloc0Test()
{
    int status = SUCCESS_CODE;

    void* p = malloc(0);
    void* q = malloc(0);
    void* r = malloc(0);
    if (!p || !q || !r) {
        LibcTestError(&status, "malloc(0) returned nullptr\n");
    }
    if (p == q || p == r || q == r) {
        LibcTestError(&status, "malloc(0) returned non-unique pointers: %p, %p, %p\n", p, q, r);
    }
    free(q);
    free(p);
    free(r);
    return status;
}
