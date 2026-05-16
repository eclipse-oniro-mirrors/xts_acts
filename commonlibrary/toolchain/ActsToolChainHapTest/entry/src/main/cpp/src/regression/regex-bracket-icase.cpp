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

// [^aBcC] with REG_ICASE should match d,D but not a,A,b,B,c,C according to
// http://austingroupbugs.net/view.php?id=872
#include <climits>
#include <cstdio>
#include <regex.h>
#include "libc_test_shim.h"
int RegexBracketIcaseTest()
{
    int status = SUCCESS_CODE;

    char buf[100];
    char* pat;
    regex_t re;
    int n;
    int i;
    struct {
        char* s;
        int n;
    } t[] = { { "a", REG_NOMATCH }, { "A", REG_NOMATCH }, { "b", REG_NOMATCH },
              { "B", REG_NOMATCH }, { "c", REG_NOMATCH }, { "C", REG_NOMATCH },
              { "d", 0 },           { "D", 0 },           { nullptr, 0 } };

    pat = "[^aBcC]";
    n = regcomp(&re, pat, REG_ICASE);
    if (n) {
        regerror(n, &re, buf, sizeof buf);
        LibcTestError(&status, "regcomp(\"%s\") failed: %d (%s)\n", pat, n, buf);
    }

    for (i = 0; t[i].s; i++) {
        n = regexec(&re, t[i].s, 0, nullptr, 0);
        if (n != t[i].n) {
            regerror(n, &re, buf, sizeof buf);
            LibcTestError(&status, "regexec(/%s/, \"%s\") returned %d (%s), wanted %d\n", pat, t[i].s, n, buf, t[i].n);
        }
    }

    return status;
}
