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

#include <cstdint>
#include <cstdio>
#include "mtest.h"

static struct FI t[] = {
#include "sanity/llrintf.h"
#include "special/llrintf.h"

};

static int LlrintfTestImpl(void)
{
#pragma STDC FENV_ACCESS ON
    long long yi;
    int e;
    int i;
    int err = 0;
    struct FI* p;

    for (i = 0; i < sizeof t / sizeof *t; i++) {
        p = t + i;

        if (p->r < 0)
            continue;
        fesetround(p->r);
        feclearexcept(FE_ALL_EXCEPT);
        yi = llrintf(p->x);
        e = fetestexcept(INEXACT | INVALID | DIVBYZERO | UNDERFLOW | OVERFLOW);
        if (!Checkexcept(e, p->e, p->r)) {
            printf("%s:%d: bad fp exception: %s llrintf(%a)=%lld, want %s",
                   p->file,
                   p->line,
                   Rstr(p->r),
                   p->x,
                   p->i,
                   Estr(p->e));
            printf(" got %s\n", Estr(e));
            err++;
        }
        if (!(p->e & INVALID) && yi != p->i) {
            printf("%s:%d: %s llrintf(%a) want %lld got %lld\n", p->file, p->line, Rstr(p->r), p->x, p->i, yi);
            err++;
        }
    }
    return !!err;
}

int LlrintfTest(void)
{
    return LlrintfTestImpl();
}
