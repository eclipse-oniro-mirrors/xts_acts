/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
#include <algorithm>
#include <cstdio>
#include <cstring>
#include "test.h"

namespace {
constexpr size_t K_LEN0 = 0;
constexpr size_t K_LEN1 = 1;
constexpr size_t K_LEN2 = 2;
constexpr size_t K_LEN3 = 3;
constexpr size_t K_LEN4 = 4;
constexpr size_t K_LEN5 = 5;
constexpr size_t K_LEN6 = 6;
constexpr size_t K_LEN7 = 7;
constexpr size_t K_LEN8 = 8;
constexpr size_t K_LEN9 = 9;
constexpr size_t K_LEN10 = 10;
constexpr size_t K_LEN11 = 11;
constexpr size_t K_LEN12 = 12;
constexpr size_t K_LEN13 = 13;
constexpr size_t K_LEN17 = 17;
constexpr size_t K_LEN20 = 20;
constexpr size_t K_LEN99 = 99;
constexpr size_t K_LEN100 = 100;
constexpr size_t K_LEN255 = 255;
constexpr size_t K_LEN1024 = 1024;
constexpr size_t K_CHAR_ARR100 = 100;
constexpr size_t K_CHAR_ARR256 = 256;
constexpr size_t K_CHAR_ARR1025 = 1025;
constexpr size_t K_PTR_OFFSET_1 = 1;
constexpr size_t K_PTR_OFFSET_2 = 2;
constexpr size_t K_PTR_OFFSET_4 = 4;
constexpr size_t K_PTR_OFFSET_5 = 5;
constexpr size_t K_PTR_OFFSET_6 = 6;
} // namespace

void TestStrlenEmptyString()
{
    if (strlen("") != K_LEN0) {
        t_error("Empty string length should be 0\n");
    }
}

void TestStrlenWithSpaces()
{
    if (strlen(" ") != K_LEN1) {
        t_error("Length of single space should be 1\n");
    }
    if (strlen("  ") != K_LEN2) {
        t_error("Length of double space should be 2\n");
    }
    if (strlen(" a ") != K_LEN3) {
        t_error("Length of ' a ' should be 3\n");
    }
    if (strlen(" a b ") != K_LEN5) {
        t_error("Length of ' a b ' should be 5\n");
    }
    if (strlen("    ") != K_LEN4) {
        t_error("Length of 4 spaces should be 4\n");
    }
}

void TestStrlenSpecialChars()
{
    if (strlen("!@#$%^&*()") != K_LEN10) {
        t_error("Length of special chars string should be 10\n");
    }
    if (strlen("[]{}<>?|") != K_LEN8) {
        t_error("Length of bracket string should be 8\n");
    }
    if (strlen("`~\\\"'") != K_LEN5) {
        t_error("Length of escaped chars string should be 5\n");
    }
}

void TestStrlenEscapedChars()
{
    if (strlen("a\nb") != K_LEN3) {
        t_error("Length of 'a\\nb' should be 3\n");
    }
    if (strlen("a\tb") != K_LEN3) {
        t_error("Length of 'a\\tb' should be 3\n");
    }
    if (strlen("\n\n\n") != K_LEN3) {
        t_error("Length of '\\n\\n\\n' should be 3\n");
    }
    if (strlen("line1\nline2") != K_LEN11) {
        t_error("Length of multiline string should be 11\n");
    }
    if (strlen("tab\tseparated") != K_LEN13) {
        t_error("Length of tab-separated string should be 13\n");
    }
}

void TestStrlenWithEmbeddedNull()
{
    const char str1[] = { 'a', '\0', 'b', '\0' };
    if (strlen(str1) != K_LEN1) {
        t_error("Length of string with embedded null should be 1\n");
    }

    const char str2[] = { 'h', 'e', '\0', 'l', 'l', 'o' };
    if (strlen(str2) != K_LEN2) {
        t_error("Length of string with early null should be 2\n");
    }

    const char str3[] = { '\0', 'x' };
    if (strlen(str3) != K_LEN0) {
        t_error("Length of null-first string should be 0\n");
    }
}

