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

#include <pthread.h>
#include "test.h"

static pthread_t g_pthd1, g_pthd2;

static void *ThreadFuncA(void *arg)
{
    g_pthd1 = pthread_self();
    return arg;
}

static void *ThreadFuncB(void *arg)
{
    pthread_t pth = pthread_self();
    int ret = pthread_equal(g_pthd1, pth);
    if (ret != 0) {
        t_error("%s two should not equal, ret is %d\n", __func__, ret);
    }
    return arg;
}

static void *ThreadFuncC(void *arg)
{
    int ret = pthread_equal(g_pthd2, pthread_self());
    if (ret == 0) {
        t_error("%s the same thread, the result should be greater than zero, ret = %d\n", __func__, ret);
    }
    return arg;
}

/**
 * @tc.name      : pthread_equal_0100
 * @tc.desc      : Compare two different threads
 * @tc.level     : Level 0
 */
void PthreadEqual0100(void)
{
    pthread_t pthread1;
    pthread_t pthread2;
    int result;

    result = pthread_create(&pthread1, nullptr, ThreadFuncA, nullptr);
    if (result != 0) {
        t_error("%s pthread_create failed\n", __func__);
        return;
    }
    result = pthread_create(&pthread2, nullptr, ThreadFuncB, nullptr);
    if (result != 0) {
        t_error("%s pthread_create failed\n", __func__);
        return;
    }

    result = pthread_join(pthread1, nullptr);
    if (result != 0) {
        t_error("%s pthread_join failed, result is %d\n", __func__, result);
    }
    pthread_join(pthread2, nullptr);
    if (result != 0) {
        t_error("%s pthread_join failed, result is %d\n", __func__, result);
    }
}

/**
 * @tc.name      : pthread_equal_0200
 * @tc.desc      : Compare the same thread
 * @tc.level     : Level 0
 */
void PthreadEqual0200(void)
{
    int result;

    result = pthread_create(&g_pthd2, nullptr, ThreadFuncC, nullptr);
    if (result != 0) {
        t_error("%s pthread_create failed\n", __func__);
        return;
    }

    result = pthread_join(g_pthd2, nullptr);
    if (result != 0) {
        t_error("%s pthread_join failed, result is %d\n", __func__, result);
    }
}

static int PthreadEqualTestImpl(int argc, char *argv[])
{
    PthreadEqual0100();
    PthreadEqual0200();
    return g_tStatus;
}

int PthreadEqualTest(void)
{
    static char libcProg[] = "libc_test";
    char *libcArgv[] = { libcProg, nullptr };
    return PthreadEqualTestImpl(1, libcArgv);
}

