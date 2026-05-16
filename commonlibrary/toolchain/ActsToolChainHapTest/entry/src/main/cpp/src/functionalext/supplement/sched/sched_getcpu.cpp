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
#include <cstdio>
#include <sched.h>
#include "libc_test_shim.h"
/*
 * @tc.name      : SchedGetcpu0100
 * @tc.desc      : Determine CPU on which the calling thread is running
 * @tc.level     : Level 0
 */
void SchedGetcpu0100(int& status)
{
    errno = 0;
    int result = sched_getcpu();
    if (result == -1) {
        LibcTestError(&status, "%s sched_getcpu failed\n", __func__);
    }
    if (errno != 0) {
        LibcTestError(&status, "%s errno is %d\n", __func__, errno);
    }
}

int SchedGetcpuTest()
{
    int status = SUCCESS_CODE;

    SchedGetcpu0100(status);
    return status;
}
