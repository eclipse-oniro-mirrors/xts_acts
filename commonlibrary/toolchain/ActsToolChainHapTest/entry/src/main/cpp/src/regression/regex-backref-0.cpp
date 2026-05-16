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

// \0 is not a valid backref, it is undefined by the standard
// we treat such cases as literal char
#include <regex.h>
#include "libc_test_shim.h"
int RegexBackref0Test()
{
    int status = SUCCESS_CODE;

    char buf[200];
    char pat[] = "a\\0";
    regex_t r;
    int n;

    n = regcomp(&r, pat, 0);
    if (n) {
        regerror(n, &r, buf, sizeof buf);
        LibcTestError(&status, "regcomp(%s) returned %d (%s) wanted 0\n", pat, n, buf);
    }
    n = regexec(&r, "a0", 0, nullptr, 0);
    if (n) {
        regerror(n, &r, buf, sizeof buf);
        LibcTestError(&status, "regexec(/%s/ ~ \"a0\") returned %d (%s), wanted 0\n", pat, n, buf);
    }

    return status;
}
