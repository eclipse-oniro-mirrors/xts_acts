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
#include <cstdio>
#include <cstring>
#include <sched.h>
#include <unistd.h>
#include "libc_test_shim.h"

static void CheckZeroResult(int& status, int rc, const char* call)
{
    if (rc != 0) {
        LibcTestError(&status, "%s failed: %s", call, strerror(errno));
    }
}

namespace {
constexpr int K_SCHED_FIFO_TEST_PRIORITY = 23;
} // namespace

int SchedSetschedulerTest()
{
    int status = SUCCESS_CODE;

    struct sched_param param;
    int maxpri;
    int minpri;
    int sched;
    pid_t pid;

    sched = SCHED_FIFO;
    pid = getpid();
    maxpri = sched_get_priority_max(sched);
    minpri = sched_get_priority_min(sched);
    if (maxpri == -1 || minpri == -1) {
        perror("get maxpriority or minpriority failed");
        return -1;
    }
    param.sched_priority = K_SCHED_FIFO_TEST_PRIORITY; // 取值范围:minpri~maxpri
    CheckZeroResult(status, sched_setscheduler(pid, sched, &param), "sched_setscheduler");
    CheckZeroResult(status, !(sched_getscheduler(pid) == sched), "sched_getscheduler");
    CheckZeroResult(status, sched_getparam(pid, &param), "sched_getparam");

    return SUCCESS_CODE;
}
