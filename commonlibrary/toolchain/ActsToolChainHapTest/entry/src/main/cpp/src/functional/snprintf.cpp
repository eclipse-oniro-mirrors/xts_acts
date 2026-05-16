/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *	http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
#ifndef XOPEN_SOURCE
#define XOPEN_SOURCE 700
#endif
#include <cstdio>
#include <cstring>
#include <cerrno>
#include <climits>
#include <cmath>
#include "test.h"

#define DISABLE_SLOW_TESTS
#define BUFFER_SIZE 2000
#define SMALL_BUFFER 4
#define STR_LEN_6 6
#define STR_LEN_4 4
#define EXP_1022 1022
#define EXP_1021 1021
#define EXP_1023 1023
#define EXP_1024 1024
#define TEST_VALUE 123456
#define DECIMAL_BASE 10
#define SKIP_FIRST_CHAR 2
#define INT_MAX_VALUE 2147483647
#define BUFFER_OVERRUN_CHECK_INDEX 5

template<typename T>
static inline bool TestEqual(T &result, T value, T expected, const char *expr, const char *msg)
{
    result = value;
    if (result == expected) {
        return true;
    }
    t_error("%s failed (%s)\n", expr, msg);
    return false;
}

static inline bool TestStringEqual(const char *s, const char *x, const char *msg)
{
    if (!strcmp(s, x)) {
        return true;
    }
    t_error("[%s] != [%s] (%s)\n", s, x, msg);
    return false;
}

#define TEST(r, f, x, m) TestEqual(r, f, x, #f, m)
#define TEST_S(s, x, m) TestStringEqual(s, x, m)

static const struct {
    const char *fmt;
    int i;
    const char *expect;
} INT_TESTS[] = {
    /* width, precision, alignment */
    { "%04d", 12, "0012" },
    { "%.3d", 12, "012" },
    { "%3d", 12, " 12" },
    { "%-3d", 12, "12 " },
    { "%+3d", 12, "+12" },
    { "%+-5d", 12, "+12  " },
    { "%+- 5d", 12, "+12  " },
    { "%- 5d", 12, " 12  " },
    { "% d", 12, " 12" },
    { "%0-5d", 12, "12   " },
    { "%-05d", 12, "12   " },

    /* ...explicit precision of 0 shall be no characters except for alt-octal. */
    { "%.0d", 0, "" },
    { "%.0o", 0, "" },
    { "%#.0d", 0, "" },
    { "%#.0o", 0, "0" },
    { "%#.0x", 0, "" },

    /* ...but it still has to honor width and flags. */
    { "%2.0u", 0, "  " },
    { "%02.0u", 0, "  " },
    { "%2.0d", 0, "  " },
    { "%02.0d", 0, "  " },
    { "% .0d", 0, " " },
    { "%+.0d", 0, "+" },

    /* hex: test alt form and case */
    { "%x", 63, "3f" },
    { "%#x", 63, "0x3f" },
    { "%X", 63, "3F" },

    /* octal: test alt form */
    { "%o", 15, "17" },
    { "%#o", 15, "017" },

    /* octal: corner cases */
    { "%#o", 0, "0" },
    { "%#.0o", 0, "0" },
    { "%#.1o", 0, "0" },
    { "%#o", 1, "01" },
    { "%#.0o", 1, "01" },
    { "%#.1o", 1, "01" },
    { "%#04o", 1, "0001" },
    { "%#04.0o", 1, "  01" },
    { "%#04.1o", 1, "  01" },
    { "%04o", 1, "0001" },
    { "%04.0o", 1, "   1" },
    { "%04.1o", 1, "   1" },

    { nullptr, 0, nullptr }
};

static const struct {
    const char *fmt;
    double f;
    const char *expect;
} FP_TESTS[] = {
    /* basic form, handling of exponent/precision for 0 */
    { "%a", 0.0, "0x0p+0" },
    { "%e", 0.0, "0.000000e+00" },
    { "%f", 0.0, "0.000000" },
    { "%g", 0.0, "0" },
    { "%#g", 0.0, "0.00000" },
    { "%la", 0.0, "0x0p+0" },
    { "%le", 0.0, "0.000000e+00" },
    { "%lf", 0.0, "0.000000" },
    { "%lg", 0.0, "0" },
    { "%#lg", 0.0, "0.00000" },

    /* rounding */
    { "%f", 1.1, "1.100000" },
    { "%f", 1.2, "1.200000" },
    { "%f", 1.3, "1.300000" },
    { "%f", 1.4, "1.400000" },
    { "%f", 1.5, "1.500000" },
    { "%.4f", 1.06125, "1.0613" }, /* input is not representible exactly as double */
    { "%.4f", 1.03125, "1.0312" }, /* 0x1.08p0 */
    { "%.2f", 1.375, "1.38" },
    { "%.1f", 1.375, "1.4" },
    { "%.1lf", 1.375, "1.4" },
    { "%.15f", 1.1, "1.100000000000000" },
    { "%.16f", 1.1, "1.1000000000000001" },
    { "%.17f", 1.1, "1.10000000000000009" },
    { "%.2e", 1500001.0, "1.50e+06" },
    { "%.2e", 1505000.0, "1.50e+06" },
    { "%.2e", 1505000.00000095367431640625, "1.51e+06" },
    { "%.2e", 1505001.0, "1.51e+06" },
    { "%.2e", 1506000.0, "1.51e+06" },
    
    /* correctness in DBL_DIG digits */
    { "%.15g", 1.23456789012345, "1.23456789012345" },

    /* correct choice of notation for %g */
    { "%g", 0.0001, "0.0001" },
    { "%g", 0.00001, "1e-05" },
    { "%g", 123456, "123456" },
    { "%g", 1234567, "1.23457e+06" },
    { "%.7g", 1234567, "1234567" },
    { "%.7g", 12345678, "1.234568e+07" },
    { "%.8g", 0.1, "0.1" },
    { "%.9g", 0.1, "0.1" },
    { "%.10g", 0.1, "0.1" },
    { "%.11g", 0.1, "0.1" },

    /* pi in double precision, printed to a few extra decimal positions */
    { "%.15f", M_PI, "3.141592653589793" },
    { "%.18f", M_PI, "3.141592653589793116" },

    /* exact conversion of large integers */
    { "%.0f", 340282366920938463463374607431768211456.0,
        "340282366920938463463374607431768211456" },

    { nullptr, 0.0, nullptr }
};

