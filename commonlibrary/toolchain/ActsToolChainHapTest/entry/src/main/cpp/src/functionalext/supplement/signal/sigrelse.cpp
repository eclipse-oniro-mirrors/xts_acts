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

static int SetupSignalHandler(int sig)
{
    struct sigaction act = {.sa_flags = 0, .sa_handler = Handler};
    struct sigaction oldAct = {};
    int result = sigaction(sig, &act, &oldAct);
    if (result != 0) {
        t_error("%s failed: result = %d\n", __func__, result);
    }
    return result;
}

static int TestSignalHold(int sig)
{
    int result = sighold(sig);
    if (result != 0) {
        t_error("%s failed: result = %d\n", __func__, result);
        return result;
    }

    sigset_t set = {0};
    result = sigprocmask(SIG_SETMASK, nullptr, &set);
    if (result != 0) {
        t_error("%s failed: result = %d\n", __func__, result);
        return result;
    }

    result = sigismember(&set, sig);
    if (result == 0) {
        t_error("%s failed: result = %d\n", __func__, result);
        return -1;
    }
    return 0;
}

static void TestSignalPause(int sig)
{
    int result = raise(sig);
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

static void TestSignalRelease(int sig)
{
    sigset_t set = {0};
    int result = sigprocmask(SIG_SETMASK, nullptr, &set);
    if (result != 0) {
        t_error("%s failed: result = %d\n", __func__, result);
    }

    result = sigismember(&set, sig);
    if (result != 1) {
        t_error("%s failed: result = %d\n", __func__, result);
    }

    result = sigrelse(sig);
    if (result != 0) {
        t_error("%s failed: result = %d\n", __func__, result);
    }

    result = sigprocmask(SIG_SETMASK, nullptr, &set);
    if (result != 0) {
        t_error("%s failed: result = %d\n", __func__, result);
    }

    result = sigismember(&set, sig);
    if (result != 0) {
        t_error("%s failed: result = %d\n", __func__, result);
    }
}

/**
 * @tc.name      : sigrelse_0100
 * @tc.desc      : removes sig from the calling process's signal mask
 * @tc.level     : Level 0
 */
void Sigrelse0100(void)
{
    g_handlerCount = 0;
    int sig = SIGALRM;

    if (SetupSignalHandler(sig) != 0) {
        return;
    }

    if (TestSignalHold(sig) != 0) {
        return;
    }

    TestSignalPause(sig);
    TestSignalRelease(sig);
}

/**
 * @tc.name      : sigrelse_0200
 * @tc.desc      : removes an invalid sig from the calling process's signal mask
 * @tc.level     : Level 2
 */
void Sigrelse0200(void)
{
    errno = 0;
    int sig = 99999;
    int result = sigrelse(sig);
    if (result == 0) {
        t_error("%s failed: result = %d\n", __func__, result);
    }

    if (errno == 0) {
        t_error("%s failed: errno = %d\n", __func__, errno);
    }
}

static int SigrelseTestImpl(int argc, char *argv[])
{
    Sigrelse0100();
    Sigrelse0200();

    return T_STATUS;
}

int SigrelseTest(void)
{
    static char libcProg[] = "libc_test";
    char *libcArgv[] = { libcProg, nullptr };
    return SigrelseTestImpl(1, libcArgv);
}
