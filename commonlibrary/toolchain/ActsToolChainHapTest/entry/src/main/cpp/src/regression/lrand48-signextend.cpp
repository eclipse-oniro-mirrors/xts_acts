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

// lrand48 should give deterministic results
#include <cstdlib>
#include "libc_test_shim.h"

namespace {
constexpr long K_LRAND48_SECOND_EXPECTED = 2116118L;
constexpr long K_LRAND48_THIRD_EXPECTED = 89401895L;
} // namespace

int Lrand48SignextendTest()
{
    int status = SUCCESS_CODE;

    const long r1 = lrand48();
    if (r1 != 0) {
        LibcTestError(&status, "1st lrand48() got %ld want 0\n", r1);
    }
    const long r2 = lrand48();
    if (r2 != K_LRAND48_SECOND_EXPECTED) {
        LibcTestError(&status, "2nd lrand48() got %ld want 2116118\n", r2);
    }
    const long r3 = lrand48();
    if (r3 != K_LRAND48_THIRD_EXPECTED) {
        LibcTestError(&status, "3rd lrand48() got %ld want 89401895\n", r3);
    }
    return status;
}
