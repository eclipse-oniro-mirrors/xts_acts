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

#include <cerrno>
#include <fcntl.h>
#include <malloc.h>
#include <cstdio>
#include <cstring>
#include "test.h"

const char *PATH_NAME = "/proc/self/mountinfo";

/**
 * @tc.name      : NameToHandleAt0100
 * @tc.desc      : Verify that the name_TO_HANDLE_AT function was successfully called (all parameters are valid)
 * @tc.level     : Level 0
 */
void NameToHandleAt0100(void)
{
    struct file_handle *fhp;
    char buf[1000];
    int mountId;
    int fhsize;
    int flags;
    int dirfd;

    fhsize = sizeof(*fhp);
    fhp = (struct file_handle *)malloc(fhsize);
    if (fhp == nullptr) {
        t_error("%s malloc failed\n", __func__);
    }

    dirfd = AT_FDCWD;
    flags = 0;
    fhp->handle_bytes = 0;

    if (name_to_handle_at(dirfd, PATH_NAME, fhp, &mountId, flags) != -1 || errno != EOVERFLOW) {
        t_error("%s Unexpected name_to_handle_at\n", __func__);
    }

    fhsize = sizeof(*fhp) + fhp->handle_bytes;
    struct file_handle *newfhp = static_cast<struct file_handle *>(malloc(static_cast<size_t>(fhsize)));
    if (newfhp == nullptr) {
        free(fhp);
        t_error("%s malloc failed\n", __func__);
        return;
    }
    memcpy(newfhp, fhp, sizeof(*fhp));
    free(fhp);
    fhp = newfhp;

    int result = name_to_handle_at(dirfd, PATH_NAME, fhp, &mountId, flags);
    if (result == -1) {
        t_error("%s name_to_handle_at failed\n");
    }

    int fd = open_by_handle_at(mountId, fhp, O_RDONLY);
    if (fd == -1) {
        t_error("%s open_by_handle_at failed\n", __func__);
    }

    int nread = read(fd, buf, sizeof(buf));
    if (nread == -1) {
        t_error("%s read failed\n", __func__);
    }
}

static int NameToHandleAtTestImpl(int argc, char *argv[])
{
    return T_STATUS;
}

int NameToHandleAtTest(void)
{
    static char libcProg[] = "libc_test";
    char *libcArgv[] = { libcProg, nullptr };
    return NameToHandleAtTestImpl(1, libcArgv);
}
