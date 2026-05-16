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
 * @tc.name      : Wcsncasecmp0100
 * @tc.desc      : test wcsncasecmp ignore case compares the first n digits of two wide strings
 * @tc.level     : Level 0
 */
void Wcsncasecmp0100(void)
{
    int result = wcsncasecmp(L"hello1", L"HELLO2", 5);
    if (result != 0) {
        t_error("%s wcsncasecmp get result is %d are not want 0\n", __func__, result);
    }
}

/**
 * @tc.name      : Wcsncasecmp0200
 * @tc.desc      : test that wcsncasecmp returns the result when ws1 is greater than ws2 in the dictionary
 * @tc.level     : Level 1
 */
void Wcsncasecmp0200(void)
{
    int result = wcsncasecmp(L"hello1", L"HELLO2", 6);
    if (result >= 0) {
        t_error("%s wcsncasecmp get result is %d are not want less 0\n", __func__, result);
    }
}

/**
 * @tc.name      : Wcsncasecmp0300
 * @tc.desc      : test that wcsncasecmp returns the result when ws1 is less than ws2 in the dictionary
 * @tc.level     : Level 1
 */
void Wcsncasecmp0300(void)
{
    int result = wcsncasecmp(L"hello2", L"HELLO1", 6);
    if (result <= 0) {
        t_error("%s wcsncasecmp get result is %d are not want gress 0\n", __func__, result);
    }
}

/**
 * @tc.name      : Wcsncasecmp0400
 * @tc.desc      : test that wcsncasecmp returns the result when ws1 is longer in the dictionary than ws2
 * @tc.level     : Level 1
 */
void Wcsncasecmp0400(void)
{
    int result = wcsncasecmp(L"hello", L"HELL", 5);
    if (result <= 0) {
        t_error("%s wcsncasecmp get result is %d are not want gress 0\n", __func__, result);
    }
}

/**
 * @tc.name      : Wcsncasecmp0500
 * @tc.desc      : wcsncasecmp returns result when test ws1 is shorter than ws2 in dictionary
 * @tc.level     : Level 1
 */
void Wcsncasecmp0500(void)
{
    int result = wcsncasecmp(L"hell", L"HELLO", 5);
    if (result >= 0) {
        t_error("%s wcsncasecmp get result is %d are not want less 0\n", __func__, result);
    }
}

/**
 * @tc.name      : Wcsncasecmp0600
 * @tc.desc      : test the result returned by wcsncasecmp when the number of comparisons is 0
 * @tc.level     : Level 2
 */
void Wcsncasecmp0600(void)
{
    int result = wcsncasecmp(L"foo", L"bar", 0);
    if (result != 0) {
        t_error("%s wcsncasecmp get result is %d are not want 0\n", __func__, result);
    }
}

static int WcsncasecmpTestImpl(int argc, char* argv[])
{
    Wcsncasecmp0100();
    Wcsncasecmp0200();
    Wcsncasecmp0300();
    Wcsncasecmp0400();
    Wcsncasecmp0500();
    Wcsncasecmp0600();
    return T_STATUS;
}

int WcsncasecmpTest(void)
{
    static char libcProgStub[] = "libc_test";
    char* libcArgvStub[] = { libcProgStub, nullptr };
    return WcsncasecmpTestImpl(1, libcArgvStub);
}
