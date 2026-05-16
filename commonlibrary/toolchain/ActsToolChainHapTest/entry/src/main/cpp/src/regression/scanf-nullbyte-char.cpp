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

// commit: ef5507867b59d19f21437970e87b5d0415c07b2e 2013-06-22
// scanf should not append null byte after scanning %c
#include "libc_test_shim.h"
int ScanfNullbyteCharTest()
{
    int status = SUCCESS_CODE;

    char dst[] = { 'a', 'a' };
    char src[] = { 'b', 'b', 0 };

    dst[0] = src[0];
    if (dst[0] != 'b') {
        LibcTestError(&status, "%%c-equivalent copy failed\n");
    }
    if (dst[1] != 'a') {
        LibcTestError(&status, "scanf clobbered the char buffer for %%c conversion\n");
    }
    return status;
}
