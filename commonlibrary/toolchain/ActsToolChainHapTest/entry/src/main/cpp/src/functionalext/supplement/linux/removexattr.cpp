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

#include <cerrno>
#include <fcntl.h>
#include <cstdio>
#include <cstring>
#include <sys/xattr.h>

#include "filepath_util.h"
#include "functionalext.h"

static const char *NAME = "user.foo";
static const char *VALUE = "bar";

/**
 * @tc.name      : Removexattr0100
 * @tc.desc      : remove an extended attribute
 * @tc.level     : Level 0
 */
void Removexattr0100(void)
{
    char path[PATH_MAX] = {0};
    if (!FileAbsolutePath(STR_FILE_TXT, path, sizeof(path))) {
        return;
    }
    int fd = open(path, O_RDWR | O_CREAT, TEST_MODE);
    if (fd < 0) {
        t_error("%s failed: fd = %d\n", __func__, fd);
    }

    char str[] = "bar";
    write(fd, str, sizeof(str));
    close(fd);

    errno = 0;
    int result = setxattr(path, NAME, VALUE, strlen(VALUE), XATTR_CREATE);
    if (result != 0) {
        t_error("%s failed: result = %d\n", __func__, result);
    }

    if (errno != 0) {
        t_error("%s failed: errno = %d\n", __func__, errno);
    }

    char buf[BUFSIZ] = {0};

    errno = 0;
    result = getxattr(path, NAME, buf, sizeof(buf));
    if (result < 0) {
        t_error("%s failed: result = %d\n", __func__, result);
    }

    if (errno != 0) {
        t_error("%s failed: errno = %d\n", __func__, errno);
    }

    if (strcmp(buf, str)) {
        t_error("%s failed: buf = %s\n", __func__, buf);
    }

    errno = 0;
    result = removexattr(path, NAME);
    if (result != 0) {
        t_error("%s failed: result = %d\n", __func__, result);
    }

    errno = 0;
    result = getxattr(path, NAME, buf, sizeof(buf));
    if (result != -1) {
        t_error("%s failed: result = %d\n", __func__, result);
    }

    if (errno != ENODATA) {
        t_error("%s failed: errno = %d\n", __func__, errno);
    }

    (void)remove(path);
}

/**
 * @tc.name      : Removexattr0200
 * @tc.desc      : remove an extended attribute with invalid parameters
 * @tc.level     : Level 2
 */
void Removexattr0200(void)
{
    errno = 0;
    int result = removexattr(nullptr, nullptr);
    if (result == 0) {
        t_error("%s failed: result = %d\n", __func__, result);
    }

    if (errno != EFAULT) {
        t_error("%s failed: errno = %d\n", __func__, errno);
    }
}

static int RemovexattrTestImpl(int argc, char *argv[])
{
    Removexattr0100();
    Removexattr0200();

    return T_STATUS;
}

int RemovexattrTest(void)
{
    static char libcProg[] = "libc_test";
    char *libcArgv[] = { libcProg, nullptr };
    return RemovexattrTestImpl(1, libcArgv);
}
