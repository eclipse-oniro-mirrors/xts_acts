/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
#include <cstdlib>
#include <cstring>
#include <cwchar>
#include "test.h"

namespace {
constexpr size_t K_SIZEOF_LONG32 = 4U;
constexpr size_t K_SIZEOF_LONG64 = 8U;

constexpr int K_BASE_AUTO = 0;
constexpr int K_BASE_BIN = 2;
constexpr int K_BASE_HEX = 16;
constexpr int K_BASE_36 = 36;
constexpr int K_BASE_INVALID = 37;

constexpr int K_PARSE_POS_0 = 0;
constexpr int K_PARSE_POS_1 = 1;
constexpr int K_PARSE_POS_2 = 2;
constexpr int K_PARSE_POS_6 = 6;
constexpr int K_PARSE_POS_10 = 10;
constexpr int K_PARSE_POS_11 = 11;
constexpr int K_PARSE_POS_19 = 19;
constexpr int K_PARSE_POS_20 = 20;

constexpr int K_EXPECT_ERRNO_OK = 0;
constexpr long K_EXPECT_DIGIT_Z_IN_BASE36 = 35;
constexpr long K_EXPECT_LONG_ZERO = 0;
constexpr long K_VAL_0X12345678 = 0x12345678;
constexpr long K_VAL_0X1234 = 0x1234;
} // namespace

static const char* WCSTOL_TEST_MSG = "";

#define TEST(r, f, x, m)                                           \
    do {                                                           \
        errno = 0;                                                 \
        WCSTOL_TEST_MSG = #f;                                      \
        (r) = (f);                                                 \
        if ((r) != (x)) {                                          \
            t_error("%s failed (" m ")\n", WCSTOL_TEST_MSG, r, x); \
        }                                                          \
    } while (0)

#define TEST2(r, f, x, m)                                          \
    do {                                                           \
        (r) = (f);                                                 \
        if ((r) != (x)) {                                          \
            t_error("%s failed (" m ")\n", WCSTOL_TEST_MSG, r, x); \
        }                                                          \
    } while (0)

static void WcstolTestLongAs32Bits(int& i, long& l, unsigned long& ul, wchar_t*& s, wchar_t*& c)
{
    TEST(l, wcstol(s = L"2147483648", &c, K_BASE_AUTO), 2147483647L, "uncaught overflow %ld != %ld");
    TEST2(i, c - s, K_PARSE_POS_10, "wrong final position %d != %d");
    TEST2(i, errno, ERANGE, "missing errno %d != %d");
    TEST(l, wcstol(s = L"-2147483649", &c, K_BASE_AUTO), -2147483647L - 1, "uncaught overflow %ld != %ld");
    TEST2(i, c - s, K_PARSE_POS_11, "wrong final position %d != %d");
    TEST2(i, errno, ERANGE, "missing errno %d != %d");
    TEST(ul, wcstoul(s = L"4294967296", &c, K_BASE_AUTO), 4294967295UL, "uncaught overflow %lu != %lu");
    TEST2(i, c - s, K_PARSE_POS_10, "wrong final position %d != %d");
    TEST2(i, errno, ERANGE, "missing errno %d != %d");
    TEST(ul, wcstoul(s = L"-1", &c, K_BASE_AUTO), -1UL, "rejected negative %lu != %lu");
    TEST2(i, c - s, K_PARSE_POS_2, "wrong final position %d != %d");
    TEST2(i, errno, K_EXPECT_ERRNO_OK, "spurious errno %d != %d");
    TEST(ul, wcstoul(s = L"-2", &c, K_BASE_AUTO), -2UL, "rejected negative %lu != %lu");
    TEST2(i, c - s, K_PARSE_POS_2, "wrong final position %d != %d");
    TEST2(i, errno, K_EXPECT_ERRNO_OK, "spurious errno %d != %d");
    TEST(ul, wcstoul(s = L"-2147483648", &c, K_BASE_AUTO), -2147483648UL, "rejected negative %lu != %lu");
    TEST2(i, c - s, K_PARSE_POS_11, "wrong final position %d != %d");
    TEST2(i, errno, K_EXPECT_ERRNO_OK, "spurious errno %d != %d");
    TEST(ul, wcstoul(s = L"-2147483649", &c, K_BASE_AUTO), -2147483649UL, "rejected negative %lu != %lu");
    TEST2(i, c - s, K_PARSE_POS_11, "wrong final position %d != %d");
    TEST2(i, errno, K_EXPECT_ERRNO_OK, "spurious errno %d != %d");
}

