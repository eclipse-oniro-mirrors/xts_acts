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
#include <cstdio>
#include <cstring>
#include <cwchar>
#include "test.h"

namespace {
constexpr const char K_WCSTOULL_TAG[] = "wcstoull";
constexpr int K_BASE_AUTO = 0;
constexpr int K_BASE_DEC = 10;
constexpr int K_BASE_BIN = 2;
constexpr int K_BASE_HEX = 16;
constexpr int K_PARSE_POS_2 = 2;
constexpr int K_PARSE_POS_20 = 20;
constexpr int K_EXPECT_ERRNO_OK = 0;
constexpr unsigned long long K_EXPECT_NEGATIVE_TWO_WRAP = static_cast<unsigned long long>(-2);
} // namespace

/**
 * @tc.name      : Wcstoull0100
 * @tc.desc      : Convert wide string to unsigned long long type based on decimal
 * @tc.level     : Level 0
 */
void Wcstoull0100(void)
{
    unsigned long long ull;
    wchar_t* s;
    wchar_t* c;
    s = L"250068492";
    errno = 0;
    ull = wcstoull(s, &c, K_BASE_DEC);
    if (ull != 250068492ULL) {
        t_error("%s failed (expect unsigned %llu != %llu)\n", K_WCSTOULL_TAG, ull, 250068492ULL);
    }
}

/**
 * @tc.name      : Wcstoull0200
 * @tc.desc      : Convert wide string to unsigned long long type based on hexadecimal
 * @tc.level     : Level 1
 */
void Wcstoull0200(void)
{
    unsigned long long ull;
    wchar_t* s;
    wchar_t* c;
    s = L"7b06af00";
    errno = 0;
    ull = wcstoull(s, &c, K_BASE_HEX);
    if (ull != 2064035584ULL) {
        t_error("%s failed (expect unsigned %llu != %llu)\n", K_WCSTOULL_TAG, ull, 2064035584ULL);
    }
}

/**
 * @tc.name      : Wcstoull0300
 * @tc.desc      : Convert wide string to unsigned long long type based on binary
 * @tc.level     : Level 1
 */
void Wcstoull0300(void)
{
    unsigned long long ull;
    wchar_t* s;
    wchar_t* c;
    s = L"1100011011110101010001100000";
    errno = 0;
    ull = wcstoull(s, &c, K_BASE_BIN);
    if (ull != 208622688ULL) {
        t_error("%s failed (expect unsigned %llu != %llu)\n", K_WCSTOULL_TAG, ull, 208622688ULL);
    }
}

/**
 * @tc.name      : Wcstoull0400
 * @tc.desc      : Convert wide string to unsigned long long type based on parameter 'base' equal to 0
 * @tc.level     : Level 1
 */
void Wcstoull0400(void)
{
    unsigned long long ull;
    wchar_t* s;
    wchar_t* c;
    s = L"0x6fffff";
    errno = 0;
    ull = wcstoull(s, &c, K_BASE_AUTO);
    if (ull != 7340031ULL) {
        t_error("%s failed (expect unsigned %llu != %llu)\n", K_WCSTOULL_TAG, ull, 7340031ULL);
    }
}

/**
 * @tc.name      : Wcstoull0500
 * @tc.desc      : Convert wide string to unsigned long long type exceeds the maximum value of the type
 * @tc.level     : Level 2
 */
void Wcstoull0500(void)
{
    int i;
    unsigned long long ull;
    wchar_t* s;
    wchar_t* c;
    s = L"18446744073709551616";
    errno = 0;
    ull = wcstoull(s, &c, K_BASE_AUTO);
    if (ull != 18446744073709551615ULL) {
        t_error("%s failed (uncaught overflow %llu != %llu)\n", K_WCSTOULL_TAG, ull, 18446744073709551615ULL);
    }
    i = static_cast<int>(c - s);
    if (i != K_PARSE_POS_20) {
        t_error("%s failed (wrong final position %d != %d)\n", K_WCSTOULL_TAG, i, K_PARSE_POS_20);
    }
    i = errno;
    if (i != ERANGE) {
        t_error("%s failed (missing errno %d != %d)\n", K_WCSTOULL_TAG, i, ERANGE);
    }
}

