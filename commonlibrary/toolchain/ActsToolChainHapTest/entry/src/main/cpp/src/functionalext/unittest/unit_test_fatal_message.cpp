/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

#include <info/fatal_message.h>

#include <cerrno>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <test.h>
#include <pthread.h>
#include <unistd.h>
#include "functionalext.h"

typedef void (*TEST_FUN)(void);
static const int WAIT_TIME = 1;

/**
 * @tc.name      : set_fatal_message
 * @tc.desc      : Test the function of set_fatal_message.
 * @tc.level     : Level 0
 */
static void FatalMessage0010(void)
{
    const char msg[1024] = {"abcdefghijklmnopqrstuvwxyz1234567890"};
    pid_t fpid;
    fpid = fork();
    if (fpid < 0) {
        TPrintf("error in fork!");
    } else if (fpid == 0) {
        int pidChild = getpid();
        fatal_msg_t *fatal_message = nullptr;
        set_fatal_message(msg);
        fatal_message = get_fatal_message();
        EXPECT_EQ("fatal_message_0010", fatal_message, nullptr);
        exit(pidChild);
    }
}

static TEST_FUN g_gFunArray[] = {
    FatalMessage0010,
};

static int UnittestFatalMessageTestImpl(void)
{
    int num = sizeof(g_gFunArray) / sizeof(TEST_FUN);
    for (int pos = 0; pos < num; ++pos) {
        g_gFunArray[pos]();
    }

    return g_tStatus;
}

int UnittestFatalMessageTest(void)
{
    return UnittestFatalMessageTestImpl();
}
