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

#include <cstring>
#include "libc_test_shim.h"
int MemmemOobReadTest()
{
    int status = SUCCESS_CODE;

    const unsigned char haystack[] = { 0, 0, 0, 0, 0, 0, 0, 1, 2 };
    const unsigned char needle[] = { 0, 0, 0, 0, 0, 0, 0, 1, 3 };
    unsigned char* p = static_cast<unsigned char*>(memmem(haystack, 8, needle, 8));
    if (!p) {
        LibcTestError(&status, "memmem(A,8,A,8) returned 0, want A\n");
    }
    return status;
}
