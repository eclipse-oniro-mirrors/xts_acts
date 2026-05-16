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

#include <ctime>
#include <threads.h>
#include "test.h"

namespace {
constexpr double K_YIELD_MIN_MICROSECONDS = 100.0;
} // namespace

#define MS (1000.0)
#define US (1000000)
#define NS (1000000000L)

double Ustimer(struct timespec tss, struct timespec tse)
{
    double sd = difftime(tse.tv_sec, tss.tv_sec);
    long nsd = tse.tv_nsec - tss.tv_nsec;
    if (nsd < 0) {
        return US * (sd - 1) + (NS + nsd) / MS;
    } else {
        return US * (sd) + nsd / MS;
    }
}

void Yieldfunc(void)
{
    struct timespec tss;
    struct timespec tse;
    (void)timespec_get(&tss, TIME_UTC);
    do {
        thrd_yield();
        (void)timespec_get(&tse, TIME_UTC);
    } while (Ustimer(tss, tse) < K_YIELD_MIN_MICROSECONDS);
}

/**
 * @tc.name      : ThrdYield0100
 * @tc.desc      : Busy wait while yielding
 * @tc.level     : Level 0
 */
void ThrdYield0100(void)
{
    int result;
    struct timespec tss;
    struct timespec tse;

    result = timespec_get(&tss, TIME_UTC);
    if (result != TIME_UTC) {
        t_error("%s timespec_get start failed", __func__);
        return;
    }

    Yieldfunc();

    result = timespec_get(&tse, TIME_UTC);
    if (result != TIME_UTC) {
        t_error("%s timespec_get end failed", __func__);
        return;
    }

    if ((Ustimer(tss, tse) - K_YIELD_MIN_MICROSECONDS) < 0) {
        t_error("%s sleep time is not 100us", __func__);
        return;
    }
}

static int ThrdYieldTestImpl(int argc, char* argv[])
{
    ThrdYield0100();
    return T_STATUS;
}

int ThrdYieldTest(void)
{
    static char libcProgStub[] = "libc_test";
    char* libcArgvStub[] = { libcProgStub, nullptr };
    return ThrdYieldTestImpl(1, libcArgvStub);
}
