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

// commit 109048e031f39fbb370211fde44ababf6c04c8fb 2014-04-07
// float printf out-of-bounds access
#include <cstdio>
#include <cstring>
#include "libc_test_shim.h"

static constexpr double K_PRINTF_LARGE_DECIMAL = 123123123123123.0;
static constexpr double K_PRINTF_NEAR_ONE_E9 = 999999999.0;
static constexpr double K_PRINTF_NEAR_ONE_E9_FRAC = 999999999.75;

static void T(int& status, const char* fmt, double d, const char* want)
{
    char buf[256];
    int n = strlen(want);
    int r = std::snprintf(buf, sizeof buf, fmt, d);
    if (r != n || memcmp(buf, want, n + 1) != 0) {
        LibcTestError(&status, "std::snprintf(\"%s\",%f) want %s got %s\n", fmt, d, want, buf);
    }
}

int Printf1e9OobTest()
{
    int status = SUCCESS_CODE;

    // fill stack with something
    T(status, "%.1f", K_PRINTF_LARGE_DECIMAL, "123123123123123.0");
    // test for out-of-bounds access
    T(status, "%g", K_PRINTF_NEAR_ONE_E9, "1e+09");
    T(status, "%.3e", K_PRINTF_NEAR_ONE_E9_FRAC, "1.000e+09");
    return status;
}
