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

// commit 211264e46a2f1bc382a84435e904d1548de672b0 2013-09-27
// mbsrtowcs should not write outside the ws array
#include <cstddef>
#include <cwchar>
#include "libc_test_shim.h"

namespace {
constexpr size_t K_MBSRTOWCS_MAX_WCHARS = 4U;
} // namespace

int MbsrtowcsOverflowTest()
{
    int status = SUCCESS_CODE;

    wchar_t ws[] = L"XXXXX";
    const char* src = "abcd";
    const char* want = src + K_MBSRTOWCS_MAX_WCHARS;
    size_t r;

    r = mbsrtowcs(ws, &src, K_MBSRTOWCS_MAX_WCHARS, nullptr);
    if (r != K_MBSRTOWCS_MAX_WCHARS) {
        LibcTestError(&status, "mbsrtowcs(ws, &abcd, 4, 0) returned %zu, wanted 4\n", r);
    }
    if (src != want) {
        LibcTestError(&status, "mbsrtowcs(ws, &abcd, 4, 0) set abcd to %p wanted %p\n", src, want);
    }
    if (wcscmp(ws, L"abcdX") != 0) {
        LibcTestError(&status, "ws is L\"%ls\", wanted L\"abcdX\"\n", ws);
    }

    return status;
}