/**
 * @tc.name      : Wcstoull0600
 * @tc.desc      : The converted result value -1 is invalid
 * @tc.level     : Level 2
 */
void Wcstoull0600(void)
{
    int i;
    unsigned long long ull;
    wchar_t* s;
    wchar_t* c;
    s = L"-1";
    errno = 0;
    ull = wcstoull(s, &c, K_BASE_AUTO);
    if (ull != static_cast<unsigned long long>(-1)) {
        t_error(
            "%s failed (rejected negative %llu != %llu)\n", K_WCSTOULL_TAG, ull, static_cast<unsigned long long>(-1));
    }
    i = static_cast<int>(c - s);
    if (i != K_PARSE_POS_2) {
        t_error("%s failed (wrong final position %d != %d)\n", K_WCSTOULL_TAG, i, K_PARSE_POS_2);
    }
    i = errno;
    if (i != K_EXPECT_ERRNO_OK) {
        t_error("%s failed (spurious errno %d != %d)\n", K_WCSTOULL_TAG, i, K_EXPECT_ERRNO_OK);
    }
}

/**
 * @tc.name      : Wcstoull0700
 * @tc.desc      : The converted result value -2 is invalid
 * @tc.level     : Level 2
 */
void Wcstoull0700(void)
{
    int i;
    unsigned long long ull;
    wchar_t* s;
    wchar_t* c;
    s = L"-2";
    errno = 0;
    ull = wcstoull(s, &c, K_BASE_AUTO);
    if (ull != K_EXPECT_NEGATIVE_TWO_WRAP) {
        t_error("%s failed (rejected negative %llu != %llu)\n", K_WCSTOULL_TAG, ull, K_EXPECT_NEGATIVE_TWO_WRAP);
    }
    i = static_cast<int>(c - s);
    if (i != K_PARSE_POS_2) {
        t_error("%s failed (wrong final position %d != %d)\n", K_WCSTOULL_TAG, i, K_PARSE_POS_2);
    }
    i = errno;
    if (i != K_EXPECT_ERRNO_OK) {
        t_error("%s failed (spurious errno %d != %d)\n", K_WCSTOULL_TAG, i, K_EXPECT_ERRNO_OK);
    }
}

/**
 * @tc.name      : Wcstoull0800
 * @tc.desc      : The converted result value -9223372036854775808 is invalid
 * @tc.level     : Level 2
 */
void Wcstoull0800(void)
{
    int i;
    unsigned long long ull;
    wchar_t* s;
    wchar_t* c;
    s = L"-9223372036854775808";
    errno = 0;
    ull = wcstoull(s, &c, K_BASE_AUTO);
    if (ull != 9223372036854775808ULL) {
        t_error("%s failed (rejected negative %llu != %llu)\n", K_WCSTOULL_TAG, ull, 9223372036854775808ULL);
    }
    i = static_cast<int>(c - s);
    if (i != K_PARSE_POS_20) {
        t_error("%s failed (wrong final position %d != %d)\n", K_WCSTOULL_TAG, i, K_PARSE_POS_20);
    }
    i = errno;
    if (i != K_EXPECT_ERRNO_OK) {
        t_error("%s failed (spurious errno %d != %d)\n", K_WCSTOULL_TAG, i, K_EXPECT_ERRNO_OK);
    }
}

static int WcstoullTestImpl(int argc, char* argv[])
{
    Wcstoull0100();
    Wcstoull0200();
    Wcstoull0300();
    Wcstoull0400();
    Wcstoull0500();
    Wcstoull0600();
    Wcstoull0700();
    Wcstoull0800();
    return T_STATUS;
}

int WcstoullTest(void)
{
    static char libcProgStub[] = "libc_test";
    char* libcArgvStub[] = { libcProgStub, nullptr };
    return WcstoullTestImpl(1, libcArgvStub);
}
