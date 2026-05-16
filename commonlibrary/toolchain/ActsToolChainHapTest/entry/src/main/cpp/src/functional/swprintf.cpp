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

/* Enable X/Open System Interfaces Extension (POSIX.1-2008)
 * This is a standard feature test macro, not a user-defined identifier.
 * Required for wide character formatting functions.
 */
#ifndef _XOPEN_SOURCE
#endif
#include <cstdio>
#include <cstring>
#include <cerrno>
#include <climits>
#include <cmath>
#include <cwchar>
#include <clocale>
#include <langinfo.h>
#include "test.h"

#define TEST(r, f, x, m) ( \
    ((r) = (f)) == (x) || \
    (t_error("%s failed (" m ")\n", #f, r, x), 0))

#define TEST_S(s, x, m) ( \
    !wcscmp((s), (x)) || \
    (t_error("[%ls] != [%ls] (%s)\n", s, x, m), 0))

static const struct {
    const wchar_t *fmt;
    int i;
    const wchar_t *expect;
} INT_TESTS[] = {
    /* width, precision, alignment */
    { L"%04d", 12, L"0012" },
    { L"%.3d", 12, L"012" },
    { L"%3d", 12, L" 12" },
    { L"%-3d", 12, L"12 " },
    { L"%+3d", 12, L"+12" },
    { L"%+-5d", 12, L"+12  " },
    { L"%+- 5d", 12, L"+12  " },
    { L"%- 5d", 12, L" 12  " },
    { L"% d", 12, L" 12" },
    { L"%0-5d", 12, L"12   " },
    { L"%-05d", 12, L"12   " },

    /* ...explicit precision of 0 shall be no characters except for alt-octal. */
    { L"%.0d", 0, L"" },
    { L"%.0o", 0, L"" },
    { L"%#.0d", 0, L"" },
    { L"%#.0o", 0, L"0" },
    { L"%#.0x", 0, L"" },

    /* hex: test alt form and case */
    { L"%x", 63, L"3f" },
    { L"%#x", 63, L"0x3f" },
    { L"%X", 63, L"3F" },

    /* octal: test alt form */
    { L"%o", 15, L"17" },
    { L"%#o", 15, L"017" },

    { nullptr, 0, nullptr }
};

static const struct {
    const wchar_t *fmt;
    double f;
    const wchar_t *expect;
} FP_TESTS[] = {
    /* basic form, handling of exponent/precision for 0 */
    { L"%e", 0.0, L"0.000000e+00" },
    { L"%f", 0.0, L"0.000000" },
    { L"%g", 0.0, L"0" },
    { L"%#g", 0.0, L"0.00000" },

    /* rounding */
    { L"%f", 1.1, L"1.100000" },
    { L"%f", 1.2, L"1.200000" },
    { L"%f", 1.3, L"1.300000" },
    { L"%f", 1.4, L"1.400000" },
    { L"%f", 1.5, L"1.500000" },
    
    /* correctness in DBL_DIG digits */
    { L"%.15g", 1.23456789012345, L"1.23456789012345" },

    /* correct choice of notation for %g */
    { L"%g", 0.0001, L"0.0001" },
    { L"%g", 0.00001, L"1e-05" },
    { L"%g", 123456, L"123456" },
    { L"%g", 1234567, L"1.23457e+06" },
    { L"%.7g", 1234567, L"1234567" },
    { L"%.7g", 12345678, L"1.234568e+07" },

    /* pi in double precision, printed to a few extra decimal positions */
    { L"%.15f", M_PI, L"3.141592653589793" },
    { L"%.18f", M_PI, L"3.141592653589793116" },

    /* exact conversion of large integers */
    { L"%.0f", 340282366920938463463374607431768211456.0,
        L"340282366920938463463374607431768211456" },

    { nullptr, 0.0, nullptr }
};

static int SwprintfTestImpl(void)
{
    int i;
    int j;
    wchar_t b[500];

    (void)(
        setlocale(LC_CTYPE, "en_US.UTF-8") ||
        setlocale(LC_CTYPE, "en_GB.UTF-8") ||
        setlocale(LC_CTYPE, "en.UTF-8") ||
        setlocale(LC_CTYPE, "POSIX.UTF-8") ||
        setlocale(LC_CTYPE, "C.UTF-8") ||
        setlocale(LC_CTYPE, "UTF-8") ||
        setlocale(LC_CTYPE, ""));

    TEST(i, strcmp(nl_langinfo(CODESET), "UTF-8"), 0, "no UTF-8 locale; tests might fail");

    TEST(i, swprintf(nullptr, 0, L"%d", 123456) < 0, 1, "%d != %d");

    TEST(i, swprintf(b, 2, L"%lc", 0xc0), 1, "%d != %d");
    TEST(i, b[0], 0xc0, "wrong character %x != %x");
    TEST(i, swprintf(b, 2, L"%lc", 0x20ac), 1, "%d != %d");
    TEST(i, b[0], 0x20ac, "wrong character %x != %x");
    TEST(i, swprintf(b, 3, L"%s", "\xc3\x80!"), 2, "%d != %d");
    TEST(i, b[0], 0xc0, "wrong character %x != %x");
    TEST(i, swprintf(b, 2, L"%.1s", "\xc3\x80!"), 1, "%d != %d");
    TEST(i, b[0], 0xc0, "wrong character %x != %x");

    wcscpy(b, L"xxxxxxxx");
    TEST(i, swprintf(b, 4, L"%d", 123456) < 0, 1, "%d != %d");
    TEST_S(b, L"123", "incorrect output");
    TEST(i, b[5], 'x', "buffer overrun");

    for (j = 0; INT_TESTS[j].fmt; j++) {
        i = swprintf(b, sizeof b, INT_TESTS[j].fmt, INT_TESTS[j].i);
        if (i != wcslen(INT_TESTS[j].expect)) {
            t_error("swprintf(b, sizeof b, \"%ls\", %d) returned %d wanted %d\n",
                INT_TESTS[j].fmt, INT_TESTS[j].i, i, wcslen(INT_TESTS[j].expect));
        }
        if (wcscmp(b, INT_TESTS[j].expect) != 0) {
            t_error("bad integer conversion: got \"%ls\", want \"%ls\"\n", b, INT_TESTS[j].expect);
        }
    }

    for (j = 0; FP_TESTS[j].fmt; j++) {
        i = swprintf(b, sizeof b, FP_TESTS[j].fmt, FP_TESTS[j].f);
        if (i != wcslen(FP_TESTS[j].expect)) {
            t_error("swprintf(b, sizeof b, \"%ls\", %f) returned %d wanted %d\n",
                FP_TESTS[j].fmt, FP_TESTS[j].f, i, wcslen(FP_TESTS[j].expect));
        }
        if (wcscmp(b, FP_TESTS[j].expect) != 0) {
            t_error("bad floating-point conversion: got \"%ls\", want \"%ls\"\n", b, FP_TESTS[j].expect);
        }
    }
    return g_tStatus;
}

int SwprintfTest(void)
{
    return SwprintfTestImpl();
}

