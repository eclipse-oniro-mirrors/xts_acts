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
 
#include <cstring>
#include <cstdlib>
#include <cstdint>
#include "test.h"

#define N (500)
#define ALIGN_MASK (63)
#define ALIGN_SIZE (64)
#define TEST_LEN (10)
#define LOOP_LIMIT (4)
#define PRINT_LEN (128)
#define TEST_OFFSET 256
#define TEST_VALUE_NEG5 -5
static char g_buf[N];
static char g_buf2[N];

static void *(*volatile g_pmemset)(void *, int, size_t);

static char *AlignedFunc(void *p)
{
    return (char*)(((uintptr_t)p + ALIGN_MASK) & -ALIGN_MASK);
}

static void TestAlign(int align, int len)
{
    char *s = AlignedFunc(g_buf + ALIGN_MASK) + align;
    char *want = AlignedFunc(g_buf2 + ALIGN_MASK) + align;
    char *p;
    int i;

    if (len + ALIGN_MASK > g_buf + N - s || len + ALIGN_MASK > g_buf2 + N - want) {
        abort();
    }
    for (i = 0; i < N; i++) {
        g_buf[i] = g_buf2[i] = ' ';
    }
    for (i = 0; i < len; i++) {
        want[i] = '#';
    }
    p = (char *)g_pmemset(s, '#', len);
    if (p != s) {
        t_error("memset(%p,...) returned %p\n", s, p);
    }
    for (i = -ALIGN_MASK; i < len + ALIGN_MASK; i++) {
        if (s[i] != want[i]) {
            t_error("memset(align %d, '#', %d) failed at pos %d\n", align, len, i);
            t_printf("got : '%.*s'\n", len + PRINT_LEN, s - ALIGN_MASK);
            t_printf("want: '%.*s'\n", len + PRINT_LEN, want - ALIGN_MASK);
            break;
        }
    }
}

static void TestValue(int c)
{
    int i;

    g_pmemset(g_buf, c, TEST_LEN);
    for (i = 0; i < TEST_LEN; i++) {
        if ((unsigned char)g_buf[i] != (unsigned char)c) {
            t_error("memset(%d) failed: got %d\n", c, g_buf[i]);
            break;
        }
    }
}

static int StringMemsetTestImpl(void)
{
    int i;
    int j;
    int k;

    g_pmemset = memset;

    for (i = 0; i < ALIGN_MASK; i++) {
        for (j = 0; j < N - TEST_OFFSET; j++) {
            TestAlign(i, j);
        }
    }

    TestValue('c');
    TestValue(0);
    TestValue(-1);
    TestValue(TEST_VALUE_NEG5);
    TestValue(0xab);
    return g_tStatus;
}

int StringMemsetTest(void)
{
    return StringMemsetTestImpl();
}
