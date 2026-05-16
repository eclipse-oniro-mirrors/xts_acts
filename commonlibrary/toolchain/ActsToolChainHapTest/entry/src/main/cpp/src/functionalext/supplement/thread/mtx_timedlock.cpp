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
#include <threads.h>
#include <cstdio>
#include <cstdlib>
#include "functionalext.h"
#include "time64_functions.h"

const int TWO = 2;

/**
 * @tc.name      : MtxTimedlock0100
 * @tc.desc      : Provide correct parameters, test timeout and lock
 * @tc.level     : Level 0
 */
void MtxTimedlock0100(void)
{
    struct timespec timeout;
    timeout.tv_sec = TWO;
    timeout.tv_nsec = 0;
    mtx_t mutex;
    int ret = 0;
    ret = mtx_init(&mutex, mtx_timed);
    if (ret != thrd_success) {
        t_error("%s mtx_init failed", __func__);
        return;
    }
    ret = mtx_timedlock(&mutex, &timeout);
    EXPECT_EQ("MtxTimedlock0100", ret, thrd_success);
    ret = mtx_unlock(&mutex);
    if (ret != thrd_success) {
        t_error("%s mtx_unlock failed", __func__);
        return;
    }
    mtx_destroy(&mutex);
}

/**
 * @tc.name      : MtxTimedlock0200
 * @tc.desc      : In the locked state, the test times out and locks
 * @tc.level     : Level 2
 */
void MtxTimedlock0200(void)
{
    mtx_t mutex;
    struct timespec timeout;
    timeout.tv_sec = TWO;
    timeout.tv_nsec = 0;
    int ret = 0;
    ret = mtx_init(&mutex, mtx_timed);
    if (ret != thrd_success) {
        t_error("%s mtx_init failed", __func__);
        return;
    }
    if (ret != thrd_success) {
        t_error("%s mtx_init failed", __func__);
        return;
    }
    ret = mtx_lock(&mutex);
    ret = mtx_timedlock(&mutex, &timeout);
    EXPECT_EQ("MtxTimedlock0200", ret, thrd_timedout);
    ret = mtx_unlock(&mutex);
    if (ret != thrd_success) {
        t_error("%s mtx_unlock failed", __func__);
        return;
    }
    mtx_destroy(&mutex);
}

/**
 * @tc.name      : MtxTimedlockTime640100
 * @tc.desc      : Provide correct parameters, test timeout and lock
 * @tc.level     : Level 0
 */
void MtxTimedlockTime640100(void)
{
    struct timespec timeout;
    timeout.tv_sec = TWO;
    timeout.tv_nsec = 0;
    mtx_t mutex;
    int ret = 0;
    ret = mtx_init(&mutex, mtx_timed);
    if (ret != thrd_success) {
        t_error("%s mtx_init failed", __func__);
        return;
    }
    ret = MtxTimedlockTime64(&mutex, &timeout);
    EXPECT_EQ("MtxTimedlockTime640100", ret, thrd_success);
    ret = mtx_unlock(&mutex);
    if (ret != thrd_success) {
        t_error("%s mtx_unlock failed", __func__);
        return;
    }
    mtx_destroy(&mutex);
}

static int MtxTimedlockTestImpl(void)
{
    MtxTimedlock0100();
    MtxTimedlock0200();
    MtxTimedlockTime640100();
    return g_tStatus;
}

int MtxTimedlockTest(void)
{
    return MtxTimedlockTestImpl();
}
