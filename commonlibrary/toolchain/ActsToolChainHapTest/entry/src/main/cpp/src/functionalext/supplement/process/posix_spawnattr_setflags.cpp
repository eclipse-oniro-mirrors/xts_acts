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
#include <spawn.h>
#include <sys/mman.h>
#include <sys/stat.h>
#include "functionalext.h"

/**
 * @tc.name      : PosixSpawnattrSetflags0100
 * @tc.desc      : set the flags of spawn attr(success)
 * @tc.level     : Level 0
 */
void PosixSpawnattrSetflags0100(void)
{
    posix_spawnattr_t spawnattr;

    int ret = posix_spawnattr_init(&spawnattr);
    ret = posix_spawnattr_setflags(&spawnattr, POSIX_SPAWN_RESETIDS);
    EXPECT_EQ("PosixSpawnattrSetflags0100", ret, CMPFLAG);
    ret = posix_spawnattr_setflags(&spawnattr, POSIX_SPAWN_SETPGROUP);
    EXPECT_EQ("PosixSpawnattrSetflags0100", ret, CMPFLAG);
    ret = posix_spawnattr_setflags(&spawnattr, POSIX_SPAWN_SETSIGDEF);
    EXPECT_EQ("PosixSpawnattrSetflags0100", ret, CMPFLAG);
    ret = posix_spawnattr_setflags(&spawnattr, POSIX_SPAWN_SETSIGMASK);
    EXPECT_EQ("PosixSpawnattrSetflags0100", ret, CMPFLAG);
    ret = posix_spawnattr_setflags(&spawnattr, POSIX_SPAWN_SETSCHEDPARAM);
    EXPECT_EQ("PosixSpawnattrSetflags0100", ret, CMPFLAG);
    ret = posix_spawnattr_setflags(&spawnattr, POSIX_SPAWN_SETSCHEDULER);
    EXPECT_EQ("PosixSpawnattrSetflags0100", ret, CMPFLAG);
    ret = posix_spawnattr_setflags(&spawnattr, POSIX_SPAWN_USEVFORK);
    EXPECT_EQ("PosixSpawnattrSetflags0100", ret, CMPFLAG);
    ret = posix_spawnattr_setflags(&spawnattr, POSIX_SPAWN_SETSID);
    EXPECT_EQ("PosixSpawnattrSetflags0100", ret, CMPFLAG);

    ret = posix_spawnattr_setflags(&spawnattr, POSIX_SPAWN_SETSID | POSIX_SPAWN_RESETIDS | POSIX_SPAWN_SETPGROUP);
    EXPECT_EQ("PosixSpawnattrSetflags0100", ret, CMPFLAG);

    posix_spawnattr_destroy(&spawnattr);
}

/**
 * @tc.name      : PosixSpawnattrSetflags0200
 * @tc.desc      : set the flags of spawn attr(failed)
 * @tc.level     : Level 2
 */
void PosixSpawnattrSetflags0200(void)
{
    posix_spawnattr_t spawnattr;
    short overflow = 256;
    int ret = posix_spawnattr_init(&spawnattr);
    ret = posix_spawnattr_setflags(&spawnattr, overflow);
    EXPECT_EQ("PosixSpawnattrSetflags0200", ret, EINVAL);

    posix_spawnattr_destroy(&spawnattr);
}

static int PosixSpawnattrSetflagsTestImpl(void)
{
    PosixSpawnattrSetflags0100();
    PosixSpawnattrSetflags0200();
    return T_STATUS;
}

int PosixSpawnattrSetflagsTest(void)
{
    return PosixSpawnattrSetflagsTestImpl();
}
