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
#include <sys/time.h>
#include "functionalext.h"
#include "time64_functions.h"

static int g_count = 0;
static void ExpireTimer(int signo)
{
    struct itimerval val;
    g_count++;
    if (g_count > 1) {
        GetitimerTime64(signo, &val);
        val.it_value.tv_sec = 0;
        val.it_value.tv_usec = 0;
        setitimer(signo, &val, nullptr);
        g_count = 0;
    }
}

static void SignalHandler(int signo)
{
    switch (signo) {
        case SIGALRM:
            printf("catch a SIGALRM signal\n");
            ExpireTimer(signo);
            break;
        case SIGVTALRM:
            printf("catch a SIGVTALRM signal\n");
            break;
        case SIGPROF:
            printf("catch a SIGPROF signal\n");
            break;
        default:
            printf("no signal\n");
            break;
    }
}

/**
 * @tc.name      : getitimer_0100
 * @tc.desc      : Verify the value of the interval timer (parameter is ITIMER_REAL)
 * @tc.level     : Level 0
 */
void GetitimerTime640100(void)
{
    (void)signal(SIGALRM, SignalHandler);
    struct itimerval old;
    int result = GetitimerTime64(ITIMER_REAL, &old);
    EXPECT_EQ("GetitimerTime640100", result, 0);
}

int GetitimerTime64Test(void)
{
    GetitimerTime640100();
    return T_STATUS;
}