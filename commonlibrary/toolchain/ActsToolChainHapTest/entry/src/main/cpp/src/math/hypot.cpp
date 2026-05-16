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

static struct DdD t[] = {
#include "sanity/hypot.h"
#include "special/hypot.h"
#include "ucb/hypot.h"

};

static void HypotTestOne(struct DdD* p, int* err)
{
#pragma STDC FENV_ACCESS ON
    double y;
    float d;
    int e;
    if (p->r < 0) {
        return;
    }
    fesetround(p->r);
    feclearexcept(FE_ALL_EXCEPT);
    y = hypot(p->x, p->x2);
    e = fetestexcept(INEXACT | INVALID | DIVBYZERO | UNDERFLOW | OVERFLOW);
    if (!Checkexcept(e, p->e, p->r)) {
        const double excX = static_cast<double>(p->x);
        const double excX2 = static_cast<double>(p->x2);
        const double excY = static_cast<double>(p->y);
        printf("%s:%d: bad fp exception: %s hypot(%a,%a)=%a, want %s",
               p->file,
               p->line,
               Rstr(p->r),
               excX,
               excX2,
               excY,
               Estr(p->e));
        printf(" got %s\n", Estr(e));
        (*err)++;
    }
    d = Ulperr(y, p->y, p->dy);
    if (!Checkulp(d, p->r) || (p->r == ROUND_TO_NEAREST && fabs(d) >= 1.0)) {
        const double yOut = static_cast<double>(y);
        const double ulpAbs = static_cast<double>(d);
        const double ulpMinusDy = static_cast<double>(d - p->dy);
        const double dyVal = static_cast<double>(p->dy);
        printf("%s:%d: %s hypot(%a,%a) want %a got %a Ulperr %.3f = %.3f + %.3f\n",
               p->file,
               p->line,
               Rstr(p->r),
               static_cast<double>(p->x),
               static_cast<double>(p->x2),
               static_cast<double>(p->y),
               yOut,
               ulpAbs,
               ulpMinusDy,
               dyVal);
        (*err)++;
    }
}

static int HypotTestImpl(void)
{
#pragma STDC FENV_ACCESS ON
    int i;
    int err = 0;
    for (i = 0; i < sizeof t / sizeof *t; i++) {
        HypotTestOne(t + i, &err);
    }
    return !!err;
}

int HypotTest(void)
{
    return HypotTestImpl();
}
