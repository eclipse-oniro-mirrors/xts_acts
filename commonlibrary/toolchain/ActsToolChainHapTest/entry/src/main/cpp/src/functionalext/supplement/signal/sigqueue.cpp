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

#include <cerrno>
#include <csignal>

#include "test.h"

static int g_actionCount = 0;

void Action(int sig, siginfo_t* info, void* ctx)
{
    if (sig != SIGALRM) {
        t_error("%s failed: sig = %d\n", __func__, sig);
    }

    if (info->si_signo != SIGALRM) {
        t_error("%s failed: info->si_signo = %d\n", __func__, info->si_signo);
    }

    if (info->si_code != SI_QUEUE) {
        t_error("%s failed: info->si_code = %d\n", __func__, info->si_code);
    }

    if (info->si_value.sival_int != 1) {
        t_error("%s failed: info->si_value.sival_int = %d\n", __func__, info->si_value.sival_int);
    }

    g_actionCount++;
}

/**
 * @tc.name      : Sigqueue0100
 * @tc.desc      : queue a signal
 * @tc.level     : Level 0
 */
void Sigqueue0100(void)
{
    g_actionCount = 0;

    int sig = SIGALRM;
    int flags = SA_SIGINFO;
    struct sigaction act = { .sa_flags = flags, .sa_sigaction = Action };
    struct sigaction oldAct {};
    int result = sigaction(sig, &act, &oldAct);
    if (result != 0) {
        t_error("%s failed: result = %d\n", __func__, result);
        return;
    }

    union sigval sigval = { .sival_int = 1 };

    errno = 0;
    result = sigqueue(getpid(), sig, sigval);
    if (result != 0) {
        t_error("%s failed: result = %d\n", __func__, result);
    }

    if (errno != 0) {
        t_error("%s failed: errno = %d\n", __func__, errno);
    }

    if (g_actionCount != 1) {
        t_error("%s failed: g_actionCount = %d\n", __func__, g_actionCount);
    }
}

/**
 * @tc.name      : Sigqueue0200
 * @tc.desc      : queue a signal with an invalid sig
 * @tc.level     : Level 2
 */
void Sigqueue0200(void)
{
    int sig = 99999;
    union sigval sigval = { .sival_int = 1 };

    errno = 0;
    int result = sigqueue(getpid(), sig, sigval);
    if (result == 0) {
        t_error("%s failed: result = %d\n", __func__, result);
    }

    if (errno == 0) {
        t_error("%s failed: errno = %d\n", __func__, errno);
    }
}

static int SigqueueTestImpl(int argc, char* argv[])
{
    Sigqueue0100();
    Sigqueue0200();

    return T_STATUS;
}

int SigqueueTest(void)
{
    static char libcProgStub[] = "libc_test";
    char* libcArgvStub[] = { libcProgStub, nullptr };
    return SigqueueTestImpl(1, libcArgvStub);
}
