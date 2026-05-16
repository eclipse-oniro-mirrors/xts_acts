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

#include <sys/sysinfo.h>
#include <unistd.h>
#include "libc_test_shim.h"
/**
 * @tc.name      : GetNprocs0100
 * @tc.desc      : Verify the number of CPUs being used
 * @tc.level     : Level 0
 */
void GetNprocs0100(int& status)
{
    int nprocs = get_nprocs();
    if (nprocs <= 0) {
        LibcTestError(&status, "%s get_nprocs failed\n", __func__);
    }
    if (sysconf(_SC_NPROCESSORS_ONLN) != nprocs) {
        LibcTestError(&status, "%s get_nprocs invalid\n", __func__);
    }
}

int GetNprocsTest()
{
    int status = SUCCESS_CODE;
    GetNprocs0100(status);
    return status;
}
