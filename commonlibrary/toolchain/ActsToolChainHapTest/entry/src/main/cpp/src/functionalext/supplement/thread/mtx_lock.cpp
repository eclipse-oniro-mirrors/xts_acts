/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
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

#include <cstdlib>
#include <threads.h>
#include <unistd.h>
#include "functionalext.h"

static mtx_t g_mtex;

static int ThreadfuncA(void* arg)
{
    int32_t ret = 0;
    ret = mtx_lock(&g_mtex);
    EXPECT_EQ("MtxLock0100", ret, thrd_success);
    ret = mtx_unlock(&g_mtex);
    EXPECT_EQ("MtxLock0100", ret, thrd_success);
    return 0;
}

static int ThreadfuncB(void* arg)
{
    int32_t ret = 0;
    ret = mtx_lock(&g_mtex);
    EXPECT_EQ("MtxLock0200", ret, thrd_success);
    ret = mtx_unlock(&g_mtex);
    EXPECT_EQ("MtxLock0200", ret, thrd_success);
    return 0;
}

static int ThreadfuncC(void* arg)
{
    int32_t ret = 0;
    ret = mtx_lock(&g_mtex);
    EXPECT_EQ("MtxLock0300", ret, thrd_success);
    ret = mtx_unlock(&g_mtex);
    EXPECT_EQ("MtxLock0300", ret, thrd_success);
    return 0;
}

static int ThreadfuncD(void* arg)
{
    int32_t ret = 0;
    ret = mtx_lock(&g_mtex);
    EXPECT_EQ("MtxLock0400", ret, thrd_success);
    ret = mtx_unlock(&g_mtex);
    EXPECT_EQ("MtxLock0400", ret, thrd_success);
    return 0;
}

static int ThreadfuncE(void* arg)
{
    int32_t ret = 0;
    ret = mtx_lock(&g_mtex);
    ret = mtx_lock(&g_mtex);
    EXPECT_EQ("MtxLock0500", ret, thrd_success);
    ret = mtx_unlock(&g_mtex);
    EXPECT_EQ("MtxLock0500", ret, thrd_success);
    return 0;
}

/**
 * @tc.name      : MtxLock0100
 * @tc.desc      : Verify process mtx_lock success when mtx_init second args is mtx_plain.
 * @tc.level     : Level 0
 */
void MtxLock0100(void)
{
    int result = mtx_init(&g_mtex, mtx_plain);
    if (result != thrd_success) {
        t_error("%s mtx_init failed", __func__);
        return;
    }
    thrd_t tid1;
    result = thrd_create(&tid1, ThreadfuncA, nullptr);
    if (result != thrd_success) {
        t_error("%s thrd_create failed", __func__);
        return;
    }
    result = thrd_join(tid1, nullptr);
    if (result != thrd_success) {
        t_error("%s thrd_join failed", __func__);
        return;
    }
}

/**
 * @tc.name      : MtxLock0200
 * @tc.desc      : Verify process mtx_lock success when mtx_init second args is mtx_timed.
 * @tc.level     : Level 0
 */
void MtxLock0200(void)
{
    int result = mtx_init(&g_mtex, mtx_timed);
    if (result != thrd_success) {
        t_error("%s mtx_init failed", __func__);
        return;
    }
    thrd_t tid2;
    result = thrd_create(&tid2, ThreadfuncB, nullptr);
    if (result != thrd_success) {
        t_error("%s thrd_create failed", __func__);
        return;
    }
    result = thrd_join(tid2, nullptr);
    if (result != thrd_success) {
        t_error("%s thrd_join failed", __func__);
        return;
    }
}

/**
 * @tc.name      : MtxLock0300
 * @tc.desc      : Verify process mtx_lock success when mtx_plain second args is mtx_plain | mtx_recursive.
 * @tc.level     : Level 0
 */
void MtxLock0300(void)
{
    int result = mtx_init(&g_mtex, mtx_plain | mtx_recursive);
    if (result != thrd_success) {
        t_error("%s mtx_init failed", __func__);
        return;
    }
    thrd_t tid3;
    result = thrd_create(&tid3, ThreadfuncC, nullptr);
    if (result != thrd_success) {
        t_error("%s thrd_create failed", __func__);
        return;
    }
    result = thrd_join(tid3, nullptr);
    if (result != thrd_success) {
        t_error("%s thrd_join failed", __func__);
        return;
    }
}

/**
 * @tc.name      : MtxLock0400
 * @tc.desc      : Verify process mtx_lock success when mtx_plain second args is mtx_timed | mtx_recursive.
 * @tc.level     : Level 0
 */
void MtxLock0400(void)
{
    int result = mtx_init(&g_mtex, mtx_timed | mtx_recursive);
    if (result != thrd_success) {
        t_error("%s mtx_init failed", __func__);
        return;
    }
    thrd_t tid4;
    result = thrd_create(&tid4, ThreadfuncD, nullptr);
    if (result != thrd_success) {
        t_error("%s thrd_create failed", __func__);
        return;
    }
    result = thrd_join(tid4, nullptr);
    if (result != thrd_success) {
        t_error("%s thrd_join failed", __func__);
        return;
    }
}

/**
 * @tc.name      : MtxLock0500
 * @tc.desc      : Verify process mtx_lock twice success when mtx_plain second args is mtx_plain | mtx_recursive.
 * @tc.level     : Level 1
 */
void MtxLock0500(void)
{
    int result = mtx_init(&g_mtex, mtx_plain | mtx_recursive);
    if (result != thrd_success) {
        t_error("%s mtx_init failed", __func__);
        return;
    }
    thrd_t tid5;
    result = thrd_create(&tid5, ThreadfuncE, nullptr);
    if (result != thrd_success) {
        t_error("%s thrd_create failed", __func__);
        return;
    }
    result = thrd_join(tid5, nullptr);
    if (result != thrd_success) {
        t_error("%s thrd_join failed", __func__);
        return;
    }
}

static int MtxLockTestImpl(void)
{
    MtxLock0100();
    MtxLock0200();
    MtxLock0300();
    MtxLock0400();
    MtxLock0500();
    return T_STATUS;
}

int MtxLockTest(void)
{
    return MtxLockTestImpl();
}
