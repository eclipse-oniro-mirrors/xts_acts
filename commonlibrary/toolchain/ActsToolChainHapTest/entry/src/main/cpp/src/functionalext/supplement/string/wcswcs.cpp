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

namespace {
constexpr int K_ABC_REPEAT_BLOCKS = 33;
constexpr int K_ABC_TRIPLET_LEN = 3;
constexpr int K_LONG_WCS_BUF_ELEMS = 100;
constexpr int K_LONG_WCS_NUL_INDEX = 99;
constexpr int K_PATTERN_BUF_ELEMS = 20;
constexpr int K_INDEX_CAFE_E_ACUTE = 3;
constexpr int K_INDEX_NAIVE_I_DIAERESIS = 2;
constexpr int K_INDEX_UBER_U_UMLAUT = 0;
constexpr int K_WCS_OFF_0 = 0;
constexpr int K_WCS_OFF_1 = 1;
constexpr int K_WCS_OFF_2 = 2;
constexpr int K_WCS_OFF_3 = 3;
constexpr int K_WCS_OFF_4 = 4;
constexpr int K_WCS_OFF_5 = 5;
constexpr int K_WCS_OFF_6 = 6;
constexpr int K_WCS_OFF_8 = 8;
constexpr int K_WCS_ABB_ABABAB_BABABA = 2;
constexpr int K_WCS_ABB_ABABAB_ABABAB = 3;
constexpr int K_WCS_ABACABCABCAB_ABCABCAB = 4;
constexpr int K_WCS_NANA_ABA = 3;
constexpr int K_WCS_NANA_BAN = 4;
constexpr int K_WCS_NANA_ANAB = 1;
constexpr int K_WCS_NANA_BANANA = 8;
constexpr int K_WCS_FF_PATTERN_OFF = 2;
constexpr int K_WCS_SPACE_IN_HELLO = 5;
constexpr int K_WCS_TAB_AFTER_TAB = 3;
constexpr int K_WCS_NEWLINE_IN_NEW = 3;
constexpr int K_WCS_CR_IN_CARRIAGE = 8;
constexpr int K_WCS_SPACE_GROUP_OFF = 3;
constexpr int K_WCS_TAB_NR_OFF = 4;
constexpr int K_WCS_ALPHABET_XYZ = 23;
constexpr int K_WCS_ABCDE_FFG = 5;
constexpr int K_WCS_ABRACAD_DAB = 6;
constexpr int K_WCS_TRIPLET_INDEX_A = 0;
constexpr int K_WCS_TRIPLET_INDEX_B = 1;
constexpr int K_WCS_TRIPLET_INDEX_C = 2;
} // namespace

static void ExpectNotFound(const wchar_t* s, const wchar_t* sub)
{
    const wchar_t* p = s;
    const wchar_t* q = wcswcs(const_cast<wchar_t*>(p), sub);
    if (q != nullptr) {
        t_error("wcswcs returned str+%d, wanted nullptr\n", static_cast<int>(q - p));
    }
}

static void ExpectFoundAt(const wchar_t* s, const wchar_t* sub, int n)
{
    const wchar_t* p = s;
    const wchar_t* q = wcswcs(const_cast<wchar_t*>(p), sub);
    if (q == nullptr) {
        t_error("wcswcs returned nullptr, wanted str+%d\n", n);
    } else if (q - p != n) {
        t_error("wcswcs returned str+%d, wanted str+%d\n", static_cast<int>(q - p), n);
    }
}

/**
 * @tc.name      : Wcswcs0100
 * @tc.desc      : test the wcswcs method to find the first occurrence of the second wide string from the first wide
 *                 string
 * @tc.level     : Level 0
 */
