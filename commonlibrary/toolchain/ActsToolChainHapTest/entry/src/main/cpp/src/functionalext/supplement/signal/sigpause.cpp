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
 * @tc.name      : Sigpause0100
 * @tc.desc      : atomically release blocked signals
 * @tc.level     : Level 0
 */
void Sigpause0100(void)
{
    g_handlerCount = 0;

    int sig = SIGALRM;
    struct sigaction act = {.sa_flags = 0, .sa_handler = Handler};
    struct sigaction oldAct = {};
    int result = sigaction(sig, &act, &oldAct);
    if (result != 0) {
        t_error("%s failed: result = %d\n", __func__, result);
        return;
    }

    result = sighold(sig);
    if (result != 0) {
        t_error("%s failed: result = %d\n", __func__, result);
        return;
    }

    sigset_t set = {0};
    result = sigprocmask(SIG_SETMASK, nullptr, &set);
    if (result != 0) {
        t_error("%s failed: result = %d\n", __func__, result);
        return;
    }

    result = sigismember(&set, sig);
    if (result == 0) {
        t_error("%s failed: result = %d\n", __func__, result);
        return;
    }

    result = raise(sig);
    if (result != 0 || g_handlerCount != 0) {
        t_error("%s failed: result = %d\n", __func__, result);
        t_error("%s failed: g_handlerCount = %d\n", __func__, g_handlerCount);
    }

    errno = 0;
    result = sigpause(sig);
    if (result != -1 || errno != EINTR) {
        t_error("%s failed: result = %d\n", __func__, result);
        t_error("%s failed: errno = %d\n", __func__, errno);
    }

    if (g_handlerCount != 1) {
        t_error("%s failed: g_handlerCount = %d\n", __func__, g_handlerCount);
    }
}

static int SigpauseTestImpl(int argc, char *argv[])
{
    Sigpause0100();

    return T_STATUS;
}

int SigpauseTest(void)
{
    static char libcProg[] = "libc_test";
    char *libcArgv[] = { libcProg, nullptr };
    return SigpauseTestImpl(1, libcArgv);
}
