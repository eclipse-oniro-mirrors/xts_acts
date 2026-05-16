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
#include <cstdlib>
#include <threads.h>
#include "functionalext.h"

static char g_list[100];
static char g_buf[12] = "called once";
void DoOnce(void)
{
    FILE *fp = fopen("/data/storage/el2/base/cache/call_once.txt", "a+");
    (void)fwrite(g_buf, sizeof(char), strlen(g_buf), fp);
    (void)fclose(fp);
    FILE *fp2 = fopen("/data/storage/el2/base/cache/call_once.txt", "r");
    (void)fread(g_list, sizeof(g_list), 1, fp2);
    (void)fclose(fp2);
}
static once_flag g_flag = ONCE_FLAG_INIT;
static void Func(void *data)
{
    call_once(&g_flag, DoOnce);
}

/**
 * @tc.name      : CallOnce0100
 * @tc.desc      : Each parameter is valid, and the function func is called only once.
 * @tc.level     : Level 0
 */
void CallOnce0100(void)
{
    EXPECT_EQ("CallOnce0100", strcmp(g_list, g_buf), 0);
}

int CallOnceTest(void)
{
    thrd_t t1;
    thrd_t t2;
    thrd_t t3;
    thrd_t t4;
    (void)thrd_create(&t1, reinterpret_cast<thrd_start_t>(Func), nullptr);
    (void)thrd_create(&t2, reinterpret_cast<thrd_start_t>(Func), nullptr);
    (void)thrd_create(&t3, reinterpret_cast<thrd_start_t>(Func), nullptr);
    (void)thrd_create(&t4, reinterpret_cast<thrd_start_t>(Func), nullptr);
    (void)thrd_join(t1, nullptr);
    (void)thrd_join(t2, nullptr);
    (void)thrd_join(t3, nullptr);
    (void)thrd_join(t4, nullptr);
    CallOnce0100();
    (void)remove("/data/storage/el2/base/cache/call_once.txt");
    memset(g_list, 0x00, sizeof(g_list));
    return g_tStatus;
}