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
#include <unistd.h>
#include "test.h"

namespace {
constexpr long K_USLEEP_ELAPSED_SEC_TOLERANCE = 2L;
} // namespace

/**
 * @tc.name      : Usleep0100
 * @tc.desc      : Pause the program for a while with usleep
 * @tc.level     : Level 0
 */
void Usleep0100(void)
{
    struct timespec oldTime;
    clock_gettime(CLOCK_MONOTONIC, &oldTime);
    int result = usleep(2000000);
    struct timespec newTime;
    clock_gettime(CLOCK_MONOTONIC, &newTime);
    if (result != 0) {
        t_error("%s usleep get result is %d is not 0", __func__, result);
    }
    long int difference = newTime.tv_sec - oldTime.tv_sec - 2;
    if (difference > K_USLEEP_ELAPSED_SEC_TOLERANCE) {
        t_error("%s usleep get result is %ld is greater than 2 MS", __func__, difference);
    }
}

static int UsleepTestImpl(int argc, char* argv[])
{
    Usleep0100();
    return T_STATUS;
}

int UsleepTest(void)
{
    static char libcProgStub[] = "libc_test";
    char* libcArgvStub[] = { libcProgStub, nullptr };
    return UsleepTestImpl(1, libcArgvStub);
}
