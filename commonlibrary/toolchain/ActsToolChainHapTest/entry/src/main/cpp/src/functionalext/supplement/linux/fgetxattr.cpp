/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
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
#include <cstring>
#include <fcntl.h>
#include <sys/xattr.h>
#include "functionalext.h"
#include "test.h"

/**
 * @tc.name      : fgetxattr_0100
 * @tc.desc      : Verify that the extended attribute value can be obtained.
 * @tc.level     : Level 0
 */
void Fgetxattr0100(void)
{
    const char* path = "/data/storage/el2/base/cache/fgetxattr.txt";
    char name[] = "user.x";
    char value[] = "the past is not dead.";

    int fd = open(path, O_RDWR | O_CREAT, TEST_MODE);
    if (fd < 0) {
        t_error("%s open failed\n", __func__);
    }

    int ret = fsetxattr(fd, name, value, strlen(value), 0);
    if (ret != 0) {
        t_error("%s fsetxattr failed\n", __func__);
    }

    ssize_t result = fgetxattr(fd, name, value, 1024);
    if (result < 0) {
        t_error("%s fgetxattr failed\n", __func__);
    }

    close(fd);
    remove(path);
}

static int FgetxattrTestImpl(int argc, char* argv[])
{
    Fgetxattr0100();
    return T_STATUS;
}

int FgetxattrTest(void)
{
    static char libcProg[] = "libc_test";
    char* libcArgv[] = { libcProg, nullptr };
    return FgetxattrTestImpl(1, libcArgv);
}
