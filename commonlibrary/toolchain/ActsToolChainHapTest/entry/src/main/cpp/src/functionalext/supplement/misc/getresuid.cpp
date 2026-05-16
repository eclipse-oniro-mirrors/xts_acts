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

#include <cerrno>
#include <cstdlib>
#include <sys/wait.h>
#include "functionalext.h"

/**
 * @tc.name      : Getresuid0100
 * @tc.desc      : Get the real UID, the effective UID, and the saved set-user-ID of the calling process
 * @tc.level     : Level 0
 */
void Getresuid0100(void)
{
    uid_t ruid = -1;
    uid_t euid = -1;
    uid_t suid = -1;
    int rev = getresuid(&ruid, &euid, &suid);
    EXPECT_EQ("Getresuid0100", rev, 0);
}

/**
 * @tc.name      : Getresuid0200
 * @tc.desc      : Get the real UID, the effective UID, and the saved set-user-ID of the child process
 * @tc.level     : Level 0
 */
void Getresuid0200(void)
{
    pid_t pid = fork();
    if (pid == 0) {
        uid_t ruid = -1;
        uid_t euid = -1;
        uid_t suid = -1;
        int rev = getresuid(&ruid, &euid, &suid);
        EXPECT_EQ("Getresuid0200", rev, 0);
    } else if (pid > 0) {
        wait(nullptr);
    }
}

/**
 * @tc.name      : Getresuid0300
 * @tc.desc      : Provide wrong arguments, call getresuid
 * @tc.level     : Level 2
 */
void Getresuid0300(void)
{
    int rev = getresuid(nullptr, nullptr, nullptr);
    EXPECT_EQ("Getresuid0300", rev, -1);
}

static int GetresuidTestImpl(void)
{
    Getresuid0100();
    Getresuid0200();
    Getresuid0300();
    return T_STATUS;
}

int GetresuidTest(void)
{
    return GetresuidTestImpl();
}
