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
 
#include <cinttypes>
#include <cstdlib>
#include <cstdio>
#include <cstring>
#include "test.h"

// Test constants for qsort operations
#define RANDOM_MODULUS 20
#define TEST_ARRAY_START_SIZE 1023
#define TEST_ARRAY_END_SIZE 1026
#define TEST_ARRAY_MAX_SIZE 1026

static int Scmp(const void *a, const void *b)
{
    return strcmp(*(char **)a, *(char **)b);
}

static int Icmp(const void *a, const void *b)
{
    return *(int*)a - *(int*)b;
}

static int Ccmp(const void *a, const void *b)
{
    return *(char*)a - *(char*)b;
}

static int Cmp64(const void *a, const void *b)
{
    const uint64_t *ua = static_cast<const uint64_t*>(a);
    const uint64_t *ub = static_cast<const uint64_t*>(b);
    return *ua < *ub ? -1 : *ua != *ub;
}

/* 26 items -- even */
static const char *g_s[] = {
    "Bob", "Alice", "John", "Ceres",
    "Helga", "Drepper", "Emeralda", "Zoran",
    "Momo", "Frank", "Pema", "Xavier",
    "Yeva", "Gedun", "Irina", "Nono",
    "Wiener", "Vincent", "Tsering", "Karnica",
    "Lulu", "Quincy", "Osama", "Riley",
    "Ursula", "Sam"
};
static const char *g_sSorted[] = {
    "Alice", "Bob", "Ceres", "Drepper",
    "Emeralda", "Frank", "Gedun", "Helga",
    "Irina", "John", "Karnica", "Lulu",
    "Momo", "Nono", "Osama", "Pema",
    "Quincy", "Riley", "Sam", "Tsering",
    "Ursula", "Vincent", "Wiener", "Xavier",
    "Yeva", "Zoran"
};

/* 23 items -- odd, prime */
static int g_n[] = {
    879045, 394, 99405644, 33434, 232323, 4334, 5454,
    343, 45545, 454, 324, 22, 34344, 233, 45345, 343,
    848405, 3434, 3434344, 3535, 93994, 2230404, 4334
};
static int g_nSorted[] = {
    22, 233, 324, 343, 343, 394, 454, 3434,
    3535, 4334, 4334, 5454, 33434, 34344, 45345, 45545,
    93994, 232323, 848405, 879045, 2230404, 3434344, 99405644
};

static void StrTest(const char **a, const char **aSorted, int len)
{
    int i;
    qsort(a, len, sizeof *a, Scmp);
    for (i=0; i<len; i++) {
        if (strcmp(a[i], aSorted[i]) != 0) {
            t_error("string sort failed at index %d\n", i);
            TPrintf("\ti\tgot\twant\n");
            for (i=0; i<len; i++) {
                TPrintf("\t%d\t%s\t%s\n", i, a[i], aSorted[i]);
            }
            break;
        }
    }
}

static void IntTest(int *a, int *aSorted, int len)
{
    int i;
    qsort(a, len, sizeof *a, Icmp);
    for (i=0; i<len; i++) {
        if (a[i] != aSorted[i]) {
            t_error("integer sort failed at index %d\n", i);
            TPrintf("\ti\tgot\twant\n");
            for (i=0; i<len; i++) {
                TPrintf("\t%d\t%d\t%d\n", i, a[i], aSorted[i]);
            }
            break;
        }
    }
}

static void Uint64Gen(uint64_t *p, uint64_t *pSorted, int n)
{
    int i;
    uint64_t r = 0;
    srand(n);
    for (i = 0; i < n; i++) {
        r += rand() % RANDOM_MODULUS;
        p[i] = r;
    }
    memcpy(pSorted, p, n * sizeof *p);

    for (i = n - 1; i > 0; i--) {
        int j = rand() % (i + 1);
        uint64_t temp = p[i];
        p[i] = p[j];
        p[j] = temp;
    }
}

static void Uint64Test(uint64_t *a, uint64_t *aSorted, int len)
{
    int i;
    qsort(a, len, sizeof *a, Cmp64);
    for (i=0; i<len; i++) {
        if (a[i] != aSorted[i]) {
            t_error("uint64 sort failed at index %d\n", i);
            TPrintf("\ti\tgot\twant\n");
            for (i=0; i<len; i++) {
                TPrintf("\t%d\t%" PRIu64 "\t%" PRIu64 "\n", i, a[i], aSorted[i]);
            }
            break;
        }
    }
}

#define T(a, aSorted) do { \
    char p[] = a; \
    qsort(p, sizeof p - 1, 1, Ccmp); \
    if (memcmp(p, aSorted, sizeof p) != 0) { \
        t_error("character sort failed\n"); \
        TPrintf("\tgot:  \"%s\"\n", p); \
        TPrintf("\twant: \"%s\"\n", aSorted); \
    } \
} while (0)

static void CharTest(void)
{
    T("", "");
    T("1", "1");
    T("11", "11");
    T("12", "12");
    T("21", "12");
    T("111", "111");
    T("211", "112");
    T("121", "112");
    T("112", "112");
    T("221", "122");
    T("212", "122");
    T("122", "122");
    T("123", "123");
    T("132", "123");
    T("213", "123");
    T("231", "123");
    T("321", "123");
    T("312", "123");
    T("1423", "1234");
    T("51342", "12345");
    T("261435", "123456");
    T("4517263", "1234567");
    T("37245618", "12345678");
    T("812436597", "123456789");
    T("987654321", "123456789");
    T("321321321", "111222333");
    T("49735862185236174", "11223344556677889");
}

static int QsortTestImpl(void)
{
    int i;

    StrTest(g_s, g_sSorted, sizeof g_s/sizeof*g_s);
    IntTest(g_n, g_nSorted, sizeof g_n/sizeof*g_n);
    CharTest();
    for (i = TEST_ARRAY_START_SIZE; i<=TEST_ARRAY_END_SIZE; i++) {
        uint64_t p[TEST_ARRAY_MAX_SIZE];
        uint64_t pSorted[TEST_ARRAY_MAX_SIZE];
        Uint64Gen(p, pSorted, i);
        Uint64Test(p, pSorted, i);
    }
    return g_tStatus;
}

int QsortTest(void)
{
    return QsortTestImpl();
}
