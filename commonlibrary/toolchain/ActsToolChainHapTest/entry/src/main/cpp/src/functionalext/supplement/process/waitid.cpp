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

#include <cstdio>
#include <cstdlib>
#include <sys/wait.h>
#include "test.h"

namespace {
constexpr int K_CHILD_EXIT_CODE_PROBE = 66;
} // namespace

/**
 * @tc.name      : Waitid0100
 * @tc.desc      : test waitid function for process control
 * @tc.level     : Level 0
 */
void Waitid0100(void)
{
    pid_t pid = fork();
    if (pid == -1) {
        t_error("%s waitid fork error\n", __func__);
    }
    if (pid == 0) {
        _exit(K_CHILD_EXIT_CODE_PROBE);
    }
    siginfo_t si = {};
    int result = waitid(P_PID, pid, &si, WEXITED);
    if (result != 0) {
        t_error("%s waitid error get result is %d are not want 0\n", __func__, result);
    }
    if (pid != si.si_pid) {
        t_error("%s waitid error pid not = si.si_pid\n", __func__);
    }
    if (si.si_status != K_CHILD_EXIT_CODE_PROBE) {
        t_error("%s waitid error si.si_status not = 66\n", __func__);
    }
    if (si.si_code != CLD_EXITED) {
        t_error("%s waitid error si.si_code not = CLD_EXITED\n", __func__);
    }
}

static int WaitidTestImpl(int argc, char* argv[])
{
    Waitid0100();
    return T_STATUS;
}

int WaitidTest(void)
{
    static char libcProgStub[] = "libc_test";
    char* libcArgvStub[] = { libcProgStub, nullptr };
    return WaitidTestImpl(1, libcArgvStub);
}