void TestStrlenLongString()
{
    char str100[] =
        "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
        "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa\0";
    if (strlen(str100) != K_LEN100) {
        t_error("Length of 100-char string should be 100\n");
    }
    char str255[] =
        "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
        "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
        "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
        "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
        "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
        "aaaaa\0";
    if (strlen(str255) != K_LEN255) {
        t_error("Length of 255-char string should be 255 actually %zu\n", strlen(str255));
    }
}

void TestStrlenCharArrays()
{
    char s1[K_LEN10] = "";
    if (strlen(s1) != K_LEN0) {
        t_error("Length of empty array should be 0\n");
    }

    char s2[K_LEN10] = "hi";
    if (strlen(s2) != K_LEN2) {
        t_error("Length of 'hi' should be 2\n");
    }

    char s3[K_LEN5] = { 'x', 'y', 'z', 0, 'q' };
    if (strlen(s3) != K_LEN3) {
        t_error("Length of 'xyz' array should be 3\n");
    }

    char s4[] = { 'h', 'e', 'l', 'l', 'o', 0 };
    if (strlen(s4) != K_LEN5) {
        t_error("Length of 'hello' array should be 5\n");
    }
}

void TestStrlenBoundaryManual()
{
    char s1[] = "a";
    if (strlen(s1) != K_LEN1) {
        t_error("Length of 'a' should be 1\n");
    }

    char s2[] = "aa";
    if (strlen(s2) != K_LEN2) {
        t_error("Length of 'aa' should be 2\n");
    }

    char s3[] = "aaa";
    if (strlen(s3) != K_LEN3) {
        t_error("Length of 'aaa' should be 3\n");
    }

    char s4[] = "aaaa";
    if (strlen(s4) != K_LEN4) {
        t_error("Length of 'aaaa' should be 4\n");
    }

    char s5[] = "aaaaa";
    if (strlen(s5) != K_LEN5) {
        t_error("Length of 'aaaaa' should be 5\n");
    }

    char s6[] = "aaaaaa";
    if (strlen(s6) != K_LEN6) {
        t_error("Length of 'aaaaaa' should be 6\n");
    }

    char s7[] = "aaaaaaa";
    if (strlen(s7) != K_LEN7) {
        t_error("Length of 'aaaaaaa' should be 7\n");
    }

    char s8[] = "aaaaaaaa";
    if (strlen(s8) != K_LEN8) {
        t_error("Length of 'aaaaaaaa' should be 8\n");
    }

    char s9[] = "aaaaaaaaa";
    if (strlen(s9) != K_LEN9) {
        t_error("Length of 'aaaaaaaaa' should be 9\n");
    }

    char s10[] = "aaaaaaaaaa";
    if (strlen(s10) != K_LEN10) {
        t_error("Length of 'aaaaaaaaaa' should be 10\n");
    }
}

void TestStrlenUtf8()
{
    if (strlen("你好") != K_LEN6) {
        t_error("Length of Chinese '你好' should be 6\n");
    }
    if (strlen("世界") != K_LEN6) {
        t_error("Length of Chinese '世界' should be 6\n");
    }
    if (strlen("你好世界") != K_LEN12) {
        t_error("Length of Chinese '你好世界' should be 12\n");
    }
}

void TestStrlenMiscCases()
{
    char s[] = "test\0hidden";
    if (strlen(s) != K_LEN4) {
        t_error("Length of 'test\\0hidden' should be 4\n");
    }

    const char* p = "pointer test";
    if (strlen(p) != K_LEN12) {
        t_error("Length of 'pointer test' should be 12\n");
    }

    char s2[] = { 't', 'e', 's', 't', 0 };
    if (strlen(s2) != K_LEN4) {
        t_error("Length of 'test' array should be 4\n");
    }

    char s3[] = { 0 };
    if (strlen(s3) != K_LEN0) {
        t_error("Length of null array should be 0\n");
    }
}

