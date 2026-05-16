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

// commit 7c8c86f6308c7e0816b9638465a5917b12159e8f 2015-03-20
// backref is not valid in ere
#include <regex.h>
#include "libc_test_shim.h"
int RegexEreBackrefTest()
{
    int status = SUCCESS_CODE;

    char buf[200];
    char pat[] = "(a)\\1";
    regex_t r;
    int n;

    n = regcomp(&r, pat, REG_EXTENDED);
    if (n) {
        regerror(n, &r, buf, sizeof buf);
        LibcTestError(&status, "regcomp(%s) returned %d (%s) wanted 0\n", pat, n, buf);
    }

    n = regexec(&r, "aa", 0, nullptr, 0);
    if (n != REG_NOMATCH) {
        regerror(n, &r, buf, sizeof buf);
        LibcTestError(&status, "regexec(/%s/ ~ \"aa\") returned %d (%s), wanted REG_NOMATCH\n", pat, n, buf);
    }

    n = regexec(&r, "a1", 0, nullptr, 0);
    if (n) {
        regerror(n, &r, buf, sizeof buf);
        LibcTestError(&status, "regexec(/%s/ ~ \"a1\") returned %d (%s), wanted 0\n", pat, n, buf);
    }

    return status;
}
