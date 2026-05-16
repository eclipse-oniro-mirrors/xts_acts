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
#include <cstdio>
#include <cstring>
#include <sys/time.h>
#include "test.h"
#include "time64_functions.h"

#define COUNT_THRESHOLD 1
#define TIMER_SEC 0
#define TIMER_USEC 100000

static int g_count = 0;

static void ExpireTimer(int signo)
{
    struct itimerval val;
    g_count++;
    if (g_count > COUNT_THRESHOLD) {
        getitimer(signo, &val);
        val.it_value.tv_sec = TIMER_SEC;
        val.it_value.tv_usec = TIMER_SEC;
        SetitimerTime64(signo, &val, nullptr);
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
 * @tc.name      : SetitimerTime640100
 * @tc.desc      : Set value of an interval timer
 * @tc.level     : Level 0
 */
void SetitimerTime640100(void)
{
    (void)signal(SIGALRM, SignalHandler);
    struct itimerval it;
    memset(&it, 0, sizeof(it));

    it.it_value.tv_sec = TIMER_SEC;
    it.it_value.tv_usec = TIMER_USEC;
    it.it_interval.tv_sec = TIMER_SEC;
    it.it_interval.tv_usec = TIMER_USEC;

    if (SetitimerTime64(ITIMER_REAL, &it, nullptr)) {
        t_error("%s set timer failed", __func__);
    }
}

static int SetitimerTime64TestWithArgs(int argc, char *argv[])
{
    SetitimerTime640100();
    return T_STATUS;
}

int SetitimerTime64Test(void)
{
    static char libcProg[] = "libc_test";
    char *libcArgv[] = { libcProg, nullptr };
    return SetitimerTime64TestWithArgs(1, libcArgv);
}