void TestStrlenConcatenatedLiterals()
{
    if (strlen("hello"
               "world") != K_LEN10) {
        t_error("Length of concatenated 'helloworld' should be 10\n");
    }
    if (strlen("foo"
               "bar"
               "baz") != K_LEN9) {
        t_error("Length of concatenated 'foobarbaz' should be 9\n");
    }
    if (strlen(""
               "") != K_LEN0) {
        t_error("Length of concatenated empty strings should be 0\n");
    }
    if (strlen("abc"
               "") != K_LEN3) {
        t_error("Length of 'abc' concatenated with empty should be 3\n");
    }
    if (strlen(""
               "xyz") != K_LEN3) {
        t_error("Length of empty concatenated with 'xyz' should be 3\n");
    }
}

void TestStrlenRepeatedChars()
{
    char a[] = "aaaaaaaaaaaaaaaaaaaa";
    if (strlen(a) != K_LEN20) {
        t_error("Length of 20 'a's should be 20\n");
    }

    char b[] = "bbbbbbbbbbbbbbbbb";
    if (strlen(b) != K_LEN17) {
        t_error("Length of 17 'b's should be 17\n");
    }

    char c[] = "cccccccccccc";
    if (strlen(c) != K_LEN12) {
        t_error("Length of 12 'c's should be 12\n");
    }
}

void TestStrlenWithPointerOffsets()
{
    char base[] = "abcdef";
    if (strlen(base + K_PTR_OFFSET_1) != K_LEN5) {
        t_error("Length from offset 1 should be 5\n");
    }
    if (strlen(base + K_PTR_OFFSET_2) != K_LEN4) {
        t_error("Length from offset 2 should be 4\n");
    }
    if (strlen(base + K_PTR_OFFSET_5) != K_LEN1) {
        t_error("Length from offset 5 should be 1\n");
    }
    if (strlen(base + K_PTR_OFFSET_6) != K_LEN0) {
        t_error("Length from offset 6 should be 0\n");
    }
}

void TestStrlenStaticConsts()
{
    static const char* a = "const1";
    if (strlen(a) != K_LEN6) {
        t_error("Length of 'const1' should be 6\n");
    }

    static const char* b = "a slightly longer const string";
    if (strlen(b) != strlen("a slightly longer const string")) {
        t_error("Length of long const string mismatch\n");
    }

    static const char* c = "";
    if (strlen(c) != K_LEN0) {
        t_error("Length of empty const string should be 0\n");
    }
}

void TestStrlenStackAllocated()
{
    char a[K_LEN6] = "hello";
    if (strlen(a) != K_LEN5) {
        t_error("Length of stack 'hello' should be 5\n");
    }

    char b[] = { 'w', 'o', 'r', 'l', 'd', '\0' };
    if (strlen(b) != K_LEN5) {
        t_error("Length of stack 'world' should be 5\n");
    }
}

void TestStrlenWithBackslashSequences()
{
    if (strlen("a\\b\\c") != K_LEN5) {
        t_error("Length of 'a\\\\b\\\\c' should be 5\n");
    }
    if (strlen("line\\n") != K_LEN6) {
        t_error("Length of 'line\\\\n' should be 6\n");
    }
    if (strlen("quote\\\"") != K_LEN7) {
        t_error("Length of 'quote\\\\\"' should be 7\n");
    }
}

void TestStrlenInlineNullCharacters()
{
    char a[] = { 'A', 'B', 'C', '\0', 'D', 'E', '\0' };
    if (strlen(a) != K_LEN3) {
        t_error("Length of array with inline null should be 3\n");
    }

    char b[] = { 'x', '\0', '\0', 'z' };
    if (strlen(b) != K_LEN1) {
        t_error("Length of array with early null should be 1\n");
    }

    char c[] = { '\0', 'a', 'b' };
    if (strlen(c) != K_LEN0) {
        t_error("Length of array with first null should be 0\n");
    }
}

