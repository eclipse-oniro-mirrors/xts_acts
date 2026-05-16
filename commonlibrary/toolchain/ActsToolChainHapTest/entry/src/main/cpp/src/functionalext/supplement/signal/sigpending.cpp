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
#include "libc_test_shim.h"
/**
 * @tc.name      : Sigpending0100
 * @tc.desc      : test the sigpending function to get the signal set set to SIG_BLOCK
 * @tc.level     : Level 0
 */
void Sigpending0100(int& status)
{
    sigset_t pending;
    sigemptyset(&pending);
    int result = sigpending(&pending);
    if (result != 0) {
        LibcTestError(&status, "%s sigpending error get result is %d are not want 0\n", __func__, result);
    }
}

int SigpendingTest()
{
    int status = SUCCESS_CODE;

    Sigpending0100(status);
    return status;
}
