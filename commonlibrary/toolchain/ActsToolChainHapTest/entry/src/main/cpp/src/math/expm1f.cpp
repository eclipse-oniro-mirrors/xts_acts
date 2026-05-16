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

static struct FF t[] = {
#include "sanity/expm1f.h"
#include "special/expm1f.h"
};

static void Expm1fTestOne(struct FF *p, int *err)
{
#pragma STDC FENV_ACCESS ON
    float y;
    float d;
    int e;
    if (p->r < 0) {
        return;
    }
    fesetround(p->r);
    feclearexcept(FE_ALL_EXCEPT);
    y = expm1f(p->x);
    e = fetestexcept(INEXACT | INVALID | DIVBYZERO | UNDERFLOW | OVERFLOW);
#ifndef __aarch64__
    if (!Checkexcept(e, p->e, p->r)) {
        const double excX = static_cast<double>(p->x);
        const double excY = static_cast<double>(p->y);
        printf("%s:%d: bad fp exception: %s expm1f(%a)=%a, want %s",
               p->file,
               p->line,
               Rstr(p->r),
               excX,
               excY,
               Estr(p->e));
        printf(" got %s\n", Estr(e));
        (*err)++;
    }
#endif
    d = Ulperrf(y, p->y, p->dy);
    if (!Checkulp(d, p->r)) {
        const double yOut = static_cast<double>(y);
        const double ulpAbs = static_cast<double>(d);
        const double ulpMinusDy = static_cast<double>(d - p->dy);
        const double dyVal = static_cast<double>(p->dy);
        printf("%s:%d: %s expm1f(%a) want %a got %a Ulperr %.3f = %.3f + %.3f\n",
               p->file,
               p->line,
               Rstr(p->r),
               static_cast<double>(p->x),
               static_cast<double>(p->y),
               yOut,
               ulpAbs,
               ulpMinusDy,
               dyVal);
        (*err)++;
    }
}

static int Expm1fTestImpl(void)
{
#pragma STDC FENV_ACCESS ON
    int i;
    int err = 0;
    for (i = 0; i < sizeof t / sizeof *t; i++) {
        Expm1fTestOne(t + i, &err);
    }
    return !!err;
}

int Expm1fTest(void)
{
    return Expm1fTestImpl();
}
