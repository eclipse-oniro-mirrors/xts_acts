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

#include <csignal>
#include <cstdlib>
#include <pthread.h>
#include <sys/wait.h>
#include "functionalext.h"

#define NUM 8
int Compare(const void* p, const void* q)
{
    return *static_cast<const int*>(p) - *static_cast<const int*>(q);
}

/**
 * @tc.name      : Bsearch0100
 * @tc.desc      : Verify that binary search can be achieved (each parameter is valid)
 * @tc.level     : Level 0
 */
void Bsearch0100(void)
{
    int array[NUM] = { 9, 2, 7, 11, 3, 87, 34, 6 };
    int key = 3;
    int* p;
    qsort(array, NUM, sizeof(int), Compare);
    p = static_cast<int*>(bsearch(&key, array, NUM, sizeof(int), Compare));
    EXPECT_EQ("Bsearch0100", (*p), key);
}

/**
 * @tc.name      : Bsearch0200
 * @tc.desc      : Binary lookup cannot be implemented in validation (invalid parameters)
 * @tc.level     : Level 2
 */
void Bsearch0200(void)
{
    int array[NUM] = { 9, 2, 7, 11, 3, 87, 34, 6 };
    int key = 3;
    int* p;
    qsort(array, NUM, sizeof(int), Compare);
    p = static_cast<int*>(bsearch(&key, array, 0, sizeof(int), Compare));
    EXPECT_TRUE("Bsearch0200", p == nullptr);
}

static int BsearchTestWithArgs(int argc, char* argv[])
{
    Bsearch0100();
    Bsearch0200();
    return T_STATUS;
}

int BsearchTest(void)
{
    static char libcProgStub[] = "libc_test";
    char* libcArgvStub[] = { libcProgStub, nullptr };
    return BsearchTestWithArgs(1, libcArgvStub);
}
