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
// scanf misreports literal match as input failure when reading EOF (null for sscanf)
#include <cstdio>
#include "libc_test_shim.h"
int ScanfMatchLiteralEofTest()
{
    int status = SUCCESS_CODE;

    char buf[] = { 0 };
    int matchCount;

    matchCount = std::sscanf(buf, "a");
    if (matchCount != EOF) {
        LibcTestError(&status, "scanf reported match failure instead of input failure on literal EOF match\n");
    }

    return status;
}
