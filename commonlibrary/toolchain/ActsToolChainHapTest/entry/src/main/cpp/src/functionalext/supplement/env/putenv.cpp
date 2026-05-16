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
#include <sys/wait.h>
#include "functionalext.h"

/**
 * @tc.name      : Putenv0100
 * @tc.desc      : Add or change the environment variable test
 * @tc.level     : Level 0
 */
void Putenv0100(void)
{
    int ret = unsetenv("test");
    EXPECT_EQ("Putenv0100", ret, CMPFLAG);

    ret = putenv("test=Putenv0100");
    EXPECT_EQ("Putenv0100", ret, CMPFLAG);
    char* test = getenv("test");
    if (test) {
        EXPECT_STREQ("Putenv0100", test, "Putenv0100");
    } else {
        EXPECT_PTRNE("Putenv0100", test, nullptr);
    }

    ret = putenv("test=putenv_new");
    EXPECT_EQ("Putenv0100", ret, CMPFLAG);
    test = getenv("test");
    EXPECT_PTRNE("Putenv0100", test, nullptr);
    if (test) {
        EXPECT_STREQ("Putenv0100", test, "putenv_new");
    }
    unsetenv("test");
}

/**
 * @tc.name      : Putenv0200
 * @tc.desc      : Provide exception parameters, add or modify the environment variable test
 * @tc.level     : Level 2
 */
void Putenv0200(void)
{
    int ret = unsetenv("test");
    EXPECT_EQ("Putenv0200", ret, CMPFLAG);

    ret = putenv("test");
    EXPECT_EQ("Putenv0200", ret, CMPFLAG);
    char* test = getenv("test");
    if (!test) {
        EXPECT_PTREQ("Putenv0200", test, nullptr);
    }
    pid_t pid = fork();
    if (pid == -1) {
        t_error("Unsetenv0100: Error forking process");
    } else if (pid == 0) {
        putenv("");
    } else {
        int status;
        waitpid(pid, &status, 0);
        if (WIFSIGNALED(status)) {
            int sig = WTERMSIG(status);
            EXPECT_EQ("Putenv0200", SIGABRT, sig);
        }
    }
    unsetenv("test");
}

static int PutenvTestImpl(void)
{
    Putenv0100();
    Putenv0200();
    return T_STATUS;
}

int PutenvTest(void)
{
    return PutenvTestImpl();
}
