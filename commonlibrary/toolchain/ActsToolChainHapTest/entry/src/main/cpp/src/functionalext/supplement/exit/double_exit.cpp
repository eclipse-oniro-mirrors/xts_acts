/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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
#include "test.h"

static int g_exitNum = 0;
static int g_isRegister = 0;

/**
 * @tc.name      : atexit_0100
 * @tc.desc      : Construct repeated call
 * @tc.level     : Level 0
 */
static void Atexit0100(void)
{
    printf("%s is registered\n", __func__);
}

/**
 * @tc.name      : atexit_0200
 * @tc.desc      : Register atexit_0100 when execute atexit_0200
 * @tc.level     : Level 0
 */
static void Atexit0200(void)
{
    g_exitNum++;
    if (!g_isRegister) {
        int result = atexit(Atexit0100);
        if (result != 0) {
            t_error("atexit_0200 error get result is not 0\n");
        }
        g_isRegister = 1;
    }
}

/**
 * @tc.name      : atexit_0300
 * @tc.desc      : Execute atexit_0300 when exit to check whether atexit_0200 is double-call
 * @tc.level     : Level 0
 */
static void Atexit0300(void)
{
    if (g_exitNum > 1) {
        t_error("exit_num from atexit_0200 error get result is not 1, now is %d\n", g_exitNum);
    }
}

static int DoubleExitTestImpl(int argc, char *argv[])
{
    int result = 0;
    result = atexit(Atexit0300);
    if (result != 0) {
        t_error("atexit_0300 error get result is not 0\n");
    }
    result = atexit(Atexit0200);
    if (result != 0) {
        t_error("atexit_0200 error get result is not 0\n");
    }
    return g_tStatus;
}

int DoubleExitTest(void)
{
    static char libcProg[] = "libc_test";
    char *libcArgv[] = { libcProg, nullptr };
    return DoubleExitTestImpl(1, libcArgv);
}
