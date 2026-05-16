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

// negated overlapping ranges in a regex bracket
// were not handled correctly by tre
#include <regex.h>
#include "libc_test_shim.h"
int RegexNegatedRangeTest()
{
    int status = SUCCESS_CODE;

    char buf[200];
    regex_t r;
    int n;

    n = regcomp(&r, "[^aa-z]", 0);
    if (n) {
        regerror(n, &r, buf, sizeof buf);
        LibcTestError(&status, "regcomp returned %d (%s)\n", n, buf);
    }

    n = regexec(&r, "k", 0, nullptr, 0);
    if (n != REG_NOMATCH) {
        regerror(n, &r, buf, sizeof buf);
        LibcTestError(&status, "regexec(/[^aa-z]/ ~ \"k\") returned %d (%s), wanted REG_NOMATCH\n", n, buf);
    }

    return status;
}
