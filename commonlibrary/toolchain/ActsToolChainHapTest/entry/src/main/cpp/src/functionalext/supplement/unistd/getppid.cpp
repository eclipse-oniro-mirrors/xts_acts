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

#include <sys/wait.h>
#include <unistd.h>
#include "functionalext.h"

/**
 * @tc.name      : Getppid0100
 * @tc.desc      : Get the Parent process id of the calling process
 * @tc.level     : Level 0
 */
void Getppid0100(void)
{
    pid_t ppid = getpid();
    pid_t pid = fork();
    if (pid == 0) {
        pid_t childPpid = getppid();
        EXPECT_EQ("Getppid0100", childPpid, ppid);
        _exit(0);
    } else if (pid > 0) {
        wait(nullptr);
    } else {
        EXPECT_FALSE("Getppid0100", 1);
    }
}

static int GetppidTestImpl(void)
{
    Getppid0100();
    return T_STATUS;
}

int GetppidTest(void)
{
    return GetppidTestImpl();
}
