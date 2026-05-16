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

static struct LiL t[] = {
#if LDBL_MANT_DIG == 53
#include "sanity/scalbn.h"
#include "special/scalbn.h"

#elif LDBL_MANT_DIG == 64
#include "sanity/scalbnl.h"
#include "special/scalbnl.h"

#endif
};

static int ScalbnlTestImpl(void)
{
#pragma STDC FENV_ACCESS ON
    long double y;
    float d;
    int e;
    int i;
    int err = 0;
    struct LiL* p;

    for (i = 0; i < sizeof t / sizeof *t; i++) {
        p = t + i;
        if (p->r < 0)
            continue;
        fesetround(p->r);
        feclearexcept(FE_ALL_EXCEPT);
        y = scalbnl(p->x, p->i);
        e = fetestexcept(INEXACT | INVALID | DIVBYZERO | UNDERFLOW | OVERFLOW);
        if (!Checkexceptall(e, p->e, p->r)) {
            printf("%s:%d: bad fp exception: %s scalbnl(%La, %lld)=%La, want %s",
                   p->file,
                   p->line,
                   Rstr(p->r),
                   p->x,
                   p->i,
                   p->y,
                   Estr(p->e));
            printf(" got %s\n", Estr(e));
            err++;
        }
        d = Ulperrl(y, p->y, p->dy);
        if (!Checkcr(y, p->y, p->r)) {
            printf("%s:%d: %s scalbnl(%La, %lld) want %La got %La ulperr %.3f = %.3f + %.3f\n",
                   p->file,
                   p->line,
                   Rstr(p->r),
                   p->x,
                   p->i,
                   p->y,
                   (long double)y,
                   (double)d,
                   (double)(d - p->dy),
                   p->dy);
            err++;
        }
    }
    return !!err;
}

int ScalbnlTest(void)
{
    return ScalbnlTestImpl();
}
