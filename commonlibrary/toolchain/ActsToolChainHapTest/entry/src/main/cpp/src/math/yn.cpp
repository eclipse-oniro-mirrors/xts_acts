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

static struct DiD t[] = {
#include "sanity/yn.h"
#include "special/yn.h"
};

static int YnTestImpl(void)
{
#pragma STDC FENV_ACCESS ON
    double y;
    float d;
    int e;
    int i;
    int err = 0;
    struct DiD* p;

    for (i = 0; i < sizeof t / sizeof *t; i++) {
        p = t + i;
        if (p->r < 0)
            continue;
        fesetround(p->r);
        feclearexcept(FE_ALL_EXCEPT);
        y = yn(p->i, p->x);
        e = fetestexcept(INEXACT | INVALID | DIVBYZERO | UNDERFLOW | OVERFLOW);
#ifndef __aarch64__
        if (!Checkexcept(e, p->e, p->r)) {
            printf("%s:%d: bad fp exception: %s yn(%lld, %a)=%a, want %s",
                   p->file,
                   p->line,
                   Rstr(p->r),
                   p->i,
                   p->x,
                   p->y,
                   Estr(p->e));
            printf(" got %s\n", Estr(e));
            err++;
        }
#endif
        d = Ulperr(y, p->y, p->dy);
        if ((!(p->x < 0) && !Checkulp(d, p->r)) || (p->x < 0 && !isnan(y) && y != -INF)) {
            printf("%s:%d: %s yn(%lld, %a) want %a got %a, ulperr %.3f = %.3f + %.3f\n",
                   p->file,
                   p->line,
                   Rstr(p->r),
                   p->i,
                   p->x,
                   p->y,
                   (double)y,
                   (double)d,
                   d - p->dy,
                   p->dy);
            err++;
        }
    }
    return !!err;
}

int YnTest(void)
{
    return YnTestImpl();
}

