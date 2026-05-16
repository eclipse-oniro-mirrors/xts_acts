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
#include <pthread.h>
#include "test.h"

static pthread_t g_tid1;

void *ThreadFunc(void *arg)
{
    pthread_t result = pthread_self();
    if (g_tid1 != result) {
        t_error("pthread_self_0100 pthread_self get result is %ld are not want %ld", result, g_tid1);
    }
    return nullptr;
}

/**
 * @tc.name      : PthreadSelf0100
 * @tc.desc      : Verify that the number of threads in the thread library is obtained successfully
 * @tc.level     : Level 0
 */
void PthreadSelf0100(void)
{
    pthread_create(&g_tid1, nullptr, ThreadFunc, nullptr);
    pthread_join(g_tid1, nullptr);
}

static int PthreadSelfTestImpl(int argc, char *argv[])
{
    PthreadSelf0100();
    return g_tStatus;
}

int PthreadSelfTest(void)
{
    static char libcProg[] = "libc_test";
    char *libcArgv[] = { libcProg, nullptr };
    return PthreadSelfTestImpl(1, libcArgv);
}
