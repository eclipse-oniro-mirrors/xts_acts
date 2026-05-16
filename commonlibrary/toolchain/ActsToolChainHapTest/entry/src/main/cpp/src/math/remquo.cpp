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

static struct DdDi t[] = {
#include "sanity/remquo.h"
#include "special/remquo.h"
};

static constexpr int REMQUO_LOW_BITS_MASK = 7;

static bool HasRemquoQuotientMismatch(const struct DdDi* p, int quotient)
{
    return (!isnan(p->y) &&
            ((quotient & REMQUO_LOW_BITS_MASK) != (p->i & REMQUO_LOW_BITS_MASK) || (quotient < 0) != (p->i < 0)));
}

static int RemquoTestImpl(void)
{
#pragma STDC FENV_ACCESS ON
    int yi;
    double y;
    float d;
    int e;
    int i;
    int err = 0;
    struct DdDi* p;

    for (i = 0; i < sizeof t / sizeof *t; i++) {
        p = t + i;

        if (p->r < 0) {
            continue;
        }
        fesetround(p->r);
        feclearexcept(FE_ALL_EXCEPT);
        y = remquo(p->x, p->x2, &yi);
        e = fetestexcept(INEXACT | INVALID | DIVBYZERO | UNDERFLOW | OVERFLOW);
        if (!Checkexcept(e, p->e, p->r)) {
            printf("%s:%d: bad fp exception: %s remquo(%a,%a)=%a,%lld, want %s",
                   p->file,
                   p->line,
                   Rstr(p->r),
                   p->x,
                   p->x2,
                   p->y,
                   p->i,
                   Estr(p->e));
            printf(" got %s\n", Estr(e));
            err++;
        }
        d = Ulperr(y, p->y, p->dy);
        if (!Checkcr(y, p->y, p->r) || HasRemquoQuotientMismatch(p, yi)) {
            printf("%s:%d: %s remquo(%a,%a) want %a,%lld got %a,%d ulperr %.3f = %.3f + %.3f\n",
                   p->file,
                   p->line,
                   Rstr(p->r),
                   p->x,
                   p->x2,
                   p->y,
                   p->i,
                   (double)y,
                   yi,
                   d,
                   (double)(d - p->dy),
                   p->dy);
            err++;
        }
    }
    return !!err;
}

int RemquoTest(void)
{
    return RemquoTestImpl();
}
