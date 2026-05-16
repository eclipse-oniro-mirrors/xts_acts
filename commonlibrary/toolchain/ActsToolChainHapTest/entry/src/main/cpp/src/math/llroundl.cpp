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

static struct LI t[] = {
#if LDBL_MANT_DIG == 53
#include "sanity/llround.h"
#include "special/llround.h"

#elif LDBL_MANT_DIG == 64
#include "sanity/llroundl.h"
#include "special/llroundl.h"

#endif
};

static int LlroundlTestImpl(void)
{
#pragma STDC FENV_ACCESS ON
    long long yi;
    int e;
    int i;
    int err = 0;
    struct LI* p;

    for (i = 0; i < sizeof t / sizeof *t; i++) {
        p = t + i;

        if (p->r < 0)
            continue;
        fesetround(p->r);
        feclearexcept(FE_ALL_EXCEPT);
        yi = llroundl(p->x);
        e = fetestexcept(INEXACT | INVALID | DIVBYZERO | UNDERFLOW | OVERFLOW);
        if (!Checkexcept(e, p->e, p->r) && (e | INEXACT) != p->e) {
            printf("%s:%d: bad fp exception: %s llroundl(%La)=%lld, want %s",
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
            printf("%s:%d: %s llroundl(%La) want %lld got %lld\n", p->file, p->line, Rstr(p->r), p->x, p->i, yi);
            err++;
        }
    }
    return !!err;
}

int LlroundlTest(void)
{
    return LlroundlTestImpl();
}
