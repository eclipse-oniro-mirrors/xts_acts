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

#include <dlfcn.h>
#include <cstdio>
#include <cstring>
#include "functionalext.h"

typedef void (*TEST_FUN)();

/**
 * @tc.name      : Asprintf0100
 * @tc.desc      : The parameters are valid and the data can be output according to the format
 * @tc.level     : Level 0
 */
void Asprintf0100(void)
{
    char *buf = "d";
    char *testStr = nullptr;
    int n = asprintf(&testStr, "%s", buf);
    free(testStr);
    testStr = nullptr;
    EXPECT_TRUE("asprintf_0100", n > 0);
}

/**
 * @tc.name      : asprintf_0200
 * @tc.desc      : The parameters are valid and the data can be output according to the format
 * @tc.level     : Level 0
 */
void Asprintf0200(void)
{
    char *buf = "o";
    char *testStr = nullptr;
    int n = asprintf(&testStr, "%s", buf);
    free(testStr);
    testStr = nullptr;
    EXPECT_TRUE("asprintf_0200", n > 0);
}

/**
 * @tc.name      : asprintf_0300
 * @tc.desc      : The parameters are valid and the data can be output according to the format
 * @tc.level     : Level 0
 */
void Asprintf0300(void)
{
    char *buf = "x,X";
    char *testStr = nullptr;
    int n = asprintf(&testStr, "%s", buf);
    free(testStr);
    testStr = nullptr;
    EXPECT_TRUE("asprintf_0300", n > 0);
}

/**
 * @tc.name      : asprintf_0400
 * @tc.desc      : The parameters are valid and the data can be output according to the format
 * @tc.level     : Level 0
 */
void Asprintf0400(void)
{
    char *buf = "u";
    char *testStr = nullptr;
    int n = asprintf(&testStr, "%s", buf);
    free(testStr);
    testStr = nullptr;
    EXPECT_TRUE("asprintf_0400", n > 0);
}

/**
 * @tc.name      : asprintf_0500
 * @tc.desc      : The parameters are valid and the data can be output according to the format
 * @tc.level     : Level 0
 */
void Asprintf0500(void)
{
    char *buf = "f";
    char *testStr = nullptr;
    int n = asprintf(&testStr, "%s", buf);
    free(testStr);
    testStr = nullptr;
    EXPECT_TRUE("asprintf_0500", n > 0);
}

/**
 * @tc.name      : asprintf_0600
 * @tc.desc      : The parameters are valid and the data can be output according to the format
 * @tc.level     : Level 0
 */
void Asprintf0600(void)
{
    char *buf = "e,E";
    char *testStr = nullptr;
    int n = asprintf(&testStr, "%s", buf);
    free(testStr);
    testStr = nullptr;
    EXPECT_TRUE("asprintf_0600", n > 0);
}

/**
 * @tc.name      : asprintf_0700
 * @tc.desc      : The parameters are valid and the data can be output according to the format
 * @tc.level     : Level 0
 */
void Asprintf0700(void)
{
    char *buf = "g,G";
    char *testStr = nullptr;
    int n = asprintf(&testStr, "%s", buf);
    free(testStr);
    testStr = nullptr;
    EXPECT_TRUE("asprintf_0700", n > 0);
}

/**
 * @tc.name      : asprintf_0800
 * @tc.desc      : The parameters are valid and the data can be output according to the format
 * @tc.level     : Level 0
 */
void Asprintf0800(void)
{
    char *buf = "c";
    char *testStr = nullptr;
    int n = asprintf(&testStr, "%s", buf);
    free(testStr);
    testStr = nullptr;
    EXPECT_TRUE("asprintf_0800", n > 0);
}

/**
 * @tc.name      : Asprintf0900
 * @tc.desc      : The parameters are valid and the data can be output according to the format
 * @tc.level     : Level 0
 */
void Asprintf0900(void)
{
    char *buf = "s";
    char *testStr = nullptr;
    int n = asprintf(&testStr, "%s", buf);
    free(testStr);
    testStr = nullptr;
    EXPECT_TRUE("asprintf_0900", n > 0);
}

static TEST_FUN g_funArray[] = {
    Asprintf0100,
    Asprintf0200,
    Asprintf0300,
    Asprintf0400,
    Asprintf0500,
    Asprintf0600,
    Asprintf0700,
    Asprintf0800,
    Asprintf0900,
};

static int AsprintfTestWithArgs(int argc, char *argv[])
{
    int num = sizeof(g_funArray) / sizeof(g_funArray[0]);
    for (int pos = 0; pos < num; ++pos) {
        g_funArray[pos]();
    }

    return g_tStatus;
}

int AsprintfTest(void)
{
    static char libcProg[] = "libc_test";
    char *libcArgv[] = { libcProg, nullptr };
    return AsprintfTestWithArgs(1, libcArgv);
}
