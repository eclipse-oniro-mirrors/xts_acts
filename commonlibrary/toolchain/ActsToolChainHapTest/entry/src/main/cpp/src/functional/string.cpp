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
 
#define DEFAULT_SOURCE 1
#define BSD_SOURCE 1
#include <cstdio>
#include <cstring>
#include "test.h"

#define BUFFER_SIZE 32
#define STR_OFFSET_16 16
#define STR_OFFSET_17 17
#define STR_OFFSET_18 18
#define STR_OFFSET_19 19
#define STR_OFFSET_1 1
#define STR_OFFSET_2 2
#define STR_OFFSET_3 3
#define STR_OFFSET_4 4
#define STR_OFFSET_5 5
#define STR_OFFSET_6 6
#define STR_OFFSET_10 10
#define STR_OFFSET_11 11
#define COMPARE_SIZE 8
#define STR_LEN_3 3
#define STR_LEN_6 6
#define STR_LEN_8 8

#define TEST(r, f, x, m) ( \
    ((r) = (f)) == (x) || \
    (t_error("%s failed (" m ")\n", #f, r, x), 0))

#define TEST_S(s, x, m) ( \
    !strcmp((s), (x)) || \
    (t_error("[%s] != [%s] (%s)\n", s, x, m), 0))

static void TestStrcpyOperations(char *b)
{
    char *s;

    b[STR_OFFSET_16] = 'a';
    b[STR_OFFSET_17] = 'b';
    b[STR_OFFSET_18] = 'c';
    b[STR_OFFSET_19] = 0;
    TEST(s, strcpy(b, b + STR_OFFSET_16), b, "wrong return %p != %p");
    TEST_S(s, "abc", "strcpy gave incorrect string");
    TEST(s, strcpy(b + STR_OFFSET_1, b + STR_OFFSET_16), b + STR_OFFSET_1, "wrong return %p != %p");
    TEST_S(s, "abc", "strcpy gave incorrect string");
    TEST(s, strcpy(b + STR_OFFSET_2, b + STR_OFFSET_16), b + STR_OFFSET_2, "wrong return %p != %p");
    TEST_S(s, "abc", "strcpy gave incorrect string");
    TEST(s, strcpy(b + STR_OFFSET_3, b + STR_OFFSET_16), b + STR_OFFSET_3, "wrong return %p != %p");
    TEST_S(s, "abc", "strcpy gave incorrect string");

    TEST(s, strcpy(b + STR_OFFSET_1, b + STR_OFFSET_17), b + STR_OFFSET_1, "wrong return %p != %p");
    TEST_S(s, "bc", "strcpy gave incorrect string");
    TEST(s, strcpy(b + STR_OFFSET_2, b + STR_OFFSET_18), b + STR_OFFSET_2, "wrong return %p != %p");
    TEST_S(s, "c", "strcpy gave incorrect string");
    TEST(s, strcpy(b + STR_OFFSET_3, b + STR_OFFSET_19), b + STR_OFFSET_3, "wrong return %p != %p");
    TEST_S(s, "", "strcpy gave incorrect string");
}

static void TestStrncpyOperations(char *b)
{
    char *s;
    int i;

    TEST(s, static_cast<char*>(memset(b, 'x', BUFFER_SIZE)), b, "wrong return %p != %p");
    TEST(s, strncpy(b, "abc", BUFFER_SIZE - 1), b, "wrong return %p != %p");
    TEST(i, memcmp(b, "abc\0\0\0\0", COMPARE_SIZE), 0, "strncpy fails to zero-pad dest");
    TEST(i, b[BUFFER_SIZE - 1], 'x', "strncpy overruns buffer when n > strlen(src)");

    b[STR_OFFSET_3] = 'x';
    b[STR_OFFSET_4] = 0;
    strncpy(b, "abc", STR_LEN_3);
    TEST(i, b[STR_OFFSET_2], 'c', "strncpy fails to copy last byte: %hhu != %hhu");
    TEST(i, b[STR_OFFSET_3], 'x', "strncpy overruns buffer to null-terminate: %hhu != %hhu");

    TEST(i, !strncmp("abcd", "abce", STR_LEN_3), 1, "strncmp compares past n");
    TEST(i, !!strncmp("abc", "abd", STR_LEN_3), 1, "strncmp fails to compare n-1st byte");

    strcpy(b, "abc");
    TEST(s, strncat(b, "123456", STR_LEN_3), b, "%p != %p");
    TEST(i, b[STR_OFFSET_6], 0, "strncat failed to null-terminate (%d)");
    TEST_S(s, "abc123", "strncat gave incorrect string");
}

static void TestStringSearchOperations(char *b)
{
    char *s;
    int i;

    strcpy(b, "aaababccdd0001122223");
    TEST(s, strchr(b, 'b'), b + STR_OFFSET_3, "%p != %p");
    TEST(s, strrchr(b, 'b'), b + STR_OFFSET_5, "%p != %p");
    TEST(i, strspn(b, "abcd"), STR_OFFSET_10, "%d != %d");
    TEST(i, strcspn(b, "0123"), STR_OFFSET_10, "%d != %d");
    TEST(s, strpbrk(b, "0123"), b + STR_OFFSET_10, "%d != %d");

    strcpy(b, "abc   123; xyz; foo");
    TEST(s, strtok(b, " "), b, "%p != %p");
    TEST_S(s, "abc", "strtok result");

    TEST(s, strtok(nullptr, ";"), b + STR_OFFSET_4, "%p != %p");
    TEST_S(s, "  123", "strtok result");

    TEST(s, strtok(nullptr, " ;"), b + STR_OFFSET_11, "%p != %p");
    TEST_S(s, "xyz", "strtok result");

    TEST(s, strtok(nullptr, " ;"), b + STR_OFFSET_16, "%p != %p");
    TEST_S(s, "foo", "strtok result");
}

static void TestStrlcpyStrlcatOperations(char *b)
{
    int i;

    memset(b, 'x', BUFFER_SIZE);
    TEST(i, strlcpy(b, "abc", BUFFER_SIZE - 1), STR_LEN_3, "length %d != %d");
    TEST(i, b[STR_OFFSET_3], 0, "strlcpy did not null-terminate short string (%d)");
    TEST(i, b[STR_OFFSET_4], 'x', "strlcpy wrote extra bytes (%d)");

    memset(b, 'x', BUFFER_SIZE);
    TEST(i, strlcpy(b, "abc", STR_OFFSET_2), STR_LEN_3, "length %d != %d");
    TEST(i, b[0], 'a', "strlcpy did not copy character %d");
    TEST(i, b[STR_OFFSET_1], 0, "strlcpy did not null-terminate long string (%d)");

    memset(b, 'x', BUFFER_SIZE);
    TEST(i, strlcpy(b, "abc", STR_LEN_3), STR_LEN_3, "length %d != %d");
    TEST(i, b[STR_OFFSET_2], 0, "strlcpy did not null-terminate l-length string (%d)");

    TEST(i, strlcpy(NULL, "abc", 0), STR_LEN_3, "length %d != %d");

    memcpy(b, "abc\0\0\0x\0", STR_LEN_8);
    TEST(i, strlcat(b, "123", BUFFER_SIZE), STR_LEN_6, "length %d != %d");
    TEST_S(b, "abc123", "strlcat result");

    memcpy(b, "abc\0\0\0x\0", STR_LEN_8);
    TEST(i, strlcat(b, "123", STR_LEN_6), STR_LEN_6, "length %d != %d");
    TEST_S(b, "abc12", "strlcat result");
    TEST(i, b[STR_OFFSET_6], 'x', "strlcat wrote past string %d != %d");

    memcpy(b, "abc\0\0\0x\0", STR_LEN_8);
    TEST(i, strlcat(b, "123", STR_OFFSET_4), STR_LEN_6, "length %d != %d");
    TEST_S(b, "abc", "strlcat result");

    memcpy(b, "abc\0\0\0x\0", STR_LEN_8);
    TEST(i, strlcat(b, "123", STR_LEN_3), STR_LEN_6, "length %d != %d");
    TEST_S(b, "abc", "strlcat result");
}

static int StringTestImpl(void)
{
    char b[BUFFER_SIZE];

    TestStrcpyOperations(b);
    TestStrncpyOperations(b);
    TestStringSearchOperations(b);
    TestStrlcpyStrlcatOperations(b);
    return g_tStatus;
}

int StringTest(void)
{
    return StringTestImpl();
}
