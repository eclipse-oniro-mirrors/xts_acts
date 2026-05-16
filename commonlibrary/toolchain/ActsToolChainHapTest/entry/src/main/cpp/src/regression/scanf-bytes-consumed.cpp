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

// commit: 5efc6af4ebb9d50eb978d0338835544fdfea0396 2011-04-25
// scanf misreports bytes consumed when EOF is hit (or null for sscanf)
#include <cstdio>
#include "libc_test_shim.h"

namespace {
constexpr int K_EXPECTED_CONSUMED_BYTES = 2;
} // namespace

int ScanfBytesConsumedTest()
{
    int status = SUCCESS_CODE;

    char buf[] = { 'a', 'a', 0 };
    char dest[3];
    int readCount;
    int* readCountPtr = &readCount;
    int n;

    n = std::sscanf(buf, "%s%n", dest, readCountPtr);
    if (n != 1) {
        LibcTestError(&status, "sscanf matched 1 input items but returned %d\n", n);
    }
    if (readCount != K_EXPECTED_CONSUMED_BYTES) {
        LibcTestError(&status, "sscanf consumed 2 bytes but reported %d\n", readCount);
    }
    return status;
}
