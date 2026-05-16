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

#include <cerrno>
#include <cfloat>
#include <cmath>
#include <cstdio>
#include <cstring>
#include <cwchar>
#include "test.h"

static void ExpectLongDoubleEq(long double a, long double b)
{
    if (!(fabsl(a - b) < LDBL_EPSILON)) {
        t_error("%s failed: %f is not equal to %f\n", __func__, a, b);
    }
}

/**
 * @tc.name      : Wcstold0100
 * @tc.desc      : Convert wide string to long double type
 * @tc.level     : Level 0
 */
void Wcstold0100(void)
{
    wchar_t str0[] = L"3.14wcstold";
    wchar_t* end = nullptr;
    const long double target = 3.14L;
    wchar_t str1[] = L"wcstold";
    long double val = wcstold(str0, &end);
    ExpectLongDoubleEq(val, target);
    if (wcscmp(end, str1)) {
        t_error("%s the result of comparing two strings should be equal", __func__);
    }
}

/**
 * @tc.name      : Wcstold0200
 * @tc.desc      : Convert wide string to long double type with no end string characters
 * @tc.level     : Level 1
 */
void Wcstold0200(void)
{
    wchar_t str[] = L"3.14";
    wchar_t* end = nullptr;
    const long double target = 3.14L;
    long double val = wcstold(str, &end);
    ExpectLongDoubleEq(val, target);
}

/**
 * @tc.name      : Wcstold0300
 * @tc.desc      : Convert wide string to long double type with whitespace present at the beginning
 * @tc.level     : Level 1
 */
void Wcstold0300(void)
{
    wchar_t str[] = L"          3.14";
    wchar_t* end = nullptr;
    const long double target = 3.14L;
    long double val = wcstold(str, &end);
    ExpectLongDoubleEq(val, target);
}

/**
 * @tc.name      : Wcstold0400
 * @tc.desc      : Convert wide string to long double type with string characters at the beginning
 * @tc.level     : Level 2
 */
void Wcstold0400(void)
{
    wchar_t str[] = L"wcstold3.14";
    wchar_t* end = nullptr;
    const long double target = 3.14L;
    long double val = wcstold(str, &end);
    if (val != 0) {
        t_error("%s invalid conversion", __func__);
    }
}

/**
 * @tc.name      : Wcstold0500
 * @tc.desc      : Convert wide string to negative number of type long double
 * @tc.level     : Level 1
 */
void Wcstold0500(void)
{
    wchar_t str[] = L"-3.14";
    wchar_t* end = nullptr;
    const long double target = -3.14L;
    long double val = wcstold(str, &end);
    ExpectLongDoubleEq(val, target);
}

/**
 * @tc.name      : Wcstold0600
 * @tc.desc      : The converted value is greater than long double max
 * @tc.level     : Level 2
 */
void Wcstold0600(void)
{
    errno = 0;
    wchar_t str[] = L"1.18973e+49322";
    wchar_t* end = nullptr;
    long double val = wcstold(str, &end);
    if (errno != ERANGE) {
        t_error("%s errno is not set\n", __func__);
    }
    if (val != HUGE_VALL) {
        t_error("%s val is not equal to INF\n", __func__);
    }
}

static int WcstoldTestImpl(int argc, char* argv[])
{
    Wcstold0100();
    Wcstold0200();
    Wcstold0300();
    Wcstold0400();
    Wcstold0500();
    Wcstold0600();
    return T_STATUS;
}

int WcstoldTest(void)
{
    static char libcProgStub[] = "libc_test";
    char* libcArgvStub[] = { libcProgStub, nullptr };
    return WcstoldTestImpl(1, libcArgvStub);
}
