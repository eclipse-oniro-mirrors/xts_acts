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
#include <unistd.h>
#include "functionalext.h"

#define EXPECTED_COUNT (2)

static pthread_spinlock_t g_lock = 0;
static int g_count = 0;

static void *Thread1Func(void *arg)
{
    int ret = pthread_spin_trylock(&g_lock);
    EXPECT_EQ("PthreadSpinTrylock0100", ret, CMPFLAG);
    ++g_count;
    ret = pthread_spin_unlock(&g_lock);
    return const_cast<char *>("success");
}

static void *Thread2Func(void *arg)
{
    int ret = pthread_spin_lock(&g_lock);
    EXPECT_EQ("PthreadSpinTrylock0200", ret, CMPFLAG);

    ret = pthread_spin_trylock(&g_lock);
    EXPECT_EQ("PthreadSpinTrylock0200", ret, EBUSY);
    ret = pthread_spin_unlock(&g_lock);
    return const_cast<char *>("success");
}

/**
 * @tc.name      : PthreadSpinTrylock0100
 * @tc.desc      : Verify that the attempt to lock is successful under multi-threading(success)
 * @tc.level     : Level 0
 */
void PthreadSpinTrylock0100(void)
{
    pthread_t thread;
    void *rev;

    int ret = pthread_spin_init(&g_lock, PTHREAD_PROCESS_PRIVATE);

    EXPECT_EQ("PthreadSpinTrylock0100", ret, CMPFLAG);
    ret = pthread_create(&thread, nullptr, Thread1Func, nullptr);
    if (ret != 0) {
        EXPECT_EQ("PthreadSpinTrylock0100", ret, CMPFLAG);
        return;
    }

    ret = pthread_spin_lock(&g_lock);
    EXPECT_EQ("PthreadSpinTrylock0100", ret, CMPFLAG);

    ++g_count;
    ret = pthread_spin_unlock(&g_lock);

    pthread_join(thread, &rev);
    EXPECT_STREQ("PthreadSpinTrylock0100", static_cast<char *>(rev), "success");
    EXPECT_EQ("PthreadSpinTrylock0100", g_count, EXPECTED_COUNT);
}

/**
 * @tc.name      : PthreadSpinTrylock0200
 * @tc.desc      : Verify that the attempt to lock is successful under multi-threading(failed)
 * @tc.level     : Level 2
 */
void PthreadSpinTrylock0200(void)
{
    pthread_t thread;
    void *rev;

    int ret = pthread_spin_init(&g_lock, PTHREAD_PROCESS_PRIVATE);

    EXPECT_EQ("PthreadSpinTrylock0200", ret, CMPFLAG);
    ret = pthread_create(&thread, nullptr, Thread2Func, nullptr);
    if (ret != 0) {
        EXPECT_EQ("PthreadSpinTrylock0200", ret, CMPFLAG);
        return;
    }

    pthread_join(thread, &rev);
    pthread_spin_destroy(&g_lock);
}

static int PthreadSpinTrylockTestImpl(void)
{
    PthreadSpinTrylock0100();
    PthreadSpinTrylock0200();

    return g_tStatus;
}

int PthreadSpinTrylockTest(void)
{
    return PthreadSpinTrylockTestImpl();
}
