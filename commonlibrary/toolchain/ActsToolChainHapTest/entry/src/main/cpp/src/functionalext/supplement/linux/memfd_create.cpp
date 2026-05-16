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

#include <cstdlib>
#include <sys/mman.h>
#include "functionalext.h"

/**
 * @tc.name      : MemfdCreate0100
 * @tc.desc      : Process memfd_create success.
 * @tc.level     : Level 0
 */
void MemfdCreate0100(void)
{
    char tmpfile[] = "/data/MemfdCreate0100.Txt";
    int fd = memfd_create(tmpfile, 0);
    EXPECT_TRUE("MemfdCreate0100", fd != -1);
    if (fd != -1) {
        int cnt = write(fd, tmpfile, strlen(tmpfile));
        EXPECT_TRUE("MemfdCreate0100", cnt == strlen(tmpfile));
        close(fd);
    }
}

/**
 * @tc.name: MemfdCreate0200
 * @tc.desc: Process memfd_create fail. because param is error.
 * @tc.level: Level 2
 */
void MemfdCreate0200(void)
{
    char tmpfile[] = "/data/MemfdCreate0200.Txt";
    int fd = memfd_create(tmpfile, -1);
    EXPECT_TRUE("MemfdCreate0200", fd == -1);
    if (fd != -1) {
        int cnt = write(fd, tmpfile, strlen(tmpfile));
        EXPECT_TRUE("MemfdCreate0200", cnt == strlen(tmpfile));
        close(fd);
    }
}

static int MemfdCreateTestImpl(void)
{
    MemfdCreate0100();
    MemfdCreate0200();
    return T_STATUS;
}

int MemfdCreateTest(void)
{
    return MemfdCreateTestImpl();
}