static void TestBasicSnprintf(char *b)
{
    int i;

    TEST(i, snprintf(nullptr, 0, "%d", TEST_VALUE), STR_LEN_6, "length returned %d != %d");
    TEST(i, snprintf(nullptr, 0, "%.4s", "hello"), STR_LEN_4, "length returned %d != %d");
    TEST(i, snprintf(b, 0, "%.0s", "goodbye"), 0, "length returned %d != %d");

    strcpy(b, "xxxxxxxx");
    TEST(i, snprintf(b, SMALL_BUFFER, "%d", TEST_VALUE), STR_LEN_6, "length returned %d != %d");
    TEST_S(b, "123", "incorrect output");
    if (b[BUFFER_OVERRUN_CHECK_INDEX] != 'x') {
        t_error("b[5] failed (buffer overrun)\n");
    }
}

static void TestTinyDoubles(char *b)
{
    int i;
    int j;
    int k;

    /* Perform ascii arithmetic to test printing tiny doubles */
    TEST(i, snprintf(b, BUFFER_SIZE, "%.1022f", 0x1p-1021), EXP_1024, "%d != %d");
    b[1] = '0';
    for (i = 0; i < EXP_1021; i++) {
        for (k = 0, j = EXP_1023; j > 0; j--) {
            if (b[j] < '5') {
                b[j] += b[j] - '0' + k, k = 0;
            } else {
                b[j] += b[j] - '0' - DECIMAL_BASE + k, k = 1;
            }
        }
    }
    if (b[1] != '1') {
        t_error("b[1] failed ('%c' != '%c')\n", b[1], '1');
    }
    for (j = SKIP_FIRST_CHAR; b[j] == '0'; j++) {
    }
    TEST(i, j, EXP_1024, "%d != %d");

#ifndef DISABLE_SLOW_TESTS
    errno = 0;
    TEST(i, snprintf(NULL, 0, "%.*u", INT_MAX_VALUE, 0), INT_MAX_VALUE, "cannot print max length %d");
    TEST(i, snprintf(NULL, 0, "%.*u ", INT_MAX_VALUE, 0), -1, "integer overflow %d");
    TEST(i, errno, EOVERFLOW, "after overflow: %d != %d");
#endif
}

static void TestIntegerFormats(char *b)
{
    int i;
    int j;

    for (j = 0; INT_TESTS[j].fmt; j++) {
        i = snprintf(b, BUFFER_SIZE, INT_TESTS[j].fmt, INT_TESTS[j].i);
        if (i != strlen(INT_TESTS[j].expect)) {
            t_error("snprintf(b, sizeof b, \"%s\", %d) returned %d wanted %d\n",
                INT_TESTS[j].fmt, INT_TESTS[j].i, i, strlen(INT_TESTS[j].expect));
        }
        if (strcmp(b, INT_TESTS[j].expect) != 0) {
            t_error("bad integer conversion: got \"%s\", want \"%s\"\n", b, INT_TESTS[j].expect);
        }
    }
}

static void TestFloatFormats(char *b)
{
    int i;
    int j;

    for (j = 0; FP_TESTS[j].fmt; j++) {
        i = snprintf(b, BUFFER_SIZE, FP_TESTS[j].fmt, FP_TESTS[j].f);
        if (i != strlen(FP_TESTS[j].expect)) {
            t_error("snprintf(b, sizeof b, \"%s\", %f) returned %d wanted %d\n",
                FP_TESTS[j].fmt, FP_TESTS[j].f, i, strlen(FP_TESTS[j].expect));
        }
        if (strcmp(b, FP_TESTS[j].expect) != 0) {
            t_error("bad floating-point conversion: got \"%s\", want \"%s\"\n", b, FP_TESTS[j].expect);
        }
    }

    TEST(i, snprintf(nullptr, 0, "%.4a", 1.0), 11, "%d != %d");
}

static int SnprintfTestImpl(void)
{
    char b[BUFFER_SIZE];

    TestBasicSnprintf(b);
    TestTinyDoubles(b);
    TestIntegerFormats(b);
    TestFloatFormats(b);
    return g_tStatus;
}

int SnprintfTest(void)
{
    return SnprintfTestImpl();
}
