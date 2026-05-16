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

#include <cstdio>
#include <unistd.h>
#include "libc_test_shim.h"
/**
 * @tc.name      : Setpgrp0100
 * @tc.desc      : Set the group ID of the current process as the process ID of the current process
 * @tc.level     : Level 0
 */
void Setpgrp0100(int& status)
{
    pid_t pt = setpgrp();
    if (pt == -1 && getpgrp() != getpid()) {
        LibcTestError(&status, "%s setpgrp failed\n", __func__);
    }
}

int SetpgrpTest()
{
    int status = SUCCESS_CODE;

    Setpgrp0100(status);
    return status;
}
