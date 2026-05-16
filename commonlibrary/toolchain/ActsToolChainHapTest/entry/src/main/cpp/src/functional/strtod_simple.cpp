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

#include <cmath>
#include <cstdlib>
#include <iomanip>
#include <sstream>
#include <string>
#include "libc_test_shim.h"

namespace {
constexpr int K_STRTOD_ROUND_TRIP_ITERATIONS = 100;
constexpr int K_STRTOD_DECIMAL_PRECISION = 300;
constexpr double K_STRTOD_WANT16 = 16.0;
constexpr double K_STRTOD_WANT17 = 17.0;
} // namespace

/* r = place to store result
 * f = function call to test (or any expression)
 * x = expected result
 * m = message to print on failure (with formats for r & x)
 */

static void CheckDoubleEq(int& status, const char* expr, double got, double expect, const char* msg)
{
    if (got != expect) {
        LibcTestError(&status, "%s failed: ", expr);
        LibcTestError(&status, msg, got, expect, got - expect);
        LibcTestError(&status, "\n");
    }
}

int StrtodSimpleTest()
{
    int status = SUCCESS_CODE;

    int i;
    double d;
    double d2;

    for (i = 0; i < K_STRTOD_ROUND_TRIP_ITERATIONS; i++) {
        d = sin(i);
        std::ostringstream oss;
        oss << std::fixed << std::setprecision(K_STRTOD_DECIMAL_PRECISION) << d;
        std::string dec = oss.str();
        d2 = strtod(dec.c_str(), nullptr);
        CheckDoubleEq(status, "strtod(buf, nullptr)", d2, d, "round trip fail %a != %a (%a)");
    }

    d = strtod("0x1p4", nullptr);
    CheckDoubleEq(status, "strtod(\"0x1p4\", nullptr)", d, K_STRTOD_WANT16, "hex float %a != %a");
    d = strtod("0x1.1p4", nullptr);
    CheckDoubleEq(status, "strtod(\"0x1.1p4\", nullptr)", d, K_STRTOD_WANT17, "hex float %a != %a");
    return status;
}
