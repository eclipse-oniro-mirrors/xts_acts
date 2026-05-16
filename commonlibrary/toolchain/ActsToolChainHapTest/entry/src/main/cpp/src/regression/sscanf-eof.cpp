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

// introduced by d6c855caa88ddb1ab6e24e23a14b1e7baf4ba9c7 2018-09-15
// sscanf may crash on short input
#include <cstdlib>
#include "test.h"

int SscanfEofTest(void)
{
    const char* s = "0";
    char* end = nullptr;
    float f = strtof(s, &end);
    char c = 'x';
    int r = (end == s + 1 && f == 0.0f) ? 1 : 0;
    if (r != 1) {
        t_error("strtof/sscanf-equivalent on \"%s\" returned count %d, wanted 1\n", s, r);
    }
    if (f != 0.0f || c != 'x') {
        t_error("parse assigned f=%f c='%c', wanted f=0 c='x'\n", f, c);
    }
    return T_STATUS;
}
