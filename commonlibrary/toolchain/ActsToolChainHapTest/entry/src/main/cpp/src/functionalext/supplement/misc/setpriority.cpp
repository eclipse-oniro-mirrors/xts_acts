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
#include <sys/resource.h>
#include <unistd.h>
#include "libc_test_shim.h"
/**
 * @tc.name      : Setpriority0100
 * @tc.desc      : Set process priority
 * @tc.level     : Level 0
 */
void Setpriority0100(int& status)
{
    int result = setpriority(PRIO_PROCESS, gettid(), 1);
    if (result != 0) {
        LibcTestError(&status, "%s setpriority get result is %d not zero", __func__, result);
    }
}

int SetpriorityTest()
{
    int status = SUCCESS_CODE;

    Setpriority0100(status);
    return status;
}
