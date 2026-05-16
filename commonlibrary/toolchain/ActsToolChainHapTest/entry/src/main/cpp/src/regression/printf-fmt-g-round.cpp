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

// commit e94d0692864ecf9522fd6a97610a47a2f718d3de 2014-04-07
// %g midpoint cases should be rounded to even
#include <cstdio>
#include <cstring>
#include "libc_test_shim.h"

namespace {
constexpr double K_PRINTF_FMT_G_MIDPOINT1 = 1000000000005.0;
constexpr double K_PRINTF_FMT_G_MIDPOINT2 = 100000000002500.0;
} // namespace

static void T(int& status, const char* fmt, double d, const char* want)
{
    char buf[256];
    int n = strlen(want);
    int r = std::snprintf(buf, sizeof buf, fmt, d);
    if (r != n || memcmp(buf, want, n + 1) != 0) {
        LibcTestError(&status, "std::snprintf(\"%s\", %f) want %s got %s\n", fmt, d, want, buf);
    }
}

int PrintfFmtGRoundTest()
{
    int status = SUCCESS_CODE;

    T(status, "%.12g", K_PRINTF_FMT_G_MIDPOINT1, "1e+12");
    T(status, "%.12g", K_PRINTF_FMT_G_MIDPOINT2, "1.00000000002e+14");
    return status;
}
