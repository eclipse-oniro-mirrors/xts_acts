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
#include <fcntl.h>
#include <spawn.h>
#include <sys/stat.h>
#include <sys/wait.h>
#include "functionalext.h"

/**
 * @tc.name      : PosixSpawnp0100
 * @tc.desc      : Use the default process attributes, create a subprocess and
 *                 execute shell commands, which are input from outside
 * @tc.level     : Level 0
 */
void PosixSpawnp0100(char* cmd)
{
    pid_t pid;
    char* argv[] = { "sh", "-c", cmd, nullptr };
    int ret = posix_spawnp(&pid, "/bin/sh", nullptr, nullptr, argv, nullptr);
    EXPECT_EQ("PosixSpawnp0100", ret, CMPFLAG);
    if (ret != 0) {
        t_error("posix_spawnp create child process failed\n");
        return;
    }
    wait(nullptr);
}

/**
 * @tc.name      : PosixSpawnp0200
 * @tc.desc      : Add SIGCHLD to the signal set, create a subprocess and
 *                 execute shell commands, which are input from outside
 * @tc.level     : Level 0
 */
void PosixSpawnp0200(char* cmd)
{
    pid_t pid;
    sigset_t def;
    posix_spawnattr_t attr;
    char* argv[] = { "sh", "-c", cmd, nullptr };
    int ret = posix_spawnattr_init(&attr);

    ret = sigemptyset(&def);
    ret = sigaddset(&def, SIGCHLD);
    if (ret == ERREXPECT) {
        EXPECT_NE("PosixSpawnp0200", ret, ERREXPECT);
        return;
    }

    ret = posix_spawnattr_setsigdefault(&attr, &def);
    posix_spawnattr_setflags(&attr, POSIX_SPAWN_SETSIGMASK);

    ret = posix_spawnp(&pid, "/bin/sh", nullptr, &attr, argv, nullptr);
    EXPECT_EQ("PosixSpawnp0200", ret, CMPFLAG);
    if (ret != 0) {
        t_error("posix_spawnp create child process failed\n");
        return;
    }

    wait(nullptr);
    posix_spawnattr_destroy(&attr);
}

/**
 * @tc.name      : PosixSpawnp0300
 * @tc.desc      : Set process attributes, create subprocesses and execute shell
 *                 commands, which are input externally
 * @tc.level     : Level 0
 */
void PosixSpawnp0300(char* cmd)
{
    pid_t pid;
    sigset_t def;
    posix_spawnattr_t attr;
    char* argv[] = { "sh", "-c", cmd, nullptr };
    int ret = posix_spawnattr_init(&attr);

    posix_spawnattr_setflags(&attr, POSIX_SPAWN_SETSIGDEF);

    ret = posix_spawnp(&pid, "/bin/sh", nullptr, &attr, argv, nullptr);
    EXPECT_EQ("PosixSpawnp0300", ret, CMPFLAG);
    if (ret != 0) {
        t_error("posix_spawnp create child process failed\n");
        return;
    }

    wait(nullptr);
    posix_spawnattr_destroy(&attr);
}

/**
 * @tc.name      : PosixSpawnp0400
 * @tc.desc      : Create a child process and execute a non-existing file in the current
 *                 directory, the process creation fails
 * @tc.level     : Level 2
 */
void PosixSpawnp0400(void)
{
    pid_t pid;

    int ret = posix_spawnp(&pid, "unexitfile", nullptr, nullptr, nullptr, nullptr);
    EXPECT_NE("PosixSpawnp0400", ret, CMPFLAG);
    if (ret != 0) {
        return;
    }
    waitpid(pid, nullptr, WNOHANG);
}

static int PosixSpawnpTestImpl(int argc, char* argv[])
{
    if (argc > 1) {
        PosixSpawnp0100(argv[1]);
        PosixSpawnp0200(argv[1]);
        PosixSpawnp0300(argv[1]);
        PosixSpawnp0400();
    }
    return T_STATUS;
}

int PosixSpawnpTest(void)
{
    static char libcProgStub[] = "libc_test";
    char* libcArgvStub[] = { libcProgStub, nullptr };
    return PosixSpawnpTestImpl(1, libcArgvStub);
}
