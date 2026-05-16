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

// commit: 72ed3d47e567b1635a35d3c1d174c8a8b2787e30 2014-07-17
// regexec should not crash on non-zero nmatch with REG_NOSUB
#include <regex.h>
#include "libc_test_shim.h"
int RegexecNosubTest()
{
    int status = SUCCESS_CODE;

    regex_t re;
    int r;

    r = regcomp(&re, "abc", REG_NOSUB);
    if (r) {
        LibcTestError(&status, "regcomp failed: %d\n", r);
    }
    r = regexec(&re, "zyx abc", 1, nullptr, 0);
    if (r == REG_NOMATCH) {
        LibcTestError(&status, "regexec failed to match\n");
    } else if (r) {
        LibcTestError(&status, "regexec returned invalid code: %d\n", r);
    }
    regfree(&re);
    return status;
}
