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
#include "libc_test_shim.h"
/**
 * @tc.name      : GetAvphysPage0100
 * @tc.desc      : Verify the total number of pages available for acquisition
 * @tc.level     : Level 0
 */
void GetAvphysPage0100(int& status)
{
    long availPhysPages = get_avphys_pages();
    if (availPhysPages <= 0) {
        LibcTestError(&status, "%s get_avphys_pages failed\n", __func__);
    }
}

int GetAvphysPagesTest()
{
    int status = SUCCESS_CODE;
    GetAvphysPage0100(status);
    return status;
}
