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
#include "test.h"

namespace {
constexpr size_t K_SIZEOF_LONG32 = 4U;
constexpr size_t K_SIZEOF_LONG64 = 8U;

constexpr int K_BASE_AUTO = 0;
constexpr int K_BASE_BIN = 2;
constexpr int K_BASE_OCT = 8;
constexpr int K_BASE_HEX = 16;
constexpr int K_BASE_36 = 36;
constexpr int K_BASE_INVALID = 37;

constexpr int K_PARSE_POS_0 = 0;
constexpr int K_PARSE_POS_1 = 1;
constexpr int K_PARSE_POS_2 = 2;
constexpr int K_PARSE_POS_3 = 3;
constexpr int K_PARSE_POS_6 = 6;
constexpr int K_PARSE_POS_7 = 7;
constexpr int K_PARSE_POS_10 = 10;
constexpr int K_PARSE_POS_11 = 11;
constexpr int K_PARSE_POS_19 = 19;
constexpr int K_PARSE_POS_20 = 20;
constexpr int K_PARSE_POS_21 = 21;

constexpr int K_EXPECT_ERRNO_OK = 0;
constexpr long K_EXPECT_DIGIT_Z_IN_BASE36 = 35;
constexpr long K_EXPECT_LONG_ZERO = 0;
constexpr long K_EXPECT_LONG_ONE = 1;
constexpr long K_VAL_0X12345678 = 0x12345678;
constexpr long K_VAL_0X0F5F = 0x0f5f;
constexpr long K_VAL_0X1234 = 0x1234;
constexpr long K_EXPECT_OCTAL_PARSED_15437 = 6943L;
} // namespace

static const char* STRTOL_TEST_MSG = "";

/* r = place to store result
 * f = function call to test (or any expression)
 * x = expected result
 * m = message to print on failure (with formats for r & x)
 **/

#define TEST(r, f, x, m)                                           \
    do {                                                           \
        errno = 0;                                                 \
        STRTOL_TEST_MSG = #f;                                      \
        (r) = (f);                                                 \
        if ((r) != (x)) {                                          \
            t_error("%s failed (" m ")\n", STRTOL_TEST_MSG, r, x); \
        }                                                          \
    } while (0)

#define TEST2(r, f, x, m)                                          \
    do {                                                           \
        (r) = (f);                                                 \
        if ((r) != (x)) {                                          \
            t_error("%s failed (" m ")\n", STRTOL_TEST_MSG, r, x); \
        }                                                          \
    } while (0)

static void StrtolTestLongAs32Bits(int& i, long& l, unsigned long& ul, char*& s, char*& c)
{
    TEST(l, strtol(s = "2147483648", &c, K_BASE_AUTO), 2147483647L, "uncaught overflow %ld != %ld");
    TEST2(i, c - s, K_PARSE_POS_10, "wrong final position %d != %d");
    TEST2(i, errno, ERANGE, "missing errno %d != %d");
    TEST(l, strtol(s = "-2147483649", &c, K_BASE_AUTO), -2147483647L - 1, "uncaught overflow %ld != %ld");
    TEST2(i, c - s, K_PARSE_POS_11, "wrong final position %d != %d");
    TEST2(i, errno, ERANGE, "missing errno %d != %d");
    TEST(ul, strtoul(s = "4294967296", &c, K_BASE_AUTO), 4294967295UL, "uncaught overflow %lu != %lu");
    TEST2(i, c - s, K_PARSE_POS_10, "wrong final position %d != %d");
    TEST2(i, errno, ERANGE, "missing errno %d != %d");
    TEST(ul, strtoul(s = "-1", &c, K_BASE_AUTO), -1UL, "rejected negative %lu != %lu");
    TEST2(i, c - s, K_PARSE_POS_2, "wrong final position %d != %d");
    TEST2(i, errno, K_EXPECT_ERRNO_OK, "spurious errno %d != %d");
    TEST(ul, strtoul(s = "-2", &c, K_BASE_AUTO), -2UL, "rejected negative %lu != %lu");
    TEST2(i, c - s, K_PARSE_POS_2, "wrong final position %d != %d");
    TEST2(i, errno, K_EXPECT_ERRNO_OK, "spurious errno %d != %d");
    TEST(ul, strtoul(s = "-2147483648", &c, K_BASE_AUTO), -2147483648UL, "rejected negative %lu != %lu");
    TEST2(i, c - s, K_PARSE_POS_11, "wrong final position %d != %d");
    TEST2(i, errno, K_EXPECT_ERRNO_OK, "spurious errno %d != %d");
    TEST(ul, strtoul(s = "-2147483649", &c, K_BASE_AUTO), -2147483649UL, "rejected negative %lu != %lu");
    TEST2(i, c - s, K_PARSE_POS_11, "wrong final position %d != %d");
    TEST2(i, errno, K_EXPECT_ERRNO_OK, "spurious errno %d != %d");
    TEST(ul, strtoul(s = "-4294967296", &c, K_BASE_AUTO), 4294967295UL, "uncaught negative overflow %lu != %lu");
    TEST2(i, c - s, K_PARSE_POS_11, "wrong final position %d != %d");
    TEST2(i, errno, ERANGE, "spurious errno %d != %d");
}

