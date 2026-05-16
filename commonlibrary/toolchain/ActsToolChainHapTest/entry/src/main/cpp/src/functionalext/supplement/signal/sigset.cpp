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

#define SUCCESS_CODE 0
#define EXPECTED_HANDLER_COUNT 1
#define INVALID_SIGNAL 99999
static int g_handlerCount = 0;
const int SIGNAL = SIGALRM;

static void handler(int sig)
{
    g_handlerCount++;
}

int Prepare(sigset_t *set)
{
    g_handlerCount = SUCCESS_CODE;

    struct sigaction act = {.sa_flags = SUCCESS_CODE, .sa_handler = handler};
    struct sigaction oldAct = {SUCCESS_CODE};
    int result = sigaction(SIGNAL, &act, &oldAct);
    if (result != SUCCESS_CODE) {
        return result;
    }

    if (g_handlerCount != SUCCESS_CODE) {
        return -1;
    }

    result = raise(SIGNAL);
    if (result != SUCCESS_CODE) {
        return result;
    }

    if (g_handlerCount != 1) {
        return -1;
    }

    result = sigemptyset(set);
    if (result != SUCCESS_CODE) {
        return result;
    }

    result = sigaddset(set, SIGNAL);
    if (result != SUCCESS_CODE) {
        return result;
    }

    result = sigprocmask(SIG_BLOCK, NULL, set);
    if (result != SUCCESS_CODE) {
        return result;
    }

    return SUCCESS_CODE;
}

/**
 * @tc.name      : sigset_0100
 * @tc.desc      : modifies the disposition of the signal sig with a handler
 * @tc.level     : Level 0
 */
void Sigset0100(void)
{
    sigset_t set;
    int result = Prepare(&set);
    if (result != SUCCESS_CODE) {
        t_error("%s failed: result = %d\n", __func__, result);
    }

    result = sigemptyset(&set);
    if (result != SUCCESS_CODE) {
        t_error("%s failed: result = %d\n", __func__, result);
    }

    errno = SUCCESS_CODE;
    sigset(SIGNAL, handler);
    if (errno != SUCCESS_CODE) {
        t_error("%s failed: errno = %d\n", __func__, errno);
    }

    result = sigprocmask(SIG_BLOCK, NULL, &set);
    if (result != SUCCESS_CODE) {
        t_error("%s failed: result = %d\n", __func__, result);
    }

    result = sigismember(&set, SIGNAL);
    if (result != SUCCESS_CODE) {
        t_error("%s failed: result = %d\n", __func__, result);
    }
}

/**
 * @tc.name      : sigset_0200
 * @tc.desc      : modifies the disposition of the signal sig with SIG_IGN
 * @tc.level     : Level 1
 */
void Sigset0200(void)
{
    sigset_t set;
    int result = Prepare(&set);
    if (result != SUCCESS_CODE) {
        t_error("%s failed: result = %d\n", __func__, result);
    }

    result = sigemptyset(&set);
    if (result != SUCCESS_CODE) {
        t_error("%s failed: result = %d\n", __func__, result);
    }

    errno = SUCCESS_CODE;
    sigset(SIGNAL, SIG_IGN);
    if (errno != SUCCESS_CODE) {
        t_error("%s failed: errno = %d\n", __func__, errno);
    }

    result = sigprocmask(SIG_BLOCK, NULL, &set);
    if (result != SUCCESS_CODE) {
        t_error("%s failed: result = %d\n", __func__, result);
    }

    result = sigismember(&set, SIGNAL);
    if (result != SUCCESS_CODE) {
        t_error("%s failed: result = %d\n", __func__, result);
    }
}

/**
 * @tc.name      : sigset_0300
 * @tc.desc      : modifies the disposition of the signal sig with SIG_DFL
 * @tc.level     : Level 1
 */
void Sigset0300(void)
{
    sigset_t set;
    int result = Prepare(&set);
    if (result != SUCCESS_CODE) {
        t_error("%s failed: result = %d\n", __func__, result);
    }

    result = sigemptyset(&set);
    if (result != SUCCESS_CODE) {
        t_error("%s failed: result = %d\n", __func__, result);
    }

    errno = SUCCESS_CODE;
    sigset(SIGNAL, SIG_DFL);
    if (errno != SUCCESS_CODE) {
        t_error("%s failed: errno = %d\n", __func__, errno);
    }

    result = sigprocmask(SIG_BLOCK, NULL, &set);
    if (result != SUCCESS_CODE) {
        t_error("%s failed: result = %d\n", __func__, result);
    }

    result = sigismember(&set, SIGNAL);
    if (result != SUCCESS_CODE) {
        t_error("%s failed: result = %d\n", __func__, result);
    }
}

/**
 * @tc.name      : sigset_0400
 * @tc.desc      : modifies the disposition of the signal sig with SIG_HOLD
 * @tc.level     : Level 1
 */
void Sigset0400(void)
{
    sigset_t set;
    int result = Prepare(&set);
    if (result != SUCCESS_CODE) {
        t_error("%s failed: result = %d\n", __func__, result);
    }

    result = sigemptyset(&set);
    if (result != SUCCESS_CODE) {
        t_error("%s failed: result = %d\n", __func__, result);
    }

    errno = SUCCESS_CODE;
    sigset(SIGNAL, SIG_HOLD);
    if (errno != SUCCESS_CODE) {
        t_error("%s failed: errno = %d\n", __func__, errno);
    }

    result = sigprocmask(SIG_BLOCK, NULL, &set);
    if (result != SUCCESS_CODE) {
        t_error("%s failed: result = %d\n", __func__, result);
    }

    result = sigismember(&set, SIGNAL);
    if (result == SUCCESS_CODE) {
        t_error("%s failed: result = %d\n", __func__, result);
    }
}

/**
 * @tc.name      : sigset_0500
 * @tc.desc      : modifies the disposition of the invalid signal sig
 * @tc.level     : Level 2
 */
void Sigset0500(void)
{
    errno = SUCCESS_CODE;
    int signal = INVALID_SIGNAL;

    sigset(signal, SIG_DFL);
    if (errno == SUCCESS_CODE) {
        t_error("%s failed: errno = %d\n", __func__, errno);
    }
}

static int SigsetTest_impl(int argc, char *argv[])
{
    Sigset0100();
    Sigset0200();
    Sigset0300();
    Sigset0400();
    Sigset0500();

    return g_tStatus;
}

int SigsetTest(void)
{
    static char libcProg[] = "libc_test";
    char *libcArgv[] = { libcProg, NULL };
    return SigsetTest_impl(1, libcArgv);
}
