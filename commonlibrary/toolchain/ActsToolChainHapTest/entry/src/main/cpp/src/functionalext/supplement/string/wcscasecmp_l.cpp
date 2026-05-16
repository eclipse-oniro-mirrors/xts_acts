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

#include <bits/alltypes.h>
#include <clocale>
#include <cstdio>
#include <cstring>
#include <cwchar>
#include "test.h"

/**
 * @tc.name      : WcscasecmpL0100
 * @tc.desc      : test wcscasecmp_l compare case-ignoring wide strings
 * @tc.level     : Level 0
 */
void WcscasecmpL0100(void)
{
    locale_t localInfo = nullptr;
    int result = wcscasecmp_l(L"hello", L"HELLO", localInfo);
    if (result != 0) {
        t_error("%s wcscasecmp_l get result is %d are not 0\n", __func__, result);
    }
}

/**
 * @tc.name      : WcscasecmpL0200
 * @tc.desc      : test the result of calling wcscasecmp_l with uppercase letters, plus numbers, and lowercase letters
 *                 and small numbers
 * @tc.level     : Level 1
 */
void WcscasecmpL0200(void)
{
    locale_t localInfo = nullptr;
    int result = wcscasecmp_l(L"hello1", L"HELLO2", localInfo);
    if (result >= 0) {
        t_error("%s wcscasecmp_l get result is %d are more then 0\n", __func__, result);
    }
}

/**
 * @tc.name      : WcscasecmpL0300
 * @tc.desc      : test the result of calling wcscasecmp_l with uppercase letters plus small numbers and lowercase
 *                 letters and large numbers
 * @tc.level     : Level 1
 */
void WcscasecmpL0300(void)
{
    locale_t localInfo = nullptr;
    int result = wcscasecmp_l(L"hello2", L"HELLO1", localInfo);
    if (result <= 0) {
        t_error("%s wcscasecmp_l get result is %d are less then 0\n", __func__, result);
    }
}

/**
 * @tc.name      : WcscasecmpL0400
 * @tc.desc      : test the result of calling wcscasecmp_l for shorter uppercase wide strings versus longer lowercase
 *                 wide strings
 * @tc.level     : Level 1
 */
void WcscasecmpL0400(void)
{
    locale_t localInfo = nullptr;
    int result = wcscasecmp_l(L"hello", L"HELL", localInfo);
    if (result <= 0) {
        t_error("%s wcscasecmp_l get result is %d are less then 0\n", __func__, result);
    }
}

/**
 * @tc.name      : WcscasecmpL0500
 * @tc.desc      : test the result of calling wcscasecmp_l on a shorter lowercase wide string versus a longer uppercase
 *                 wide string
 * @tc.level     : Level 1
 */
void WcscasecmpL0500(void)
{
    locale_t localInfo = nullptr;
    int result = wcscasecmp_l(L"hell", L"HELLO", localInfo);
    if (result >= 0) {
        t_error("%s wcscasecmp_l get result is %d are more then 0\n", __func__, result);
    }
}

static int WcscasecmpLTestImpl(int argc, char* argv[])
{
    WcscasecmpL0100();
    WcscasecmpL0200();
    WcscasecmpL0300();
    WcscasecmpL0400();
    WcscasecmpL0500();
    return T_STATUS;
}

int WcscasecmpLTest(void)
{
    static char libcProgStub[] = "libc_test";
    char* libcArgvStub[] = { libcProgStub, nullptr };
    return WcscasecmpLTestImpl(1, libcArgvStub);
}
