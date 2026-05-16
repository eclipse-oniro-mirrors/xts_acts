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
#include <cstring>
#include "test.h"

// 修复：把 char* 改成 const char*
#define T(no, str, c, substr)                                                                     \
    {                                                                                             \
        const char *result = strrchr(str, c);                                                           \
        if (strcmp(result, substr) != 0)                                                          \
            t_error("%s strrchr(%s,%s) returned %s, wanted %s\n", #no, #str, #c, result, substr); \
    }

// 修复：把 char* 改成 const char*
#define N(no, str, c)                                                                      \
    {                                                                                      \
        const char *result = strrchr(str, c);                                                    \
        if (result != nullptr)                                                                \
            t_error("%s strrchr(%s,%s) returned %s is not nullptr\n", #no, #str, #c, result); \
    }

// 修复：把 char* 改成 const char*
#define N1(no, str)                                                                    \
    {                                                                                  \
        const char *result = strrchr(str, 0);                                                \
        if (strcmp(result, "") != 0)                                                   \
            t_error("%s strrchr(%s,nullptr) returned %s is not ''\n", #no, #str, result); \
    }

static int StrrchrTestImpl(int argc, char *argv[])
{
    /**
     * @tc.name      : strrchr_0100
     * @tc.desc      : Get the position of the last occurrence of a character in a string
     * @tc.level     : Level 0
     */
    T("strrchr_0100", "happy", 'a', "appy");
    /**
     * @tc.name      : strrchr_0200
     * @tc.desc      : Get is the last occurrence of a character in a string
     * @tc.level     : Level 1
     */
    T("strrchr_0200", "happy", 'p', "py");
    /**
     * @tc.name      : strrchr_0300
     * @tc.desc      : Test string does not appear parameter
     * @tc.level     : Level 1
     */
    N("strrchr_0300", "happy", 'd');
    /**
     * @tc.name      : strrchr_0400
     * @tc.desc      : Test empty string as parameter
     * @tc.level     : Level 2
     */
    N("strrchr_0400", "", 'd');
    /**
     * @tc.name      : strrchr_0500
     * @tc.desc      : Test null character as parameter
     * @tc.level     : Level 2
     */
    N1("strrchr_0500", "happy");
    return g_tStatus;
}

int StrrchrTest(void)
{
    static char libcProg[] = "libc_test";
    char *libcArgv[] = { libcProg, nullptr };
    return StrrchrTestImpl(1, libcArgv);
}