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

static int g_count = 0;
void ExpireTimer(int signo)
{
    struct itimerval val;
    g_count++;
    if (g_count > 1) {
        getitimer(signo, &val);
        val.it_value.tv_sec = 0;
        val.it_value.tv_usec = 0;
        setitimer(signo, &val, nullptr);
        g_count = 0;
    }
}

void SignalHandler(int signo)
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
 * @tc.name      : Getitimer0100
 * @tc.desc      : Verify the value of the interval timer (parameter is ITIMER_REAL)
 * @tc.level     : Level 0
 */
void Getitimer0100(void)
{
    (void)signal(SIGALRM, SignalHandler);
    struct itimerval old;
    int result = getitimer(ITIMER_REAL, &old);
    EXPECT_EQ("Getitimer0100", result, 0);
}

/**
 * @tc.name      : Getitimer0200
 * @tc.desc      : Verify the value of the interval timer (parameter is ITIMER_VIRTUAL)
 * @tc.level     : Level 0
 */
void Getitimer0200(void)
{
    (void)signal(SIGALRM, SignalHandler);
    struct itimerval old;
    int result = getitimer(ITIMER_VIRTUAL, &old);
    EXPECT_EQ("Getitimer0200", result, 0);
}

/**
 * @tc.name      : Getitimer0300
 * @tc.desc      : Verify the value of the interval timer (parameter is ITIMER_PROF)
 * @tc.level     : Level 0
 */
void Getitimer0300(void)
{
    (void)signal(SIGALRM, SignalHandler);
    struct itimerval old;
    int result = getitimer(ITIMER_PROF, &old);
    EXPECT_EQ("Getitimer0300", result, 0);
}

static int GetitimerTestImpl(void)
{
    Getitimer0100();
    Getitimer0200();
    Getitimer0300();

    return T_STATUS;
}

int GetitimerTest(void)
{
    return GetitimerTestImpl();
}
