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

static struct DDi t[] = {
#include "sanity/frexp.h"
#include "special/frexp.h"

};

static void FrexpTestOne(struct DDi* p, int* err)
{
#pragma STDC FENV_ACCESS ON
    int yi;
    double y;
    float d;
    int e;
    if (p->r < 0) {
        return;
    }
    fesetround(p->r);
    feclearexcept(FE_ALL_EXCEPT);
    y = frexp(p->x, &yi);
    e = fetestexcept(INEXACT | INVALID | DIVBYZERO | UNDERFLOW | OVERFLOW);
    if (!Checkexceptall(e, p->e, p->r)) {
        printf("%s:%d: bad fp exception: %s frexp(%a)=%a,%lld, want %s",
               p->file,
               p->line,
               Rstr(p->r),
               static_cast<double>(p->x),
               static_cast<double>(p->y),
               p->i,
               Estr(p->e));
        printf(" got %s\n", Estr(e));
        (*err)++;
    }
    d = Ulperr(y, p->y, p->dy);
    if (!Checkcr(y, p->y, p->r) || (isfinite(p->x) && yi != p->i)) {
        const double yGot = static_cast<double>(y);
        const double ulpAbs = static_cast<double>(d);
        const double ulpMinusDy = static_cast<double>(d - p->dy);
        const double dyVal = static_cast<double>(p->dy);
        printf("%s:%d: %s frexp(%a) want %a,%lld got %a,%d Ulperr %.3f = %.3f + %.3f\n",
               p->file,
               p->line,
               Rstr(p->r),
               static_cast<double>(p->x),
               static_cast<double>(p->y),
               p->i,
               yGot,
               yi,
               ulpAbs,
               ulpMinusDy,
               dyVal);
        (*err)++;
    }
}

static int FrexpTestImpl(void)
{
#pragma STDC FENV_ACCESS ON
    int i;
    int err = 0;
    for (i = 0; i < sizeof t / sizeof *t; i++) {
        FrexpTestOne(t + i, &err);
    }
    return !!err;
}

int FrexpTest(void)
{
    return FrexpTestImpl();
}
