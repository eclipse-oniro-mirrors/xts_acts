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

#include <fcntl.h>
#include <cstdio>
#include "test.h"
#include "functionalext.h"

static const char *PATHA = "/data/storage/el2/base/cache/readtest.txt";

/**
 * @tc.name      : getchar_unlocked_0100
 * @tc.desc      : Verify that a character can be read from standard input.
 * @tc.level     : Level 0
 */
void GetcharUnlocked0100(void)
{
    char str[] = "r";
    int fd = open(PATHA, O_RDWR | O_CREAT, TEST_MODE);
    if (fd < 0) {
        t_error("%s open failed\n", __func__);
    }

    ssize_t ret = write(fd, str, sizeof(str));
    if (ret < 0) {
        t_error("%s write failed\n", __func__);
    }
    FILE *fp = freopen(PATHA, "r", stdin);
    if (!fp) {
        t_error("%s freopen failed\n", __func__);
    }

    char ch = getchar_unlocked();
    if (ch != 'r') {
        t_error("%s getchar_unlocked failed\n");
    }

    (void)fclose(fp);
    close(fd);
    (void)remove(PATHA);
}

static int GetcharUnlockedTestImpl(int argc, char *argv[])
{
    GetcharUnlocked0100();
    return g_tStatus;
}

int GetcharUnlockedTest(void)
{
    static char libcProg[] = "libc_test";
    char *libcArgv[] = { libcProg, nullptr };
    return GetcharUnlockedTestImpl(1, libcArgv);
}
