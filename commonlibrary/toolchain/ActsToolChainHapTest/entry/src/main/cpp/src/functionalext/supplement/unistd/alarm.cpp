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

#include <csignal>
#include <unistd.h>
#include "functionalext.h"

typedef void (*TEST_FUN)();
#define SLEEP_TIME 6
static int g_timeOut = 0;
static void Handler(int signo)
{
    (void)signo;
    g_timeOut = 1;
    printf("Signal Handler called: SIGALRM received\n");
}

/**
 * @tc.name      : Alarm0100
 * @tc.desc      : Set the alarm time for the process.
 * @tc.level     : Level 0
 */
void Alarm0100()
{
    (void)signal(SIGALRM, Handler);
    unsigned int result = alarm(SLEEP_TIME);
    EXPECT_EQ("Alarm0100", result, 0);
    (void)alarm(0);
}

static TEST_FUN g_gFunArray[] = {
    Alarm0100,
};

static int AlarmTestWithArgs(int argc, char* argv[])
{
    T_STATUS = 0;
    int num = sizeof(g_gFunArray) / sizeof(g_gFunArray[0]);
    for (int pos = 0; pos < num; ++pos) {
        g_gFunArray[pos]();
    }

    return T_STATUS;
}

int AlarmTest(void)
{
    static char libcProgStub[] = "libc_test";
    char* libcArgvStub[] = { libcProgStub, nullptr };
    return AlarmTestWithArgs(1, libcArgvStub);
}
