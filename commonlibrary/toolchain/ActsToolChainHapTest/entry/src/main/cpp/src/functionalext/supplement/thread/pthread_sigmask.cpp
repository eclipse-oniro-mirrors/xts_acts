/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
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
#include <cstdlib>
#include <pthread.h>
#include <unistd.h>
#include "functionalext.h"

static int32_t g_errorParam = 3;

/**
 * @tc.name      : PthreadSigmask0100
 * @tc.desc      : Verify pthread_sigmask process success when define shield signal is SIGUSR1
 * @tc.level     : Level 1
 */
void PthreadSigmask0100(void)
{
    sigset_t set;
    sigaddset(&set, SIGUSR1);
    int32_t ret = pthread_sigmask(SIG_BLOCK, &set, nullptr);
    EXPECT_EQ("PthreadSigmask0100", ret, 0);
    sigset_t setOne;
    sigset_t setEmpty;
    sigaddset(&setOne, SIGUSR2);
    sigemptyset(&setEmpty);
    ret = pthread_sigmask(SIG_BLOCK, &setOne, &setEmpty);
    EXPECT_EQ("PthreadSigmask0100", ret, 0);
    sigismember(&set, SIGUSR1);
    EXPECT_EQ("PthreadSigmask0100", sigismember(&set, SIGUSR1), 1);
}

/**
 * @tc.name      : PthreadSigmask0200
 * @tc.desc      : Verify pthread_sigmask process success when undefine shield signal
 * @tc.level     : Level 1
 */
void PthreadSigmask0200(void)
{
    sigset_t set;
    sigaddset(&set, SIGUSR1);
    sigaddset(&set, SIGQUIT);
    int32_t ret = pthread_sigmask(SIG_BLOCK, &set, nullptr);
    EXPECT_EQ("PthreadSigmask0200", ret, 0);
    sigset_t setEmpty;
    sigemptyset(&setEmpty);
    ret = pthread_sigmask(SIG_BLOCK, &setEmpty, nullptr);
    EXPECT_EQ("PthreadSigmask0200", ret, 0);
    ret = sigismember(&set, SIGUSR1);
    EXPECT_EQ("PthreadSigmask0200", ret, 1);
    ret = sigismember(&set, SIGQUIT);
    EXPECT_EQ("PthreadSigmask0200", ret, 1);
}

/**
 * @tc.name      : PthreadSigmask0300
 * @tc.desc      : Verify pthread_sigmask process fail becaus first param is error
 * @tc.level     : Level 2
 */
void PthreadSigmask0300(void)
{
    sigset_t set;
    sigaddset(&set, SIGUSR1);
    sigaddset(&set, SIGQUIT);
    int32_t ret = pthread_sigmask(SIG_BLOCK + g_errorParam, &set, nullptr);
    EXPECT_EQ("PthreadSigmask0300", ret, EINVAL);
}

/**
 * @tc.name      : PthreadSigmask0400
 * @tc.desc      : Verify pthread_sigmask process success when second and third param is null
 * @tc.level     : Level 2
 */
void PthreadSigmask0400(void)
{
    sigset_t set;
    sigset_t setEmpty;
    sigaddset(&set, SIGUSR1);
    sigemptyset(&setEmpty);
    int32_t ret = pthread_sigmask(SIG_BLOCK, &set, nullptr);
    EXPECT_EQ("pthread_setschedparam_0400", ret, 0);
    ret = pthread_sigmask(SIG_BLOCK, nullptr, &setEmpty);
    EXPECT_EQ("pthread_setschedparam_0400", ret, 0);
    ret = sigismember(&set, SIGUSR1);
    EXPECT_EQ("pthread_setschedparam_0400", ret, 1);
}

static int PthreadSigmaskTestTestImpl(void)
{
    PthreadSigmask0100();
    PthreadSigmask0200();
    PthreadSigmask0300();
    PthreadSigmask0400();
    return T_STATUS;
}

int PthreadSigmaskTestTest(void)
{
    return PthreadSigmaskTestTestImpl();
}
