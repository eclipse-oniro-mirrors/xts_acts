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
#include "sanity/hypot.h"
#include "special/hypot.h"
#include "ucb/hypot.h"

#elif LDBL_MANT_DIG == 64
#include "sanity/hypotl.h"
#include "special/hypotl.h"

#endif
};

static void HypotlTestOne(struct LlL* p, int* err)
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
    y = hypotl(p->x, p->x2);
    e = fetestexcept(INEXACT | INVALID | DIVBYZERO | UNDERFLOW | OVERFLOW);
    if (!Checkexcept(e, p->e, p->r)) {
        const long double fmtLaExcX = static_cast<long double>(p->x);
        const long double fmtLaExcX2 = static_cast<long double>(p->x2);
        const long double fmtLaExcY = static_cast<long double>(p->y);
        printf("%s:%d: bad fp exception: %s hypotl(%La,%La)=%La, want %s",
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
    if (!Checkulp(d, p->r) || (p->r == ROUND_TO_NEAREST && fabs(d) >= 1.0)) {
        const long double ulpLaX = static_cast<long double>(p->x);
        const long double ulpLaX2 = static_cast<long double>(p->x2);
        const long double ulpLaY = static_cast<long double>(p->y);
        const long double ulpLaYgot = y;
        const double ulpAbs = static_cast<double>(d);
        const double ulpMinusDy = static_cast<double>(d - p->dy);
        const double dyVal = static_cast<double>(p->dy);
        printf("%s:%d: %s hypotl(%La,%La) want %La got %La Ulperr %.3f = %.3f + %.3f\n",
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

static int HypotlTestImpl(void)
{
#pragma STDC FENV_ACCESS ON
    int i;
    int err = 0;
    for (i = 0; i < sizeof t / sizeof *t; i++) {
        HypotlTestOne(t + i, &err);
    }
    return !!err;
}

int HypotlTest(void)
{
    return HypotlTestImpl();
}