void TestStrlenExtendedAscii()
{
    char a[] = { 127, 0 };
    if (strlen(a) != K_LEN1) {
        t_error("Length of extended ASCII 127 should be 1\n");
    }

    char b[] = { static_cast<char>(200), static_cast<char>(201), 0 };
    if (strlen(b) != K_LEN2) {
        t_error("Length of extended ASCII 200,201 should be 2\n");
    }

    char c[] = { static_cast<char>(255), 0 };
    if (strlen(c) != K_LEN1) {
        t_error("Length of extended ASCII 255 should be 1\n");
    }
}

void TestStrlenNullAtEndOfBuffer()
{
    char a[K_CHAR_ARR100];
    std::fill_n(a, K_LEN99, 'x');
    a[K_LEN99] = '\0';
    if (strlen(a) != K_LEN99) {
        t_error("Length of 99 'x's should be 99\n");
    }
}

void TestStrlenPartialInitArray()
{
    char s[K_LEN10] = "abc";
    if (strlen(s) != K_LEN3) {
        t_error("Length of partially initialized 'abc' should be 3\n");
    }

    char t[K_LEN20] = "abcdefgh";
    if (strlen(t) != K_LEN8) {
        t_error("Length of partially initialized 'abcdefgh' should be 8\n");
    }
}

void TestStrlenMaxSafe()
{
    char longbuf[K_CHAR_ARR256];
    for (int i = 0; i < static_cast<int>(K_LEN255); ++i) {
        longbuf[i] = 'a';
    }
    longbuf[K_LEN255] = '\0';
    if (strlen(longbuf) != K_LEN255) {
        t_error("Length of 255 'a's should be 255\n");
    }
}

void TestStrlenManualTruncate()
{
    char s[] = "abcdefghij";
    s[K_LEN5] = '\0';
    if (strlen(s) != K_LEN5) {
        t_error("Length after truncate at 5 should be 5\n");
    }

    s[K_LEN1] = '\0';
    if (strlen(s) != K_LEN1) {
        t_error("Length after truncate at 1 should be 1\n");
    }
}

void TestStrlenWeirdPrintables()
{
    char s1[] = "abc\tdef";
    if (strlen(s1) != K_LEN7) {
        t_error("Length of 'abc\\tdef' should be 7\n");
    }

    char s2[] = "abc\vdef";
    if (strlen(s2) != K_LEN7) {
        t_error("Length of 'abc\\vdef' should be 7\n");
    }
}

void TestStrlenWhitespaceMix()
{
    if (strlen("    ") != K_LEN4) {
        t_error("Length of 4 spaces should be 4\n");
    }
    if (strlen(" \t \n ") != K_LEN5) {
        t_error("Length of mixed whitespace should be 5\n");
    }
    if (strlen("\t\t\t") != K_LEN3) {
        t_error("Length of 3 tabs should be 3\n");
    }
}

void TestStrlenReverseEmbeddedNull()
{
    char s[] = { 'z', 'y', 'x', '\0', 'w', 'v' };
    if (strlen(s) != K_LEN3) {
        t_error("Length with reverse embedded null should be 3\n");
    }
}

void TestStrlenManualFillBuffer()
{
    char s[K_LEN6];
    s[K_LEN0] = 'a';
    s[K_LEN1] = 'b';
    s[K_LEN2] = 'c';
    s[K_LEN3] = 'd';
    s[K_LEN4] = '\0';
    s[K_LEN5] = 'x';
    if (strlen(s) != K_LEN4) {
        t_error("Length of manually filled buffer should be 4\n");
    }
}

