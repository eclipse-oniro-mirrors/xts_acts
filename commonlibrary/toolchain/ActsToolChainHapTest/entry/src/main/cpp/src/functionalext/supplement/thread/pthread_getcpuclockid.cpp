/**
 * Copyright (c) 2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include <pthread.h>
#include <sched.h>
#include <unistd.h>
#include "functionalext.h"

int g_gthreadExitFlag = 0;
static void* ThreadFunc(void* arg)
{
    while (!g_gthreadExitFlag) {
        sched_yield();
    }
    return nullptr;
}

/**
 * @tc.name      : PthreadGetcpuclockid0100
 * @tc.desc      : Get the specified thread clock ID
 * @tc.level     : Level 0
 */
void PthreadGetcpuclockid0100(void)
{
    pthread_t thread;
    clockid_t cid;
    int ret = pthread_create(&thread, nullptr, ThreadFunc, nullptr);
    EXPECT_EQ("PthreadGetcpuclockid0100", ret, 0);
    ret = pthread_getcpuclockid(pthread_self(), &cid);
    EXPECT_EQ("PthreadGetcpuclockid0100", ret, 0);
    EXPECT_TRUE("PthreadGetcpuclockid0100", cid != 0);

    ret = pthread_getcpuclockid(thread, &cid);
    EXPECT_EQ("PthreadGetcpuclockid0100", ret, 0);
    EXPECT_TRUE("PthreadGetcpuclockid0100", cid != 0);
    g_gthreadExitFlag = 1;
    (void)pthread_join(thread, nullptr);
}

static int PthreadGetcpuclockidTestImpl(void)
{
    PthreadGetcpuclockid0100();
    return T_STATUS;
}

int PthreadGetcpuclockidTest(void)
{
    return PthreadGetcpuclockidTestImpl();
}
