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

#include <cwchar>
#include "libc_test_shim.h"

int WcsncpyReadOverflowTest()
{
    int status = SUCCESS_CODE;

    wchar_t dst[] = { 'a', 'a' };
    wchar_t src[] = { 0, 'b' };

    auto unsafeWcsncpy = &wcsncpy;
    (void)unsafeWcsncpy(dst, src, 1);
    if (dst[1] != 'a') {
        LibcTestError(&status, "wcsncpy copied more than N\n");
    }
    return status;
}
