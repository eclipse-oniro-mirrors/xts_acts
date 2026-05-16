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

static pthread_spinlock_t g_lock = 0;
static int g_count = 0;

static void *Thread1(void *arg)
{
    int ret = pthread_spin_lock(&g_lock);
    EXPECT_EQ("PthreadSpinUnlock0100", ret, CMPFLAG);
    ++g_count;
    ret = pthread_spin_unlock(&g_lock);
    EXPECT_EQ("PthreadSpinUnlock0100", ret, CMPFLAG);
    EXPECT_EQ("PthreadSpinUnlock0100", g_count, 1);
    return const_cast<char *>("success");
}

/**
 * @tc.name      : PthreadSpinUnlock0100
 * @tc.desc      : Verify that the spin lock releases the lock successfully under multi-threading
 * @tc.level     : Level 0
 */
void PthreadSpinUnlock0100(void)
{
    pthread_t thread;
    void *rev;

    int ret = pthread_spin_init(&g_lock, PTHREAD_PROCESS_PRIVATE);

    EXPECT_EQ("PthreadSpinUnlock0100", ret, CMPFLAG);
    ret = pthread_create(&thread, nullptr, Thread1, nullptr);
    if (ret != 0) {
        EXPECT_EQ("PthreadSpinUnlock0100", ret, CMPFLAG);
        pthread_spin_destroy(&g_lock);
        return;
    }

    pthread_join(thread, &rev);
    EXPECT_STREQ("PthreadSpinUnlock0100", (char *)rev, "success");
    EXPECT_EQ("PthreadSpinUnlock0100", g_count, 1);

    pthread_spin_destroy(&g_lock);
}

static int PthreadSpinUnlockTestImpl(void)
{
    PthreadSpinUnlock0100();
    return g_tStatus;
}

int PthreadSpinUnlockTest(void)
{
    return PthreadSpinUnlockTestImpl();
}
