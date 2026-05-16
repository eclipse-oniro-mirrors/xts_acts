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

#include <cerrno>
#include <dirent.h>
#include <cstring>
#include <sys/stat.h>
#include <cstdio>
#include <unistd.h>
#include "test.h"
/*
 * @tc.name      : opendir_0100
 * @tc.desc      : Verify that the parameters are valid to open the specified directory
 * @tc.level     : Level 0
 */
void Opendir0100(void)
{
    errno = 0;
    const char *path = "/data/storage/el2/base/cache/opendirtest";
    if (access(path, F_OK) == 0) {
        remove(path);
    }
    int ret = mkdir(path, 0777);
    if (ret != 0) {
        t_error("opendirtest create failed: errno = %d\n", errno);
    }
    DIR *dir = opendir(path);
    if (!dir) {
        t_error("%s opendir failed\n", __func__);
    }
    struct dirent *r;
    int issuccess = 0;
    while ((r = readdir(dir)) != nullptr) {
        if (strcmp(r->d_name, ".") == 0) {
            issuccess = 1;
            break;
        }
    }
    if (issuccess != 1) {
        t_error("%s opendir is not right", __func__);
    }
    closedir(dir);
    ret = remove(path);
    if (ret != 0) {
        t_error("remove failed: errno = %d\n", errno);
    }
}

/*
 * @tc.name      : opendir_0200
 * @tc.desc      : When the path is not a folder or not exit, test the return value of the function
 * @tc.level     : Level 2
 */
void Opendir0200(void)
{
    DIR *dir1 = opendir("/dev/null");
    if (dir1) {
        t_error("%s dir should be nullptr\n", __func__);
    }

    errno = 0;
    DIR *dir2 = opendir("/does/not/exit/folder");
    if (dir2) {
        t_error("%s dir should be nullptr\n", __func__);
    }
    if (errno != ENOENT) {
        t_error("%s errno should be ENOTDIR, but now is %d\n", __func__, errno);
    }
}

/*
 * @tc.name      : opendir_0300
 * @tc.desc      : When the path is nullptr, test the return value of the function
 * @tc.level     : Level 2
 */
void Opendir0300(void)
{
    DIR *dir = opendir(nullptr);
    if (dir) {
        t_error("%s dir should be nullptr\n", __func__);
    }
}

static int OpendirTestImpl(int argc, char *argv[])
{
    Opendir0100();
    Opendir0200();
    Opendir0300();

    return g_tStatus;
}

int OpendirTest(void)
{
    static char libcProg[] = "libc_test";
    char *libcArgv[] = { libcProg, nullptr };
    return OpendirTestImpl(1, libcArgv);
}

