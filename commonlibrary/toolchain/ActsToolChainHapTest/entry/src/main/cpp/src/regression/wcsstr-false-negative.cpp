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

// commit 476cd1d96560aaf7f210319597556e7fbcd60469 2014-04-18
// wcsstr (strstr and memmem) failed to match repetitive needles in some cases
#include <cstddef>
#include <cwchar>
#include "libc_test_shim.h"

namespace {
constexpr ptrdiff_t K_EXPECTED_HAYSTACK_OFFSET = 8;
} // namespace

int WcsstrFalseNegativeTest()
{
    int status = SUCCESS_CODE;

    const wchar_t* haystack = L"playing play play play always";
    const wchar_t* needle = L"play play play";

    const wchar_t* p = wcsstr(haystack, needle);
    if (p != haystack + K_EXPECTED_HAYSTACK_OFFSET) {
        LibcTestError(&status,
                      "wcsstr(L\"%S\",L\"%S\") failed: got %p, want %p\n",
                      haystack,
                      needle,
                      p,
                      haystack + K_EXPECTED_HAYSTACK_OFFSET);
    }
    return status;
}
