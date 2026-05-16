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

#include <algorithm>
#include <cstdio>
#include <cstdlib>
#include "libc_test_shim.h"

int StrtodLongTest()
{
    int status = SUCCESS_CODE;

    double x;
    double want = .1111111111111111111111;
    static char buf[40000];

    std::fill_n(buf, sizeof buf, '1');
    buf[0] = '.';
    buf[sizeof buf - 1] = 0;

    if ((x = strtod(buf, nullptr)) != want) {
        LibcTestError(&status, "strtod(.11[...]1) got %a want %a\n", x, want);
    }
    return status;
}
