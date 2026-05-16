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

static int g_handlerCount = 0;

static void Handler(int sig)
{
    g_handlerCount++;
}

/**
 * @tc.name      : Sigsuspend0100
 * @tc.desc      : wait for a signal
 * @tc.level     : Level 0
 */
void Sigsuspend0100(void)
{
    sigset_t set;
    sigemptyset(&set);

    int sig = SIGALRM;
    sigaddset(&set, sig);
    sigprocmask(SIG_BLOCK, &set, nullptr);

    int flags = 0;
    struct sigaction act = {.sa_flags = flags, .sa_handler = Handler};
    struct sigaction oldAct = {};
    int result = sigaction(sig, &act, &oldAct);
    if (result != 0) {
        t_error("%s failed: result = %d\n", __func__, result);
    }

    sigset_t pendingSet;
    sigemptyset(&pendingSet);
    sigpending(&pendingSet);

    for (int i = SIGHUP; i <= SIGSTKSZ; ++i) {
        result = sigismember(&pendingSet, i);
        if (result != 0) {
            t_error("%s failed: result = %d, i = %d\n", __func__, result, i);
        }
    }

    (void)raise(sig);
    if (g_handlerCount != 0) {
        t_error("%s failed: g_handlerCount = %d\n", __func__, g_handlerCount);
    }

    sigemptyset(&pendingSet);
    sigpending(&pendingSet);

    for (int i = SIGHUP; i <= SIGSTKSZ; ++i) {
        if ((i == sig) != (sigismember(&pendingSet, i))) {
            t_error("%s failed: i = %d, sig = %d\n", __func__, i, sig);
        }
    }

    sigset_t setWithoutSig;
    sigfillset(&setWithoutSig);
    sigdelset(&setWithoutSig, sig);

    result = sigsuspend(&setWithoutSig);
    if (result != -1) {
        t_error("%s failed: result = %d\n", __func__, result);
    }

    if (errno != EINTR) {
        t_error("%s failed: errno = %d\n", __func__, errno);
    }

    if (g_handlerCount != 1) {
        t_error("%s failed: g_handlerCount = %d\n", __func__, g_handlerCount);
    }
}

static int SigsuspendTestImpl(int argc, char *argv[])
{
    Sigsuspend0100();

    return T_STATUS;
}

int SigsuspendTest(void)
{
    static char libcProg[] = "libc_test";
    char *libcArgv[] = { libcProg, nullptr };
    return SigsuspendTestImpl(1, libcArgv);
}
