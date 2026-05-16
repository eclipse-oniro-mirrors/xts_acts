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
#include <csignal>
#include <cstdio>
#include <cstdlib>
#include "test.h"

static const char *PATH = "/data/storage/el2/base/cache/";

static void Handler(int sig)
{
    exit(g_tStatus);
}

/**
 * @tc.name      : telldir_0100
 * @tc.desc      : Get the current read position of the parameter dir directory stream
 * @tc.level     : Level 0
 */
void Telldir0100(void)
{
    DIR *dir;
    struct dirent *ptr;
    int counter = 0;
    dir = opendir(PATH);
    long offset1 = telldir(dir);
    long offset2 = 0;
    while ((ptr = readdir(dir)) != nullptr) {
        counter++;

        if (counter > 1) {
            offset2 = telldir(dir);
            break;
        }
    }
    if (offset1 == offset2) {
        t_error("%s offset2 invalid", __func__);
    }
    closedir(dir);
}

/**
 * @tc.name      : telldir_0200
 * @tc.desc      : Catch exception when parameter dir is NULL
 * @tc.level     : Level 2
 */
void Telldir0200(void)
{
    signal(SIGSEGV, Handler);

    DIR *dir = nullptr;
    telldir(dir);
}

static int TelldirTestImpl(int argc, char *argv[])
{
    Telldir0100();
    Telldir0200();
    return g_tStatus;
}

int TelldirTest(void)
{
    static char libcProg[] = "libc_test";
    char *libcArgv[] = { libcProg, nullptr };
    return TelldirTestImpl(1, libcArgv);
}