static void StrtolTestLongAs64Bits(int& i, long& l, unsigned long& ul, char*& s, char*& c)
{
    TEST(l, strtol(s = "9223372036854775808", &c, K_BASE_AUTO), 9223372036854775807L, "uncaught overflow %ld != %ld");
    TEST2(i, c - s, K_PARSE_POS_19, "wrong final position %d != %d");
    TEST2(i, errno, ERANGE, "missing errno %d != %d");
    TEST(l,
         strtol(s = "-9223372036854775809", &c, K_BASE_AUTO),
         -9223372036854775807L - 1,
         "uncaught overflow %ld != %ld");
    TEST2(i, c - s, K_PARSE_POS_20, "wrong final position %d != %d");
    TEST2(i, errno, ERANGE, "missing errno %d != %d");
    TEST(ul,
         strtoul(s = "18446744073709551616", &c, K_BASE_AUTO),
         18446744073709551615UL,
         "uncaught overflow %lu != %lu");
    TEST2(i, c - s, K_PARSE_POS_20, "wrong final position %d != %d");
    TEST2(i, errno, ERANGE, "missing errno %d != %d");
    TEST(ul, strtoul(s = "-1", &c, K_BASE_AUTO), -1UL, "rejected negative %lu != %lu");
    TEST2(i, c - s, K_PARSE_POS_2, "wrong final position %d != %d");
    TEST2(i, errno, K_EXPECT_ERRNO_OK, "spurious errno %d != %d");
    TEST(ul, strtoul(s = "-2", &c, K_BASE_AUTO), -2UL, "rejected negative %lu != %lu");
    TEST2(i, c - s, K_PARSE_POS_2, "wrong final position %d != %d");
    TEST2(i, errno, K_EXPECT_ERRNO_OK, "spurious errno %d != %d");
    TEST(ul,
         strtoul(s = "-9223372036854775808", &c, K_BASE_AUTO),
         -9223372036854775808UL,
         "rejected negative %lu != %lu");
    TEST2(i, c - s, K_PARSE_POS_20, "wrong final position %d != %d");
    TEST2(i, errno, K_EXPECT_ERRNO_OK, "spurious errno %d != %d");
    TEST(ul,
         strtoul(s = "-9223372036854775809", &c, K_BASE_AUTO),
         -9223372036854775809UL,
         "rejected negative %lu != %lu");
    TEST2(i, c - s, K_PARSE_POS_20, "wrong final position %d != %d");
    TEST2(i, errno, K_EXPECT_ERRNO_OK, "spurious errno %d != %d");
    TEST(ul,
         strtoul(s = "-18446744073709551616", &c, K_BASE_AUTO),
         18446744073709551615UL,
         "uncaught negative overflow %lu != %lu");
    TEST2(i, c - s, K_PARSE_POS_21, "wrong final position %d != %d");
    TEST2(i, errno, ERANGE, "spurious errno %d != %d");
}

static void StrtolTestLongWidthCases(int& i, long& l, unsigned long& ul, char*& s, char*& c)
{
    if (sizeof(long) == K_SIZEOF_LONG32) {
        StrtolTestLongAs32Bits(i, l, ul, s, c);
    } else if (sizeof(long) == K_SIZEOF_LONG64) {
        StrtolTestLongAs64Bits(i, l, ul, s, c);
    } else {
        t_error("sizeof(long) == %d, not implemented\n", static_cast<int>(sizeof(long)));
    }
}

