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
static volatile int g_count = 0;

static void *Thread1(void *arg)
{
    int ret = pthread_spin_lock(&g_lock);
    EXPECT_EQ("PthreadSpinLock0100", ret, CMPFLAG);
    ++g_count;
    ret = pthread_spin_unlock(&g_lock);
    return const_cast<char *>("success");
}

/**
 * @tc.name      : PthreadSpinLock0100
 * @tc.desc      : Verify that the return value of the calling function is correct
 * @tc.level     : Level 0
 */
void PthreadSpinLock0100(void)
{
    pthread_spinlock_t spin;

    int ret = pthread_spin_init(&spin, PTHREAD_PROCESS_PRIVATE);
    EXPECT_EQ("PthreadSpinLock0100", ret, CMPFLAG);

    ret = pthread_spin_lock(&spin);
    EXPECT_EQ("PthreadSpinLock0100", ret, CMPFLAG);

    ret = pthread_spin_unlock(&spin);
    EXPECT_EQ("PthreadSpinLock0100", ret, CMPFLAG);

    pthread_spin_destroy(&spin);
}

/**
 * @tc.name      : PthreadSpinLock0200
 * @tc.desc      : Verify that under multi-threading, whether the modification of the global variable data is
 *                 as expected, and whether the spin lock is successfully locked
 * @tc.level     : Level 0
 */
void PthreadSpinLock0200(void)
{
    pthread_t thread;
    void *rev;

    int ret = pthread_spin_init(&g_lock, PTHREAD_PROCESS_PRIVATE);

    EXPECT_EQ("PthreadSpinLock0200", ret, CMPFLAG);
    ret = pthread_create(&thread, nullptr, Thread1, nullptr);
    if (ret != 0) {
        EXPECT_EQ("PthreadSpinLock0200", ret, CMPFLAG);
        return;
    }

    ret = pthread_spin_lock(&g_lock);
    EXPECT_EQ("PthreadSpinLock0200", ret, CMPFLAG);

    ++g_count;
    ret = pthread_spin_unlock(&g_lock);

    pthread_join(thread, &rev);
    EXPECT_STREQ("PthreadSpinLock0200", (char *)rev, "success");
    EXPECT_EQ("PthreadSpinLock0200", g_count, EXPECTED_COUNT);

    pthread_spin_destroy(&g_lock);
}

static int PthreadSpinLockTestImpl(void)
{
    PthreadSpinLock0100();
    PthreadSpinLock0200();

    return g_tStatus;
}

int PthreadSpinLockTest(void)
{
    return PthreadSpinLockTestImpl();
}