void TestStrlenDynamicInitShort()
{
    char s[K_LEN4] = { 0 };
    s[K_LEN0] = 'a';
    s[K_LEN1] = 'b';
    s[K_LEN2] = 'c';
    s[K_LEN3] = '\0';
    if (strlen(s) != K_LEN3) {
        t_error("Length of dynamically initialized buffer should be 3\n");
    }
}

void TestStrlenUnicodeMix()
{
    if (strlen("a你b好c") != K_LEN9) {
        t_error("Length of mixed Unicode string should be 9\n");
    }
    if (strlen("αβγ") != K_LEN6) {
        t_error("Length of Greek letters should be 6\n");
    }
}

void TestStrlenVeryLongString()
{
    char veryLong[K_CHAR_ARR1025];
    std::fill_n(veryLong, K_LEN1024, 'x');
    veryLong[K_LEN1024] = '\0';
    if (strlen(veryLong) != K_LEN1024) {
        t_error("Length of very long string should be 1024\n");
    }
}

void TestStrlenNullOnly()
{
    char s[] = { '\0' };
    if (strlen(s) != K_LEN0) {
        t_error("Length of null-only string should be 0\n");
    }
}

void TestStrlenAlternatingChars()
{
    char s[] = "a\0b\0c\0d";
    if (strlen(s) != K_LEN1) {
        t_error("Length of alternating chars string should be 1\n");
    }
}

void TestStrlenAllControlChars()
{
    char s[] = { 1, 2, 3, 4, 5, 0 };
    if (strlen(s) != K_LEN5) {
        t_error("Length of control chars string should be 5\n");
    }
}

void TestStrlenHexChars()
{
    char s[] = "\x41\x42\x43\x00\x44";
    if (strlen(s) != K_LEN3) {
        t_error("Length of hex string should be 3\n");
    }
}

void TestStrlenOctalChars()
{
    char s[] = "\101\102\103\000\104";
    if (strlen(s) != K_LEN3) {
        t_error("Length of octal string should be 3\n");
    }
}

void TestStrlenOnePastNull()
{
    char s[] = "abc\0d";
    if (strlen(s + K_PTR_OFFSET_4) != K_LEN1) {
        t_error("Length past null should be 1\n");
    }
}

void TestStrlenEmptyAfterNull()
{
    char s[] = "\0abc";
    if (strlen(s + 1) != K_LEN3) {
        t_error("Length after null should be 3\n");
    }
}

static int StrlenTestTestImpl()
{
    TestStrlenEmptyString();
    TestStrlenWithSpaces();
    TestStrlenSpecialChars();
    TestStrlenEscapedChars();
    TestStrlenWithEmbeddedNull();
    TestStrlenLongString();
    TestStrlenCharArrays();
    TestStrlenBoundaryManual();
    TestStrlenUtf8();
    TestStrlenMiscCases();
    TestStrlenConcatenatedLiterals();
    TestStrlenRepeatedChars();
    TestStrlenWithPointerOffsets();
    TestStrlenStaticConsts();
    TestStrlenStackAllocated();
    TestStrlenWithBackslashSequences();
    TestStrlenInlineNullCharacters();
    TestStrlenExtendedAscii();
    TestStrlenNullAtEndOfBuffer();
    TestStrlenPartialInitArray();
    TestStrlenMaxSafe();
    TestStrlenManualTruncate();
    TestStrlenWeirdPrintables();
    TestStrlenWhitespaceMix();
    TestStrlenReverseEmbeddedNull();
    TestStrlenManualFillBuffer();
    TestStrlenDynamicInitShort();
    TestStrlenUnicodeMix();
    TestStrlenVeryLongString();
    TestStrlenNullOnly();
    TestStrlenAlternatingChars();
    TestStrlenAllControlChars();
    TestStrlenHexChars();
    TestStrlenOctalChars();
    TestStrlenOnePastNull();
    TestStrlenEmptyAfterNull();
    return 0;
}

int StrlenTestTest(void)
{
    return StrlenTestTestImpl();
}
