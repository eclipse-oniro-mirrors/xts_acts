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
 * @tc.name      : Wcscasecmp0100
 * @tc.desc      : test wcscasecmp compare case-ignoring wide strings
 * @tc.level     : Level 0
 */
void Wcscasecmp0100(void)
{
    int result = wcscasecmp(L"hello", L"HELLO");
    if (result != 0) {
        t_error("%s wcscasecmp get result is %d are not 0\n", __func__, result);
    }
}

/**
 * @tc.name      : Wcscasecmp0200
 * @tc.desc      : test the result of calling wcscasecmp with uppercase letters, plus numbers, and lowercase letters
 *                 and small numbers
 * @tc.level     : Level 1
 */
void Wcscasecmp0200(void)
{
    int result = wcscasecmp(L"hello1", L"HELLO2");
    if (result >= 0) {
        t_error("%s wcscasecmp get result is %d are more then 0\n", __func__, result);
    }
}

/**
 * @tc.name      : Wcscasecmp0300
 * @tc.desc      : test the result of calling wcscasecmp with uppercase letters plus small numbers and lowercase
 *                 letters and large numbers
 * @tc.level     : Level 1
 */
void Wcscasecmp0300(void)
{
    int result = wcscasecmp(L"hello2", L"HELLO1");
    if (result <= 0) {
        t_error("%s wcscasecmp get result is %d are less then 0\n", __func__, result);
    }
}

/**
 * @tc.name      : Wcscasecmp0400
 * @tc.desc      : test the result of calling wcscasecmp for shorter uppercase wide strings versus longer lowercase
 *                 wide strings
 * @tc.level     : Level 1
 */
void Wcscasecmp0400(void)
{
    int result = wcscasecmp(L"hello", L"HELL");
    if (result <= 0) {
        t_error("%s wcscasecmp get result is %d are less then 0\n", __func__, result);
    }
}

/**
 * @tc.name      : Wcscasecmp0500
 * @tc.desc      : test the result of calling wcscasecmp on a shorter lowercase wide string versus a longer uppercase
 *                 wide string
 * @tc.level     : Level 1
 */
void Wcscasecmp0500(void)
{
    int result = wcscasecmp(L"hell", L"HELLO");
    if (result >= 0) {
        t_error("%s wcscasecmp get result is %d are more then 0\n", __func__, result);
    }
}

static int WcscasecmpTestImpl(int argc, char* argv[])
{
    Wcscasecmp0100();
    Wcscasecmp0200();
    Wcscasecmp0300();
    Wcscasecmp0400();
    Wcscasecmp0500();
    return T_STATUS;
}

int WcscasecmpTest(void)
{
    static char libcProgStub[] = "libc_test";
    char* libcArgvStub[] = { libcProgStub, nullptr };
    return WcscasecmpTestImpl(1, libcArgvStub);
}
