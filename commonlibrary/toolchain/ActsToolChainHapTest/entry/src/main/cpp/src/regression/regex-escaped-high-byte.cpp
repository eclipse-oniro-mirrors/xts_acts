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

// commit 39dfd58417ef642307d90306e1c7e50aaec5a35c 2015-03-20
// backslash followed by high byte should be parsed as a normal sequence
#include <clocale>
#include <regex.h>
#include "libc_test_shim.h"
int RegexEscapedHighByteTest()
{
    int status = SUCCESS_CODE;

    char buf[200];
    regex_t r;
    int n;

    (void)setlocale(LC_CTYPE, "C.UTF-8");

    // illegal sequence (not U+00FC)
    n = regcomp(&r, "\\\xfc", 0);
    if (n != REG_BADPAT) {
        regerror(n, &r, buf, sizeof buf);
        LibcTestError(&status, "regcomp(\\\\\\xfc) returned %d (%s) wanted REG_BADPAT\n", n, buf);
    }

    return status;
}
