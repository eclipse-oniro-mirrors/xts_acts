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

// WARNING: failed to inject status
#include <fnmatch.h>
#include "libc_test_shim.h"
static void ConsumeInt(int n)
{
    (void)n;
}
static void F()
{
    ConsumeInt(FNM_NOMATCH);
    ConsumeInt(FNM_PATHNAME);
    ConsumeInt(FNM_PERIOD);
    ConsumeInt(FNM_NOESCAPE);
    {
        int (*p)(const char*, const char*, int) = fnmatch;
    }
}

int FnmatchTest()
{
    F();
    return SUCCESS_CODE;
}
