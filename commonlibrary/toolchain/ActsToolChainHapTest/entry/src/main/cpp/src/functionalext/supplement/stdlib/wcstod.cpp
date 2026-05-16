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

static void ExpectDoubleEq(double a, double b)
{
    if (!(fabs(a - b) < DBL_EPSILON)) {
        t_error("%s failed: %f is not equal to %f\n", __func__, a, b);
    }
}

/**
 * @tc.name      : Wcstod0100
 * @tc.desc      : Convert wide string to dobule type
 * @tc.level     : Level 0
 */
void Wcstod0100(void)
{
    wchar_t str0[] = L"3.14wcstod";
    wchar_t* end = nullptr;
    const double target = 3.14;
    wchar_t str1[] = L"wcstod";
    double val = wcstod(str0, &end);
    ExpectDoubleEq(val, target);
    if (wcscmp(end, str1)) {
        t_error("%s the result of comparing two strings should be equal", __func__);
    }
}

/**
 * @tc.name      : Wcstod0200
 * @tc.desc      : Convert wide string to dobule type with no end string characters
 * @tc.level     : Level 1
 */
void Wcstod0200(void)
{
    wchar_t str[] = L"3.14";
    wchar_t* end = nullptr;
    const double target = 3.14;
    double val = wcstod(str, &end);
    ExpectDoubleEq(val, target);
}

/**
 * @tc.name      : Wcstod0300
 * @tc.desc      : Convert wide string to dobule type with whitespace present at the beginning
 * @tc.level     : Level 1
 */
void Wcstod0300(void)
{
    wchar_t str[] = L"          3.14";
    wchar_t* end = nullptr;
    const double target = 3.14;
    double val = wcstod(str, &end);
    ExpectDoubleEq(val, target);
}

/**
 * @tc.name      : Wcstod0400
 * @tc.desc      : Convert wide string to dobule type with string characters at the beginning
 * @tc.level     : Level 2
 */
void Wcstod0400(void)
{
    wchar_t str[] = L"wcstod3.14";
    wchar_t* end = nullptr;
    const double target = 3.14;
    double val = wcstod(str, &end);
    if (val != 0) {
        t_error("%s invalid conversion", __func__);
    }
}

/**
 * @tc.name      : Wcstod0500
 * @tc.desc      : Convert wide string to negative number of type double
 * @tc.level     : Level 1
 */
void Wcstod0500(void)
{
    wchar_t str[] = L"-3.14";
    wchar_t* end = nullptr;
    const double target = -3.14;
    double val = wcstod(str, &end);
    ExpectDoubleEq(val, target);
}

/**
 * @tc.name      : Wcstod0600
 * @tc.desc      : Convert the hexadecimal string in the wide string to double type
 * @tc.level     : Level 1
 */
void Wcstod0600(void)
{
    wchar_t str[] = L"0X1.BC70A3D70A3D7P+6";
    wchar_t* end = nullptr;
    double val = wcstod(str, &end);
    const double target = 111.11;
    ExpectDoubleEq(val, target);
}

/**
 * @tc.name      : Wcstod0700
 * @tc.desc      : The converted value is greater than double max
 * @tc.level     : Level 2
 */
void Wcstod0700(void)
{
    wchar_t str[] = L"1.18973e+4932";
    wchar_t* end = nullptr;
    double val = wcstod(str, &end);
    if (errno != ERANGE) {
        t_error("%s errno is not set", __func__);
    }
    if (val != INFINITY) {
        t_error("%s val is not equal to INF", __func__);
    }
}

static int WcstodTestImpl(int argc, char* argv[])
{
    Wcstod0100();
    Wcstod0200();
    Wcstod0300();
    Wcstod0400();
    Wcstod0500();
    Wcstod0600();
    Wcstod0700();
    return T_STATUS;
}

int WcstodTest(void)
{
    static char libcProgStub[] = "libc_test";
    char* libcArgvStub[] = { libcProgStub, nullptr };
    return WcstodTestImpl(1, libcArgvStub);
}
