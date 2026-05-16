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

#include <cstdio>
#include <ctime>
#include "test.h"
#include "time64_functions.h"

#define NANOSECOND (1000000000)

/**
 * @tc.name      : timespec_get_0100
 * @tc.desc      : Base is not TIME_UTC
 * @tc.level     : Level 0
 */
void TimespecGet0100(void)
{
    struct timespec ts;
    int result = timespec_get(&ts, 0);
    if (result != 0) {
        t_error("%s timespec_get failed, result is %d", __func__, result);
    }
}

/**
 * @tc.name      : timespec_get_0200
 * @tc.desc      : Base is TIME_UTC
 * @tc.level     : Level 1
 */
void TimespecGet0200(void)
{
    struct timespec ts;
    int result = timespec_get(&ts, TIME_UTC);
    if (result != TIME_UTC) {
        t_error("%s timespec_get failed, result is %d", __func__, result);
    }
    if (ts.tv_nsec < 0 || ts.tv_nsec >= NANOSECOND) {
        t_error("%s ts invalid", __func__);
    }
}

/**
 * @tc.name      : timespec_get_time64_0200
 * @tc.desc      : Base is TIME_UTC
 * @tc.level     : Level 1
 */
void TimespecGetTime640200(void)
{
    struct timespec ts;
    int result = TimespecGetTime64(&ts, TIME_UTC);
    if (result != TIME_UTC) {
        t_error("%s __timespec_get_time64 failed, result is %d", __func__, result);
    }
    if (ts.tv_nsec < 0 || ts.tv_nsec >= NANOSECOND) {
        t_error("%s ts invalid", __func__);
    }
}

static int TimespecGetTestImpl(int argc, char *argv[])
{
    TimespecGet0100();
    TimespecGet0200();
    TimespecGetTime640200();
    return T_STATUS;
}

int TimespecGetTest(void)
{
    static char libcProg[] = "libc_test";
    char *libcArgv[] = { libcProg, nullptr };
    return TimespecGetTestImpl(1, libcArgv);
}
