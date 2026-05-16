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

static struct LLi t[] = {
#if LDBL_MANT_DIG == 53
#include "sanity/lgamma_r.h"
#include "special/lgamma_r.h"
#elif LDBL_MANT_DIG == 64
#include "sanity/lgammal_r.h"
#include "special/lgammal_r.h"
#endif
};

static int LgammalRTestImpl(void)
{
#pragma STDC FENV_ACCESS ON
    int yi;
    long double y;
    float d;
    int e;
    int i;
    int err = 0;
    struct LLi* p;

    for (i = 0; i < sizeof t / sizeof *t; i++) {
        p = t + i;

        if (p->r < 0) {
            continue;
        }
        fesetround(p->r);
        feclearexcept(FE_ALL_EXCEPT);
        y = lgammal_r(p->x, &yi);
        e = fetestexcept(INEXACT | INVALID | DIVBYZERO | UNDERFLOW | OVERFLOW);
        if (!Checkexcept(e, p->e, p->r)) {
            printf("%s:%d: bad fp exception: %s lgammal_r(%La)=%La,%lld, want %s",
                   p->file,
                   p->line,
                   Rstr(p->r),
                   p->x,
                   p->y,
                   p->i,
                   Estr(p->e));
            printf(" got %s\n", Estr(e));
            err++;
        }
        d = Ulperrl(y, p->y, p->dy);
        // 2 ulp errors allowed
        if ((p->r == ROUND_TO_NEAREST && fabs(d) > 2) ||
            (!isnan(p->x) && p->x != -INF && !(p->e & DIVBYZERO) && yi != p->i)) {
            printf("%s:%d: %s lgammal_r(%La) want %La,%lld got %La,%d ulperr %.3f = %.3f + %.3f\n",
                   p->file,
                   p->line,
                   Rstr(p->r),
                   p->x,
                   p->y,
                   p->i,
                   (long double)y,
                   yi,
                   (double)d,
                   (double)(d - p->dy),
                   p->dy);
            err++;
        }
    }
    return !!err;
}

int LgammalRTest(void)
{
    return LgammalRTestImpl();
}

