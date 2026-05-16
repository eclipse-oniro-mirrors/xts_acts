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

static mtx_t g_mtx;

/**
 * @tc.name      : mtx_init.
 * @tc.desc      : Verify mtx_init process success when second args is mtx_plain.
 * @tc.desc      : level 0
 */
void MtxInit0100(void)
{
    int32_t ret = 0;
    ret = mtx_init(&g_mtx, mtx_plain);
    EXPECT_EQ("MtxInit0100", ret, thrd_success);
    mtx_destroy(&g_mtx);
}

/**
 * @tc.name      : mtx_init.
 * @tc.desc      : Verify mtx_init process success when second args is mtx_timed.
 * @tc.desc      : level 1
 */
void MtxInit0200(void)
{
    int32_t ret = 0;
    ret = mtx_init(&g_mtx, mtx_timed);
    EXPECT_EQ("MtxInit0200", ret, thrd_success);
    mtx_destroy(&g_mtx);
}

/**
 * @tc.name      : mtx_init.
 * @tc.desc      : Verify mtx_init process success when second args is mtx_plain | mtx_recursive.
 * @tc.desc      : level 0
 */
void MtxInit0300(void)
{
    int32_t ret = 0;
    ret = mtx_init(&g_mtx, mtx_plain | mtx_recursive);
    EXPECT_EQ("MtxInit0300", ret, thrd_success);
    mtx_destroy(&g_mtx);
}

/**
 * @tc.name      : mtx_init.
 * @tc.desc      : Verify mtx_init process success when second args is mtx_timed | mtx_recursive.
 * @tc.desc      : level 0
 */
void MtxInit0400(void)
{
    int32_t ret = 0;
    ret = mtx_init(&g_mtx, mtx_timed | mtx_recursive);
    EXPECT_EQ("MtxInit0400", ret, thrd_success);
    mtx_destroy(&g_mtx);
}

static int MtxInitTestImpl(void)
{
    MtxInit0100();
    MtxInit0200();
    MtxInit0300();
    MtxInit0400();
    return T_STATUS;
}

int MtxInitTest(void)
{
    return MtxInitTestImpl();
}