static void WcstolTestLongAs64Bits(int& i, long& l, unsigned long& ul, wchar_t*& s, wchar_t*& c)
{
    TEST(l, wcstol(s = L"9223372036854775808", &c, K_BASE_AUTO), 9223372036854775807L, "uncaught overflow %ld != %ld");
    TEST2(i, c - s, K_PARSE_POS_19, "wrong final position %d != %d");
    TEST2(i, errno, ERANGE, "missing errno %d != %d");
    TEST(l,
         wcstol(s = L"-9223372036854775809", &c, K_BASE_AUTO),
         -9223372036854775807L - 1,
         "uncaught overflow %ld != %ld");
    TEST2(i, c - s, K_PARSE_POS_20, "wrong final position %d != %d");
    TEST2(i, errno, ERANGE, "missing errno %d != %d");
    TEST(ul,
         wcstoul(s = L"18446744073709551616", &c, K_BASE_AUTO),
         18446744073709551615UL,
         "uncaught overflow %lu != %lu");
    TEST2(i, c - s, K_PARSE_POS_20, "wrong final position %d != %d");
    TEST2(i, errno, ERANGE, "missing errno %d != %d");
    TEST(ul, wcstoul(s = L"-1", &c, K_BASE_AUTO), -1UL, "rejected negative %lu != %lu");
    TEST2(i, c - s, K_PARSE_POS_2, "wrong final position %d != %d");
    TEST2(i, errno, K_EXPECT_ERRNO_OK, "spurious errno %d != %d");
    TEST(ul, wcstoul(s = L"-2", &c, K_BASE_AUTO), -2UL, "rejected negative %lu != %lu");
    TEST2(i, c - s, K_PARSE_POS_2, "wrong final position %d != %d");
    TEST2(i, errno, K_EXPECT_ERRNO_OK, "spurious errno %d != %d");
    TEST(ul,
         wcstoul(s = L"-9223372036854775808", &c, K_BASE_AUTO),
         -9223372036854775808UL,
         "rejected negative %lu != %lu");
    TEST2(i, c - s, K_PARSE_POS_20, "wrong final position %d != %d");
    TEST2(i, errno, K_EXPECT_ERRNO_OK, "spurious errno %d != %d");
    TEST(ul,
         wcstoul(s = L"-9223372036854775809", &c, K_BASE_AUTO),
         -9223372036854775809UL,
         "rejected negative %lu != %lu");
    TEST2(i, c - s, K_PARSE_POS_20, "wrong final position %d != %d");
    TEST2(i, errno, K_EXPECT_ERRNO_OK, "spurious errno %d != %d");
}

static void WcstolTestLongWidthCases(int& i, long& l, unsigned long& ul, wchar_t*& s, wchar_t*& c)
{
    if (sizeof(long) == K_SIZEOF_LONG32) {
        WcstolTestLongAs32Bits(i, l, ul, s, c);
    } else if (sizeof(long) == K_SIZEOF_LONG64) {
        WcstolTestLongAs64Bits(i, l, ul, s, c);
    } else {
        t_error("sizeof(long) == %d, not implemented\n", static_cast<int>(sizeof(long)));
    }
}

static void WcstolTestRadixEtcCases(int& i, long& l, wchar_t*& s, wchar_t*& c)
{
    TEST(l, wcstol(L"z", nullptr, K_BASE_36), K_EXPECT_DIGIT_Z_IN_BASE36, "%ld != %ld");
    TEST(l, wcstol(L"00010010001101000101011001111000", nullptr, K_BASE_BIN), K_VAL_0X12345678, "%ld != %ld");

    TEST(l, wcstol(s = L"0xz", &c, K_BASE_HEX), K_EXPECT_LONG_ZERO, "%ld != %ld");
    TEST2(i, c - s, K_PARSE_POS_1, "wrong final position %ld != %ld");

    TEST(l, wcstol(s = L"0x1234", &c, K_BASE_HEX), K_VAL_0X1234, "%ld != %ld");
    TEST2(i, c - s, K_PARSE_POS_6, "wrong final position %ld != %ld");

    c = nullptr;
    TEST(l, wcstol(s = L"123", &c, K_BASE_INVALID), K_EXPECT_LONG_ZERO, "%ld != %ld");
    TEST2(i, c - s, K_PARSE_POS_0, "wrong final position %d != %d");
    TEST2(i, errno, EINVAL, "%d != %d");
}

static int WcstolTestImpl(void)
{
    int i;
    long l;
    unsigned long ul;
    wchar_t* s;
    wchar_t* c;

    TEST(l, wcstol(L"2147483647", nullptr, K_BASE_AUTO), 2147483647L, "max 32bit signed %ld != %ld");
    TEST(ul, wcstoul(L"4294967295", nullptr, K_BASE_AUTO), 4294967295UL, "max 32bit unsigned %lu != %lu");

    WcstolTestLongWidthCases(i, l, ul, s, c);
    WcstolTestRadixEtcCases(i, l, s, c);
    return T_STATUS;
}

int WcstolTest(void)
{
    return WcstolTestImpl();
}
