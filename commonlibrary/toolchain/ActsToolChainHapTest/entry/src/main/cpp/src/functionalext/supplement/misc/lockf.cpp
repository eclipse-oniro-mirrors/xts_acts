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
#include <unistd.h>
#include "functionalext.h"

static const char* PATH = "/data/storage/el2/base/cache/lockf.txt";
const int SIZE = 3;

/**
 * @tc.name      : lockf_0100
 * @tc.desc      : Verify lockf process success. When cmd is F_LOCK.
 * @tc.level     : Level 0
 */
void Lockf0100(void)
{
    int fd = open(PATH, O_RDWR | O_CREAT, TEST_MODE);
    if (fd < 0) {
        t_error("%s failed: fd = %d\n", __func__, fd);
        return;
    }

    int ret = lockf(fd, F_LOCK, 0);
    EXPECT_EQ("Lockf0100", ret, 0);

    ret = lockf(fd, F_ULOCK, 0);
    EXPECT_EQ("Lockf0100", ret, 0);

    ret = remove(PATH);
    EXPECT_EQ("Lockf0100", ret, 0);
}

/**
 * @tc.name      : lockf_0200
 * @tc.desc      : Verify lockf process success. When cmd is F_TLOCK.
 * @tc.level     : Level 0
 */
void Lockf0200(void)
{
    int fd = open(PATH, O_RDWR | O_CREAT, TEST_MODE);
    if (fd < 0) {
        t_error("%s failed: fd = %d\n", __func__, fd);
        return;
    }

    int ret = lockf(fd, F_TLOCK, 0);
    EXPECT_EQ("Lockf0200", ret, 0);

    ret = lockf(fd, F_ULOCK, 0);
    EXPECT_EQ("Lockf0200", ret, 0);

    ret = remove(PATH);
    EXPECT_EQ("Lockf0200", ret, 0);
}

/**
 * @tc.name      : lockf_0300
 * @tc.desc      : Verify lockf process success. When cmd is F_TEST.
 * @tc.level     : Level 0
 */
void Lockf0300(void)
{
    int fd = open(PATH, O_RDWR | O_CREAT, TEST_MODE);
    if (fd < 0) {
        t_error("%s failed: fd = %d\n", __func__, fd);
    }

    int ret = lockf(fd, F_LOCK, 0);
    EXPECT_EQ("Lockf0300", ret, 0);

    ret = lockf(fd, F_TEST, 0);
    EXPECT_EQ("Lockf0300", ret, 0);

    ret = lockf(fd, F_ULOCK, 0);
    EXPECT_EQ("Lockf0300", ret, 0);

    ret = remove(PATH);
    EXPECT_EQ("Lockf0300", ret, 0);
}

/**
 * @tc.name      : lockf_0400
 * @tc.desc      : Verify lockf process fail bacause lock mode is error.
 * @tc.level     : Level 0
 */
void Lockf0400(void)
{
    int fd = open(PATH, O_RDWR | O_CREAT, TEST_MODE);
    if (fd < 0) {
        t_error("%s failed: fd = %d\n", __func__, fd);
    }

    int ret = lockf(fd, -1, 0);
    EXPECT_EQ("Lockf0400", ret, -1);

    ret = remove(PATH);
    EXPECT_EQ("Lockf0400", ret, 0);
}

static int LockfTestImpl(void)
{
    Lockf0100();
    Lockf0200();
    Lockf0300();
    Lockf0400();
    return T_STATUS;
}

int LockfTest(void)
{
    return LockfTestImpl();
}
