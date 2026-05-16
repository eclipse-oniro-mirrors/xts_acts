/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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

#include <cstring>
#include <cstdint>
#include "test.h"

// Test constants for string operations
#define TEST_BUFFER_SIZE 512
#define ALIGNMENT_OFFSET 63
#define CACHE_LINE_SIZE 64
#define ARRAY_SIZE_A 128
#define ARRAY_SIZE_S 256
#define ALIGNMENT_ITERATIONS 8
#define CHAR_MASK 127
#define MAX_CHAR_VALUE 255

static char g_buf[TEST_BUFFER_SIZE];

static void *Aligned(void *p)
{
    return reinterpret_cast<void*>((reinterpret_cast<uintptr_t>(p) + ALIGNMENT_OFFSET) &
                                    static_cast<uintptr_t>(-CACHE_LINE_SIZE));
}

static void *Aligncpy(const void *p, size_t len, size_t a)
{
    return memcpy(reinterpret_cast<char*>(Aligned(g_buf))+a, p, len);
}

#define N(s, c) { \
    int align; \
    for (align=0; align<ALIGNMENT_ITERATIONS; align++) { \
        char *p = reinterpret_cast<char*>(Aligncpy(s, sizeof s, align)); \
        char *q = strchr(p, c); \
        if (q) \
            t_error("strchr(%s,%s) with align=%d returned str+%d, wanted 0\n", #s, #c, align, q-p); \
    } \
}

#define T(s, c, n) { \
    int align; \
    for (align=0; align<ALIGNMENT_ITERATIONS; align++) { \
        char *p = reinterpret_cast<char*>(Aligncpy(s, sizeof s, align)); \
        char *q = strchr(p, c); \
        if (q == 0) \
            t_error("strchr(%s,%s) with align=%d returned 0, wanted str+%d\n", #s, #c, align, n); \
        else if (q - p != n) \
            t_error("strchr(%s,%s) with align=%d returned str+%d, wanted str+%d\n", #s, #c, align, q-p, n); \
    } \
}

static int StringStrchrTestImpl(void)
{
    int i;
    char a[ARRAY_SIZE_A];
    char s[ARRAY_SIZE_S];

    for (i = 0; i < ARRAY_SIZE_A; i++) {
        a[i] = static_cast<char>((i+1) & CHAR_MASK);
    }
    for (i = 0; i < ARRAY_SIZE_S; i++) {
        reinterpret_cast<unsigned char*>(s)[i] = static_cast<unsigned char>(i+1);
    }

    N("\0aaa", 'a')
    N("a\0bb", 'b')
    N("ab\0c", 'c')
    N("abc\0d", 'd')
    N("abc abc\0x", 'x')
    N(a, ARRAY_SIZE_A)
    N(a, MAX_CHAR_VALUE)

    T("", 0, 0)
    T("a", 'a', 0)
    T("a", 'a'+256, 0)
    T("a", 0, 1)
    T("abb", 'b', 1)
    T("aabb", 'b', 2)
    T("aaabb", 'b', 3)
    T("aaaabb", 'b', 4)
    T("aaaaabb", 'b', 5)
    T("aaaaaabb", 'b', 6)
    T("abc abc", 'c', 2)
    T(s, 1, 0)
    T(s, 2, 1)
    T(s, 10, 9)
    T(s, 11, 10)
    T(s, CHAR_MASK, CHAR_MASK-1)
    T(s, ARRAY_SIZE_A, ARRAY_SIZE_A-1)
    T(s, MAX_CHAR_VALUE, MAX_CHAR_VALUE-1)
    T(s, 0, MAX_CHAR_VALUE)

    return g_tStatus;
}

int StringStrchrTest(void)
{
    return StringStrchrTestImpl();
}
