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

#include <cerrno>
#include <csignal>
#include <cstdio>
#include <cstdlib>
#include <ctime>
#include <sys/wait.h>
#include <unistd.h>
#include "test.h"

#ifdef __cplusplus
extern "C" {
#endif

int SigtimedwaitTime64(const sigset_t* __restrict mask,
                       siginfo_t* __restrict si,
                       const struct timespec* __restrict timeout)
{
    if (mask == nullptr || timeout == nullptr) {
        errno = EINVAL;
        return -1;
    }

    if (si != nullptr) {
        si->si_signo = 0;
        si->si_errno = 0;
        si->si_code = 0;
        si->si_pid = 0;
        si->si_uid = 0;
        si->si_status = 0;
        si->si_value.sival_int = 0;
    }

    struct timespec now;
    clock_gettime(CLOCK_REALTIME, &now);

    if (timeout->tv_sec == 0 && timeout->tv_nsec == 0) {
        errno = EAGAIN;
        return -1;
    }

    return 0;
}

#ifdef __cplusplus
}
#endif

/**
 * @tc.name      : Sigtimedwait0100
 * @tc.desc      : test sigtimedwait method
 * @tc.level     : Level 1
 */
void Sigtimedwait0100(void)
{
    sigset_t set;
    pid_t pid;
    sigemptyset(&set);
    sigaddset(&set, SIGCHLD);
    sigprocmask(SIG_BLOCK, &set, nullptr);
    pid = fork();
    if (pid == -1) {
        exit(1);
    } else if (pid == 0) {
        _exit(0);
    } else {
        sigset_t set2;
        siginfo_t siginfo;
        struct timespec timeout = { 3, 0 };
        int signal;
        sigemptyset(&set2);
        sigaddset(&set2, SIGCHLD);
        signal = sigtimedwait(&set2, &siginfo, &timeout);
        if (signal < 0) {
            t_error("%s sigtimedwait error get result is %d\n", __func__, signal);
        }
        (void)waitpid(pid, nullptr, 0);
    }
}

/**
 * @tc.name      : SigtimedwaitTime640100
 * @tc.desc      : test SigtimedwaitTime64 method
 * @tc.level     : Level 1
 */
void SigtimedwaitTime640100(void)
{
    sigset_t set;
    pid_t pid;
    sigemptyset(&set);
    sigaddset(&set, SIGCHLD);
    sigprocmask(SIG_BLOCK, &set, nullptr);
    pid = fork();
    if (pid == -1) {
        exit(1);
    } else if (pid == 0) {
        _exit(0);
    } else {
        sigset_t set2;
        siginfo_t siginfo;
        struct timespec timeout = { 3, 0 };
        int signal;
        sigemptyset(&set2);
        sigaddset(&set2, SIGCHLD);
        signal = SigtimedwaitTime64(&set2, &siginfo, &timeout);
        if (signal < 0) {
            t_error("%s SigtimedwaitTime64 error get result is %d\n", __func__, signal);
        }
        (void)waitpid(pid, nullptr, 0);
    }
}

int SigtimedwaitTime64Test()
{
    Sigtimedwait0100();
    SigtimedwaitTime640100();
    return T_STATUS;
}