void Wcswcs0100(void)
{
    ExpectFoundAt(L"", L"", K_WCS_OFF_0);
    ExpectFoundAt(L"abcd", L"", K_WCS_OFF_0);
    ExpectFoundAt(L"abcd", L"a", K_WCS_OFF_0);
    ExpectFoundAt(L"abcd", L"b", K_WCS_OFF_1);
    ExpectFoundAt(L"abcd", L"c", K_WCS_OFF_2);
    ExpectFoundAt(L"abcd", L"d", K_WCS_OFF_3);
    ExpectFoundAt(L"abcd", L"ab", K_WCS_OFF_0);
    ExpectFoundAt(L"abcd", L"bc", K_WCS_OFF_1);
    ExpectFoundAt(L"abcd", L"cd", K_WCS_OFF_2);
    ExpectFoundAt(L"ababa", L"baba", K_WCS_OFF_1);
    ExpectFoundAt(L"ababab", L"babab", K_WCS_OFF_1);
    ExpectFoundAt(L"abababa", L"bababa", K_WCS_OFF_1);
    ExpectFoundAt(L"abababab", L"bababab", K_WCS_OFF_1);
    ExpectFoundAt(L"ababababa", L"babababa", K_WCS_OFF_1);
    ExpectFoundAt(L"abbababab", L"bababa", K_WCS_ABB_ABABAB_BABABA);
    ExpectFoundAt(L"abbababab", L"ababab", K_WCS_ABB_ABABAB_ABABAB);
    ExpectFoundAt(L"abacabcabcab", L"abcabcab", K_WCS_ABACABCABCAB_ABCABCAB);
    ExpectFoundAt(L"nanabanabanana", L"aba", K_WCS_NANA_ABA);
    ExpectFoundAt(L"nanabanabanana", L"ban", K_WCS_NANA_BAN);
    ExpectFoundAt(L"nanabanabanana", L"anab", K_WCS_NANA_ANAB);
    ExpectFoundAt(L"nanabanabanana", L"banana", K_WCS_NANA_BANANA);
    ExpectFoundAt(L"_ _\xff_ _", L"_\xff_", K_WCS_FF_PATTERN_OFF);
}

/**
 * @tc.name      : Wcswcs0200
 * @tc.desc      : test the result of the wcswcs method when the second substring cannot be found from the first
 * substring
 * @tc.level     : Level 1
 */
void Wcswcs0200(void)
{
    ExpectNotFound(L"", L"a");
    ExpectNotFound(L"a", L"aa");
    ExpectNotFound(L"a", L"b");
    ExpectNotFound(L"aa", L"ab");
    ExpectNotFound(L"aa", L"aaa");
    ExpectNotFound(L"abba", L"aba");
    ExpectNotFound(L"abc abc", L"abcd");
    ExpectNotFound(L"0-1-2-3-4-5-6-7-8-9", L"-3-4-56-7-8-");
    ExpectNotFound(L"0-1-2-3-4-5-6-7-8-9", L"-3-4-5+6-7-8-");
    ExpectNotFound(L"_ _ _\xff_ _ _", L"_\x7f_");
    ExpectNotFound(L"_ _ _\x7f_ _ _", L"_\xff_");
}

/**
 * @tc.name      : Wcswcs0300
 * @tc.desc      : test wcswcs with overlapping patterns and edge cases
 * @tc.level     : Level 1
 */
void Wcswcs0300(void)
{
    // Overlapping pattern tests
    ExpectFoundAt(L"aaaabaaaa", L"aaa", K_WCS_OFF_0);
    ExpectFoundAt(L"mississippi", L"issi", K_WCS_OFF_1);
    ExpectFoundAt(L"abcabcabc", L"abcabc", K_WCS_OFF_0);
    ExpectFoundAt(L"ababababab", L"ababab", K_WCS_OFF_0);

    // Edge cases
    ExpectFoundAt(L"x", L"x", K_WCS_OFF_0);
    ExpectFoundAt(L"xy", L"xy", K_WCS_OFF_0);
    ExpectFoundAt(L"xyz", L"yz", K_WCS_OFF_1);
    ExpectFoundAt(L"a\0b", L"a", K_WCS_OFF_0); // String containing null character
}

/**
 * @tc.name      : Wcswcs0400
 * @tc.desc      : test wcswcs with very long strings and patterns
 * @tc.level     : Level 2
 */
void Wcswcs0400(void)
{
    wchar_t longStr[K_LONG_WCS_BUF_ELEMS];
    wchar_t pattern[K_PATTERN_BUF_ELEMS];

    // Generate long string "abcabc...abc"
    for (int i = 0; i < K_ABC_REPEAT_BLOCKS; i++) {
        wchar_t* p = longStr + i * K_ABC_TRIPLET_LEN;
        p[K_WCS_TRIPLET_INDEX_A] = L'a';
        p[K_WCS_TRIPLET_INDEX_B] = L'b';
        p[K_WCS_TRIPLET_INDEX_C] = L'c';
    }
    longStr[K_LONG_WCS_NUL_INDEX] = L'\0';

    ExpectFoundAt(longStr, L"abc", K_WCS_OFF_0);
    ExpectFoundAt(longStr, L"bca", K_WCS_OFF_1);
    ExpectFoundAt(longStr, L"abcabc", K_WCS_OFF_0);

    // test long pattern
    {
        const wchar_t lit[] = L"abcabcabcabc";
        size_t j = 0;
        for (; lit[j] != L'\0' && j + 1 < static_cast<size_t>(K_PATTERN_BUF_ELEMS); ++j) {
            pattern[j] = lit[j];
        }
        pattern[j] = L'\0';
    }
    ExpectFoundAt(longStr, pattern, K_WCS_OFF_0);
}

