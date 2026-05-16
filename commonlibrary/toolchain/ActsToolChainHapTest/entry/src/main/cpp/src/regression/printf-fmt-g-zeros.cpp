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

// commit 89740868c9f1c84b8ee528468d12df1fa72cd392 2014-04-07
// %g should not print trailing zeros
#include <cstdio>
#include <cstring>
#include "libc_test_shim.h"

static constexpr double K_PRINTF_FMT_G_VALUE = 987654321098765.0;
static constexpr double K_PRINTF_FMT_G_TRAILING_ZEROS_CASE = 100000000000000.5;

static void T(const char* fmt, double d, const char* want, int& status)
{
    char buf[256];
    int n = strlen(want);
    int r = std::snprintf(buf, sizeof buf, fmt, d);
    if (r != n || memcmp(buf, want, n + 1) != 0) {
        LibcTestError(&status, "std::snprintf(\"%s\",%f) want %s got %s\n", fmt, d, want, buf);
    }
}

int PrintfFmtGZerosTest()
{
    int status = SUCCESS_CODE;

    T("%.50g", K_PRINTF_FMT_G_TRAILING_ZEROS_CASE, "100000000000000.5", status);
    T("%.50g", K_PRINTF_FMT_G_VALUE, "987654321098765", status);
    return status;
}
