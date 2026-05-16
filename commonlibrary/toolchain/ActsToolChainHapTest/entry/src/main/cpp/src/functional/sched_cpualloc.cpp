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

// sched_cpualloc(0) should return unique pointers
// (often expected and gnulib replaces sched_cpualloc if sched_cpualloc(0) returns 0)
#include <cstdlib>
#include <sched.h>
#include "libc_test_shim.h"
int SchedCpuallocTest()
{
    int status = SUCCESS_CODE;

    cpu_set_t* p = __sched_cpualloc(0);
    cpu_set_t* q = __sched_cpualloc(0);
    cpu_set_t* r = __sched_cpualloc(0);
    if (!p || !q || !r) {
        LibcTestError(&status, "sched_cpualloc(0) returned nullptr\n");
    }
    if (p == q || p == r || q == r) {
        LibcTestError(&status, "sched_cpualloc(0) returned non-unique pointers: %p, %p, %p\n", p, q, r);
    }
    free(q);
    free(p);
    free(r);
    return status;
}