/**
 * @tc.name      : Wcswcs0500
 * @tc.desc      : test wcswcs with whitespace characters and control characters
 * @tc.level     : Level 1
 */
void Wcswcs0500(void)
{
    // Whitespace character tests
    ExpectFoundAt(L"hello world", L" ", K_WCS_SPACE_IN_HELLO);
    ExpectFoundAt(L"tab\ttab", L"\t", K_WCS_TAB_AFTER_TAB);
    ExpectFoundAt(L"new\nline", L"\n", K_WCS_NEWLINE_IN_NEW);
    ExpectFoundAt(L"carriage\rreturn", L"\r", K_WCS_CR_IN_CARRIAGE);

    // Mixed whitespace characters
    ExpectFoundAt(L"a b c d", L" c ", K_WCS_SPACE_GROUP_OFF);
    ExpectFoundAt(L"test\t\n\rstring", L"\t\n\r", K_WCS_TAB_NR_OFF);
}

/**
 * @tc.name      : Wcswcs0600
 * @tc.desc      : test wcswcs with repeated characters and patterns
 * @tc.level     : Level 0
 */
void Wcswcs0600(void)
{
    // Repeated character tests
    ExpectFoundAt(L"aaaaaaaaaa", L"aaa", K_WCS_OFF_0);
    ExpectFoundAt(L"aaaaaaaaaa", L"aaaaa", K_WCS_OFF_0);
    ExpectFoundAt(L"ababababab", L"abab", K_WCS_OFF_0);
    ExpectFoundAt(L"abcabcabc", L"bcab", K_WCS_OFF_1);

    // Partial matches that ultimately fail
    ExpectNotFound(L"abcdeabcdf", L"abcdg"); // Should not find "abcdg"
    ExpectNotFound(L"xyzxyzx", L"xyzb");
}

/**
 * @tc.name      : Wcswcs0700
 * @tc.desc      : test wcswcs with case sensitivity and character variations
 * @tc.level     : Level 1
 */
void Wcswcs0700(void)
{
    // Case sensitivity tests
    ExpectFoundAt(L"Hello World", L"World", K_WCS_OFF_6);
    ExpectNotFound(L"Hello WORLD", L"World");

    // Special character variants
    ExpectFoundAt(L"café au lait", L"é", K_INDEX_CAFE_E_ACUTE);
    ExpectFoundAt(L"naïve approach", L"ï", K_INDEX_NAIVE_I_DIAERESIS);
    ExpectFoundAt(L"über", L"ü", K_INDEX_UBER_U_UMLAUT);
}

/**
 * @tc.name      : Wcswcs0800
 * @tc.desc      : test wcswcs performance with partial matches and near misses
 * @tc.level     : Level 2
 */
void Wcswcs0800(void)
{
    // Partial match tests
    ExpectFoundAt(L"abcdefghijklmnopqrstuvwxyz", L"xyz", K_WCS_ALPHABET_XYZ);
    ExpectFoundAt(L"abcdeffghijkl", L"ffg", K_WCS_ABCDE_FFG);
    ExpectFoundAt(L"abracadabra", L"dab", K_WCS_ABRACAD_DAB);

    // Close but not exact matches
    ExpectNotFound(L"abcdefgh", L"abcdeg");
    ExpectNotFound(L"hello world", L"worlds");
    ExpectNotFound(L"programming", L"programmer");

    // Pattern longer than the string
    ExpectNotFound(L"short", L"this pattern is much longer than the string");
}

static int WcswcsTestImpl(int argc, char* argv[])
{
    Wcswcs0100();
    Wcswcs0200();
    Wcswcs0300();
    Wcswcs0400();
    Wcswcs0500();
    Wcswcs0600();
    Wcswcs0700();
    Wcswcs0800();
    return T_STATUS;
}

int WcswcsTest(void)
{
    static char libcProg[] = "libc_test";
    char* libcArgv[] = { libcProg, nullptr };
    return WcswcsTestImpl(1, libcArgv);
}
