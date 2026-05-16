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
#include <cstdlib>
#include <cstring>

#include "filepath_util.h"

static void Handler(int sig)
{
    exit(g_tStatus);
}

/**
 * @tc.name      : rewinddir_0100
 * @tc.desc      : reset directory stream
 * @tc.level     : Level 0
 */
void Rewinddir0100(void)
{
    char name[PATH_MAX] = {0};
    FILE_ABSOLUTE_DIR(name);
    DIR *dir = opendir(name);
    if (dir == nullptr) {
        t_error("%s failed: opendir. name = %s\n", __func__, name);
        return;
    }

    struct dirent *result = readdir(dir);
    if (result == nullptr) {
        t_error("%s failed: readdir\n", __func__);
        return;
    }

    char *dName = result->d_name;

    while ((result = readdir(dir)) != nullptr) {
    }

    rewinddir(dir);
    result = readdir(dir);
    if (result == nullptr) {
        t_error("%s failed: readdir\n", __func__);
        return;
    }

    if (strcmp(dName, result->d_name)) {
        t_error("%s failed: strcmp. dName = %s, result->d_name = %s\n", __func__, dName, result->d_name);
        return;
    }

    closedir(dir);
}

/**
 * @tc.name      : rewinddir_0200
 * @tc.desc      : reset directory stream with a NULL dir
 * @tc.level     : Level 2
 */
void Rewinddir0200(void)
{
    signal(SIGSEGV, Handler);

    DIR *dir = nullptr;
    rewinddir(dir);
}

static int RewinddirTestImpl(int argc, char *argv[])
{
    Rewinddir0100();
    Rewinddir0200();

    return g_tStatus;
}

int RewinddirTest(void)
{
    static char libcProg[] = "libc_test";
    char *libcArgv[] = { libcProg, nullptr };
    return RewinddirTestImpl(1, libcArgv);
}
