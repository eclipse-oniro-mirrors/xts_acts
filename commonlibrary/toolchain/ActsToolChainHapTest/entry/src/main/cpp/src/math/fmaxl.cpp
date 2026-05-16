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

static struct LlL t[] = {
#if LDBL_MANT_DIG == 53
#include "sanity/fmax.h"
#include "special/fmax.h"

#elif LDBL_MANT_DIG == 64
#include "sanity/fmaxl.h"
#include "special/fmaxl.h"

#endif
};

static void FmaxlTestOne(struct LlL* p, int* err)
{
#pragma STDC FENV_ACCESS ON
    long double y;
    float d;
    int e;
    if (p->r < 0) {
        return;
    }
    fesetround(p->r);
    feclearexcept(FE_ALL_EXCEPT);
    y = fmaxl(p->x, p->x2);
    e = fetestexcept(INEXACT | INVALID | DIVBYZERO | UNDERFLOW | OVERFLOW);
    if (!Checkexceptall(e, p->e, p->r)) {
        const long double fmtLaExcX = static_cast<long double>(p->x);
        const long double fmtLaExcX2 = static_cast<long double>(p->x2);
        const long double fmtLaExcY = static_cast<long double>(p->y);
        printf("%s:%d: bad fp exception: %s fmaxl(%La,%La)=%La, want %s",
               p->file,
               p->line,
               Rstr(p->r),
               fmtLaExcX,
               fmtLaExcX2,
               fmtLaExcY,
               Estr(p->e));
        printf(" got %s\n", Estr(e));
        (*err)++;
    }
    d = Ulperrl(y, p->y, p->dy);
    if (!Checkcr(y, p->y, p->r)) {
        const long double ulpLaX = static_cast<long double>(p->x);
        const long double ulpLaX2 = static_cast<long double>(p->x2);
        const long double ulpLaY = static_cast<long double>(p->y);
        const long double ulpLaYgot = y;
        const double ulpAbs = static_cast<double>(d);
        const double ulpMinusDy = static_cast<double>(d - p->dy);
        const double dyVal = static_cast<double>(p->dy);
        printf("%s:%d: %s fmaxl(%La,%La) want %La got %La Ulperr %.3f = %.3f + %.3f\n",
               p->file,
               p->line,
               Rstr(p->r),
               ulpLaX,
               ulpLaX2,
               ulpLaY,
               ulpLaYgot,
               ulpAbs,
               ulpMinusDy,
               dyVal);
        (*err)++;
    }
}

static int FmaxlTestImpl(void)
{
#pragma STDC FENV_ACCESS ON
    int i;
    int err = 0;
    for (i = 0; i < sizeof t / sizeof *t; i++) {
        FmaxlTestOne(t + i, &err);
    }
    return !!err;
}

int FmaxlTest(void)
{
    return FmaxlTestImpl();
}
