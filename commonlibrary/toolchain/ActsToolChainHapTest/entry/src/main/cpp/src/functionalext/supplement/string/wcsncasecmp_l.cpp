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
#include <cwchar>
#include "test.h"

/**
 * @tc.name      : WcsncasecmpL0100
 * @tc.desc      : test wcsncasecmp_l ignore case compares the first n digits of two wide strings
 * @tc.level     : Level 0
 */
void WcsncasecmpL0100(void)
{
    int result = wcsncasecmp_l(L"hello1", L"HELLO2", 5, nullptr);
    if (result != 0) {
        t_error("%s wcsncasecmp_l get result is %d are not want 0\n", __func__, result);
    }
}

/**
 * @tc.name      : WcsncasecmpL0200
 * @tc.desc      : test that wcsncasecmp_l returns the result when ws1 is greater than ws2 in the dictionary
 * @tc.level     : Level 1
 */
void WcsncasecmpL0200(void)
{
    int result = wcsncasecmp_l(L"hello1", L"HELLO2", 6, nullptr);
    if (result >= 0) {
        t_error("%s wcsncasecmp_l get result is %d are not want less 0\n", __func__, result);
    }
}

/**
 * @tc.name      : WcsncasecmpL0300
 * @tc.desc      : test that wcsncasecmp_l returns the result when ws1 is less than ws2 in the dictionary
 * @tc.level     : Level 1
 */
void WcsncasecmpL0300(void)
{
    int result = wcsncasecmp_l(L"hello2", L"HELLO1", 6, nullptr);
    if (result <= 0) {
        t_error("%s wcsncasecmp_l get result is %d are not want gress 0\n", __func__, result);
    }
}

/**
 * @tc.name      : WcsncasecmpL0400
 * @tc.desc      : test that wcsncasecmp_l returns the result when ws1 is longer in the dictionary than ws2
 * @tc.level     : Level 1
 */
void WcsncasecmpL0400(void)
{
    int result = wcsncasecmp_l(L"hello", L"HELL", 5, nullptr);
    if (result <= 0) {
        t_error("%s wcsncasecmp_l get result is %d are not want gress 0\n", __func__, result);
    }
}

/**
 * @tc.name      : WcsncasecmpL0500
 * @tc.desc      : wcsncasecmp_l returns result when test ws1 is shorter than ws2 in dictionary
 * @tc.level     : Level 1
 */
void WcsncasecmpL0500(void)
{
    int result = wcsncasecmp_l(L"hell", L"HELLO", 5, nullptr);
    if (result >= 0) {
        t_error("%s wcsncasecmp_l get result is %d are not want less 0\n", __func__, result);
    }
}

/**
 * @tc.name      : WcsncasecmpL0600
 * @tc.desc      : test the result returned by wcsncasecmp_l when the number of comparisons is 0
 * @tc.level     : Level 2
 */
void WcsncasecmpL0600(void)
{
    int result = wcsncasecmp_l(L"foo", L"bar", 0, nullptr);
    if (result != 0) {
        t_error("%s wcsncasecmp_l get result is %d are not want 0\n", __func__, result);
    }
}

static int WcsncasecmpLTestImpl(int argc, char* argv[])
{
    WcsncasecmpL0100();
    WcsncasecmpL0200();
    WcsncasecmpL0300();
    WcsncasecmpL0400();
    WcsncasecmpL0500();
    WcsncasecmpL0600();
    return T_STATUS;
}

int WcsncasecmpLTest(void)
{
    static char libcProgStub[] = "libc_test";
    char* libcArgvStub[] = { libcProgStub, nullptr };
    return WcsncasecmpLTestImpl(1, libcArgvStub);
}