static void StrtolTestLongLongAs64Bits(int& i, long long& ll, unsigned long long& ull, char*& s, char*& c)
{
    TEST(ll,
         strtoll(s = "9223372036854775808", &c, K_BASE_AUTO),
         9223372036854775807LL,
         "uncaught overflow %lld != %lld");
    TEST2(i, c - s, K_PARSE_POS_19, "wrong final position %d != %d");
    TEST2(i, errno, ERANGE, "missing errno %d != %d");
    TEST(ll,
         strtoll(s = "-9223372036854775809", &c, K_BASE_AUTO),
         -9223372036854775807LL - 1,
         "uncaught overflow %lld != %lld");
    TEST2(i, c - s, K_PARSE_POS_20, "wrong final position %d != %d");
    TEST2(i, errno, ERANGE, "missing errno %d != %d");
    TEST(ull,
         strtoull(s = "18446744073709551616", &c, K_BASE_AUTO),
         18446744073709551615ULL,
         "uncaught overflow %llu != %llu");
    TEST2(i, c - s, K_PARSE_POS_20, "wrong final position %d != %d");
    TEST2(i, errno, ERANGE, "missing errno %d != %d");
    TEST(ull, strtoull(s = "-1", &c, K_BASE_AUTO), -1ULL, "rejected negative %llu != %llu");
    TEST2(i, c - s, K_PARSE_POS_2, "wrong final position %d != %d");
    TEST2(i, errno, K_EXPECT_ERRNO_OK, "spurious errno %d != %d");
    TEST(ull, strtoull(s = "-2", &c, K_BASE_AUTO), -2ULL, "rejected negative %llu != %llu");
    TEST2(i, c - s, K_PARSE_POS_2, "wrong final position %d != %d");
    TEST2(i, errno, K_EXPECT_ERRNO_OK, "spurious errno %d != %d");
    TEST(ull,
         strtoull(s = "-9223372036854775808", &c, K_BASE_AUTO),
         -9223372036854775808ULL,
         "rejected negative %llu != %llu");
    TEST2(i, c - s, K_PARSE_POS_20, "wrong final position %d != %d");
    TEST2(i, errno, K_EXPECT_ERRNO_OK, "spurious errno %d != %d");
    TEST(ull,
         strtoull(s = "-9223372036854775809", &c, K_BASE_AUTO),
         -9223372036854775809ULL,
         "rejected negative %llu != %llu");
    TEST2(i, c - s, K_PARSE_POS_20, "wrong final position %d != %d");
    TEST2(i, errno, K_EXPECT_ERRNO_OK, "spurious errno %d != %d");
    TEST(ull,
         strtoull(s = "-18446744073709551616", &c, K_BASE_AUTO),
         18446744073709551615ULL,
         "uncaught negative overflow %llu != %llu");
    TEST2(i, c - s, K_PARSE_POS_21, "wrong final position %d != %d");
    TEST2(i, errno, ERANGE, "spurious errno %d != %d");
}

static void StrtolTestLongLongWidthCases(int& i, long long& ll, unsigned long long& ull, char*& s, char*& c)
{
    if (sizeof(long long) == K_SIZEOF_LONG64) {
        StrtolTestLongLongAs64Bits(i, ll, ull, s, c);
    } else {
        t_error("sizeof(long long) == %d, not implemented\n", static_cast<int>(sizeof(long long)));
    }
}

static void StrtolTestRadixEtcCases(int& i, long& l, char*& s, char*& c)
{
    TEST(l, strtol("z", nullptr, K_BASE_36), K_EXPECT_DIGIT_Z_IN_BASE36, "%ld != %ld");
    TEST(l, strtol("00010010001101000101011001111000", nullptr, K_BASE_BIN), K_VAL_0X12345678, "%ld != %ld");
    TEST(l, strtol(s = "0F5F", &c, K_BASE_HEX), K_VAL_0X0F5F, "%ld != %ld");

    TEST(l, strtol(s = "0xz", &c, K_BASE_HEX), K_EXPECT_LONG_ZERO, "%ld != %ld");
    TEST2(i, c - s, K_PARSE_POS_1, "wrong final position %ld != %ld");

    TEST(l, strtol(s = "0x1234", &c, K_BASE_HEX), K_VAL_0X1234, "%ld != %ld");
    TEST2(i, c - s, K_PARSE_POS_6, "wrong final position %ld != %ld");

    c = nullptr;
    TEST(l, strtol(s = "123", &c, K_BASE_INVALID), K_EXPECT_LONG_ZERO, "%ld != %ld");
    TEST2(i, c - s, K_PARSE_POS_0, "wrong final position %d != %d");
    TEST2(i, errno, EINVAL, "%d != %d");

    TEST(l, strtol(s = "  15437", &c, K_BASE_OCT), K_EXPECT_OCTAL_PARSED_15437, "%ld != %ld");
    TEST2(i, c - s, K_PARSE_POS_7, "wrong final position %d != %d");

    TEST(l, strtol(s = "  1", &c, K_BASE_AUTO), K_EXPECT_LONG_ONE, "%ld != %ld");
    TEST2(i, c - s, K_PARSE_POS_3, "wrong final position %d != %d");
}

static int StrtolTestImpl(void)
{
    int i;
    long l;
    unsigned long ul;
    long long ll;
    unsigned long long ull;
    char* s;
    char* c;

    TEST(l, atol("2147483647"), 2147483647L, "max 32bit signed %ld != %ld");
    TEST(l, strtol("2147483647", nullptr, K_BASE_AUTO), 2147483647L, "max 32bit signed %ld != %ld");
    TEST(ul, strtoul("4294967295", nullptr, K_BASE_AUTO), 4294967295UL, "max 32bit unsigned %lu != %lu");

    StrtolTestLongWidthCases(i, l, ul, s, c);
    StrtolTestLongLongWidthCases(i, ll, ull, s, c);
    StrtolTestRadixEtcCases(i, l, s, c);
    return T_STATUS;
}

int StrtolTest(void)
{
    return StrtolTestImpl();
}
