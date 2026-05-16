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

#include <fcntl.h>
#include <sys/xattr.h>
#include "functionalext.h"

#define BUFFER_SIZE (10)
#define FILE_PERMISSIONS (0667)
#define FAILURE_CODE (-1)
#define DATA_LENGTH (4)
#define SUCCESS_CODE (0)

static const char *PATH = "/data/storage/el2/base/cache/test.txt";

/**
 * @tc.name      : Fsetxattr0100
 * @tc.desc      : Sets the value of the extended attribute identified by name and associated with the given path in the
 *                 filesystem
 * @tc.level     : Level 0
 */
void Fsetxattr0100(void)
{
    char buf[BUFFER_SIZE];

    int fd = open(PATH, O_CREAT | O_WRONLY, FILE_PERMISSIONS);
    EXPECT_NE("Fsetxattr0100", fd, FAILURE_CODE);

    int result = fsetxattr(fd, "user.foo", "bar", DATA_LENGTH, SUCCESS_CODE);
    EXPECT_EQ("Fsetxattr0100", result, SUCCESS_CODE);

    result = fgetxattr(fd, "user.foo", buf, sizeof(buf));
    EXPECT_EQ("Fsetxattr0100", result, DATA_LENGTH);
    EXPECT_STREQ("Fsetxattr0100", buf, "bar");

    close(fd);
    (void)remove(PATH);
}

static int FsetxattrTestImpl(int argc, char *argv[])
{
    Fsetxattr0100();
    return T_STATUS;
}

int FsetxattrTest(void)
{
    static char libcProg[] = "libc_test";
    char *libcArgv[] = { libcProg, nullptr };
    return FsetxattrTestImpl(1, libcArgv);
}
