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

#include <dirent.h>
#include <cerrno>
#include <csignal>
#include <cstdio>
#include <cstdlib>
#include <cstring>

#include "test.h"

static const char *PATH = "/data/storage/el2/base/cache/";

static void Handler(int sig)
{
    exit(g_tStatus);
}

/**
 * @tc.name      : seekdir_0100
 * @tc.desc      : set the position of the next readdir() call in the directory stream
 * @tc.level     : Level 0
 */
void Seekdir0100(void)
{
    DIR *dir = opendir(PATH);
    if (dir == nullptr) {
        t_error("%s failed: opendir. PATH = %s\n", __func__, PATH);
    }

    int counter = 0;
    struct dirent *result;
    long offset = 0;
    while ((result = readdir(dir)) != nullptr) {
        counter++;

        if (counter > 1) {
            offset = telldir(dir);
            break;
        }
    }

    result = readdir(dir);
    if (result == nullptr) {
        t_error("%s failed: readdir\n", __func__);
    }

    char dName[BUFSIZ] = {0};
    strcpy(dName, result->d_name);

    errno = 0;
    seekdir(dir, offset);
    if (errno != 0) {
        t_error("%s failed: seekdir. errno = %d\n", __func__, errno);
    }

    result = readdir(dir);
    if (result == nullptr) {
        t_error("%s failed: readdir\n", __func__);
    }

    if (strcmp(result->d_name, dName)) {
        t_error("%s failed: strcmp. result->d_name = %s, dName = %s\n", __func__, result->d_name, dName);
    }

    closedir(dir);
}

/**
 * @tc.name      : seekdir_0200
 * @tc.desc      : set the position of the next readdir() call in the directory stream to zero
 * @tc.level     : Level 1
 */
void Seekdir0200(void)
{
    DIR *dir = opendir(PATH);
    if (dir == nullptr) {
        t_error("%s failed: opendir. PATH = %s\n", __func__, PATH);
    }

    struct dirent *result = readdir(dir);
    if (result == nullptr) {
        t_error("%s failed: readdir\n", __func__);
    }

    char dName[BUFSIZ] = {0};
    strcpy(dName, result->d_name);

    errno = 0;
    seekdir(dir, 0);
    if (errno != 0) {
        t_error("%s failed: seekdir. errno = %d\n", __func__, errno);
    }

    result = readdir(dir);
    if (result == nullptr) {
        t_error("%s failed: readdir\n", __func__);
    }

    if (strcmp(result->d_name, dName)) {
        t_error("%s failed: strcmp. result->d_name = %s, dName = %s\n", __func__, result->d_name, dName);
    }

    closedir(dir);
}

/**
 * @tc.name      : seekdir_0300
 * @tc.desc      : set the position of the next readdir() call in the directory stream with NULL
 * @tc.level     : Level 2
 */
void Seekdir0300(void)
{
    signal(SIGSEGV, Handler);

    DIR *dir = nullptr;
    seekdir(dir, -1);
}

static int SeekdirTestImpl(int argc, char *argv[])
{
    Seekdir0100();
    Seekdir0200();
    Seekdir0300();

    return g_tStatus;
}

int SeekdirTest(void)
{
    static char libcProg[] = "libc_test";
    char *libcArgv[] = { libcProg, nullptr };
    return SeekdirTestImpl(1, libcArgv);
}
