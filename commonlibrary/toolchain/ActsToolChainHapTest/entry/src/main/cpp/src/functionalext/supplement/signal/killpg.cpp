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

#include <csignal>
#include <cstdio>
#include <cstdlib>
#include <sys/wait.h>
#include <unistd.h>
#include "functionalext.h"

static int g_exitFlag = 0;

void ChildFunc(int signal)
{
    switch (signal) {
        case SIGCHLD:
            g_exitFlag = 1;
            break;
        default:
            break;
    }
    return;
}

/**
 * @tc.name      : Killpg0100
 * @tc.desc      : Determine whether the child process successfully receives the signal to
 *                 the main process and respond accordingly
 * @tc.level     : Level 1
 */
void Killpg0100(void)
{
    pid_t pid;
    int status;
    sigset_t sigset;
    sigemptyset(&sigset);
    sigaddset(&sigset, SIGCHLD);
    sigprocmask(SIG_BLOCK, &sigset, nullptr);
    pid = fork();
    if (pid == 0) {
        sleep(1);
        int ret = killpg(getpgrp(), SIGCHLD);
        EXPECT_EQ("Killpg0100", ret, 0);
        exit(EXIT_SUCCESS);
    } else if (pid > 0) {
        (void)signal(SIGCHLD, ChildFunc);
        sigprocmask(SIG_UNBLOCK, &sigset, nullptr);
        while (!g_exitFlag) {
            sleep(1);
        }
        wait(nullptr);
        EXPECT_EQ("Killpg0100", g_exitFlag, 1);
    } else {
        printf("Fork wrong\n");
        exit(EXIT_FAILURE);
    }
}

/**
 * @tc.name      : Killpg0200
 * @tc.desc      : Outlier judgment
 * @tc.level     : Level 2
 */
void Killpg0200(void)
{
    int ret = killpg(-1, -1);
    EXPECT_EQ("Killpg0200", ret, -1);
}

static int KillpgTestImpl(void)
{
    Killpg0100();
    Killpg0200();
    return T_STATUS;
}

int KillpgTest(void)
{
    return KillpgTestImpl();
}
