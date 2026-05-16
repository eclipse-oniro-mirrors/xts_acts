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
#include <threads.h>
#include "functionalext.h"

#define SUCCESS_CODE (0)
#define SLEEP_SECONDS (2)

static mtx_t g_mtx;
static cnd_t g_cnd;
void CndWaitFirst(void *arg)
{
    int res = -1;
    (void)mtx_lock(&g_mtx);
    res = cnd_wait(&g_cnd, &g_mtx);
    EXPECT_EQ("CndWait0100", res, thrd_success);
    (void)mtx_unlock(&g_mtx);
}

/**
 * @tc.name      : CndWait0100
 * @tc.desc      : The parameter is valid and can block the calling thread and release the specified mutex
 * @tc.level     : Level 0
 */
void CndWait0100(void)
{
    thrd_t id1;
    int ret;
    (void)cnd_init(&g_cnd);
    (void)mtx_init(&g_mtx, 0);
    ret = thrd_create(&id1, reinterpret_cast<thrd_start_t>(CndWaitFirst), reinterpret_cast<void *>(1));
    EXPECT_EQ("CndWait0100", ret, SUCCESS_CODE);
    sleep(SLEEP_SECONDS);
    (void)mtx_lock(&g_mtx);
    (void)cnd_signal(&g_cnd);
    (void)mtx_unlock(&g_mtx);
    (void)thrd_join(id1, nullptr);
    cnd_destroy(&g_cnd);
    mtx_destroy(&g_mtx);
}

static int CndWaitTestWithArgs(int argc, char *argv[])
{
    CndWait0100();
    return g_tStatus;
}

int CndWaitTest(void)
{
    static char libcProg[] = "libc_test";
    char *libcArgv[] = { libcProg, nullptr };
    return CndWaitTestWithArgs(1, libcArgv);
}
