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

void Handler(int sig)
{
    g_handlerCount++;
}

/**
 * @tc.name      : Sighold0100
 * @tc.desc      : add sig to the signal mask of the calling process
 * @tc.level     : Level 0
 */
void Sighold0100(void)
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
    if (result != 0) {
        t_error("%s failed: result = %d\n", __func__, result);
    }

    if (g_handlerCount != 0) {
        t_error("%s failed: handler_count = %d\n", __func__, g_handlerCount);
    }
}

/**
 * @tc.name      : Sighold0200
 * @tc.desc      : add an invalid sig to the signal mask of the calling process
 * @tc.level     : Level 2
 */
void Sighold0200(void)
{
    errno = 0;
    int sig = 99999;
    int result = sighold(sig);
    if (result == 0) {
        t_error("%s failed: result = %d\n", __func__, result);
    }

    if (errno == 0) {
        t_error("%s failed: errno = %d\n", __func__, errno);
    }
}

static int SigholdTestImpl(int argc, char *argv[])
{
    Sighold0100();
    Sighold0200();

    return T_STATUS;
}

int SigholdTest(void)
{
    static char libcProg[] = "libc_test";
    char *libcArgv[] = { libcProg, nullptr };
    return SigholdTestImpl(1, libcArgv);
}
