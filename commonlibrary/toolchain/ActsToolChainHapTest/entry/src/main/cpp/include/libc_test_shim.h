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

#pragma once

#include <cstdarg>
#include <cstdio>
#include "CommonTool.h"

static inline void LibcTestError(int* status, const char* fmt, ...)
{
    if (status != nullptr) {
        *status = 1;
    }
    va_list args;
    va_start(args, fmt);
    // OHPrintf takes variadic args directly; forward by formatting via vsnprintf is overkill here.
    // Use a small buffer to keep implementation simple.
    char buf[512];
    (void)std::vsnprintf(buf, sizeof(buf), fmt, args);
    va_end(args);
    OHPrintf("%s", buf);
}
