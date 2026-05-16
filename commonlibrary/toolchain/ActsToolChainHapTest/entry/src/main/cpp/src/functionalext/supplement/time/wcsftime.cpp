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
#include <cstring>
#include <ctime>
#include <cwchar>
#include "libc_test_shim.h"
/**
 * @tc.name      : Wcsftime0100
 * @tc.desc      : Format system time
 * @tc.level     : Level 0
 */
void Wcsftime0100(int& status)
{
    time_t rtime;
    struct tm* timeinfo;
    wchar_t buffer[80];
    (void)time(&rtime);
    timeinfo = localtime(&rtime);
    size_t result = wcsftime(buffer, 80, L"%I:%M%p", timeinfo);
    if (!result) {
        LibcTestError(&status, "%s wcsftime failed", __func__);
    }
}

int WcsftimeTest()
{
    int status = SUCCESS_CODE;

    Wcsftime0100(status);
    return status;
}
