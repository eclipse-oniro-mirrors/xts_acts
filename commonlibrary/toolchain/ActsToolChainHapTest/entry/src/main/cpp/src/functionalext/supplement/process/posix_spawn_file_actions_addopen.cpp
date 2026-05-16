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

#include <fcntl.h>
#include <fdop.h>
#include <spawn.h>
#include <sys/mman.h>
#include <sys/stat.h>
#include "functionalext.h"

/**
 * @tc.name      : PosixSpawnFileActionsAddopen0100
 * @tc.desc      : Set the behavior property of the open file to the spawn file actions object
 * @tc.level     : Level 0
 */
void PosixSpawnFileActionsAddopen0100(void)
{
    posix_spawn_file_actions_t fa;
    struct fdop* ptr = NULL;

    posix_spawn_file_actions_init(&fa);

    int fd = 10;
    int ret = posix_spawn_file_actions_addopen(&fa, fd, "/data/storage/el2/base/cache", O_RDWR | O_CREAT, S_IXGRP);
    EXPECT_EQ("PosixSpawnFileActionsAddopen0100", ret, CMPFLAG);
    if (ret == 0) {
        ptr = reinterpret_cast<struct fdop*>(fa.__actions);
        EXPECT_EQ("PosixSpawnFileActionsAddopen0100", ptr->cmd, FDOP_OPEN);
        EXPECT_EQ("PosixSpawnFileActionsAddopen0100", ptr->fd, fd);
        EXPECT_EQ("PosixSpawnFileActionsAddopen0100", ptr->oflag, O_RDWR | O_CREAT);
        EXPECT_EQ("PosixSpawnFileActionsAddopen0100", ptr->mode, S_IXGRP);
        EXPECT_STREQ("PosixSpawnFileActionsAddopen0100", ptr->path, "/data/storage/el2/base/cache");
    }

    posix_spawn_file_actions_destroy(&fa);
}

/**
 * @tc.name      : PosixSpawnFileActionsAddopen0200
 * @tc.desc      : Set the behavior property of the open file to the spawn file actions object
 * @tc.level     : Level 0
 */
void PosixSpawnFileActionsAddopen0200(void)
{
    posix_spawn_file_actions_t fa;
    struct fdop* ptr = NULL;
    int fd = 10;
    posix_spawn_file_actions_init(&fa);
    int ret = posix_spawn_file_actions_addopen(
        &fa, fd, "/data/storage/el2/base/cache", O_RDONLY | O_CREAT, S_IXGRP | S_IROTH | S_IWOTH);
    EXPECT_EQ("PosixSpawnFileActionsAddopen0200", ret, CMPFLAG);
    if (ret == 0) {
        ptr = reinterpret_cast<struct fdop*>(fa.__actions);
        EXPECT_EQ("PosixSpawnFileActionsAddopen0200", ptr->cmd, FDOP_OPEN);
        EXPECT_EQ("PosixSpawnFileActionsAddopen0200", ptr->fd, fd);
        EXPECT_EQ("PosixSpawnFileActionsAddopen0200", ptr->oflag, O_RDONLY | O_CREAT);
        EXPECT_EQ("PosixSpawnFileActionsAddopen0200", ptr->mode, S_IXGRP | S_IROTH | S_IWOTH);
        EXPECT_STREQ("PosixSpawnFileActionsAddopen0200", ptr->path, "/data/storage/el2/base/cache");
    }

    ret = posix_spawn_file_actions_destroy(&fa);
}

/**
 * @tc.name      : PosixSpawnFileActionsAddopen0300
 * @tc.desc      : Set the behavior property of the open file to the spawn file actions object
 * @tc.level     : Level 0
 */
void PosixSpawnFileActionsAddopen0300(void)
{
    posix_spawn_file_actions_t fa;
    struct fdop* ptr = NULL;
    int fd = 10;
    posix_spawn_file_actions_init(&fa);
    int ret = posix_spawn_file_actions_addopen(
        &fa, fd, "/data/storage/el2/base/cache", O_WRONLY | O_CREAT, S_IXGRP | S_IROTH | S_IWOTH);
    EXPECT_EQ("PosixSpawnFileActionsAddopen0300", ret, CMPFLAG);
    if (ret == 0) {
        ptr = reinterpret_cast<struct fdop*>(fa.__actions);
        EXPECT_EQ("PosixSpawnFileActionsAddopen0300", ptr->cmd, FDOP_OPEN);
        EXPECT_EQ("PosixSpawnFileActionsAddopen0300", ptr->fd, fd);
        EXPECT_EQ("PosixSpawnFileActionsAddopen0300", ptr->oflag, O_WRONLY | O_CREAT);
        EXPECT_EQ("PosixSpawnFileActionsAddopen0300", ptr->mode, S_IXGRP | S_IROTH | S_IWOTH);
        EXPECT_STREQ("PosixSpawnFileActionsAddopen0300", ptr->path, "/data/storage/el2/base/cache");
    }

    ret = posix_spawn_file_actions_destroy(&fa);
}

static int PosixSpawnFileActionsAddopenTestImpl(void)
{
    PosixSpawnFileActionsAddopen0100();
    PosixSpawnFileActionsAddopen0200();
    PosixSpawnFileActionsAddopen0300();
    return T_STATUS;
}

int PosixSpawnFileActionsAddopenTest(void)
{
    return PosixSpawnFileActionsAddopenTestImpl();
}
