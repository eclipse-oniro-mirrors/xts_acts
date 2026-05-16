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
 * @tc.name      : Gethostname0100
 * @tc.desc      : Get the hostname through the gethostname method
 * @tc.level     : Level 0
 */
void Gethostname0100(int& status)
{
    char hostname[65];
    int result = gethostname(hostname, sizeof(hostname));
    if (result != 0) {
        LibcTestError(&status, "%s gethostname get result is %d are not want 0\n", __func__, result);
    }
}

int GethostnameTest()
{
    int status = SUCCESS_CODE;
    Gethostname0100(status);
    return status;
}
