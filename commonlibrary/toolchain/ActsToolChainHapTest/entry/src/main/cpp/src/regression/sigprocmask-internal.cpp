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

// commit: a49c119276742d7d212fb88f83a8f559ca549e72 2011-02-19
// commit: 96f2197494791f5884c01b5caa908074cc7e90a6 2011-02-20
// commit: 23815f88df6c45247f3755dc7857f4013264c04f 2013-07-18
// implementation signals should not be masked
#include <cerrno>
#include <csignal>
#include <cstring>
#include "libc_test_shim.h"

namespace {
constexpr int K_SIG_RT_PROBE_START = 32;
} // namespace

int SigprocmaskInternalTest()
{
    int status = SUCCESS_CODE;

    sigset_t s;
    int i;

    sigemptyset(&s);
    for (i = K_SIG_RT_PROBE_START; i < SIGRTMIN; i++) {
        sigaddset(&s, i);
        if (sigismember(&s, i) == 1) {
            LibcTestError(&status, "sigaddset(&s, %d) set implementation internal rt signal\n", i);
        }
    }
    if (sigprocmask(SIG_BLOCK, &s, nullptr)) {
        LibcTestError(&status, "blocking signals failed: %s\n", strerror(errno));
    }
    if (sigprocmask(SIG_BLOCK, nullptr, &s)) {
        LibcTestError(&status, "querying sigmask failed: %s\n", strerror(errno));
    }
    for (i = K_SIG_RT_PROBE_START; i < SIGRTMIN; i++) {
        if (sigismember(&s, i) == 1) {
            LibcTestError(&status, "implementation internal rt signal %d can be blocked\n", i);
        }
    }
    return status;
}
