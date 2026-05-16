/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

// commit: 6871fd773dcedbf056317d5d5e87b4859e97c4a4 2011-03-10
// commit: 9505bfbc40fec217820abad7142663eda60cd6be 2014-03-18
// catching stackoverflow SIGSEGV using sigaltstack
// mips stack_t is inconsistent with other archs
#include <cerrno>
#include <csignal>
#include <cstdint>
#include <cstdlib>
#include <cstring>
#include "test.h"

static void CheckZeroResult(int ret, const char* expr)
{
    if (ret != 0) {
        t_error("%s failed: %s\n", expr, strerror(errno));
    }
}

static char g_stack[SIGSTKSZ];

static void Handler(int sig)
{
    uintptr_t i;
    stack_t ss;

    i = reinterpret_cast<uintptr_t>(reinterpret_cast<void*>(&i));
    if (i < reinterpret_cast<uintptr_t>(static_cast<void*>(g_stack)) ||
        i >= reinterpret_cast<uintptr_t>(static_cast<void*>(g_stack)) + SIGSTKSZ) {
        t_error("signal Handler was not invoked on the altstack\n");
    }

    CheckZeroResult(sigaltstack(nullptr, &ss), "sigaltstack(nullptr, &ss)");
    if (ss.ss_flags != SS_ONSTACK) {
        t_error("ss_flags is not SS_ONSTACK in the signal Handler\n");
    }
}

static int SigaltstackTestImpl(void)
{
    stack_t ss;
    struct sigaction sa;

    ss.ss_sp = g_stack;
    ss.ss_size = sizeof g_stack;
    ss.ss_flags = 0;
    sa.sa_handler = Handler;
    sa.sa_flags = SA_ONSTACK;

    CheckZeroResult(sigaltstack(&ss, nullptr), "sigaltstack(&ss, nullptr)");
    CheckZeroResult(sigfillset(&sa.sa_mask), "sigfillset(&sa.sa_mask)");
    CheckZeroResult(sigaction(SIGUSR1, &sa, nullptr), "sigaction(SIGUSR1, &sa, nullptr)");
    CheckZeroResult(raise(SIGUSR1), "raise(SIGUSR1)");

    errno = 0;
    ss.ss_size = MINSIGSTKSZ - 1;
    if (sigaltstack(&ss, nullptr) != -1 || errno != ENOMEM) {
        t_error(
            "sigaltstack with g_stack size < MINSIGSTKSZ should have failed with ENOMEM, "
            "got %s\n",
            strerror(errno));
    }
    errno = 0;
    ss.ss_flags = -1;
    ss.ss_size = MINSIGSTKSZ;
    if (sigaltstack(&ss, nullptr) != -1 || errno != EINVAL) {
        t_error(
            "sigaltstack with bad ss_flags should have failed with EINVAL, "
            "got %s\n",
            strerror(errno));
    }
    errno = 0;
    CheckZeroResult(sigaltstack(nullptr, nullptr), "sigaltstack(nullptr, nullptr)");

    return T_STATUS;
}

int SigaltstackTest(void)
{
    return SigaltstackTestImpl();
}
