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
#include <unistd.h>
#include "functionalext.h"

static int g_successfully = 0;
int g_failed = -1;

/*
 * @tc.name      : Daemon0100
 * @tc.desc      : Verify that the working directory of the daemon can be changed (parameters is 0)
 * @tc.level     : Level 0
 */
void Daemon0100(void)
{
    pid_t pid;
    int result = daemon(0, 0);
    EXPECT_EQ("Daemon0100", result, g_successfully);
}

/*
 * @tc.name      : Daemon0200
 * @tc.desc      : Verify that the working directory of the daemon can be changed (parameters is 7)
 * @tc.level     : Level 0
 */
void Daemon0200(void)
{
    pid_t pid;
    int result = daemon(7, 0);
    EXPECT_EQ("Daemon0200", result, g_successfully);
    int fd = open("/dev/null", O_RDWR);
    EXPECT_EQ("Daemon0200", fd, g_successfully);
}

/*
 * @tc.name      : Daemon0300
 * @tc.desc      : Verify that the working directory of the daemon cannot be changed
 *                 (the nochdir parameter has no effect)
 * @tc.level     : Level 2
 */
void Daemon0300(void)
{
    pid_t pid;
    int result = daemon(0, -1);
    EXPECT_EQ("Daemon0300", result, g_failed);
}

/*
 * @tc.name      : Daemon0400
 * @tc.desc      : Verify that the working directory of the daemon cannot be changed
 *                 (the noclose parameter has no effect)
 * @tc.level     : Level 2
 */
void Daemon0400(void)
{
    pid_t pid;
    int result = daemon(-1, -1);
    EXPECT_EQ("Daemon0400", result, g_failed);
    int fd = open("/dev/null", O_RDWR);
    EXPECT_EQ("Daemon0400", fd, g_failed);
}

/*
 * @tc.name      : Daemon0500
 * @tc.desc      : Verify that the working directory of the daemon cannot be changed (parameter invalid)
 * @tc.level     : Level 2
 */
void Daemon0500(void)
{
    pid_t pid;
    int result = daemon(0, 0);
    EXPECT_EQ("Daemon0500", result, g_successfully);
    pid = fork();
    EXPECT_EQ("Daemon0500", pid, g_failed);
}

/*
 * @tc.name      : Daemon0600
 * @tc.desc      : Verify that the working directory of the daemon cannot be changed (parameter invalid)
 * @tc.level     : Level 2
 */
void Daemon0600(void)
{
    pid_t pid;
    int result = daemon(0, 0);
    EXPECT_EQ("Daemon0600", result, g_successfully);
    int mode = setsid();
    EXPECT_EQ("Daemon0600", mode, g_failed);
}

static int DaemonTestWithArgs(int argc, char* argv[])
{
    Daemon0100();
    Daemon0200();
    Daemon0300();
    Daemon0400();
    Daemon0500();
    Daemon0600();

    return T_STATUS;
}

int DaemonTest(void)
{
    static char libcProg[] = "libc_test";
    char* libcArgv[] = { libcProg, nullptr };
    return DaemonTestWithArgs(1, libcArgv);
}

int DaemonTestCompat(void)
{
    return DaemonTest();
}
