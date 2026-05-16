/*
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

#include <mntent.h>
#include <pthread.h>
#include "functionalext.h"

static pthread_barrier_t g_barrier;
#define WAIT() pthread_barrier_wait(&g_barrier)

void* GetmntentROne(void* arg)
{
    char c[1000];
    char str[100];
    FILE* fptr = nullptr;
    char strings[1024];
    if ((fptr = fopen("/proc/mounts", "r")) == nullptr) {
        t_error("%s Error! fopen failed\n", __func__);
    }
    int readRet = fscanf(fptr, "%999s", c);
    EXPECT_NE("getmntent_r_0100", readRet, EOF);
    int closeRet = fclose(fptr);
    EXPECT_EQ("getmntent_r_0100", closeRet, 0);
    int parseRet = sscanf(c, "%99s", str);
    EXPECT_EQ("getmntent_r_0100", parseRet, 1);
    struct mntent* m = nullptr;
    struct mntent mntbuf;
    memset(&strings[0], 0x00, sizeof(strings));
    FILE* ffp = setmntent("/proc/mounts", "r");
    EXPECT_PTRNE("getmntent_r_0100", ffp, nullptr);

    WAIT();
    m = getmntent_r(ffp, &mntbuf, strings, sizeof(strings));
    EXPECT_TRUE("getmntent_r_0100", m != nullptr);
    EXPECT_EQ("getmntent_r_0100", strcmp(m->mnt_fsname, str), 0);
    EXPECT_EQ("getmntent_r_0100", strcmp(mntbuf.mnt_fsname, str), 0);

    int endRet = endmntent(ffp);
    EXPECT_EQ("getmntent_r_0100", endRet, 1);
    return m;
}

/**
 * @tc.name      : getmntent_r_0100
 * @tc.desc      : Multiple threads simultaneously read file information.
 * @tc.level     : Level 0
 */
void GetmntentR0100(void)
{
    pthread_t srv;
    pthread_t cli;
    int ret = pthread_barrier_init(&g_barrier, nullptr, 2);
    EXPECT_EQ("getmntent_r_0100", 0, ret);
    ret = pthread_create(&srv, nullptr, GetmntentROne, nullptr);
    EXPECT_EQ("getmntent_r_0100", 0, ret);
    ret = pthread_create(&cli, nullptr, GetmntentROne, nullptr);
    EXPECT_EQ("getmntent_r_0100", 0, ret);
    ret = pthread_join(cli, nullptr);
    EXPECT_EQ("getmntent_r_0100", 0, ret);
    ret = pthread_join(srv, nullptr);
    EXPECT_EQ("getmntent_r_0100", 0, ret);
    ret = pthread_barrier_destroy(&g_barrier);
    EXPECT_EQ("getmntent_r_0100", 0, ret);
}

/**
 * @tc.name      : getmntent_r_0200
 * @tc.desc      : The f parameter is invalid, reading the file information failed.
 * @tc.level     : Level 2
 */
void GetmntentR0200(void)
{
    char c[1000];
    char str[100];
    char strings[1024];

    static const char* path = "/data/storage/el2/base/cache/getmntent.txt";
    FILE* fptr = fopen(path, "w");
    EXPECT_TRUE("getmntent_r_0200", fptr != nullptr);
    int closeRet = fclose(fptr);
    EXPECT_EQ("getmntent_r_0200", closeRet, 0);

    struct mntent* m = nullptr;
    struct mntent mntbuf;
    memset(&strings[0], 0x00, sizeof(strings));
    FILE* ffp = setmntent(path, "r");
    EXPECT_PTRNE("getmntent_r_0200", ffp, nullptr);
    m = getmntent_r(ffp, &mntbuf, strings, sizeof(strings));
    EXPECT_EQ("getmntent_r_0200", m, nullptr);
    int endRet = endmntent(ffp);
    EXPECT_EQ("getmntent_r_0200", endRet, 1);
    int removeRet = remove(path);
    EXPECT_EQ("getmntent_r_0200", removeRet, 0);
}

static int GetmntentRTestImpl(int argc, char* argv[])
{
    GetmntentR0100();
    GetmntentR0200();

    return T_STATUS;
}

int GetmntentRTest(void)
{
    static char libcProg[] = "libc_test";
    char* libcArgv[] = { libcProg, nullptr };
    return GetmntentRTestImpl(1, libcArgv);
}
