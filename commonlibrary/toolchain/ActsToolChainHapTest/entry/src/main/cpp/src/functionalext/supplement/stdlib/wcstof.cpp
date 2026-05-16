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

static void ExpectFloatEq(float a, float b)
{
    if (!(fabsf(a - b) < FLT_EPSILON)) {
        t_error("%s failed: %f is not equal to %f\n", __func__, a, b);
    }
}

/**
 * @tc.name      : Wcstof0100
 * @tc.desc      : Convert wide string to float type
 * @tc.level     : Level 0
 */
void Wcstof0100(void)
{
    wchar_t str0[] = L"3.14wcstof";
    wchar_t* end = nullptr;
    const float target = 3.14f;
    wchar_t str1[] = L"wcstof";
    float val = wcstof(str0, &end);
    ExpectFloatEq(val, target);
    if (wcscmp(end, str1)) {
        t_error("%s the result of comparing two strings should be equal", __func__);
    }
}

/**
 * @tc.name      : Wcstof0200
 * @tc.desc      : Convert wide string to float type with no end string characters
 * @tc.level     : Level 1
 */
void Wcstof0200(void)
{
    wchar_t str[] = L"3.14";
    wchar_t* end = nullptr;
    const float target = 3.14f;
    float val = wcstof(str, &end);
    ExpectFloatEq(val, target);
}

/**
 * @tc.name      : Wcstof0300
 * @tc.desc      : Convert wide string to float type with whitespace present at the beginning
 * @tc.level     : Level 1
 */
void Wcstof0300(void)
{
    wchar_t str[] = L"          3.14";
    wchar_t* end = nullptr;
    const float target = 3.14f;
    float val = wcstof(str, &end);
    ExpectFloatEq(val, target);
}

/**
 * @tc.name      : Wcstof0400
 * @tc.desc      : Convert wide string to float type with string characters at the beginning
 * @tc.level     : Level 2
 */
void Wcstof0400(void)
{
    wchar_t str[] = L"wcstof3.14";
    wchar_t* end = nullptr;
    const float target = 3.14f;
    float val = wcstof(str, &end);
    if (val != 0) {
        t_error("%s invalid conversion", __func__);
    }
}

/**
 * @tc.name      : Wcstof0500
 * @tc.desc      : Convert wide string to negative number of type float
 * @tc.level     : Level 1
 */
void Wcstof0500(void)
{
    wchar_t str[] = L"-3.14";
    wchar_t* end = nullptr;
    const float target = -3.14f;
    float val = wcstof(str, &end);
    ExpectFloatEq(val, target);
}

/**
 * @tc.name      : Wcstof0600
 * @tc.desc      : Convert wide string to negative number of type float
 * @tc.level     : Level 1
 */
void Wcstof0600(void)
{
    wchar_t str[] = L"0X1.BC70A3D70A3D7P+6";
    wchar_t* end = nullptr;
    float val = wcstof(str, &end);
    const float target = 111.11f;
    ExpectFloatEq(val, target);
}

/**
 * @tc.name      : Wcstof0700
 * @tc.desc      : The converted value is greater than float max
 * @tc.level     : Level 2
 */
void Wcstof0700(void)
{
    wchar_t str[] = L"1.18973e+4932";
    wchar_t* end = nullptr;
    float val = wcstof(str, &end);
    if (errno != ERANGE) {
        t_error("%s errno is not set", __func__);
    }
    if (val != INFINITY) {
        t_error("%s val is not equal to INF", __func__);
    }
}

static int WcstofTestImpl(int argc, char* argv[])
{
    Wcstof0100();
    Wcstof0200();
    Wcstof0300();
    Wcstof0400();
    Wcstof0500();
    Wcstof0600();
    Wcstof0700();
    return T_STATUS;
}

int WcstofTest(void)
{
    static char libcProgStub[] = "libc_test";
    char* libcArgvStub[] = { libcProgStub, nullptr };
    return WcstofTestImpl(1, libcArgvStub);
}
