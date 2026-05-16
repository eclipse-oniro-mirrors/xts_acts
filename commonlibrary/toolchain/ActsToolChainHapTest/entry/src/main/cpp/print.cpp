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

#include <cstdarg>
#include <cstdio>
#include <unistd.h>
#include "CommonTool.h"
#include "test.h"

#ifdef __cplusplus
extern "C" {
#endif

volatile int g_tStatus = 0;

int TPrintf(const char* s, ...)
{
    va_list ap;
    va_start(ap, s);
    g_tStatus = 1;
    OHPrintf("testcase,error printing...");
    if (s != nullptr) {
        OHVPrintf(s, ap);
        va_end(ap);
        return 0;
    }
    va_end(ap);
    return -1;
}

#ifdef __cplusplus
}
#endif
