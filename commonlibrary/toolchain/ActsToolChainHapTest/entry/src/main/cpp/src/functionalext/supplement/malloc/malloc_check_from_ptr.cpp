/**
 * Copyright (c) 2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include <cstdio>
#include <functionalext.h>
#include <malloc.h>
#include <sys/mman.h>

#define TEST_MEM_SIZE 256
#define NO_JEMALLOC_ZONE 0
#define JEMALLOC_ZONE 1
#define UN_JEMALLOC (-1)
#define NUM_MALLOCS 256

static void ExpectEqOneOf(const char* fun, int val, int exp1, int exp2)
{
    if (val != exp1 && val != exp2) {
        t_error("[%s] failed: %d != %d and %d != %d\n", fun, val, exp1, val, exp2);
    }
}

static void FreePtrsRange(void** ptrs, int count)
{
    if (!ptrs || count <= 0) {
        return;
    }

    for (int i = 0; i < count; ++i) {
        if (ptrs[i]) {
            free(ptrs[i]);
            ptrs[i] = nullptr;
        }
    }
}

/**
 * @tc.name      : MallocCheckFromPtr0100
 * @tc.desc      : The memory block was allocated using malloc
 * @tc.level     : Level 0
 */
void MallocCheckFromPtr0100(void)
{
    void* p = malloc(TEST_MEM_SIZE);
    EXPECT_PTRNE("MallocCheckFromPtr0100", p, nullptr);
    if (!p) {
        return;
    }
    int ret = malloc_check_from_ptr(p);
    ExpectEqOneOf("MallocCheckFromPtr0100", ret, JEMALLOC_ZONE, UN_JEMALLOC);
    free(p);
}

/**
 * @tc.name      : MallocCheckFromPtr0200
 * @tc.desc      : The memory block was allocated not using malloc
 * @tc.level     : Level 0
 */
void MallocCheckFromPtr0200(void)
{
    void* p = mmap(nullptr, TEST_MEM_SIZE, PROT_READ | PROT_WRITE, MAP_SHARED, -1, 0);
    EXPECT_PTRNE("MallocCheckFromPtr0200", p, nullptr);
    if (!p) {
        return;
    }
    int ret = malloc_check_from_ptr(p);
    ExpectEqOneOf("MallocCheckFromPtr0200", ret, NO_JEMALLOC_ZONE, UN_JEMALLOC);
    munmap(p, TEST_MEM_SIZE);
}

/**
 * @tc.name      : MallocCheckFromPtr0300
 * @tc.desc      : The memory block was allocated using calloc
 * @tc.level     : Level 0
 */
void MallocCheckFromPtr0300(void)
{
    void* p = calloc(1, TEST_MEM_SIZE);
    EXPECT_PTRNE("MallocCheckFromPtr0300", p, nullptr);
    if (!p) {
        return;
    }
    int ret = malloc_check_from_ptr(p);
    ExpectEqOneOf("MallocCheckFromPtr0300", ret, JEMALLOC_ZONE, UN_JEMALLOC);
    free(p);
}

/**
 * @tc.name      : MallocCheckFromPtr0400
 * @tc.desc      : multiple test malloc_check_from_ptr
 * @tc.level     : Level 0
 */
void MallocCheckFromPtr0400(void)
{
    void* ptrs[NUM_MALLOCS];

    // multiple malloc
    for (int i = 0; i < NUM_MALLOCS; ++i) {
        ptrs[i] = malloc(TEST_MEM_SIZE);
        if (!ptrs[i]) {
            FreePtrsRange(ptrs, i);
            return;
        }
    }

    // malloc_check_from_ptr in ptrs
    for (int i = 0; i < NUM_MALLOCS; ++i) {
        int ret = malloc_check_from_ptr(ptrs[i]);
        ExpectEqOneOf("MallocCheckFromPtr0400", ret, JEMALLOC_ZONE, UN_JEMALLOC);
    }

    // free all
    FreePtrsRange(ptrs, NUM_MALLOCS);
}

static int MallocCheckFromPtrTestImpl(void)
{
    MallocCheckFromPtr0100();
    MallocCheckFromPtr0200();
    MallocCheckFromPtr0300();
    MallocCheckFromPtr0400();
    return T_STATUS;
}

int MallocCheckFromPtrTest(void)
{
    return MallocCheckFromPtrTestImpl();
}
