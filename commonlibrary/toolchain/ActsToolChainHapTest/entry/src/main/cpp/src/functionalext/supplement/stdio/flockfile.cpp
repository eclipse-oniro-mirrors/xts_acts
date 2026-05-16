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

#include <pthread.h>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include "test.h"

#define THREAD_COUNT 100
#define BUFFER_SIZE 64

static FILE *g_fp;
static const char *PATH = "/data/storage/el2/base/cache/test.txt";

void *DoChildOne(void *a)
{
    puts("start do_child_one");

    flockfile(stdout);

    puts("after first flockfile");

    flockfile(stdout);

    puts("foo");

    funlockfile(stdout);

    puts("after first funlockfile");

    funlockfile(stdout);

    puts("all done");
    return a;
}

void *DoChildTwo(void *p)
{
    char buf[BUFFER_SIZE];

    flockfile(g_fp);

    if (fseek(g_fp, 0L, SEEK_SET) == -1) {
        t_error("%s fseek failed\n", __func__);
    }
    (void)fread(buf, BUFFER_SIZE, 1, g_fp);

    int count = atoi(buf);
    ++count;
    (void)sprintf(buf, "%d", count);
    if (fseek(g_fp, 0L, SEEK_SET) == -1) {
        t_error("%s fseek failed\n", __func__);
    }
    (void)fwrite(buf, strlen(buf), 1, g_fp);

    funlockfile(g_fp);
    return nullptr;
}

/**
 * @tc.name      : Flockfile0100
 * @tc.desc      : Acquire for a thread ownership of a (FILE *) object (stdout)
 * @tc.level     : Level 0
 */
void Flockfile0100(void)
{
    pthread_t th;

    if (pthread_create(&th, nullptr, DoChildOne, nullptr) != 0) {
        t_error("%s pthread_create failed\n", __func__);
    }

    void *result;
    if (pthread_join(th, &result) != 0) {
        t_error("%s pthread_join failed\n", __func__);
    } else if (result != nullptr) {
        t_error("%s wrong return value: %p, expected %p\n", __func__, result, nullptr);
    }
}

/**
 * @tc.name      : Flockfile0200
 * @tc.desc      : Shared FILE* to implements mutual exclusion
 * @tc.level     : Level 1
 */
void Flockfile0200(void)
{
    pthread_t tid[THREAD_COUNT];

    g_fp = fopen(PATH, "w+");
    if (g_fp == nullptr) {
        t_error("%s fopen failed\n", __func__);
    }

    for (int i = 0; i < THREAD_COUNT; i++) {
        if (pthread_create(tid + i, nullptr, DoChildTwo, nullptr) != 0) {
            t_error("%s pthread_create failed\n", __func__);
        }
    }

    for (int j = 0; j < THREAD_COUNT; j++) {
        if (pthread_join(tid[j], nullptr) != 0) {
            t_error("%s pthread_join failed\n", __func__);
        }
    }

    (void)fclose(g_fp);
    g_fp = nullptr;
    (void)remove(PATH);
}

static int FlockfileTestImpl(int argc, char *argv[])
{
    Flockfile0100();
    Flockfile0200();
    return g_tStatus;
}

int FlockfileTest(void)
{
    static char libcProg[] = "libc_test";
    char *libcArgv[] = { libcProg, nullptr };
    return FlockfileTestImpl(1, libcArgv);
}
