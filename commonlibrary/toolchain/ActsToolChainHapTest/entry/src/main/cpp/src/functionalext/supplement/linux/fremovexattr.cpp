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
 * @tc.name      : Fremovexattr0100
 * @tc.desc      : Verify that the extended properties of the specified file can be deleted.
 * @tc.level     : Level 0
 */
void Fremovexattr0100(void)
{
    char buf[BUFFER_SIZE];

    int fd = open(PATH, O_CREAT | O_WRONLY, FILE_PERMISSIONS);
    EXPECT_NE("Fremovexattr0100", fd, FAILURE_CODE);

    int result = fsetxattr(fd, "user.foo", "bar", DATA_LENGTH, SUCCESS_CODE);
    EXPECT_EQ("Fremovexattr0100", result, SUCCESS_CODE);

    result = fgetxattr(fd, "user.foo", buf, sizeof(buf));
    EXPECT_EQ("Fremovexattr0100", result, DATA_LENGTH);
    EXPECT_STREQ("Fremovexattr0100", buf, "bar");

    result = fremovexattr(fd, "user.foo");
    EXPECT_EQ("Fremovexattr0100", result, SUCCESS_CODE);

    memset(buf, 0, sizeof(buf));
    result = fgetxattr(fd, "user.foo", buf, sizeof(buf));
    EXPECT_EQ("Fremovexattr0100", result, FAILURE_CODE);

    close(fd);
    (void)remove(PATH);
}

static int FremovexattrTestImpl(int argc, char *argv[])
{
    Fremovexattr0100();
    return T_STATUS;
}

int FremovexattrTest(void)
{
    static char libcProg[] = "libc_test";
    char *libcArgv[] = { libcProg, nullptr };
    return FremovexattrTestImpl(1, libcArgv);
}
