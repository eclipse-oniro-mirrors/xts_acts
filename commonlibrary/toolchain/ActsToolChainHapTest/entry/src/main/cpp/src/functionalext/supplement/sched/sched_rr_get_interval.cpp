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
#include <dlfcn.h>
#include <sched.h>

#include "test.h"

using SchedRrGetInterval64Func = int (*)(pid_t, struct timespec*);
constexpr const char* SCHED_RR_GET_INTERVAL64_SYMBOL = "__sched_rr_get_interval_time64";
/**
 * @tc.name      : sched_rr_get_interval_0100
 * @tc.desc      : get the SCHED_RR interval for the named process
 * @tc.level     : Level 0
 */
void SchedRrGetInterval0100(void)
{
    pid_t pid = getpid();
    struct timespec ts = { 0 };

    errno = 0;
    int result = sched_rr_get_interval(pid, &ts);
    if (result != 0 || errno != 0) {
        t_error("%s failed: result = %d\n", __func__, result);
        t_error("%s failed: errno = %d\n", __func__, errno);
    }

    if (ts.tv_sec < 0 || ts.tv_nsec < 0) {
        t_error("%s failed: ts.tv_sec = %ld\n", __func__, ts.tv_sec);
        t_error("%s failed: ts.tv_nsec = %ld\n", __func__, ts.tv_nsec);
    }
}

/**
 * @tc.name      : sched_rr_get_interval_0200
 * @tc.desc      : get the SCHED_RR interval for an invalid process
 * @tc.level     : Level 2
 */
void SchedRrGetInterval0200(void)
{
    pid_t pid = -1;
    struct timespec ts = { 0 };

    errno = 0;
    int result = sched_rr_get_interval(pid, &ts);
    if (result == 0 || errno == 0) {
        t_error("%s failed: result = %d\n", __func__, result);
        t_error("%s failed: errno = %d\n", __func__, errno);
    }
}

/**
 * @tc.name      : sched_rr_get_interval_time64_0100
 * @tc.desc      : get the SCHED_RR interval for the named process
 * @tc.level     : Level 0
 */
void SchedRrGetIntervalTime640100(void)
{
    SchedRrGetInterval64Func schedRrGetInterval64 =
        reinterpret_cast<SchedRrGetInterval64Func>(dlsym(RTLD_DEFAULT, SCHED_RR_GET_INTERVAL64_SYMBOL));
    if (schedRrGetInterval64 == nullptr) {
        t_error("%s failed: dlsym __sched_rr_get_interval_time64 failed\n", __func__);
        return;
    }
    pid_t pid = getpid();
    struct timespec ts = { 0 };

    errno = 0;
    int result = schedRrGetInterval64(pid, &ts);
    if (result != 0 || errno != 0) {
        t_error("%s failed: result = %d\n", __func__, result);
        t_error("%s failed: errno = %d\n", __func__, errno);
    }

    if (ts.tv_sec < 0 || ts.tv_nsec < 0) {
        t_error("%s failed: ts.tv_sec = %ld\n", __func__, ts.tv_sec);
        t_error("%s failed: ts.tv_nsec = %ld\n", __func__, ts.tv_nsec);
    }
}

static int SchedRrGetIntervalTestImpl(int argc, char* argv[])
{
    SchedRrGetInterval0100();
    SchedRrGetInterval0200();
    SchedRrGetIntervalTime640100();
    return T_STATUS;
}

int SchedRrGetIntervalTest(void)
{
    static char libcProg[] = "libc_test";
    char* libcArgv[] = { libcProg, nullptr };
    return SchedRrGetIntervalTestImpl(1, libcArgv);
}
