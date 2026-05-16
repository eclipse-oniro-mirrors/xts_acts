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
#include <cstdlib>
#include <cstring>
#include <search.h>
#include <ctime>
#include "test.h"

#define ARRAY_SIZE (10)
static void *g_root = nullptr;
static int g_freeCalls = 0;

static void *MallocNode(unsigned n)
{
    void *p = malloc(n);
    if (p) {
        return p;
    }
    fprintf(stderr, "insufficient memory\n");
    exit(EXIT_FAILURE);
}

int CmpNode(const void *pa, const void *pb)
{
    if (*(int *)pa < *(int *)pb) {
        return -1;
    }
    if (*(int *)pa > *(int *)pb) {
        return 1;
    }
    return 0;
}

void NodeFree(void *p)
{
    free(p);
    g_freeCalls++;
}

/**
 * @tc.name      : tdestroy_0100
 * @tc.desc      : Removes the whole tree pointed to by root
 * @tc.level     : Level 0
 */
void Tdestroy0100(void)
{
    int i;
    int *ptr;
    int *target;
    void *val;
    void *result;
    int array[ARRAY_SIZE] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9};

    for (i = 0; i < ARRAY_SIZE; i++) {
        ptr =  (int *)MallocNode(sizeof(int));
        *ptr = array[i];
        val = tsearch((void *)ptr, &g_root, CmpNode);
        if (val == nullptr) {
            exit(EXIT_FAILURE);
        } else if ((*(int **)val) != ptr) {
            free(ptr);
        }
    }

    tdestroy(g_root, NodeFree);
    if (g_freeCalls != ARRAY_SIZE) {
        t_error("%s tdestroy failed, g_freeCalls is %d\n", __func__, g_freeCalls);
    }
}

static int TdestroyTestImpl(int argc, char *argv[])
{
    Tdestroy0100();
    return g_tStatus;
}

int TdestroyTest(void)
{
    static char libcProg[] = "libc_test";
    char *libcArgv[] = { libcProg, nullptr };
    return TdestroyTestImpl(1, libcArgv);
}
